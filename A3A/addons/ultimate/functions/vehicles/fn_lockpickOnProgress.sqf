params ["_target", "_caller", "_actionId", "_frame", "_maxFrame"];

if !([_target] call A3U_fnc_isLocked) exitWith {[_target, _actionId] call BIS_fnc_holdActionRemove};

private _zones = call A3U_fnc_lockpickZones;
private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);
private _vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _target >> "displayName");

if (_frame == 2) then {
    [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_start", _vehicleName]] call A3A_fnc_customHint;
};

private _hintMessage = [];

if (_closestZone isEqualTo teamPlayer && {_frame >= (_maxFrame / 12)}) then {
    _hintMessage = [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_zone_control", _vehicleName]];
};

if ([_caller, 'ToolKit'] call BIS_fnc_hasItem && {_hintMessage isEqualTo []} && {_frame >= (_maxFrame / 2)}) then {
    _hintMessage = [localize "STR_A3AU_action_lockpick_title", format [localize "STR_A3AU_action_lockpick_has_toolkit", _vehicleName]];
};

if (_hintMessage isNotEqualTo []) exitWith {
    [_target, _actionId] call BIS_fnc_holdActionRemove;
    [_target, false] remoteExec ["A3U_fnc_setLock", (owner _target)];
    _hintMessage call A3A_fnc_customHint;
};