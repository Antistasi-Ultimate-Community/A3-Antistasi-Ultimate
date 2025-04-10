#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Police vs Invaders Event Init.");

private _vehicles = [];
private _groups = [];

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _cities = citiesX select {sidesX getVariable [_x, sideUnknown] != teamPlayer && {spawner getVariable _x != 2}};

if (_cities isEqualTo []) exitWith {
    Info("No neutral cities available, aborting event.");
    [POLICE_SKIRMISH] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _city = selectRandom _cities;
private _cityPos = getMarkerPos _city;

// Function to spawn police forces
private _fnc_spawnPoliceForces = {
    params ["_side", "_basePos", "_vehicleTypes", "_unitGroupType"];
    
    private _numGroups = selectRandom [1, 2];
    
    for "_i" from 1 to _numGroups do {
        // Corrected vehicle spawn block
		private _road = objNull;
		private _radius = 50;
		private _foundRoad = false;

		while {!_foundRoad && _radius <= 300} do {
		    private _nearRoads = _basePos nearRoads _radius;

		    if (count _nearRoads > 0) then {
		        _road = selectRandom _nearRoads;
		        _foundRoad = true;
		    } else {
		        _radius = _radius + 50;
		    };
		};

		// Determine spawn position
		private _spawnPos = if (!isNull _road) then {
		    getPosATL _road
		} else {
		    // Create position near base if no roads found
		    _basePos getPos [random 150, random 360]
		};
		
		// Use random position if no roads found
		if (isNull _road) then {
		    _road = _basePos getPos [random 150, random 360];
		    _road setPosATL [getPosATL _road#0, getPosATL _road#1, 0]; // Reset height to 0
		};
        
        // Proper spawnVehicle call
		private _vehicleType = selectRandom _vehicleTypes;
        private _vehData = [_spawnPos, random 360, _vehicleType, _side] call A3A_fnc_spawnVehicle;
        private _vehicle = _vehData select 0;
		_crewGroup = _vehData select 2;
		[_vehicle, _side] call A3A_fnc_AIVEHinit;
		[_vehicle, ["BeaconsStart", 1]] remoteExecCall ["animate", 0, _vehicle];
		private _typeCargoGroup = [_vehicleType, Occupants] call A3A_fnc_cargoSeats;
		private _cargoGroup = [_spawnPos, Occupants, _typeCargoGroup, true,false] call A3A_fnc_spawnGroup;

		(units _crewGroup) join _cargoGroup;
		_groups pushBack _cargoGroup;

		// Adding patrol points
        private _wp = _cargoGroup addWaypoint [_cityPos, 50];
        _wp setWaypointType "MOVE";
		sleep 5;
		_wp setWaypointType "SAD";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointBehaviour "AWARE";

		_vehicles pushBack _vehicle;
    };
};

// Force spawn function with corrections
private _fnc_spawnForces = {
    params ["_side", "_basePos", "_vehicleTypes", "_unitGroupType"];
    
    private _numGroups = selectRandom [1, 2];
    
    for "_i" from 1 to _numGroups do {
        // Corrected vehicle spawn block
		private _road = objNull;
		private _radius = 50;
		private _foundRoad = false;

		while {!_foundRoad && _radius <= 300} do {
		    private _nearRoads = _basePos nearRoads _radius;

		    if (count _nearRoads > 0) then {
		        _road = selectRandom _nearRoads;
		        _foundRoad = true;
		    } else {
		        _radius = _radius + 50;
		    };
		};

		// Determine spawn position
		private _spawnPos = if (!isNull _road) then {
		    getPosATL _road
		} else {
		    // Create position near base if no roads found
		    _basePos getPos [random 150, random 360]
		};
		
		// Use random position if no roads found
		if (isNull _road) then {
		    _road = _basePos getPos [random 150, random 360];
		    _road setPosATL [getPosATL _road#0, getPosATL _road#1, 0]; // Reset height to 0
		};
        
        // Proper spawnVehicle call
		private _vehicleType = selectRandom _vehicleTypes;
        private _vehData = [_spawnPos, random 360, _vehicleType, _side] call A3A_fnc_spawnVehicle;
        private _vehicle = _vehData select 0;
		_crewGroup = _vehData select 2;
		[_vehicle, _side] call A3A_fnc_AIVEHinit;
		private _group = [_spawnPos, _side, _unitGroupType, true] call A3A_fnc_spawnGroup;

		(units _crewGroup) join _group;
		_groups pushBack _group;

		// Adding patrol points
        private _wp = _group addWaypoint [_cityPos, 50];
        _wp setWaypointType "MOVE";
		sleep 5;
		_wp setWaypointType "SAD";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointBehaviour "AWARE";

		_vehicles pushBack _vehicle;
    };
};

// Spawn police forces (Occupants)
[Occupants, _cityPos getPos [100, random 360], (A3A_faction_occ get "vehiclesPolice"), (A3A_faction_occ get "groupPolice")] call _fnc_spawnPoliceForces;

// Spawn invader forces
[Invaders, _cityPos getPos [300, random 360 + 180], (A3A_faction_inv get "vehiclesMilitiaLightArmed") + (A3A_faction_inv get "vehiclesLightArmed") + (A3A_faction_inv get "vehiclesLightUnarmed") + (A3A_faction_inv get "vehiclesMilitiaCars"), selectRandom ([A3A_faction_inv, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier)] call _fnc_spawnForces;

// Set mutual hostility
{_x setCombatMode "YELLOW"} forEach _groups;

private _timeOut = time + 1200;
waitUntil {
    sleep 5;
    time > _timeOut || 
    {(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _cityPos < 1400} == -1}
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";
Info("Police vs Invaders Event cleanup complete.");