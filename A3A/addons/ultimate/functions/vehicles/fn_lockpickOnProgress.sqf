params ["_target", "_caller", "_frame", "_actionId"];

private _zones = call A3U_fnc_lockpickZones;

// if !(locked _target in [2, 3]) exitWith {[_target, _actionId] call BIS_fnc_holdActionRemove};

private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);
if (_closestZone isEqualTo teamPlayer) then {
    if (_frame >= 3) then {
        [_target, false] call A3U_fnc_setLock;
        [_target, _actionId] call BIS_fnc_holdActionRemove;
        [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_zone_control", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
    };
};