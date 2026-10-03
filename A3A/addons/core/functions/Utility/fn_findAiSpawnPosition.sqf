#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_findAiSpawnPosition

Description:
    Use AI bunch-up helpers near a position to find a suitable spawn position
    for AI.

Parameters:
    0: _marker - Marker name to search spawn helpers at <STRING>

Optional:

Example:
    (begin example)
    ["Synd_HQ"] call A3A_fnc_findAiSpawnPosition;
    (end example)

Returns:
    <ARRAY> Spawn position ATL

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(findAiSpawnPosition),_this);

if !assert(params[
    ["_marker", nil, [""]]
]) exitWith {};

private _position = getMarkerPos _marker;
private _size = [_marker] call A3A_fnc_sizeMarker;
private _assemblyPositions = nearestObjects[_position, ["Building"], 2 * _size, true]
    select { alive _x && { _x inArea _marker } && { getNumber(configOf _x >> QGVAR(aiBunchUpPriority)) > 0 } }
    apply { [(getPosATL _x) vectorMultiply [1,1,0], getNumber(configOf _x >> QGVAR(aiBunchUpPriority))] };

// Always exclude priority=1 if higher priorities are found
private _haveHigher = _assemblyPositions findIf { _x select 1 > 1 } != -1;
if (_haveHigher) then {
    _assemblyPositions = _assemblyPositions select { _x select 1 > 1 };
};

// Shouldn't happen because there should at least be a flag with priority 1...
if (_assemblyPositions isEqualTo []) exitWith { _position };

// Convert into [pos0, weight0, pos1, weight1,...] array
private _positions = [];
_assemblyPositions apply { _positions append _x };
selectRandomWeighted _positions;
