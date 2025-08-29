params ["_target", "_caller"];

if !([_caller, _target] call FUNCMAIN(canUnlock)) exitWith {};

private _zones = call A3U_fnc_lockpickZones;

private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);

// TODO: check if there's anybody around to notice the alarm
if (_closestZone isNotEqualTo teamPlayer) then {
    [_target, "alarmCar"] remoteExecCall ["say3D", 0, true]; 

    _caller setCaptive false;

    [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_aborted"] call A3A_fnc_customHint;
};
