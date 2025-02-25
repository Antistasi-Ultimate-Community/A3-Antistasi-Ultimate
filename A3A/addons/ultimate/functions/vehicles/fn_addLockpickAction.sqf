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

params ["_vehicle"];

if (!isServer && hasInterface) exitWith {
    ["Server-side function was not called on the server? Aborting", _fnc_scriptName] call A3U_fnc_log;
};

[_vehicle] remoteExecCall ["A3U_fnc_lockpick", 0, _vehicle];