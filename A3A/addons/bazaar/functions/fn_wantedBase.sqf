// Shared: the class a Wanted List pin stands for. A weapon preset (scope and
// laser fitted, same name as the bare gun) is pinned as the plain gun the
// traders actually stock (fn_buildPool folds presets the same way); anything
// else is itself. [class] -> class
params [["_c", "", [""]]];
if (_c == "") exitWith { "" };
private _cw = configFile >> "CfgWeapons" >> _c;
if !((getNumber (_cw >> "type")) in [1, 2, 4]) exitWith { _c };
private _b = getText (_cw >> "baseWeapon");
if (_b != "" && {_b != _c} && {([_b] call ABZ_fnc_sellClass) isEqualTo _b}) exitWith { _b };
_b = [_c] call BIS_fnc_baseWeapon;
if (_b isEqualType "" && {_b != ""} && {_b != _c} && {([_b] call ABZ_fnc_sellClass) isEqualTo _b}) exitWith { _b };
_c
