/*
    Author:
        Silence
    
    Description:
        Tracks player UID (mainly) to ensure they don't leave and rejoin to avoid a kick.
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
        _injurer <SIDE> <Default: sideEmpty>
        _track <BOOL> <Default: true>
    
    Dependencies:
        A3U_trackedPlayers <ARRAY<STRING>>
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [player, WEST] call A3U_fnc_trackPlayer;
    
    Return:
        N/A
*/

params [
    ["_unit", ObjNull],
    ["_injurer", sideEmpty],
    ["_track", true]
];

private _name = name _unit;
private _uid = getPlayerUID _unit;

_unit setVariable ["A3A_injurer", _injurer, true];

if (_track) then {
    A3U_trackedPlayers pushBackUnique _uid;
    [format["Adding %1 (%2) to the tracked list.", _name, _uid], _fnc_scriptName] call A3U_fnc_log;
} else {
    A3U_trackedPlayers deleteAt (A3U_trackedPlayers find _uid);
    [format["Removing %1 (%2) from the tracked list.", _name, _uid], _fnc_scriptName] call A3U_fnc_log;
};

diag_log A3U_trackedPlayers;