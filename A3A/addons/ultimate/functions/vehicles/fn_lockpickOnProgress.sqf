params ["_target", "_caller", "_actionId", "_frame", "_maxFrame"];

if (_frame >= (_maxFrame / 2)) then {
    _caller setCaptive false;
};

private _zones = call A3U_fnc_lockpickZones;

if (locked _target in [0, 1]) exitWith {[_target, _actionId] call BIS_fnc_holdActionRemove};

private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);
if (_closestZone isEqualTo teamPlayer) then {
    [_target, _actionId] call BIS_fnc_holdActionRemove;
    [_target, false] remoteExec ["A3U_fnc_setLock", (owner _target)];
    [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_success", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
};