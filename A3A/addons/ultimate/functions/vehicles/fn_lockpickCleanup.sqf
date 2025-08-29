#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3U_fnc_lockpickCleanup

Description:
    Cleans up the lockpick action from a vehicle

Parameters:
    0: _vehicle - the vehicle to clean up <OBJECT>

Optional:
    1: _unlockVehicle - whether to unlock the vehicle, too (default: false) <BOOL>

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
    ["_unlockVehicle", false, [false]]
];

if !assert(!isNull _vehicle) exitWith {};

private _removeOk = true;

if (_unlockVehicle) then {
    try {
        if !([_target] call A3U_fnc_isEngineer) then {
            if !GVAR(allowLockpickKits) then { throw "Lockpick kits are disabled" };

            private _lockpickKit = [player] call A3U_fnc_lockpickGetPlayerItem;

            // Should not happen, still check, though
            if !assert(_lockpickKit isNotEqualTo "") then { throw "No lockpick kit found" };

            // Now "use" the lockpick kit
            if !([player, _lockpickKit] call A3U_fnc_useMagazineItem) then { throw "Failure to use magazine item" };
        };

        [_target, false] remoteExecCall ["A3U_fnc_setLock", owner _target];
    } catch {
        Error_1("Vehicle won't be unlocked: %1", _exception);
        _removeOk = false;
    };
};

if (_removeOk) then {
    _target setVariable[QGVAR(lockpickUsed), nil];
    _target setVariable[QGVAR(lockpickWillBreak), nil];

    if (_target getVariable[QGVAR(lockpickAction), false] isNotEqualTo false) then {
        [_target, _target getVariable QGVAR(lockpickAction)] call BIS_fnc_holdActionRemove;
        _target setVariable[QGVAR(lockpickAction), nil];
    };
};

nil;
