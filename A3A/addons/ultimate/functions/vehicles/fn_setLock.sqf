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
#include "..\..\script_component.hpp"

params [
    ["_vehicle", objNull],
    ["_state", false]
];

if (!isServer && hasInterface) exitWith {
    Error("Server-side function was not called on the server? Aborting");
};

if (enableVehicleAutoLock isEqualTo false) exitWith {false};

if (isNull _vehicle ||
    { !alive _vehicle } || 
    { _vehicle isKindOf "Static" }
) exitWith {false};

_vehicle lock _state;
[_vehicle, _state] remoteExecCall ["lockInventory", 0, _vehicle];

if (_state isEqualTo true) then {
    [_vehicle] call A3U_fnc_addLockpickAction;
};

Debug_2("%1 has been locked. State: %2", typeOf _vehicle, _state);

true;