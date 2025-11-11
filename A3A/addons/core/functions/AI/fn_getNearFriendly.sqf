/*
Maintainer: wersal
    Returns nearby friendly AI units matching specified filters (optionally excluding vehicle crews). 
    Local only.

Parameters:
    _centerPos - Position or object to use as search center [Position/OBJECT]
    _targetSide - Side of units to search for [SIDE]
    _radius - Search radius in meters [NUMBER]
    _excludeInVehicles - (Optional, default: true) Exclude units in vehicles [BOOLEAN]

Return Value:
    <ARRAY> Filtered units matching criteria

Scope: Client
Environment: Any
Public: Yes

Example:
// Get nearby friendly infantry within 100m (excluding vehicle crews)
_friendlyInfantry = [
    getPos _unit, 
    side _unit, 
    100
] call A3A_fnc_getNearFriendly;

// Get all nearby friendly units including vehicle crews
_allFriendlyUnits = [
    getPos _unit, 
    west, 
    200, 
    false
] call A3A_fnc_getNearFriendly;
*/

params [
    "_centerPos",
    "_targetSide",
    "_radius",
    ["_excludeInVehicles", true]
];

allUnits select {
    side _x == _targetSide &&
    {_x distance _centerPos <= _radius} &&
	{!_excludeInVehicles || {isNull objectParent _x}}
};
