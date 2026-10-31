params ["_playerUID", "_varName", "_varValue"];

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _abort = false;

if (isNil "_playerUID") then {
	_playerUID = "";
	_abort = true;
};
if (isNil "_varName") then {
	_varName = "";
	_abort = true;
};
if (isNil "_varValue") then {
	_varValue = "";
	_abort = true;
};
if (_abort) exitWith {
    Error_3("Save invalid for %1, saving %3 as %2",_playerUID,_varName,_varValue);
};
private _playerVarName = format ["player_%1_%2", _playerUID, _varName];
[_playerVarName, _varValue] call A3A_fnc_setStatVariable;
