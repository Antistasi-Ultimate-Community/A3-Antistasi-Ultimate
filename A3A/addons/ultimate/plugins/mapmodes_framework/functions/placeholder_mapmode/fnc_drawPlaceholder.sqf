/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_drawPlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Creates twenty translucent purple circles on the first draw after activation
    and reuses their cached positions until the provider is disabled.

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

params ["_map"];
if !(missionNamespace getVariable [QGVAR(placeholderEnabled), false]) exitWith {};
private _circles = missionNamespace getVariable [QGVAR(placeholderCircles), []];
if (_circles isEqualTo []) then {
    private _minimumRadius = (worldSize * 0.02) min 600;
    private _maximumRadius = (worldSize * 0.04) min 1200;
    for "_index" from 1 to 20 do {
        private _radius = _minimumRadius + random (_maximumRadius - _minimumRadius);
        private _span = worldSize - 2 * _radius;
        _circles pushBack [[_radius + random _span, _radius + random _span, 0], _radius];
    };
    missionNamespace setVariable [QGVAR(placeholderCircles), _circles];
};
{
    _x params ["_position", "_radius"];
    _map drawEllipse [_position, _radius, _radius, 0, [0.65, 0.1, 0.9, 0.3], "#(rgb,1,1,1)color(1,1,1,1)"];
} forEach _circles;