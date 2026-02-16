#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_nearestFriendlyMarker

Description:
    Find the nearest friendly marker to a given unit/vehicle/position.

Parameters:
    0: _position - Unit/vehicle/position <OBJECT,ARRAY>

Optional:
    1: _limitDistance - Search in this radius, only <NUMBER>
        (default: -1, no limit)

Example:
    (begin example)
     // Returns the name of the nearest friendly marker to the player. Even if
     // its 8000m away.
    [player] call A3A_fnc_nearestFriendlyMarker;

    // Returns the name of the nearest friendly marker to the player within
    // 2000m, or "" if none found.
    [player, 2000] call A3A_fnc_nearestFriendlyMarker;
    (end example)

Returns:
    <STRING> Name of nearest friendly marker, or "" if none found.

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_position", nil, [objNull, []]]
]) exitWith { "" };
if (_position isEqualType objNull && { !assert(!isNull _position) }) exitWith { "" };

private _limitDistance = param[1, -1, [0]];
private _markers = markersX select { sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer };
private _nearestMarker = [_markers, _position] call BIS_fnc_nearestPosition;

// Shouldn't happen, but just in case
if !assert(_nearestMarker isEqualType "") exitWith { "" };

if (_limitDistance >= 0 && { _position distance markerPos _nearestMarker > _limitDistance } ) exitWith { "" };

_nearestMarker;
