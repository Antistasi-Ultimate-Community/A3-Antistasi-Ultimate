/*
	Maintainer:
		jwoodruff40 / Creep'nCrunch
	
	Description:
		Creates the vehicles for a zone from its weighted pool
	
	Params:
		_markerX <STRING> Zone marker
		_sideX <SIDE> Zone side
		_pool <ARRAY> Weighted pool from A3A_fnc_createZoneVehiclesPool
		_count <NUMBER> Maximum number of vehicles
	
	Dependencies:
		A3A_fnc_createZoneVehiclesPool
		A3A_fnc_findSpawnPosition
		A3A_fnc_AIVEHinit
	
	Scope:
		Server
	
	Environment:
		Scheduled
	
	Usage:
		([_markerX, _sideX, _pool, 3] call A3A_fnc_createZoneVehicles) params ["_vehicles", "_spawnsUsed"];
	
	Return:
		[_vehicles, _spawnsUsed] <ARRAY>
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX", "_sideX", "_pool", "_count"];

private _vehicles = [];
private _spawnsUsed = [];
if (_pool isEqualTo []) exitWith { [_vehicles, _spawnsUsed] };

for "_i" from 1 to _count do {
	private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	if !(_spawnParameter isEqualType []) exitWith {};
	_spawnsUsed pushBack _spawnParameter#2;

	private _veh = nil;
	private _type = selectRandomWeighted _pool;
	isNil {
		_veh = createVehicle [_type, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
		_veh setDir (_spawnParameter select 1);
	};
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	_vehicles pushBack _veh;
};

[_vehicles, _spawnsUsed]
