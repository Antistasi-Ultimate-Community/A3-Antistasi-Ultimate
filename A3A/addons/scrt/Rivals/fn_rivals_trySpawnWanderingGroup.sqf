/*
Maintainer: Socrates
    Spawns wandering group of rivals in the.

Arguments:
    <MARKER> Location.

Return Value:
    <NIL>

Scope: Server
Environment: Schduled
Public: Yes
Dependencies:
    <NUMBER> nextRivalsLocationReveal

Example:
[] spawn SCRT_fnc_rivals_trySpawnWanderingGroup;
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()


params ["_marker"];

if (areRivalsDefeated) exitWith {
	Info("Rivals was defeated before, exiting.");
};
if (!areRivalsDiscovered) exitWith {
	Info("Rivals are not yet discovered, exiting.");
};
if (!(_marker in ([] call SCRT_fnc_rivals_getLocations))) exitWith {
	Info("Location is not in the rivals network, exiting.");
};
if (!([] call SCRT_fnc_rivals_rollProbability)) exitWith {
	Info("Low probability, exiting.");
};

Info_1("Creating rivals patrol on %1 marker...", _marker);

sleep 15;

private _groups = [];
private _vehicles = [];

private _rivalsTacUnit = [] call SCRT_fnc_rivals_chooseGroupToSpawn;
if (_rivalsTacUnit isEqualTo []) exitWith {
	Error("Empty rivals group for some reason, aborting.");
};

Info_1("Rivals tactical unit: %1", str _rivalsTacUnit);

private _spawnableGroup = _rivalsTacUnit select 0;
private _spawnableVehicle = _rivalsTacUnit select 1;

//group with vehicle will spawn on road
if (_spawnableVehicle != "") then {
	private _markerPosition = getMarkerPos _marker;
	private _originPosition = [
            _markerPosition, //center
            0, //minimal distance
            700, //maximumDistance
            0, //object distance
            0, //water mode
            0, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_markerPosition, _markerPosition] //default position
        ] call BIS_fnc_findSafePos;

	private _roads = [];
	private _radiusX = 50;
	private _iterations = 0;

	while {true} do {
		_roads = _originPosition nearRoads _radiusX;
		if (count _roads > 0 && {_roads findIf {!([position _x] call A3A_fnc_enemyNearCheck)} != -1}) exitWith {};
		if (_iterations > 30) exitWith {};
		_iterations = _iterations + 1;
		_radiusX = _radiusX + 50;
	};

	private _vehicleSpawnPosition = nil;
	private _dirVeh = random 360;
	if (isNil "_roads"  || _roads isEqualTo []) then {
		_vehicleSpawnPosition = [
            _markerPosition, //center
            0, //minimal distance
            250, //maximumDistance
            7, //object distance
            0, //water mode
            0.45, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_originPosition, _originPosition] //default position
        ] call BIS_fnc_findSafePos;
	} else {
		private _road = selectRandom _roads;
		private _roadCon = roadsConnectedto _road;
		_dirVeh = if(count _roadcon > 0) then {[_road, _roadCon select 0] call BIS_fnc_DirTo} else {random 360};
		_vehicleSpawnPosition = getPos _road;
	};

	private _emptyPos = _vehicleSpawnPosition findEmptyPosition [0, 50, _spawnableVehicle];
	if (_emptyPos isNotEqualTo []) then {
		_vehicleSpawnPosition = _emptyPos;
	};

	private _vehicleData = [_vehicleSpawnPosition, _dirVeh, _spawnableVehicle, Rivals] call A3A_fnc_RivalsSpawnVehicle;
	private _vehicle = _vehicleData select 0;
	[_vehicle, Rivals] call A3A_fnc_AIVEHinit;
	private _vehicleCrew = _vehicleData select 1;
	private _vehicleGroup = _vehicleData select 2;
	{[_x] call A3A_fnc_NATOinit} forEach _vehicleCrew;

	private _group = [_vehicleSpawnPosition, Rivals, _spawnableGroup] call A3A_fnc_RivalsSpawnGroup;
	{
		[_x] join _vehicleGroup; 
		[_x] call A3A_fnc_NATOinit;
	} forEach units _group;
	deleteGroup _group;
	
	// [_vehicleGroup, _markerPosition, 500] call bis_fnc_taskPatrol;
	[_vehicleGroup, "Patrol_Area", 25, 100, 500, true, _markerPosition, false] call A3A_fnc_patrolLoop;

	_groups pushBack _vehicleGroup;
	_vehicles pushBack _vehicle;
} else {
	private _markerPosition = getMarkerPos _marker;
	private _originPosition = [
            _markerPosition, //center
            0, //minimal distance
            700, //maximumDistance
            7, //object distance
            0, //water mode
            0, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_markerPosition, _markerPosition] //default position
        ] call BIS_fnc_findSafePos;

	private _iterations = 0;

	while {(allUnits select {side _x in [Occupants, teamPlayer]}) findIf {_x distance2D _originPosition < 500} != -1} do {
		_originPosition = [
            _markerPosition, //center
            0, //minimal distance
            700, //maximumDistance
            7, //object distance
            0, //water mode
            0, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_originPosition, _originPosition]
        ] call BIS_fnc_findSafePos;
		if ((allUnits select {side _x in [Occupants, teamPlayer]}) findIf {_x distance2D _originPosition < 500} == -1) exitWith {};
		if (_iterations > 30) exitWith {};
		_iterations = _iterations + 1;
	};

	private _group = [_originPosition, Rivals, _spawnableGroup] call A3A_fnc_RivalsSpawnGroup;
	{
		[_x] call A3A_fnc_NATOinit;
	} forEach units _group;

	[_group, "Patrol_Area", 25, 250, 350, true, (getMarkerPos _marker), false] call A3A_fnc_patrolLoop;
	_groups pushBack _group;
};

waitUntil {sleep 1; (spawner getVariable _marker == 2)};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
