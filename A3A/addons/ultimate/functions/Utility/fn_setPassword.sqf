/*
    Author:
        Silence
    
    Description:
        Sets the A3U_password specifically on the server. Again, security is not necessarily a concern.
        Key signatures are assumed to be on - Anyone still able to access server variables will likely be able to cheat without this anyway.
    
    Params:
        _password <STRING> <Default: "">
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        ["password"] remoteExecCall ["A3U_fnc_setPassword", 2];
    
    Return:
        N/A
*/

params [
    ["_password", ""]
];

if (!isServer) exitWith {
    [_password] remoteExecCall ["A3U_fnc_setPassword", 2];
};

["Setting server password.", _fnc_scriptName] call A3U_fnc_log;

A3U_password = _password;