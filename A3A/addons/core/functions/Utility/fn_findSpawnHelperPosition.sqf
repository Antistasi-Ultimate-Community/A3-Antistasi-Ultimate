#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_findSpawnHelperPosition

Description:
    Find suitable position for spawns of a given type; fallback to provided
    default value, if none found.

Parameters:
    0: _spawnType - ENUM("hc","mineSweep","outpost") <STRING>

Optional:
    1: _fallback - fallback position/callback <ARRAY,CODE>
        If array, expected to be either [x,y,z] or [[x,y,z], direction].
        If code, expected to return either of the above. If left out, fallback
        will be nearest road at respawn marker with some randomness applied.

Example:
    (begin example)
    // Find spawn position for HC group, with fallback to respawn marker.
    ["hc", markerPos respawnTeamPlayer] call A3A_fnc_findSpawnHelperPosition;

    // Find spawn position for mine sweep unit, with custom fallback callback to call.
    ["mineSweep", {getMarkerPos respawnTeamPlayer getPos [20, random 360]}] call A3A_fnc_findSpawnHelperPosition;
    (end example)

Returns:
    <ARRAY> [position, direction]

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(findSpawnHelperPosition),_this);

if !assert(params[
    ["_spawnType", nil, [""]]
]) exitWith {};

// Look for spawn helpers of the given type that have no vehicles within 10m
// or their size * 2, whichever is greater.
private _size = ["Synd_HQ"] call A3A_fnc_sizeMarker;
private _helpers = nearestObjects[markerPos "Synd_HQ", [QEGVAR(ultimate,BaseSpawnHelper)], 2 * _size] select {
    private _helper = _x;
    _spawnType in getArray(configOf _helper >> QEGVAR(ultimate,spawnTypes)) && {
        nearestObjects[_helper, ["LandVehicle","Air"], 10 max(2 * sizeOf typeOf _helper)] select {
            (!isObjectHidden _x) &&
            { !(_x in attachedObjects _helper) }
        } isEqualTo []
    };
};

Trace_1(QFUNCMAIN(findSpawnHelperPosition),_helpers);

// Found matching, unoccupied spawn helper(s); pick one and return its position and direction.
if (_helpers isNotEqualTo []) exitWith {
    selectRandom _helpers call {
        [getPosATL _this vectorMultiply[1,1,0], getDir _this]
    };
};

// Fallback!
private _fallback = param[1, nil, [[], {}]];

// No fallback provided, return nearest road or fallback fallback to respawn marker.
if (isNil "_fallback") exitWith {
    private _searchCenter = markerPos respawnTeamPlayer;
    private _road = [_searchCenter] call A3A_fnc_findNearestGoodRoad;
    private _posAndDir = if !(isNull _road) then {
        [position _road, getDir _road];
    } else {
        [_searchCenter, random 360];
    };

    _posAndDir params["_searchPosition", "_direction"];

    private _pos = _searchPosition findEmptyPosition[1, 30, "B_G_Van_01_transport_F"];
    if (_pos isEqualTo []) then { _pos = _searchPosition };
    [_pos, _direction];
};

private _value = if (_fallback isEqualType {}) then {
    [] call _fallback;
} else {
    _fallback
};

switch true do {
    // Assume Position3D
    case(count _value isNotEqualTo 2): { [_value, random 360] };
    // Check if fallback is [position, direction]
    default {
        _value params["_a","_b"];
        if (_a isEqualType [] && {_b isEqualType 0}) then {
            [_a, _b]
        } else {
            [_value, random 360]
        };
    };
};
