/*
    Author:
        Maxx, Silence
    
    Description:
        Adds the action to trigger lockpicking, handles broadcasting and JIP
    
    Params:
        _vehicle <OBJECT>
    
    Dependencies:
        N/A
    
    Scope:
        Server, HC
    
    Environment:
        Unscheduled
    
    Usage:
        [_vehicle] call A3U_fnc_addLockpickAction;
    
    Return:
        N/A
*/
#include "..\..\script_component.hpp"

params ["_vehicle"];

if (!isServer && hasInterface) exitWith {
    Error("Server-side function was not called on the server? Aborting");
};

[_vehicle] remoteExecCall ["A3U_fnc_lockpick", 0, _vehicle];