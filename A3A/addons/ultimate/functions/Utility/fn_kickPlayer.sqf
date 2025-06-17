/*
    Author:
        Silence
    
    Description:
        Handles kicking the player after respawn (if applicable). Security isn't a big concern (yet).
    
    Params:
        _unit <OBJECT> <Default: ObjNull>
    
    Dependencies:
        A3U_password <STRING>
        A3U_kickExemptions <ARRAY<STRING>>
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [_unit] remoteExecCall ["A3U_fnc_kickPlayer", 2];
    
    Return:
        N/A
*/

params [
    ["_unit", ObjNull]
];

if (!isServer) exitWith {
    [_unit] remoteExecCall ["A3U_fnc_kickPlayer", 2];
};

private _uid = getPlayerUID _unit;
if (_uid in A3U_kickExemptions) exitWith {
    [format["Attempted to kick %1, but they are exempt", name _unit], _fnc_scriptName] call A3U_fnc_log;
    nil;
};

[format["Attempting to kick %1", name _unit], _fnc_scriptName] call A3U_fnc_log;
private _password = A3U_password; // Server side only var

if (isNil "_password") exitWith {
    ["Admin Notification", "Server password is not set. Please tell an admin if they're incapable of reading."] remoteExecCall ["A3A_fnc_customHint", 0, false]
};

private _kickMessage = "You have been eliminated. This server has a one-life system, you may rejoin once the timer expires.";
private _kick = format["#kick %1 - %2 -", _uid, _kickMessage];

_password serverCommand _kick;