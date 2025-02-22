params ["_target", "_caller"];

private _zones = call A3U_fnc_lockpickZones;

private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);
if (_closestZone isNotEqualTo teamPlayer) then {
    [_target, "alarmCar"] remoteExec ["say3D", 0, true];

    private _closeUnits = nearestObjects [_caller, ["CAManBase"], 50];
    _closeUnits deleteAt (_closeUnits find _caller);
    {
        _x knowsAbout _caller;
        _x setBehaviour "COMBAT";
    } forEach _closeUnits;

    [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_aborted"] call A3A_fnc_customHint;
};