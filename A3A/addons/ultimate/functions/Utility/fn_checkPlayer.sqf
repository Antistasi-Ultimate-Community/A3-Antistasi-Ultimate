/*
    Author:
        Silence
    
    Description:
        Checks if player is in the tracked list, kicks them if they are
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
    
    Dependencies:
        A3U_trackedPlayers
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [player] call A3U_fnc_checkPlayer;
    
    Return:
        true if kicked, false if not
*/

params [
    ["_unit", ObjNull]
];

private _uid = getPlayerUID _unit;

if (_uid in A3U_trackedPlayers) exitWith {
    [_unit] call A3U_fnc_kickPlayer;
    true
};

false