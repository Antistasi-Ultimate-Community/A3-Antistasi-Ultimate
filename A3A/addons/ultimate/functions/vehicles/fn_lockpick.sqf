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
    //"(_this distance _target < 10) && {alive _target} && {_target call A3U_fnc_isLocked}",
    QUOTE([ARR_3(_this,_target,true) call FUNCMAIN(canUnlock)]),
    //"(_caller distance _target < 10) && {_caller call A3A_fnc_isEngineer}",
    QUOTE([ARR_2(_this,_target) call FUNCMAIN(canUnlock)]),
    { call FUNC(lockpickOnStart) },
    { call FUNC(lockpickOnProgress) },
    { call FUNC(lockpickOnSuccess) },
    { call FUNC(lockpickOnFail) },
    [],
    vehicleLockpickTime,
    2026,
    false,
    false
] call BIS_fnc_holdActionAdd];

nil;
