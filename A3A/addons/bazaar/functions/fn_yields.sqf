// Shared: everything you can end up holding from ONE of this item, as
// lowercase names: what it turns into (fn_turnsInto - arsenal folds,
// attachment modes) plus, for a preset weapon, each built-in part (as a
// trader deals it, fn_sellClass) and what that part turns into - buy the
// preset, take the scope off.
// Used wherever "could someone get X out of this?" decides a job or a
// table: fn_rollJob, fn_rollStock, fn_serverSell, fn_load, fn_dealerReach.
// (Not for "is it unlimited": a preset isn't free because one part is.)
// [class] -> [lowercase names]
params [["_c", "", [""]]];
if (_c == "") exitWith { [] };
private _names = [_c] call ABZ_fnc_turnsInto;
private _cw = configFile >> "CfgWeapons" >> _c;
if ((getNumber (_cw >> "type")) in [1, 2, 4]) then {
	{
		private _part = getText (_x >> "item");
		if (_part != "") then {
			private _pc = [_part] call ABZ_fnc_sellClass;
			if (_pc == "") then { _pc = _part };
			{ _names pushBackUnique _x } forEach ([_part] call ABZ_fnc_turnsInto);
			if (_pc != _part) then { { _names pushBackUnique _x } forEach ([_pc] call ABZ_fnc_turnsInto) };
		};
	} forEach ("true" configClasses (_cw >> "LinkedItems"));
};
_names
