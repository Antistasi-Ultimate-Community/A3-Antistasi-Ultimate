#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isWithinNearestFriendlyMarker

Description:
    Check if unit/vehicle/position is near and within the area of a friendly
    marker.

    For zero-size markers, assume a default radius of 50 meters.

Parameters:
    0: _position - Unit/vehicle/position to check <OBJECT,ARRAY>

Optional:
    1: _limitDistance - Search in this radius, only <NUMBER>
        (default: -1, no limit)

Example:
    (begin example)
    // Returns true if player is near a friendly marker very far away, false otherwise.
    [player] call A3A_fnc_isWithinNearestFriendlyMarker;

    // Returns true if player is near a friendly marker 500m away, false otherwise.
    [player, 500] call A3A_fnc_isWithinNearestFriendlyMarker;
    (end example)

Returns:
    <BOOL> True if near a friendly marker, false otherwise.

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_position", nil, [objNull, []]]
]) exitWith { false };
if (_position isEqualType objNull && { !assert(!isNull _position) }) exitWith { false };

private _limitDistance = param[1, -1, [0]];
private _nearestMarker = [_position, _limitDistance] call A3A_fnc_nearestFriendlyMarker;

(_nearestMarker isNotEqualTo "") &&
{ [_position, _nearestMarker] call A3A_fnc_isWithinMarkerArea };
