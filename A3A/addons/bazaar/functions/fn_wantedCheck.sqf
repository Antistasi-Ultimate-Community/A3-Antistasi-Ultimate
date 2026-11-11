// Client (ABZ_rolled): something just appeared at a trader. Any of it on my
// Wanted List gets a line in chat saying who has it and where.
// A pinned weapon also matches its plain base model (the Bazaar stocks base
// models; a pinned preset is the same gun).
params [["_vname", "", [""]], ["_town", "", [""]], ["_items", [], [[]]], ["_jobClass", "", [""]], ["_why", "stock", [""]]];
if (!hasInterface) exitWith {};
private _pins = call ABZ_fnc_wantedList;
if (_pins isEqualTo []) exitWith {};

private _keys = createHashMap;	// lowercase class -> pinned class
{
	_keys set [toLower _x, _x];
	if ((getNumber (configFile >> "CfgWeapons" >> _x >> "type")) in [1, 2, 4]) then {
		private _b = [_x] call BIS_fnc_baseWeapon;
		if (_b isEqualType "" && {_b != ""}) then { _keys set [toLower _b, _x] };
	};
} forEach _pins;

private _said = [];
private _fnc_say = {
	params ["_cls", "_how"];
	private _k = toLower _cls;
	if (_k in _said) exitWith {};
	_said pushBack _k;
	systemChat format [localize "STR_A3U_Bazaar_Shop_Wanted", [_cls] call ABZ_fnc_displayNameOf, _vname, _town, _how];
};
{
	_x params [["_c", "", [""]], ["_kind", "single", [""]]];
	if ((toLower _c) in _keys || {(toLower ([_c] call ABZ_fnc_wantedBase)) in _keys}) then {
		[_c, switch (true) do {
			case (_why == "sold"): { localize "STR_A3U_Bazaar_Shop_Sold" };
			case (_kind == "crate"): { localize "STR_A3U_Bazaar_Shop_SealedCrate" };
			case (_why == "new"): { localize "STR_A3U_Bazaar_Shop_NewStall" };
			default { localize "STR_A3U_Bazaar_Shop_AfterRestock" };
		}] call _fnc_say;
	};
} forEach _items;
if (_jobClass != "" && {(toLower _jobClass) in _keys || {(toLower ([_jobClass] call ABZ_fnc_wantedBase)) in _keys}}) then {
	[_jobClass, localize "STR_A3U_Bazaar_Shop_TraderWantsIt"] call _fnc_say;
};
