#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isWithinMarkerArea

Description:
    Check if a given position/object is within the area of a specified marker.

    For zero-size markers, assume a default radius of
    GVAR(zeroSizeMarkerBlowup) meters.

Parameters:
    0: _position - The position/object to check <ARRAY,OBJECT>
    1: _markerName - The name of the marker <STRING>

Optional:
    2: _zeroSizeRadius - The radius to use if the marker size is zero <SCALAR>
        (Default: GVAR(zeroSizeMarkerBlowup))

Example:
    (begin example)
    [[1000,2000,0], "markerName"] call A3A_fnc_isWithinMarkerArea;
    [player, "markerName", 150] call A3A_fnc_isWithinMarkerArea;
    (end example)

Returns:
    <BOOL> True if the position is within the marker area, false otherwise.

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_position", nil, [objNull, []]],
    ["_markerName", nil, [""]]
]) exitWith { false };
if (_position isEqualType objNull && { !assert(!isNull _position) }) exitWith { false };

if (markerShape _markerName isEqualTo "") exitWith {
    Warning_1("No such marker: %1",str _markerName);
    false;
};

private _zeroSizeRadius = param[2, GVAR(zeroSizeMarkerBlowup), [0]];

_position inArea[
    markerPos _markerName,
    (markerSize _markerName select 0) max _zeroSizeRadius,
    (markerSize _markerName select 1) max _zeroSizeRadius,
    markerDir _markerName,
    markerShape _markerName isEqualTo "RECTANGLE"
];
