/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_disablePlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Disables the provider, removes only its owned draw and map-opening handlers,
    and clears cached circles and attachment state. Safe to repeat.

Parameters:
    None.

Example:
    [] call A3A_ultimate_mapmodes_framework_fnc_disablePlaceholder;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"

if (!hasInterface) exitWith {};
missionNamespace setVariable [QGVAR(placeholderEnabled), false];
private _map = uiNamespace getVariable [QGVAR(placeholderMap), controlNull];
private _drawHandler = uiNamespace getVariable [QGVAR(placeholderDrawHandler), -1];
if (!isNull _map && {_drawHandler >= 0}) then {
    _map ctrlRemoveEventHandler ["Draw", _drawHandler];
};
private _mapHandler = missionNamespace getVariable [QGVAR(placeholderMapHandler), -1];
if (_mapHandler >= 0) then { removeMissionEventHandler ["Map", _mapHandler]; };
uiNamespace setVariable [QGVAR(placeholderMap), controlNull];
uiNamespace setVariable [QGVAR(placeholderDrawHandler), -1];
missionNamespace setVariable [QGVAR(placeholderMapHandler), -1];
missionNamespace setVariable [QGVAR(placeholderCircles), []];