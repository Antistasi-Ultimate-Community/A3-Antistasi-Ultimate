/*
    Author:
        Silence
    
    Description:
        Does X
    
    Params:
        _hoverMarkers <ARRAY> <Default: []>
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [VALUE] call A3U_fnc_NAME;
    
    Return:
        _return <TYPE>
*/

params [["_hoverMarkers", []]];

if !(isServer) exitWith {[_hoverMarkers] remoteExecCall ["A3U_fnc_handleMrkUpdate", 2]};

missionNamespace setVariable ["A3U_hoverMarkers", _hoverMarkers, true];