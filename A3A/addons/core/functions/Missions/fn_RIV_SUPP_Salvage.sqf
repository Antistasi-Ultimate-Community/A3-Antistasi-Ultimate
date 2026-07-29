#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

if (!isServer and hasInterface) exitWith{};

Info_1("Salvage Ambushed Truck Init, marker: %1", _markerX);

private _vehicles = [];
private _groups = [];
private _others = [];
private _isDifficult = random 10 < tierWar && {([] call SCRT_fnc_rivals_rollProbability)};
private _positionX = getMarkerPos _markerX;

private _faction = A3A_faction_riv;

private _limit = if (_isDifficult) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _spawnPosition = [_positionX, 600, 1500, 0, 0] call BIS_fnc_findSafePos;
private _bases = citiesX + airportsX + milbases + outposts + seaports + factories + resourcesX + ["Synd_HQ"];
private _isTooCloseToOutposts = _bases findIf { _spawnPosition distance2d (getMarkerPos _x) < 600 || {_spawnPosition inArea _x} } != -1;
private _nearRoads = _spawnPosition nearRoads 100;

if (_isTooCloseToOutposts || _nearRoads isEqualTo []) then {
	private _radiusX = 1500;
    while {true} do {
        _spawnPosition = [
            _positionX, //center
            600, //minimal distance
            _radiusX, //maximumDistance
            0, //object distance
            0, //water mode
            1, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_spawnPosition, _spawnPosition] //default position
        ] call BIS_fnc_findSafePos;
		_nearRoads = _spawnPosition nearRoads 100;
        _isTooCloseToOutposts = _bases findIf { _spawnPosition distance2d (getMarkerPos _x) < 600 || {_spawnPosition inArea _x} } != -1;
        if (_isTooCloseToOutposts && {_nearRoads isNotEqualTo []}) exitWith {};
        _radiusX = _radiusX + 1;
    };
};

Info_1("Initial position: %1", _spawnPosition);


private _routeNodes = ([_spawnPosition, _positionX] call A3A_fnc_findPath) apply {_x select 0};

if (_routeNodes isEqualTo []) exitWith {
	Error_1("Couldn't find path from starting position to %1, aborting and rerolling ordinary supplies mission.", _markerX);
	["SUPP"] remoteExec ["A3A_fnc_missionRequest", 2];
};
#if __A3_DEBUG__
	{ 
		private _marker = createMarker [format ["%1salvageDebugNode%2", random 10000, random 10000], _x]; 
		_marker setMarkerType "hd_dot"; 
		_marker setMarkerSize [1, 1]; 
		_marker setMarkerText ""; 
		_marker setMarkerColor "ColorRed"; 
		_marker setMarkerAlpha 1; 
	} forEach _routeNodes;
#endif

private _startNode = _routeNodes select 2;
private _nextNode = _routeNodes select 4;
private _roads = objNull;
private _radiusX = 5;

while {true} do {
    _roads = _startNode nearRoads _radiusX;
    if (count _roads > 0 && {_roads findIf {[position _x, _positionX] call A3A_fnc_arePositionsConnected} != -1}) exitWith {};
    _radiusX = _radiusX + 5;
};

private _startingRoad = _roads select 0;

Info_1("Road position: %1", _startingRoad);

private _startingRoadPosition = getPos _startingRoad;

private _midPoint = [((_startNode select 0) + (_nextNode select 0)) / 2, ((_startNode select 1) + (_nextNode select 1)) / 2];
private _roads = objNull;
private _radiusX = 5;

while {true} do {
    _roads = _midPoint nearRoads _radiusX;
    if (count _roads > 0) exitWith {};
    _radiusX = _radiusX + 5;
};

private _nextRoad = _roads select 0;
private _nextRoadPos = position _nextRoad;

private _midMidPoint = [((_startingRoadPosition select 0) + (_nextRoadPos select 0)) / 2, ((_startingRoadPosition select 1) + (_nextRoadPos select 1)) / 2];
private _roads = objNull;
private _radiusX = 5;

while {true} do {
    _roads = _midMidPoint nearRoads _radiusX;
    if (count _roads > 0) exitWith {};
    _radiusX = _radiusX + 5;
};
private _midRoad = _roads select 0;
private _dirVeh = [_startingRoad, _midRoad] call BIS_fnc_dirTo;

Info("Spawning crater...");

private _crater = createVehicle ["CraterLong", _startingRoadPosition, [], 0, "CAN_COLLIDE"];
_crater setDir _dirveh;
_crater setVectorUp surfaceNormal getPos _crater;
_others pushBack _crater;


Info_1("Crater pos: %1", _startingRoadPosition);

Info("Spawning truck...");

private _crewClasses = [
	A3A_faction_reb get "unitCrew",
	A3A_faction_reb get "unitSniper",
	A3A_faction_reb get "unitLAT",
	A3A_faction_reb get "unitMedic",
	A3A_faction_reb get "unitMG",
	A3A_faction_reb get "unitGL",
	A3A_faction_reb get "unitRifle",
	A3A_faction_reb get "unitSL",
	A3A_faction_reb get "unitEng"
];

private _truckClass = selectRandom (A3A_faction_reb get "vehiclesTruck");
private _truck = createVehicle [_truckClass, [_startingRoadPosition select 0, _startingRoadPosition select 1, 0.9], [], 0, "CAN_COLLIDE"];
_truck setDir _dirVeh;
_truck setDamage (random [0.3,0.5,0.7]);
_truck setHit ["wheel_2_1_steering", 0.5];
_truck setHit ["wheel_1_1_steering", 0.5];
[_truck, teamPlayer] call A3A_fnc_AIVEHinit;
_vehicles pushBack _truck;


Info_2("Truck classname: %1, truck position: %2", _truckClass, getPos _truck);

Info("Adding food sacks to cargo...");

private _foodSacks = createVehicle ["Land_FoodSacks_01_cargo_brown_F", _startingRoadPosition, [], 0, "NONE"];
_foodSacks enableRopeAttach true;
_foodSacks allowDamage false;
[_foodSacks] call A3A_Logistics_fnc_addLoadAction;
private _return = [_truck, _foodSacks] call A3A_Logistics_fnc_canLoad; 
if !(_return isEqualType 0) then { 
	_return set [4, true];
	_return remoteExec ["A3A_Logistics_fnc_load", 2]; 
} else {
	Error_3("For some reason no autologistics load. Vehicle: %1, Cargo: %2, Return: %3", (typeOf _truck), (typeOf _foodSacks), (str _return));
};


private _nameDest = [_markerX] call A3A_fnc_localizar;
private _taskId = "SUPP" + str A3A_taskCount;
[
	[teamPlayer,civilian],
	_taskId,
	[
		format [localize "STR_A3A_Missions_RIV_SUPP_Salvage_task_desc", _nameDest, _faction get "name", _displayTime],
		localize "STR_A3A_Missions_RIV_SUPP_Salvage_task_header",
		_markerX
	],_startingRoadPosition,false,0,true,"truck",true] call BIS_fnc_taskCreate;
[_taskId, "SUPP", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

Info("Waiting until players will be near the zone.");

waitUntil {
	sleep 1; 
	(call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_startingRoadPosition, distanceSPWN1, distanceSPWN1] isNotEqualTo [] || 
	{dateToNumber date > _dateLimitNum}
};


Info("Setting things in motion...");

if (dateToNumber date < _dateLimitNum) then {
	for "_i" from 0 to round (random [3,5,6]) do {
		_firePosition = [
			_startingRoadPosition, 
			1,
			20,
			2
		] call BIS_fnc_findSafePos;

		private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
		[_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

		private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
		[_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
		[_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
		[_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

		_others append [_fireEffectEmitter, _lightEffectEmitter];
	};

	Info("Spawning dead crew...");

	private _groupCrew = createGroup teamPlayer;
	for "_i" from 0 to round (random [1,2,3]) do {
		private _position = [
			_startingRoadPosition, //center
			0, //minimal distance
			15, //maximumDistance
			2, //object distance
			0, //water mode
			0, //maximum terrain gradient
			0, //shore mode
			[], //blacklist positions
			[_startingRoadPosition, _startingRoadPosition] //default position
		] call BIS_fnc_findSafePos;
		private _crew = [_groupCrew, selectRandom _crewClasses, _position, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_crew, 0] call A3A_fnc_equipRebel;	
		[_crew] call A3A_fnc_NATOinit;

		_crew setDamage 1;
		private _dir = [_crew, _truck] call BIS_fnc_dirTo;
		_crew setDir (_dir - 180);

		sleep 1.5;
		private _bloodSplat = createVehicle [
			(selectRandom ["BloodPool_01_Large_New_F", "BloodSplatter_01_Large_New_F", "BloodSplatter_01_Medium_New_F", "BloodPool_01_Medium_New_F"]),
			(position _crew),
			[], 
			0,
			"CAN_COLLIDE"
		];
		_others pushBack _bloodSplat;
	};
	_groups pushBack _groupCrew;

	Info("Spawning barricade and static weapon...");

	private _barricadePos = position _nextRoad;
	private _roadcon = roadsConnectedto _nextRoad;
	private _dirBarricade = if (count _roadcon > 0) then {[_nextRoad, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
	private _barricadeTypes = [
		"Land_Barricade_01_10m_F", 
		"Land_Barricade_01_4m_F", 
		"Land_Fortress_01_bricks_v1_F"
	];

	private _canOpener = createVehicle ["Land_CanOpener_F", _barricadePos, [], 0 , "CAN_COLLIDE"]; 
	_canOpener hideObjectGlobal true;
	private _barricade = createVehicle [selectRandom _barricadeTypes, _barricadePos, [], 0 , "CAN_COLLIDE"]; 
	_canOpener disableCollisionWith _barricade;
	_barricade setDir _dirBarricade;
	_barricade setVectorUp surfaceNormal position _barricade;
	_others append [_canOpener, _barricade];

	private _groupGunner = createGroup Rivals;
	private _staticWeaponClass = selectRandom (_faction get "staticLowWeapons");
	private _weaponPos = [_barricadePos, 7, _dirBarricade + 270] call BIS_Fnc_relPos;
	private _weapon = createVehicle [_staticWeaponClass, _weaponPos, [], 0 , "NONE"];
	_weapon setDir ([_weapon, _truck] call BIS_fnc_dirTo);
	_vehicles pushBack _weapon;

	private _gunner = [_groupGunner, _faction get "unitRifle", _positionX, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
	[_gunner] call A3A_fnc_NATOinit;
	[_gunner, Rivals] call A3A_fnc_AIVEHinit;
	_gunner moveInGunner _weapon;
	_groups pushBack _groupGunner;

	Info_2("Static weapon class: %1, postion: %2", _staticWeaponClass, _weaponPos);

	if (_isDifficult) then {
		Info("Creating small minefield near ambush.");
		private _minesCount = round random [3,5,7];
		private _mines = (_faction get "minefieldAPERS");
		for "_i" from 1 to _minesCount do {
			private _mineX = createMine [selectRandom _mines, _startingRoadPosition, [], 25];
			Rivals revealMine _mineX;
			_vehicles pushBack _mineX;
	#if __A3_DEBUG__
			teamPlayer revealMine _mineX;
	#endif
		};
	};

	private _patrolPool = if (_isDifficult) then {
		(_faction get "groupsSquad") + (_faction get "groupsFireteam")
	} else {
		(_faction get "groupsFireteam")
	};

	private _barricadePatrolGroup = [_barricadePos, Rivals, (selectRandom _patrolPool)] call A3A_fnc_RivalsSpawnGroup;
	(units _barricadePatrolGroup) apply {
		[_x,""] call A3A_fnc_NATOinit;
	};

	[_barricadePatrolGroup, "Patrol_Defend", 0, 200, -1, true, _barricadePos, false] call A3A_fnc_patrolLoop;
	_groups pushBack _barricadePatrolGroup;

	private _truckPatrolGroup = [_startingRoadPosition, Rivals, (selectRandom _patrolPool)] call A3A_fnc_RivalsSpawnGroup;
	(units _truckPatrolGroup) apply {
		[_x,""] call A3A_fnc_NATOinit;
	};

	[_truckPatrolGroup, "Patrol_Area", 50, 150, 250, true, (position _truck), false] call A3A_fnc_patrolLoop;

	_groups pushBack _truckPatrolGroup;
};

waitUntil {
	sleep 1;
	(_foodSacks inArea [_positionX, 25, 25, 0, false, -1] && isNull attachedTo _foodSacks && isNull ropeAttachedTo _foodSacks) || dateToNumber date > _dateLimitNum;
};

private _factor = [1, 1.5] select (_isDifficult);

switch(true) do {
	case (dateToNumber date > _dateLimitNum): {
		Info("Failure, time is out.");
		[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
		[5*_factor,-5*_factor,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-10*_factor, theBoss] call A3A_fnc_addScorePlayer;
	};
	case (_foodSacks inArea [_positionX, 50, 50, 0, false, -1] && {isNull attachedTo _foodSacks and isNull ropeAttachedTo _foodSacks }): {
		Info("Success, box is in the city.");
		[petros,"hint", format [localize "STR_A3A_Missions_SUPP_Supplies_success", _nameDest], localize "STR_A3A_Missions_SUPP_Supplies_tip_header"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
		[_taskId, "SUPP", "SUCCEEDED"] call A3A_fnc_taskSetState;
		{ 
			[round (15*_factor),_x] call A3A_fnc_addScorePlayer;
    		[round (300*_factor),_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[5*_factor,theBoss] call A3A_fnc_addScorePlayer;
    	[round (100*_factor), theBoss, true] call A3A_fnc_addMoneyPlayer;
		[-15*_factor, 15*_factor , _markerX] remoteExec ["A3A_fnc_citySupportChange",2];
		Debug("aggroEvent | Rebels won a supply mission");
		[Occupants, -10, 60] remoteExec ["A3A_fnc_addAggression",2];

		[0, round (300 * _factor)] remoteExec ["A3A_fnc_resourcesFIA",2];

		[20*_factor, (100/baseRivalsDecay)] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
		[10*_factor] remoteExecCall ["SCRT_fnc_rivals_addProgressToRivalsLocationReveal", 2];
	};
	default {
		Error("Unknown mission state, aborting.");
		[_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
	};
};

sleep 30;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
{deleteVehicle _x} forEach _others;

deleteVehicle _foodSacks;
private _emptybox = "Land_Pallet_F" createVehicle (getpos _foodSacks);
[_emptybox] spawn A3A_fnc_postmortem;

[_taskId, "SUPP", 900] spawn A3A_fnc_taskDelete;

Info("Salvage ambushed truck cleanup complete.");
