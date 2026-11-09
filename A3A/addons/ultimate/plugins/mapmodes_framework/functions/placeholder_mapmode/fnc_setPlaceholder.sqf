/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_setPlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Enables or cleans up the development provider's map handlers. Generates twenty
    large purple circles once per activation and keeps their positions cached.

Parameters:
    0: _enabled - Whether to activate the diagnostic provider <Boolean>

Example:
    [true] call A3A_ultimate_mapmodes_framework_fnc_setPlaceholder;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_enabled"];
if (!hasInterface) exitWith {};
if (!_enabled) exitWith {
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
};
if (missionNamespace getVariable [QGVAR(placeholderEnabled), false]) exitWith {
    [] call FUNC(attachPlaceholder);
};
private _circles = [];
private _minimumRadius = (worldSize * 0.02) min 600;
private _maximumRadius = (worldSize * 0.04) min 1200;
for "_index" from 1 to 20 do {
    private _radius = _minimumRadius + random (_maximumRadius - _minimumRadius);
    private _span = worldSize - 2 * _radius;
    _circles pushBack [[_radius + random _span, _radius + random _span, 0], _radius];
};
missionNamespace setVariable [QGVAR(placeholderCircles), _circles];
missionNamespace setVariable [QGVAR(placeholderEnabled), true];
private _handler = addMissionEventHandler ["Map", {
    params ["_opened"];
    if (_opened) then { [] call FUNC(attachPlaceholder); };
}];
missionNamespace setVariable [QGVAR(placeholderMapHandler), _handler];
[] call FUNC(attachPlaceholder);