/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_drawPlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Draws cached translucent purple circles with the diagnostic label centered on
    each circle. This provider never changes other providers' data or rendering.

Parameters:
    0: _map - Main-map control supplied by its Draw event <Control>

Example:
    [_map] call A3A_ultimate_mapmodes_framework_fnc_drawPlaceholder;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_map"];
if !(missionNamespace getVariable [QGVAR(placeholderEnabled), false]) exitWith {};
private _label = localize LSTRING(Placeholder);
{
    _x params ["_position", "_radius"];
    _map drawEllipse [_position, _radius, _radius, 0, [0.65, 0.1, 0.9, 0.3], "#(rgb,1,1,1)color(1,1,1,1)"];
} forEach (missionNamespace getVariable [QGVAR(placeholderCircles), []]);