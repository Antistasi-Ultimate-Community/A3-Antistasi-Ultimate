/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_unregisterMode

Description:
    Removes one provider. Deactivates an active provider before removing its
    registration; failed cleanup leaves the registration intact.

Parameters:
    0: _id - Registered provider ID <String>

Example:
    ["MyAddon_supply"] call A3A_ultimate_mapmodes_framework_fnc_unregisterMode;

Returns:
    <Boolean> True on removal; false for invalid input or failed deactivation.

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface || {missionNamespace getVariable [QGVAR(transitioning), false]}) exitWith {false};
if !(_this isEqualType [] && {count _this isEqualTo 1} && {!isNil {_this select 0}} && {(_this select 0) isEqualType ""}) exitWith {false};
params ["_id"];
// TO BE REMOVED | DEV TEST PROVIDER MAPMODE: manage the development provider internally.
if (_id isEqualTo QGVAR(placeholder)) exitWith {false};
private _registry = missionNamespace getVariable [QGVAR(registry), createHashMap];
if !(_id in _registry) exitWith {false};
private _removed = true;
if (_id isEqualTo (missionNamespace getVariable [QGVAR(active), ""])) then {
    _removed = ["", false] call FUNC(selectMode);
};
if (!_removed) exitWith {false};
_registry deleteAt _id;
[] call FUNC(refreshModes);
true