// SERVER: rolls a trader's job for this rotation: "bring me N of X".
// X is a common-to-rare weapon, ammo or gear item the arsenal has NOT
// unlocked (so it can't just be pulled from the box) and that nobody sells -
// not a trader's table, not Antistasi's Arms Dealer - under any name it can
// turn into (fn_turnsInto: put it in the arsenal and take out its folded
// name, or flip an attachment to another mode). Otherwise a job could be
// filled by buying it at the next stall.
// Job layout: [class, wanted, delivered, rewardEach]
// _alsoRows: rows that were on this trader's table until a moment ago (the
// table a restock just replaced) - they count as "on sale" too
params [["_entry", [], [[]]], ["_alsoRows", [], [[]]]];
if !(missionNamespace getVariable ["ABZ_jobs", true]) exitWith { [] };
private _pool = ABZ_pool;
if (_pool isEqualTo []) exitWith { [] };

// everything on any trader's table (this one included), and what it turns into
private _reach = createHashMap;
{
	{
		private _c = _x param [0, ""];
		if (_c isEqualType "" && {_c != ""}) then {	// bulk crates too: they unpack into the arsenal
			{ _reach set [_x, true] } forEach ([_c] call ABZ_fnc_yields);
		};
	} forEach (_x param [6, []]);
} forEach ([_entry, [0, "", [], 0, "", "", _alsoRows]] + ABZ_vendors);
// anything still inside a buy-back window: bought moments ago, refundable
// in full - a job must not turn it into a free bet on the next restock
{
	{
		if (time < (_x select 4) && {(_x select 2) > 0}) then {
			{ _reach set [_x, true] } forEach ([_x select 1] call ABZ_fnc_yields);
		};
	} forEach _y;
} forEach ABZ_receipts;
private _dealer = (call ABZ_fnc_dealerReach) select 0;

private _cands = _pool select {
	private _l = toLower (_x select 0);
	(_x select 3) in ["weapon", "ammo", "gear"] && {(_x select 2) <= 2} && {!(_l in _reach)} && {!(_l in _dealer)}
};
_cands = (_cands call BIS_fnc_arrayShuffle) select [0, 60];
if (call ABZ_fnc_isAntistasi) then {
	_cands = _cands select { !([[_x select 0]] call ABZ_fnc_isUnlockedAny) };	// same test the sale uses
};
// (what the Arms Dealer would pay for one you found yourself doesn't matter:
// that's your choice of buyer, not a loop - you can't buy it anywhere)
if (_cands isEqualTo []) exitWith { [] };

private _pick = _cands selectRandomWeighted (_cands apply { [40, 40, 20] select (_x select 2) });
_pick params ["_class", "_base", "_tier", "_kind"];

private _wanted = switch (_kind) do {
	case "weapon": { 2 + floor random 3 };	// 2-4
	case "ammo": { 10 + floor random 11 };	// 10-20
	default { 2 + floor random 4 };	// 2-5
};

private _buy = [_class] call ABZ_fnc_unitPrice;
private _reward = 5 * round ((_buy * (missionNamespace getVariable ["ABZ_jobReward", 1.5])) / 5);
if (_reward <= 0) exitWith { [] };

[_class, _wanted, 0, _reward]
