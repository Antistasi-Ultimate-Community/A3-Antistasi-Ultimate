/*
    Author:
        Silence
    
    Description:
        Locks or unlocks _vehicle with _state
    
    Params:
        _vehicle <OBJECT> <Default: ObjNull>
        _state <BOOL> <Default: false>
    
    Usage:
        [cursorObject, true] call A3U_fnc_setLock;
    
    Return:
        true if successful <BOOL>
*/

params [
    ["_vehicle", ObjNull],
    ["_state", false]
];

if (_vehicle isEqualTo ObjNull || {isNil "_vehicle"}) exitWith {false};
if ( ["flag", typeOf _vehicle] call BIS_fnc_inString ) exitWith {false};
if (alive _vehicle isEqualTo false) exitWith {false};

_vehicle lock _state;
[_vehicle] call A3U_fnc_lockpick;

[format["%1 has been locked. State: %2", typeOf _vehicle, _state], _fnc_scriptName] call A3U_fnc_log;

true;