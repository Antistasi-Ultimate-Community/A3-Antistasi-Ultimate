private _varName = _this select 0;
private _varValue = [_varName] call A3A_fnc_returnSavedStat;
if (isNil "_varValue") exitWith {};
[_varName,_varValue] call A3A_fnc_loadStat;
