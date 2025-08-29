#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_canUnlock

Description:
    Checks if a vehicle can be unlocked

Parameters:
    0: _unit - the player attempting to unlock <OBJECT>
    1: _target - the vehicle to check <OBJECT>

Optional:
    2: _forDisplayOnly - whether the check is for displaying the hold-action (true) or executing it (false, default) <BOOL>

Example:
    (begin example)
    [player, cursorTarget] call A3A_fnc_canUnlock;
    (end example)

Returns:
    Whether the vehicle can be unlocked <BOOL>

Author:
    UnseenKill
---------------------------------------------------------------------------- */
if !assert(params[
    ["_unit", nil, [objNull]],
    ["_target", nil, [objNull]],
]) exitWith { false };

if !assert(!isNull _unit) exitWith { false };
if !assert(!isNull _target) exitWith { false };

private _forDisplayOnly = params[2, false, [true]];

// Vehicle is missing required variable
if (_target getVariable[QGVAR(lockpickAction), false] isEqualTo false) exitWith { false };

// Generic interaction checks
if !(call FUNC(canInteract)) exitWith { false };

// Vehicle is unlocked
if !([_target] call FUNC(isLocked)) exitWith { false };

// Display-only checks
if (_forDisplayOnly) exitWith { true };

// Allow engineers
if ([_unit] call FUNC(isEngineer)) exitWith { true };

GVAR(allowLockpickKits) && {
    magazines _unit findIf {
        _x isKindOf QGVAR(LockpickKitBase)
    } != -1
};
