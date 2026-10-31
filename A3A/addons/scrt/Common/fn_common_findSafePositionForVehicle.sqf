/*
Maintainer: Socrates
    Tries to find position for vehicle on road or in the wild, so it can be safely spawned there.

Arguments:
	<POSITION> Approximate search position.
    <STRING> Vehicle classname.

Return Value:
    <ARRAY> [position, direction]

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> nextRivalsLocationReveal

Example:
[_position, _classname] call SCRT_fnc_common_trySpawnWanderingGroup;
*/

params [["_position", []], ["_classname", ""], ["_radius", 250], ["_ignoreRoads", false]];

if (_position isEqualTo [] || {_classname isEqualTo ""}) exitWith {};

private _roads = [];
private _radiusX = 50;
private _iterations = 0;

if (!_ignoreRoads) then {
	while {true} do {
		_roads = _position nearRoads _radiusX;
		if (_roads isNotEqualTo []) exitWith {};
		if (_iterations > 30) exitWith {};
		_iterations = _iterations + 1;
		_radiusX = _radiusX + 50;
	};
};

private _vehicleSpawnPosition = nil;
private _dirVeh = random 360;
if (_roads isEqualTo []) then {
	_vehicleSpawnPosition = [
		_position, //center
		0, //minimal distance
		_radius, //maximumDistance
		7, //object distance
		0, //water mode
		0.45, //maximum terrain gradient
		0, //shore mode
		[], //blacklist positions
		[_position, _position] //default position
	] call BIS_fnc_findSafePos;
} else {
	private _road = selectRandom _roads;
	private _roadCon = roadsConnectedTo _road;
	_dirVeh = if(_roadcon isNotEqualTo []) then {[_road, _roadCon select 0] call BIS_fnc_DirTo} else {random 360};
	_vehicleSpawnPosition = getPos _road;
};

private _emptyPos = _vehicleSpawnPosition findEmptyPosition [0, _radius, _classname];
if (_emptyPos isNotEqualTo []) then {
	_vehicleSpawnPosition = _emptyPos;
};

[_vehicleSpawnPosition, _dirVeh]
