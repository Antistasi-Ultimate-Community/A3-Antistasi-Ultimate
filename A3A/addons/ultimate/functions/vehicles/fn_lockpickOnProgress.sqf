params ["_target", "_caller", "_actionId", "_frame", "_maxFrame"];

if !([_target] call A3U_fnc_isLocked) exitWith {[_target, _actionId] call BIS_fnc_holdActionRemove};

private _zones = call A3U_fnc_lockpickZones;

private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);

if (_frame == 2) then {
    [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_start", (getText (configFile >> "cfgVehicles" >> typeOf (_this select 0) >> "displayName"))]] call A3A_fnc_customHint;
};

if (_frame >= (_maxFrame / 12) && {_closestZone isEqualTo teamPlayer}) exitWith {
    [_target, _actionId] call BIS_fnc_holdActionRemove;
    [_target, false] remoteExec ["A3U_fnc_setLock", (owner _target)];
    [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_zone_control", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
};

if (_frame >= (_maxFrame / 2) && {[_caller, 'ToolKit'] call BIS_fnc_hasItem}) then {
    [_target, _actionId] call BIS_fnc_holdActionRemove;
    [_target, false] remoteExec ["A3U_fnc_setLock", (owner _target)];
    [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_has_toolkit", (getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName"))]] call A3A_fnc_customHint;
};