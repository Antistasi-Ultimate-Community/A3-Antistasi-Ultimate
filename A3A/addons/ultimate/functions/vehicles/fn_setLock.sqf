/*
    Author:
        Silence
    
    Description:
        Locks or unlocks _vehicle with _state, handles locking inventory (including global and JIP)
    
    Params:
        _vehicle <OBJECT> <Default: ObjNull>
        _state <BOOL> <Default: false>
    
    Dependencies:
        enableVehicleAutoLock
    
    Scope:
        Server, HC
    
    Environment:
        Unscheduled
    
    Usage:
        [_vehicle, _state] call A3U_fnc_setLock;
    
    Return:
        true/false <BOOL>
*/  

params [
    ["_vehicle", ObjNull],
    ["_state", false]
];

if (!isServer && hasInterface) exitWith {
    ["Server-side function was not called on the server? Aborting", _fnc_scriptName] call A3U_fnc_log;
};

if (enableVehicleAutoLock isEqualTo false) exitWith {false};

if (_vehicle isEqualTo ObjNull || {isNil "_vehicle"}) exitWith {false};
if (_vehicle isKindOf "Static") exitWith {false};
if (!(alive _vehicle)) exitWith {false};

_vehicle lock _state;
[_vehicle, _state] remoteExecCall ["lockInventory", 0, _vehicle];

if (_state isEqualTo true) then {
    [_vehicle] call A3U_fnc_addLockpickAction;
};

[format["%1 has been locked. State: %2", typeOf _vehicle, _state], _fnc_scriptName] call A3U_fnc_log;

true;