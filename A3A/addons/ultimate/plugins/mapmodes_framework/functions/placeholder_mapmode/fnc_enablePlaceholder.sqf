/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_enablePlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Enables the provider and installs its map-opening handler. Repeated activation
    reuses existing data and handlers; visual data is created by the first draw.

Parameters:
    None.

Example:
    [] call A3A_ultimate_mapmodes_framework_fnc_enablePlaceholder;

Returns:
    <Boolean|nil> Attachment result, or no value without a local interface.

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"

if (!hasInterface) exitWith {};
if (missionNamespace getVariable [QGVAR(placeholderEnabled), false]) exitWith {
    [] call FUNC(attachPlaceholder);
};
missionNamespace setVariable [QGVAR(placeholderEnabled), true];
private _handler = addMissionEventHandler ["Map", {
    params ["_opened"];
    if (_opened) then { [] call FUNC(attachPlaceholder); };
}];
missionNamespace setVariable [QGVAR(placeholderMapHandler), _handler];
[] call FUNC(attachPlaceholder);