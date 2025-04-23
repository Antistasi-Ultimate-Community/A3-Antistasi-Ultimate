//ToDo: this function needs a refactor bad
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Debug("Spawning AAF Road Patrol");

private _players = allPlayers - entities "HeadlessClient_F";
private _bases = (seaports + airportsX + outposts + milbases) select {
	call {
		if (_players inAreaArray [markerPos _x, 2000, 2000] isEqualTo []) exitWith {false};
		private _side = sidesX getVariable [_x, sideUnknown];
		if (_side == teamPlayer) exitWith {false};
		if (_x in seaports and Faction(_side) get "vehiclesGunBoats" isEqualTo []) exitWith {false};
		if (_x call A3A_fnc_getMarkerNavPoint == -1) exitWith {false};
		true;
	};
};
if (_bases isEqualTo []) exitWith {};

Debug_1("Possible patrol bases %1", _bases);

private _soldiers = [];
private _vehiclesX = [];
private _groups = [];
private _roads = [];

private _base = selectRandom _bases;
private _sideX = sidesX getVariable [_base,sideUnknown];
private _faction = Faction(_sideX);

private _typeCar = "";
private _typePatrol = "LAND";

switch (true) do {
	case (_base in seaports): {
		_typeCar = selectRandom (_faction get "vehiclesGunBoats");
		_typePatrol = "SEA";
	};

	case (_base in milbases): {
		if (random 10 < tierWar + aggressionOccupants/10) then {
			_typeCar = selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightTanks"));
		} else {
			_typeCar = selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightAPCs") + (_faction get "vehiclesMilitiaAPCs"));
		};
	};

	case (_base in airportsX && {!(_faction getOrDefault ["attributeLowAir", false])}): {
		if (_sideX isEqualTo Invaders || {random 10 < tierWar + aggressionOccupants/10}) then {
			_typeCar = selectRandom (_faction get "vehiclesHelisLight");
			if(count (_faction get "vehiclesAirPatrol") > 0) then 
			{
				_typeCar = selectRandom (_faction get "vehiclesAirPatrol");
			};
			_typePatrol = "AIR";
		} else {
			_typeCar = selectRandom ((_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaCars"));	
		};
	};

	default {
		if (_sideX isEqualTo Invaders || {random 10 < tierWar + aggressionOccupants/10}) then {
			_typeCar = selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightUnarmed"));
		} else {
			_typeCar = selectRandom ((_faction get "vehiclesPolice") + (_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaCars") + (_faction get "vehiclesBasic"));
		};
	};
};

Info_3("Sending patrol of type %1 vehicle %2 from %3", _typePatrol, _typeCar, _base);

private _posbase = getMarkerPos _base;
private _arrayDestinations = [];
private _distanceX = 0;

switch (_typePatrol) do {
	case "AIR": {
		_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
		_distanceX = 200;
	};
	case "SEA": {
		_arrayDestinations = seaMarkers select {(getMarkerPos _x) distance _posbase < 2500};
		_distanceX = 100;
	};
	default {
		_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
		_arrayDestinations = [_arrayDestinations,_posBase] call A3A_fnc_patrolDestinations;
		_distanceX = 50;
	};
};

if (count _arrayDestinations < 4) exitWith {};

AAFpatrols = AAFpatrols + 1;

switch (true) do {
	case (_typePatrol isEqualTo "SEA"): {
		_posbase = [_posbase,50,150,10,2,0,0] call BIS_Fnc_findSafePos;
	};
	case (_typePatrol isNotEqualTo "AIR"): {
		private _indexX = airportsX find _base;
		if (_indexX != -1) then {
			private _spawnPoint = server getVariable (format ["spawn_%1", _base]);
			_posBase = getMarkerPos _spawnPoint;
		} else {
			_posbase = position ([_posbase] call A3A_fnc_findNearestGoodRoad);
		};
	};
};

private _vehicle = [_posBase, 0,_typeCar, _sideX] call A3A_fnc_spawnVehicle;
private _veh = _vehicle select 0;

[_veh, _sideX] call A3A_fnc_AIVEHinit;
[_veh,"Patrol"] spawn A3A_fnc_inmuneConvoy;

private _vehCrew = _vehicle select 1;

// Forced non-spawner for performance reasons. They can travel a lot through rebel territory.
{[_x,"",false] call A3A_fnc_NATOinit} forEach _vehCrew;

private _groupVeh = _vehicle select 2;
_soldiers append _vehCrew;
_groups pushBack _groupVeh;
_vehiclesX pushBack _veh;

switch (true) do {
	case (_typeCar in (_faction get "vehiclesLightUnarmed")): {
		sleep 1;
		private _groupX = [_posbase, _sideX, (selectRandom ([_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier))] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x,"",false] call A3A_fnc_NATOinit} forEach units _groupX;
		deleteGroup _groupX;
	};
	case (_typeCar in (_faction get "vehiclesLightAPCs")): {
		sleep 1;
		private _groupX = [_posbase, _sideX, (selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier))] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x,"",false] call A3A_fnc_NATOinit} forEach units _groupX;
		deleteGroup _groupX;
	};
	case (_typeCar in ((_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs"))): {
		sleep 1;
		private _groupX = [_posbase, _sideX, (selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier))] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _veh;_x moveInCargo _veh; _soldiers pushBack _x; [_x] joinSilent _groupVeh; [_x,"",false] call A3A_fnc_NATOinit} forEach units _groupX;
		deleteGroup _groupX;
	};
};

while {alive _veh} do {
	if (count _arrayDestinations < 2) exitWith {};
	private _destinationX = selectRandom _arrayDestinations;
	private _posDestination = getMarkerPos _destinationX;
	if (_typePatrol == "LAND") then {
		private _road = [_posDestination] call A3A_fnc_findNearestGoodRoad;
		_posDestination = position _road;
	};
	private _Vwp0 = _groupVeh addWaypoint [_posDestination, 0];
	_Vwp0 setWaypointType "MOVE";
	_Vwp0 setWaypointBehaviour "SAFE";
	_Vwp0 setWaypointSpeed "LIMITED";
	_veh setFuel 1;

	private _timeout = time + (_veh distance2d _posDestination) / 6 + 300;			// stuck detection
	waitUntil {sleep 60; _veh distance _posDestination < _distanceX or {time > _timeout or {{[_x] call A3A_fnc_canFight} count _soldiers == 0 or {!canMove _veh}}}};
	if !(_veh distance _posDestination < _distanceX) exitWith {};

	switch (_typePatrol) do {
		case "AIR": {
			_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
		};
		case "SEA": {
			_arrayDestinations = seaMarkers select {(getMarkerPos _x) distance position _veh < 2500};
		};
		default {
			_arrayDestinations = markersX select {sidesX getVariable [_x,sideUnknown] == _sideX};
			_arrayDestinations = [_arrayDestinations,position _veh] call A3A_fnc_patrolDestinations;
		};
	};
};

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehiclesX;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _groups;

AAFpatrols = AAFpatrols - 1;
