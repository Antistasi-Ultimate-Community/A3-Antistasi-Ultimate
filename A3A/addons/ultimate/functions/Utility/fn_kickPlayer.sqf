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

private _name = name _unit;

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

[_unit, sideEmpty, false] remoteExecCall ["A3U_fnc_trackPlayer", 2];

_password serverCommand _kick;

private _messages = [
    "<t color='#ff0000'>%1 is gone.</t> Farewell!",
    "<t color='#ff0000'>%1 has been fired</t> from The Science Team.",
    "<t color='#ff0000'>%1 fucked around</t>, and they <t color='#ff0000'>just found out.</t>",
    "What a shame! <t color='#ff0000'>%1 is OUT.</t>",
    "<t color='#ff0000'>%1's contract has been terminated</t>. Such a shame.",
    "<t color='#ff0000'>%1 proved to be a disappointment</t>. Next subject!",
    "<t color='#ff0000'>%1 has been permanently retired</t> from life.",
    "<t color='#ff0000'>%1 was made redundant</t>, effective immediately.",
    "<t color='#ff0000'>%1’s living privileges have been revoked</t>. How sad.",
    "<t color='#ff0000'>%1 proved death</t> is still trending."
];

private _message = format[(selectRandom _messages), _name];

// [_message] remoteExec ["systemChat", 0];
// [_message, false] remoteExec ["A3A_fnc_showIntel", 0];
_warningText = "<t font ='PuristaSemibold' align = 'center' size='0.5' color='#ebebeb'>" + _message + "</t>";
[_warningText,0,safezoneY-0.25] remoteExec ["BIS_fnc_dynamicText"];