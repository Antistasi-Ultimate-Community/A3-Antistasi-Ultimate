/*
    Author:
        Maxx
    
    Description:
        Adds the ability to lockpick locked vehicles
    
    Params:
        _vehicle <Object> <Default: nil>
    
    Usage:
        [_vehicle] call A3U_fnc_lockpick;
*/

params ["_vehicle"];

[ 
    _vehicle,
    localize "STR_A3AU_action_lockpick_title",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "(_this distance _target < 10) && {_this call A3U_fnc_isLocked}",
    "(_caller distance _target < 10) && {_this call A3A_fnc_isEngineer}",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        if !(_caller call A3A_fnc_isEngineer) then {
            [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_not_engineer"] call A3A_fnc_customHint;
        };
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];

        [_target, _caller, _actionId, _frame, _maxFrame] call A3U_fnc_lockpickOnProgress;
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target, _caller, _actionId] call A3U_fnc_lockpickOnSuccess;
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        
        [_target, _caller] call A3U_fnc_lockpickOnFail;
    },
    [],
    vehicleLockpickTime,
    2026,
    false,
    false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _vehicle];