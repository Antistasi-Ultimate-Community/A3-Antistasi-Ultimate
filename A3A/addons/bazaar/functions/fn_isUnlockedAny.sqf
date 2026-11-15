// SERVER: is this class unlimited in the Antistasi arsenal under ANY name
// the arsenal files it by? JNA folds items before storing them (TFAR radio
// parent, base weapon, RHS sight base), so the class itself may never be in
// the list while its folded name is unlimited. A CBA disposable launcher
// also counts as unlimited when its ROCKET is: a loose rocket turns into a
// whole launcher the moment it's dropped. And an attachment counts as
// unlimited when any mode it switches to is (fn_turnsInto).
// [classes...] -> bool. Used by the sell refusal, job rolling and bulk
// rolling so they can never disagree.
params [["_classes", [], [[]]]];
if !(call ABZ_fnc_isAntistasi) exitWith { false };

private _ll = missionNamespace getVariable ["cba_disposable_LoadedLaunchers", nil];
private _nl = missionNamespace getVariable ["cba_disposable_NormalLaunchers", nil];
private _fnc_lookup = {
	params ["_map", "_key", "_def"];
	if (isNil "_map") exitWith { _def };
	if (_map isEqualType createHashMap) exitWith { _map getOrDefault [_key, _map getOrDefault [toLower _key, _def]] };
	if (_map isEqualType locationNull || {_map isEqualType objNull}) exitWith { _map getVariable [_key, _def] };
	_def
};

private _names = [];
{
	if (_x isEqualType "" && {_x != ""}) then {
		{ _names pushBackUnique _x } forEach ([_x] call ABZ_fnc_turnsInto);	// arsenal folds + attachment modes
		// disposable: fireable -> carry -> [fireable, rocket]
		private _carry = [_ll, _x, _x] call _fnc_lookup;
		if !(_carry isEqualType "") then { _carry = _x };
		private _entry = [_nl, _carry, []] call _fnc_lookup;
		if (_entry isEqualType [] && {count _entry >= 2} && {(_entry select 1) isEqualType ""} && {(_entry select 1) != ""}) then {
			_names pushBackUnique (toLower (_entry select 1));
		};
	};
} forEach _classes;
(_names findIf { [_x] call ABZ_fnc_isUnlocked }) > -1
