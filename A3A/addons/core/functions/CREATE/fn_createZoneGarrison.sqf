/*
	Maintainer:
		jwoodruff40 / Creep'nCrunch
	
	Description:
		Creates the garrison (units / groups) for a zone. The first group is placed into nearby buildings, the rest patrol and defend the zone.
		Garrison entries are split into groups of 7, skipping every 8th entry (existing behaviour).
		Spawn radii and patrol radius depend on the zone type:
			Airbases and milbases: extra groups spawn 50-100m out (min gap 5), patrol radius 200
			Outposts and seaports: extra groups spawn 10-100m out (min gap 2), patrol radius 100, plusGarrison can replace the garrison with random squads
			Resources and factories: extra groups spawn 10-50m out (min gap 5), patrol radius 100
	
	Params:
		_markerX <STRING> Zone marker
		_sideX <SIDE> Zone side
		_garrison <ARRAY> Ordered garrison unit types (see A3A_fnc_garrisonReorg)
		_size <NUMBER> Zone size, used as the building search radius
	
	Dependencies:
		SCRT_fnc_unit_flattenTier
		A3A_fnc_spawnGroup
		A3A_fnc_getSafePos
		A3A_fnc_NATOinit
		A3A_fnc_patrolGroupGarrison
		A3A_fnc_patrolLoop
	
	Scope:
		Server
	
	Environment:
		Scheduled
	
	Usage:
		([_markerX, _sideX, _garrison, _size] call A3A_fnc_createZoneGarrison) params ["_groups", "_soldiers"];
	
	Return:
		[_groups, _soldiers] <ARRAY>
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX", "_sideX", "_garrison", "_size"];

private _positionX = getMarkerPos _markerX;
private _groups = [];
private _soldiers = [];

private _zoneParams = [50, 100, 5, 200];
private _useRandomSquads = false;
switch (true) do {
	case (_markerX in outposts);
	case (_markerX in seaports): {
		_zoneParams = [10, 100, 2, 100];
		_useRandomSquads = plusGarrison isEqualTo false;
	};
	case (_markerX in resourcesX);
	case (_markerX in factories): {
		_zoneParams = [10, 50, 5, 100];
	};
};
_zoneParams params ["_spawnMin", "_spawnMax", "_spawnGap", "_patrolRadius"];

private _chunks = [];
for "_start" from 0 to (count _garrison - 1) step 8 do {
	_chunks pushBack (_garrison select [_start, 7]);
};

{
	private _groupTypes = if (_useRandomSquads) then {
		selectRandom ([Faction(_sideX), "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
	} else {
		_x
	};

	private _groupX = if (_forEachIndex isEqualTo 0) then {
		[_positionX, _sideX, _groupTypes, true, false] call A3A_fnc_spawnGroup;
	} else {
		private _spawnPosition = [_positionX, _spawnMin, _spawnMax, _spawnGap, 0, -1, 0] call A3A_fnc_getSafePos;
		[_spawnPosition, _sideX, _groupTypes, false, true] call A3A_fnc_spawnGroup;
	};
	_groups pushBack _groupX;
	{
		[_x, _markerX] call A3A_fnc_NATOinit;
		_soldiers pushBack _x;
	} forEach units _groupX;

	if (_forEachIndex isEqualTo 0) then {
		// Returns additional defense groups if not enough garrison positions were found
		_groups append ([_groupX, _positionX, _size] call A3A_fnc_patrolGroupGarrison);
	} else {
		[_groupX, "Patrol_Defend", 0, _patrolRadius, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
	};
} forEach _chunks;

[_groups, _soldiers]
