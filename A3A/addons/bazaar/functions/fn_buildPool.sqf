// SERVER: builds the sellable catalog once. Source per the "Stock source"
// setting: the gear of every faction in the campaign (default, Antistasi
// only - works with any template, Faction Forger factions included) or a
// scan of everything loaded. Entries: [class, basePrice, tier, kind, subtype].
if (!isServer) exitWith {};

private _source = missionNamespace getVariable ["ABZ_stockSource", 0];
private _classes = [];
if (_source == 0 && {call ABZ_fnc_isAntistasi}) then {
	_classes = call ABZ_fnc_poolFromFactions;
	if (count _classes < 20) then {
		diag_log format ["[ABZ] Faction gear scan found only %1 classes - falling back to a full config scan", count _classes];
		_classes = [];
	};
};
private _fromFactions = _classes isNotEqualTo [];
if (!_fromFactions) then { _classes = call ABZ_fnc_poolFromConfigs };

// Antistasi Ultimate's forbidden list: never fence what the mission bans
private _forbidden = missionNamespace getVariable ["A3U_forbiddenItems", []];
if !(_forbidden isEqualType []) then { _forbidden = [] };

private _pool = [];
private _seen = createHashMap;
{
	private _c = _x;
	if !(_c isEqualType "") then { continue };
	// weapon stack duplicates (RHS etc.): list the base weapon only, like the arsenal does
	private _base = getText (configFile >> "CfgWeapons" >> _c >> "baseWeapon");
	if (_base != "" && {_base != _c}) then { _c = _base };
	if (_c in _forbidden) then { continue };
	// exactly what a trader would buy back (fn_sellClass): valid public gear
	// (a disposable launcher as its carry class), no loose disposable-launcher
	// rockets, no preset packs with built-in cargo
	_c = [_c] call ABZ_fnc_sellClass;
	if (_c == "" || {_c in _forbidden}) then { continue };
	if (_c in _seen) then { continue };
	_seen set [_c, true];
	([_c] call ABZ_fnc_itemKind) params ["_kind", "_sub"];
	if (_kind == "") then { continue };
	private _price = [_c, _kind, _sub] call ABZ_fnc_itemPrice;
	private _tier = [_price] call ABZ_fnc_tierOf;
	// a preset weapon is as rare as the rarest part it comes with (a thermal
	// sight on it is a thermal sight) - the rarity gate (fn_progressGate)
	// and the roll weights look at this tier
	if (_kind == "weapon") then {
		{
			private _part = getText (_x >> "item");
			if (_part != "") then {
				private _pc = [_part] call ABZ_fnc_sellClass;
				if (_pc == "") then { _pc = _part };
				([_pc] call ABZ_fnc_itemKind) params ["_pk", "_ps"];
				if (_pk != "") then { _tier = _tier max ([[_pc, _pk, _ps] call ABZ_fnc_itemPrice] call ABZ_fnc_tierOf) };
			};
		} forEach ("true" configClasses (configFile >> "CfgWeapons" >> _c >> "LinkedItems"));
	};
	_pool pushBack [_c, _price, _tier, _kind, _sub];
} forEach _classes;

ABZ_pool = _pool;
ABZ_poolSource = ["configs", "factions"] select _fromFactions;

private _counts = [0, 0, 0, 0];
{ _counts set [_x select 2, (_counts select (_x select 2)) + 1] } forEach _pool;
diag_log format ["[ABZ] Stock catalog: %1 sellable items from %2 (common %3 / uncommon %4 / rare %5 / exotic %6)",
	count _pool, ABZ_poolSource, _counts select 0, _counts select 1, _counts select 2, _counts select 3];
