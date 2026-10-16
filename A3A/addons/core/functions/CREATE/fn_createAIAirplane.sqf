#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

ServerInfo_1("Spawning Airbase %1", _markerX);

private _vehiclesX = [];
private _groups = [];
private _soldiers = [];
private _props = [];
private _dogs = []; //dogs are used in fn_location_createPatrols, removing this variable will break spawn
private _spawnsUsed = [];

_positionX = getMarkerPos (_markerX);
private _patrolSize = [_markerX] call A3A_fnc_sizeMarker;

private _size = [_markerX] call A3A_fnc_sizeMarker;

private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _busy = false;		//if (dateToNumber date > server getVariable _markerX) then {false} else {true};
private _nVeh = round (_size/60);

private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

/////////////////////////////
// SPAWNING SAM SITE	  //
////////////////////////////

([_markerX, _sideX, 1800] call A3A_fnc_createZoneSamSite) params ["_samGroups", "_samSoldiers", "_samVehicles", "_samSpawns"];
_groups append _samGroups;
_soldiers append _samSoldiers;
_vehiclesX append _samVehicles;
_spawnsUsed append _samSpawns;

if (_frontierX) then {
	_roads = _positionX nearRoads _size;
	if (count _roads != 0) then {
		private _groupX = createGroup _sideX;
		_groups pushBack _groupX;
		private _typeVehX = selectRandom (_faction get "staticAT");

		if (_faction getOrDefault ["noSandbag", false]) then {		
			private _veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPos _pos;
			_veh setDir _dirVeh + 180;
			private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;
			private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			[_unit,_markerX] call A3A_fnc_NATOinit;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_soldiers pushBack _unit;
		} else {
			private _bunker = (_faction get "sandbag") createVehicle _pos;
			_vehiclesX pushBack _bunker;
			_bunker setDir _dirveh;
			_pos = getPosATL _bunker;
			private _veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPos _pos;
			_veh setDir _dirVeh + 180;
			private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;
			private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			[_unit,_markerX] call A3A_fnc_NATOinit;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_soldiers pushBack _unit;
		};
	};
};

private _mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerDirLocal (markerDir _markerX);
if (!debug) then {_mrk setMarkerAlphaLocal 0};

//maybe it's no longer needed after all..?
private _additionalGarrison = [_sideX, _markerX] call SCRT_fnc_garrison_rollOversizeGarrison;
if (_additionalGarrison isNotEqualTo []) then {
	for "_i" from 0 to (count _additionalGarrison) - 1 do {
		private _groupTypes = _additionalGarrison select _i;
		private _group = [_positionX, _sideX, _groupTypes, false, true] call A3A_fnc_spawnGroup;
		if !(isNull _group) then {
			[_group, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;
			_groups pushBack _group;
			{[_x] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _group;
		};
	};
};

private _garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;

private _radiusX = count _garrison;
private _patrol = true;

if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then {
	_patrol = false;
} else {
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};

([_markerX, _sideX, _garrison, _size] call A3A_fnc_createZoneGarrison) params ["_garrisonGroups", "_garrisonSoldiers"];
_groups append _garrisonGroups;
_soldiers append _garrisonSoldiers;

if (_patrol) then {
	[_markerX, _positionX, _sideX, _faction, 6] call SCRT_fnc_location_createPatrols;
};
private _countX = 0;

([_markerX, _sideX] call A3A_fnc_createZoneMortars) params ["_mortarGroups", "_mortarSoldiers", "_mortarVehicles", "_mortarProps", "_mortarSpawns"];
_groups append _mortarGroups;
_soldiers append _mortarSoldiers;
_vehiclesX append _mortarVehicles;
_props append _mortarProps;
_spawnsUsed append _mortarSpawns;

private _ret = [_markerX,_size,_sideX,_frontierX] call A3A_fnc_milBuildings;
_groups pushBack (_ret select 0);
_vehiclesX append (_ret select 1);
_soldiers append (_ret select 2);
_spawnsUsed append (_ret select 3);
{[_x, _sideX] call A3A_fnc_AIVEHinit} forEach (_ret select 1);

if(random 100 < (50 + tierWar * 3)) then {
	_large = (random 100 < (40 + tierWar * 2));
	[_markerX, _large] spawn A3A_fnc_placeIntel;
};

if (!_busy) then {
	private _pos = nil;
	private _ang = nil;
	//Newer system in place
	private _runwaySpawnLocation = [_markerX] call A3A_fnc_getRunwayTakeoffForAirportMarker;
	if !(_runwaySpawnLocation isEqualTo []) then
	{
		_pos = _runwaySpawnLocation select 0;
		_ang = _runwaySpawnLocation select 1;
	};
	_countX = 0;
	private _vehCount = round (random [2, 4, 5]);
	private _hangarPlanes = [];
	while {_countX < _vehCount} do {
		private _veh = objNull;
		private _hangar = objNull;
		private _spawnParameter = [_markerX, "Plane"] call A3A_fnc_findSpawnPosition;
		if(_spawnParameter isEqualType []) then {
			private _vehPool = [_faction, ["vehiclesPlanesCAS", "vehiclesPlanesAA"], [1, 1]] call A3A_fnc_createZoneVehiclesPool;
			_spawnsUsed pushBack _spawnParameter#2;
			_typeVehX = selectRandomWeighted _vehPool;
			_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
			_veh setDir (_spawnParameter select 1);
			_hangarPlanes pushBack [_veh, _typeVehX, _spawnParameter];
		} else {
			if !(_runwaySpawnLocation isEqualTo []) then {
				private _vehPool = [
					_faction, 
					["vehiclesPlanesCAS", "vehiclesPlanesAA", "vehiclesPlanesLargeCAS", "vehiclesPlanesLargeAA", "vehiclesPlanesTransport", "vehiclesPlanesGunship"],
					[0.7, 0.7, 1, 1, 1, 0.5]
				] call A3A_fnc_createZoneVehiclesPool;

				_typeVehX = selectRandomWeighted _vehPool;
				if (!isNil "_typeVehX") then {
					_veh = createVehicle [_typeVehX, _pos, [],50, "NONE"];
					_veh setDir (_ang);
					_pos = [_pos, 50,_ang] call BIS_fnc_relPos;
					_vehiclesX pushBack _veh;
					[_veh, _sideX] call A3A_fnc_AIVEHinit;
				};
			} else {
				//No places found, neither hangar nor runway
				_countX = _vehCount;
			};
		};
		_countX = _countX + 1;
	};

	// Hangar plane replacement if destroyed on spawn by collision with hangar (presumably)
	// Call it once here for all planes spawned in hangar instead of per plane as before,
	// and run it in the background instead of blocking the main garrison spawn script
	if (_hangarPlanes isNotEqualTo []) then { [_sideX, _vehiclesX, _hangarPlanes] spawn {
		params ["_sideX", "_vehiclesX", "_hangarPlanes"];
		sleep 0.5;
		private _fixedPlanes = [];
		{
			_x params ["_veh", "_typeVehX", "_spawnParameter"];
			if !(alive _veh) then {
				private _hangar = (nearestObjects [_veh, ["Static"], 20]) select 0;
				deleteVehicle _hangar;
				deleteVehicle _veh;
				_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
				_veh setDir (_spawnParameter select 1);
				_veh allowDamage false;
				_veh enableSimulation false;
				_fixedPlanes pushBack _veh;
			};
			_vehiclesX pushBack _veh;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
		} forEach _hangarPlanes;

		if (_fixedPlanes isNotEqualTo []) then {
			sleep 0.5;
			{
				_x enableSimulation true;
				_x allowDamage true;
			} forEach _fixedPlanes;
		};
	}};
};

([_markerX] call A3A_fnc_createZoneFlag) params ["_flagX", "_flagSpawn"];
_vehiclesX pushBack _flagX;
if (!isNil "_flagSpawn") then { _spawnsUsed pushBack _flagSpawn };

([_markerX] call A3A_fnc_createZoneAmmoBox) params ["_ammoBox", "_ammoBoxSpawn"];
if (!isNil "_ammoBoxSpawn") then { _spawnsUsed pushBack _ammoBoxSpawn };


if (!_busy) then
{
	private _vehPool = [_faction, [
		"vehiclesLightAPCs",
		"vehiclesAPCs",
		"vehiclesIFVs",
		"vehiclesLightTanks",
		"vehiclesTanks",
		"vehiclesAirborne"
	], [
		12 - (tierWar),
		12 - (tierWar * 0.5),
		5 + (tierWar),
		12 - (tierWar * 0.25),
		5 + (tierWar),
		5 + (tierWar)
	]] call A3A_fnc_createZoneVehiclesPool;

	([_markerX, _sideX, _vehPool, round (random 2)] call A3A_fnc_createZoneVehicles) params ["_heavyVehs", "_heavySpawns"];
	_vehiclesX append _heavyVehs;
	_spawnsUsed append _heavySpawns;
	_nVeh = _nVeh - count _heavyVehs;
};

private _groundPool = [_faction, [
	"vehiclesLightArmed",
	"vehiclesLightUnarmed",
	"vehiclesTrucks",
	"vehiclesCargoTrucks",
	"vehiclesAmmoTrucks",
	"vehiclesRepairTrucks",
	"vehiclesFuelTrucks",
	"vehiclesMedical"
], [
	7,
	4,
	2,
	2,
	1 + (tierWar * 0.05),
	1 + (tierWar * 0.05),
	1 + (tierWar * 0.2),
	2
]] call A3A_fnc_createZoneVehiclesPool;

([_markerX, _sideX, _groundPool, (_nVeh min 3) max 0] call A3A_fnc_createZoneVehicles) params ["_groundVehs", "_groundSpawns"];
_vehiclesX append _groundVehs;
_spawnsUsed append _groundSpawns;


/////////////////////////////
// Self-propelled AA 	  //
////////////////////////////

private _max = if (_frontierX) then {2} else {1};
for "_i" from 1 to _max do {
	private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	
	if !(_spawnParameter isEqualType []) exitWith {};
	_spawnsUsed pushBack _spawnParameter#2;

	private _veh = nil;
	isNil {
		_veh = createVehicle [selectRandom (_faction get "vehiclesAA"), (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
		_veh setDir (_spawnParameter select 1);
  	};

	_groupVeh = [_sideX, _veh] call A3A_fnc_createVehicleCrew;
	{[_x,_markerX] call A3A_fnc_NATOinit} forEach units _groupVeh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	_soldiers append units _groupVeh;
	_groups pushBack _groupVeh;
  	[_groupVeh, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;
	_vehiclesX pushBack _veh;

	[gunner _veh, GVAR(scanHorizonHeight)] spawn SCRT_fnc_common_scanHorizon;

	_veh setVariable ["originalPos", getPosATL _veh];
};

{
  if (_x isKindOf "Static" || _x isKindOf "StaticWeapon") then {continue};
  [_x, true] call A3U_fnc_setLock;
} forEach _vehiclesX;

private _boatType = selectRandom (_faction get "vehiclesGunBoats");
private _mrkMar = seaSpawn select {getMarkerPos _x inArea _markerX};
if (count _mrkMar > 0) then {
	private _pos = (getMarkerPos (_mrkMar select 0)) findEmptyPosition [0,20,_boatType];
	private _vehicle=[_pos, 0,_boatType, _sideX] call A3A_fnc_spawnVehicle;
	private _veh = _vehicle select 0;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	private _vehCrew = _vehicle select 1;
	{[_x,_markerX] call A3A_fnc_NATOinit} forEach _vehCrew;
	private _groupVeh = _vehicle select 2;
	_soldiers append _vehCrew;
	[_groupVeh, "Patrol_Water", 25, 200, -1, true, _pos] call A3A_fnc_patrolLoop;
	_groups pushBack _groupVeh;
	_vehiclesX pushBack _veh;

	_veh setVariable ["originalPos", getPosATL _veh];
};

/////////////////////////////
// Heavy Patrol Vehicle   //
////////////////////////////
if (random 100 < (20 + tierWar * 3)) then {
	private _road = [_positionX] call A3A_fnc_findNearestGoodRoad;
	if (_road distance2D _positionX > 800) exitWith {};

	private _heavyVehPool =  (_faction get "vehiclesTanks") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesLightAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightTanks");
	private _type = selectRandom _heavyVehPool;

	private _heavyVehicle = [_type, (position _road), 15, 10] call A3A_fnc_safeVehicleSpawn;
	if (isNull _heavyVehicle) exitWith {};

	private _crewType = [_sideX, _heavyVehicle] call A3A_fnc_crewTypeForVehicle;
	private _group = createGroup _sideX;

	_group = [_group, _heavyVehicle, _crewType] call A3A_fnc_createVehicleCrew;

	[_heavyVehicle, _sideX] call A3A_fnc_AIVEHinit;
	{[_x,_markerX] call A3A_fnc_NATOinit} forEach (units _group);

	if (_type in ((_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightAPCs"))) then {
		private _troopGroup = [(position _road), _sideX, (selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier))] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _heavyVehicle;_x moveInCargo _heavyVehicle; _soldiers pushBack _x; [_x] joinSilent _group; [_x,"",false] call A3A_fnc_NATOinit} forEach units _troopGroup;
		deleteGroup _troopGroup;
	};

	[_group, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;

	_heavyVehicle setVariable ["originalPos", getPosATL _heavyVehicle];

	_soldiers append (units _group);
	_groups pushBack _group;
	_vehiclesX pushBack _heavyVehicle;

	_heavyVehicle setVariable ["originalPos", getPosATL _heavyVehicle];
};

{ _x setVariable ["originalPos", getPosATL _x] } forEach _vehiclesX;

[CBA_EVENT_SERVER_SPAWN_LOCATION, [_markerX, "Airport", true]] call FUNCMAIN(triggerLocalEvent);

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

{
	// delete all vehicles that haven't been stolen
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

deleteMarker _mrk;
{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _dogs;
{ deleteGroup _x } forEach _groups;
{ deleteVehicle _x } forEach _props;

_spawnsUsed call A3A_fnc_freeSpawnPositions;

// If loot crate was stolen, set the cooldown
if (!isNil "_ammoBox") then {
	if ((alive _ammoBox) and (_ammoBox distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox };
	if (alive _ammoBox) then { [_ammoBox] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};

[CBA_EVENT_SERVER_SPAWN_LOCATION, [_markerX, "Airport", false]] call FUNCMAIN(triggerLocalEvent);
