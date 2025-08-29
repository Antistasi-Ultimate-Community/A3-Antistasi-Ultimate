params ["_target", "_caller", "_actionId", "_frame", "_maxFrame"];

if !([_caller, _target] call FUNCMAIN(canUnlock)) exitWith { [_target] call FUNCMAIN(lockpickCleanup) };

private _zones = call A3U_fnc_lockpickZones;
private _closestZone = (sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown]);
private _vehicleName = getText (configOf _target >> "displayName");

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

// Successful lockpick (early exit)
if (_hintMessage isNotEqualTo []) exitWith {
    [_target, true] call FUNCMAIN(lockpickCleanup);
    _hintMessage call A3A_fnc_customHint;
};
