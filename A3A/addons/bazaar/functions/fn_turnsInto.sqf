// Shared: every class name this item can turn into in a player's hands, as
// lowercase names - the item itself plus:
//   - what the Antistasi arsenal files it as (JNA folds a weapon to its
//     baseWeapon / BIS_fnc_baseWeapon, a TFAR radio to its tf_parent, an
//     RHS sight to its rhs_optic_base) - put it in, take the other one out
//   - for attachments, every mode it switches to with CBA/ACE
//     (fn_switchFamily) and what the arsenal files those as
// One rule for "is it unlimited" (fn_isUnlockedAny), "can a job be filled
// from someone's table or the Arms Dealer" (fn_rollJob, fn_load) and "would
// this stock fill another trader's job" (fn_rollStock).
// [class] -> [lowercase names]
params [["_c", "", [""]]];
if (_c == "") exitWith { [] };
private _names = [];
private _cw = configFile >> "CfgWeapons" >> _c;
{ if (_x != "") then { _names pushBackUnique (toLower _x) } } forEach [_c, getText (_cw >> "baseWeapon"), getText (_cw >> "rhs_optic_base"), getText (_cw >> "tf_parent")];
// a weapon put in through a container is filed by BIS_fnc_baseWeapon (JNA's
// cargo sweep), which also strips a preset with no baseWeapon to the first
// parent without built-in parts
if ((getNumber (_cw >> "type")) in [1, 2, 4]) then {
	private _bw = [_c] call BIS_fnc_baseWeapon;
	if (_bw isEqualType "" && {_bw != ""}) then { _names pushBackUnique (toLower _bw) };
};
if ((getNumber (_cw >> "ItemInfo" >> "type")) in [101, 201, 301, 302]) then {
	{
		_names pushBackUnique _x;
		private _mc = configFile >> "CfgWeapons" >> _x;
		{ if (_x != "") then { _names pushBackUnique (toLower _x) } } forEach [getText (_mc >> "baseWeapon"), getText (_mc >> "rhs_optic_base")];
	} forEach ([_c] call ABZ_fnc_switchFamily);
};
_names
