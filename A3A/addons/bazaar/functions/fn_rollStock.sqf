// SERVER: rolls a trader's stock for one rotation - a spread of weapons,
// ammo, gear and clothing drawn by rarity, with a magazine that fits most
// weapons, plus a few sealed bulk crates (one arsenal unlock each).
// Slot layout: [class, price, tier, qtyLeft, isBulk, kind]
params [["_entry", [], [[]]]];
if (ABZ_pool isEqualTo []) exitWith { [] };
// "Rarity gate by war tier" (v1.1.0): the strongest stock waits for the war
private _gate = call ABZ_fnc_progressGate;	// [highest single/vehicle tier, highest crate tier]
private _pool = ABZ_pool select { (_x select 2) <= (_gate select 0) };

// war-tier scaling: the sliders are the tier-5 baseline. Tier 1 carries
// ~3/4 of the single items and half the bulk; tier 10 roughly double the
// singles, 2-3x the bulk crates and deeper quantities.
private _tf = call ABZ_fnc_tierFactor;	// 0 at tier 1 .. 1 at tier 10 (0.45 = baseline)
private _fSingle = 0.65 + 1.0 * _tf;	// 0.65 .. 1.65  (1.1 at baseline -> rounds to the slider)
private _fBulk = 0.4 + 1.6 * _tf;	// 0.4 .. 2.0
private _fQty = 0.75 + 0.75 * _tf;	// 0.75 .. 1.5
if (_tf isEqualTo 0.45) then { _fSingle = 1; _fBulk = 1; _fQty = 1 };
private _slots = round ((missionNamespace getVariable ["ABZ_slotCount", 12]) * _fSingle);
private _bulkSlots = round ((missionNamespace getVariable ["ABZ_bulkSlots", 2]) * _fBulk);
private _bulkUnlocked = missionNamespace getVariable ["ABZ_bulkUnlockedToo", false];

// one price rule for everything the Bazaar sells (fn_unitPrice)
private _fnc_price = {
	params ["_item"];
	[_item select 0] call ABZ_fnc_unitPrice
};
private _fnc_weighted = {
	params ["_cands"];
	if (_cands isEqualTo []) exitWith { [] };
	_cands selectRandomWeighted (_cands apply { ([_x select 2] call ABZ_fnc_rarityInfo) select 2 })
};

private _byKind = createHashMap;
{
	private _k = _x select 3;
	private _arr = _byKind getOrDefault [_k, []];
	_arr pushBack _x;
	_byKind set [_k, _arr];
} forEach _pool;

private _stock = [];
private _used = createHashMap;
// never stock what another trader's open job is asking for - nor anything
// that turns into it (fn_turnsInto: arsenal folds, attachment modes)
private _jobNames = createHashMap;
{
	private _j = _x param [12, []];
	if (_j isNotEqualTo [] && {(_x select 0) != (_entry param [0, -1])}) then {
		_used set [_j select 0, true];
		_jobNames set [toLower (_j select 0), true];
	};
} forEach ABZ_vendors;
private _qtyByTier = [[5, 15], [3, 8], [1, 3], [1, 1]];
private _cycle = ["weapon", "ammo", "gear", "weapon", "ammo", "clothing"];

private _fnc_add = {
	params ["_item", "_bulk"];
	if (_item isEqualTo []) exitWith { false };
	if ((_item select 0) in _used) exitWith { false };
	if (count _jobNames > 0 && {(([_item select 0] call ABZ_fnc_yields) findIf { _x in _jobNames }) > -1}) exitWith { _used set [_item select 0, true]; false };
	_used set [_item select 0, true];
	private _qty = 1;
	private _price = [_item] call _fnc_price;
	if (_bulk) then {
		_price = [_item select 0] call ABZ_fnc_cratePrice;	// one rule with restored saves
	} else {
		(_qtyByTier select (_item select 2)) params ["_lo", "_hi"];
		_qty = _lo + floor random (_hi - _lo + 1);
		// ammo is a consumable - stock it three times as deep so a real
		// resupply run (20-30 mags) is possible in one visit
		if ((_item select 3) == "ammo") then { _qty = _qty * 3 };
		_qty = 1 max round (_qty * _fQty);
	};
	_stock pushBack [_item select 0, _price, _item select 2, _qty, _bulk, _item select 3];
	true
};

for "_i" from 0 to (_slots - 1) do {
	private _kind = _cycle select (_i mod count _cycle);
	private _cands = _byKind getOrDefault [_kind, []];
	if (_cands isEqualTo []) then { _cands = _pool };
	private _ok = false;
	for "_try" from 1 to 6 do {
		if ([[_cands] call _fnc_weighted, false] call _fnc_add) exitWith { _ok = true };
	};
	if (!_ok) then { _ok = [[_pool] call _fnc_weighted, false] call _fnc_add };
	// a weapon usually comes with a magazine that fits it
	private _last = _stock param [(count _stock) - 1, []];
	if (_ok && {_last isNotEqualTo []} && {(_last select 5) == "weapon"} && {random 1 < 0.7} && {count _stock < _slots + 3}) then {
		private _compat = compatibleMagazines (_last select 0);
		private _fits = _pool select { (_x select 3) == "ammo" && {(_x select 0) in _compat} };
		if (_fits isNotEqualTo []) then { [selectRandom _fits, false] call _fnc_add };
	};
};

// bulk crates: a random handful of candidates (keeps the unlock check cheap
// on huge catalogs), skipping anything the arsenal already has unlimited
private _bulkCands = ABZ_pool select { (_x select 2) <= (_gate select 1) && {!((_x select 0) in _used)} };
_bulkCands = _bulkCands call BIS_fnc_arrayShuffle;
_bulkCands = _bulkCands select [0, 80];
if (!_bulkUnlocked && {call ABZ_fnc_isAntistasi}) then {
	_bulkCands = _bulkCands select { !([[_x select 0]] call ABZ_fnc_isUnlockedAny) };
};
private _bulkWeights = [20, 45, 30, 5];
for "_i" from 1 to _bulkSlots do {
	if (_bulkCands isEqualTo []) exitWith {};
	private _pick = _bulkCands selectRandomWeighted (_bulkCands apply { _bulkWeights select (_x select 2) });
	_bulkCands = _bulkCands - [_pick];
	[_pick, true] call _fnc_add;
};

// military vehicles (v1.0.2): a few "stolen" enemy vehicles, more and
// heavier as the war goes on. Slot layout extends the normal one:
// [class, price, tier, 1, false, "vehicle", category, source side var]
private _vehPool = missionNamespace getVariable ["ABZ_vehPool", []];
private _fVeh = [0.5 + _tf, 1] select (_tf isEqualTo 0.45);	// tier 1: half, tier 10: 1.5x
private _vehSlots = round ((missionNamespace getVariable ["ABZ_vehSlots", 2]) * _fVeh);
if (_vehSlots > 0 && {_vehPool isNotEqualTo []}) then {
	private _coastal = ([_entry param [2, [0, 0, 0]], ABZ_boatRange] call ABZ_fnc_waterNear) isNotEqualTo [];
	private _byCat = createHashMap;
	{
		private _cat = _x select 1;
		if (_cat == "BOAT" && {!_coastal}) then { continue };
		if (((ABZ_vehCats getOrDefault [_cat, ["", 0]]) select 1) > (_gate select 0)) then { continue };	// rarity gate
		private _arr = _byCat getOrDefault [_cat, []];
		_arr pushBack _x;
		_byCat set [_cat, _arr];
	} forEach _vehPool;
	private _heavyF = 0.4 + 1.2 * _tf;	// APCs, helicopters, AA, tanks grow more likely with the war
	for "_i" from 1 to _vehSlots do {
		private _cats = (keys _byCat) select { (_byCat get _x) isNotEqualTo [] };
		if (_cats isEqualTo []) exitWith {};
		// the first vehicle is one the rebels can actually take delivery of,
		// whenever such a category exists; the rest are something to fight for
		if (_i == 1) then {
			private _met = _cats select { ([_x] call ABZ_fnc_vehReq) select 0 };
			if (_met isNotEqualTo []) then { _cats = _met };
		};
		private _w = _cats apply {
			(ABZ_vehCats getOrDefault [_x, ["", 0, 10, false]]) params ["", "", "_wt", "_heavy"];
			_wt * ([1, _heavyF] select _heavy)
		};
		private _cat = _cats selectRandomWeighted _w;
		private _cands = _byCat get _cat;
		private _pick = _cands deleteAt (floor random (count _cands));
		_pick params ["_c", "", "_sideVar"];
		private _tierV = (ABZ_vehCats getOrDefault [_cat, ["", 1]]) select 1;
		_stock pushBack [_c, [_c, _cat] call ABZ_fnc_vehPrice, _tierV, 1, false, "vehicle", _cat, _sideVar];
	};
};

_stock
