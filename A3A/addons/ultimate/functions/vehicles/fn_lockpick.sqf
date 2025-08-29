#include "..\..\script_component.hpp"
/*
    Author:
        Maxx, Silence
    
    Description:
        Adds the action to lockpick a vehicle locally
    
    Params:
        _vehicle <OBJECT>
    
    Dependencies:
        vehicleLockpickTime
    
    Scope:
        Client
    
    Environment:
        Unscheduled
    
    Usage:
        [_vehicle] call A3U_fnc_lockpick;
    
    Return:
        N/A
*/

params ["_vehicle"];

if isNull(_vehicle) exitWith {};

_vehicle setVariable[QGVAR(lockpickAction), [ 
    _vehicle,
    localize "STR_A3AU_action_lockpick_title",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    QUOTE([ARR_3(_this,_target,true) call A3U_fnc_canUnlock]),
    QUOTE([ARR_2(_this,_target) call A3U_fnc_canUnlock]),
    { call A3U_fnc_lockpickOnStart },
    { call A3U_fnc_lockpickOnProgress },
    { call A3U_fnc_lockpickOnSuccess },
    { call A3U_fnc_lockpickOnFail },
    [],
    vehicleLockpickTime,
    2026,
    false,
    false
] call BIS_fnc_holdActionAdd];

nil;
