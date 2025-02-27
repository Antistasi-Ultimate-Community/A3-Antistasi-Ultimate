/*
    Author:
        MaxxLite

    Description:
        Adds the action to dialog with _unit, handles broadcasting and JIP
    
    Params:
        _unit <Default: ObjNull>
    
    Dependencies:
        N/A
    
    Scope:
        Server, HC
    
    Environment:
        Unscheduled
    
    Usage:
        [_unit] call A3U_fnc_dialogCivAction;
    
    Return:
        N/A
*/



#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_unit", ObjNull]];

if !(allowCivDialog) exitWith {false};

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_lowCiv || _civNonHuman) exitWith {false};

if (!isServer && hasInterface) exitWith {
    ["Server-side function was not called on the server? Aborting", _fnc_scriptName] call A3U_fnc_log;
};

[_unit] remoteExecCall ["A3A_fnc_dialogCiv", 0, _unit];