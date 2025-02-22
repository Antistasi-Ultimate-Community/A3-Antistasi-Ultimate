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

private _zones = (airportsX + milbases + seaports + outposts);

[ 
    _vehicle,
    localize "STR_A3AU_action_lockpick_title",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    "(_this distance _target < 5) && {_this call A3A_fnc_isEngineer} && {[_this, 'ToolKit'] call BIS_fnc_hasItem}",
    "(_caller distance _target < 5)",
    {[localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_start", (getText (configFile >> "cfgVehicles" >> typeOf (_this select 0) >> "displayName"))]] call A3A_fnc_customHint},
    {
        params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];

        [_target, _zones, _frame, _actionId] call A3U_fnc_lockpickOnProgress;
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, false] call A3U_fnc_setLock;
        [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_success", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
    },
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_target, _caller, _zones] call A3U_fnc_lockpickOnFail;
    },
    [],
    30,
    2026,
    true,
    false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _vehicle];