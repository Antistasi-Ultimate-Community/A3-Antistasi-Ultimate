#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_handlerTerrainManipulator

Description:
    Post complete/load handler for terrain manipulator base builder objects.

Parameters:
    0: _object - Terrain manipulator object <OBJECT>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill
---------------------------------------------------------------------------- */
params[
    ["_object", objNull, [objNull]]
];

if !assert(!isNull _object) exitWith {};

private _properties = configOf _object >> QGVAR(Properties);
private _actions = getArray(_properties >> "actions");

if ("terrainCleaner" in _actions) then {
    [_object, getNumber(_properties >> "cleanRadius")] call A3A_fnc_terrainCleaner;
};

if ("terrainSmoother" in _actions) then {
    getArray(_properties >> "smoothRadius") params[
        ["_mainZoneRadius", 0, [0]],
        ["_smoothingZoneRadius", 0, [0]]
    ];
    [_object, _mainZoneRadius, _smoothingZoneRadius] call A3A_fnc_terrainSmoother;
};

if ("hideObject" in _actions) then {
    _object hideObjectGlobal true;
    _object enableSimulationGlobal false;
};

nil;
