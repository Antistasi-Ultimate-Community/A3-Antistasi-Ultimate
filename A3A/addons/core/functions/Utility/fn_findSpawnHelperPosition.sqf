#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_findSpawnHelperPosition

Description:
    Find suitable position for spawns of a given type; fallback to provided
    default value, if none found.

Parameters:
    0: _spawnType - ENUM("hc","mineSweep","outpost") <STRING>
    1: _fallback - fallback position/callback <ARRAY,CODE>

Optional:

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
    ["_spawnType", nil, [""]],
    ["_fallback", nil, [[], {}]]
]) exitWith {};

// Look for spawn helpers of the given type that have no vehicles within 10m
// or their size * 2, whichever is greater.
private _helpers = entities QEGVAR(ultimate,BaseSpawnHelper) select {
    _spawnType in getArray(configOf _x >> QEGVAR(ultimate,spawnTypes)) && 
    { nearestObjects[_x, ["LandVehicle","Air"], 10 max(2 * sizeOf typeOf _x)] isEqualTo [] };
};

// Found matching, unoccupied spawn helper(s); pick one and return its position and direction.
if (_helpers isNotEqualTo []) exitWith {
    selectRandom _helpers call {
        [getPosATL _this vectorMultiply[1,1,0], getDir _this]
    };
};

// Fallback!
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
