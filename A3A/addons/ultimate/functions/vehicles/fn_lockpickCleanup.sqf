#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_lockpickCleanup

Description:
    Cleans up the lockpick action from a vehicle

Parameters:
    0: _vehicle - the vehicle to clean up <OBJECT>

Optional:
    1: _unlockAfter - whether to unlock the vehicle after cleanup (default: false) <BOOL>

Example:

Returns:
    Nothing

Scope:
    Client

Author:
    UnseenKill
---------------------------------------------------------------------------- */
params[
    ["_vehicle", objNull, [objNull]],
    ["_unlockAfter", false, [false]]
];

if !assert(!isNull _vehicle) exitWith {};

if (_target getVariable[QGVAR(lockpickAction), false] isNotEqualTo false) then {
    [_target, _target getVariable QGVAR(lockpickAction)] call BIS_fnc_holdActionRemove;
    _target setVariable[QGVAR(lockpickAction), nil];
};

if (_unlockAfter) then {
    [_target, false] remoteExecCall ["A3U_fnc_setLock", owner _target];
};

nil;
