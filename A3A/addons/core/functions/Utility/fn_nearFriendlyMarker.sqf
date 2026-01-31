#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_nearFriendlyMarker

Description:
    Check if unit/vehicle is near and within the area of a friendly marker.

    For zero-size markers, assume a default radius of 50 meters.

Parameters:
    0: _object - Unit/vehicle to check <OBJECT>

Optional:

Example:
    (begin example)
    [player] call A3A_fnc_nearFriendlyMarker;
     // Returns true if player is near a friendly marker, false otherwise.
    (end example)

Returns:
    <BOOL> True if near a friendly marker, false otherwise.

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith { false };

private _nearestMarker = [markersX, _object] call BIS_fnc_nearestPosition;

(sidesX getVariable[_nearestMarker, sideUnknown] isEqualTo teamPlayer) && {
    _object inArea[
        markerPos _nearestMarker,
        (markerSize _nearestMarker select 0) max 100,
        (markerSize _nearestMarker select 1) max 100,
        markerDir _nearestMarker,
        markerShape _nearestMarker isEqualTo "RECTANGLE"
    ]
};
