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
if !assert(params[
    ["_vehicle", nil, [objNull]]
]) exitWith {};

if !assert(!isNull _vehicle) exitWith {};

private _removeOk = true;
private _unlockVehicle = param[1, false, [true]];

if (_unlockVehicle) then {
    try {
        if !([player] call A3A_fnc_isEngineer) then {
            if !GVAR(allowLockpickKits) then { throw "Lockpick kits are disabled" };

            private _lockpickKit = [player] call A3U_fnc_lockpickGetPlayerItem;

            // Should not happen, still check, though
            if !assert(_lockpickKit isNotEqualTo "") then { throw "No lockpick kit found" };

            // Now "use" the lockpick kit
            if !([player, _lockpickKit] call A3U_fnc_useMagazineItem) then { throw "Failure to use magazine item" };
        };

        [_vehicle, false] remoteExecCall ["A3U_fnc_setLock", owner _vehicle];
    } catch {
        Error_1("Vehicle won't be unlocked: %1", _exception);
        _removeOk = false;
    };
};

if (_removeOk) then {
    _vehicle setVariable[QGVAR(lockpickUsed), nil];
    _vehicle setVariable[QGVAR(lockpickWillBreak), nil];

    if (_vehicle getVariable[QGVAR(lockpickAction), false] isNotEqualTo false) then {
        [_vehicle, _vehicle getVariable QGVAR(lockpickAction)] call BIS_fnc_holdActionRemove;
        _vehicle setVariable[QGVAR(lockpickAction), nil];
    };
};

nil;
