#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


//Mission: Steal ammo box from helicrash
if (!isServer && hasInterface) exitWith{};

params ["_markerX"];

Info("Helicrash mission init.");

private _missionOriginPos = getMarkerPos _markerX;
private _difficult = random 10 < tierWar;
private _bonus = if (_difficult) then {2} else {1};
private _sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
Info_3("Origin: %1, Hardmode: %2, Controlling Side: %3", _markerX, _difficult, _sideX);

private _limit = if (_difficult) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _destinationName = [_markerX] call A3A_fnc_localizar;

//creating array for cleanup
private _vehicles = [];
private _groups = [];
private _effectsAndProps = [];

//choosing enemy delivery target site
private _potentialSites = outposts + milbases + airportsX;
_potentialSites = _potentialSites select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
private _deliverySite = getMarkerPos _markerX;
if(count _potentialSites > 0) then {
    //TODO: find closest enemy outposts
    _randomEnemySite = selectRandom _potentialSites;
    _deliverySite = getMarkerPos _randomEnemySite;
};

Info_3("Difficulty: %1, Side: %2, Destination: %3", str _difficult, str _sideX, _destinationName);

//finding crash position
private _angle = random 360;
private _countX = 0;
private _distance = if (_difficult) then {2000} else {3000};
private _posCrashOrigin = [];
private _respawnTeamPlayerMarkerPos = getMarkerPos respawnTeamPlayer;
while {true} do {
	_posCrashOrigin = _missionOriginPos getPos [_distance,_angle];
    _respawnTeamPlayerMarkerPos = getMarkerPos respawnTeamPlayer;
    _outOfBounds = _posCrashOrigin findIf { (_x < 0) || {_x > worldSize}} != -1;
	if (!surfaceIsWater _posCrashOrigin 
        && _posCrashOrigin distance _respawnTeamPlayerMarkerPos < 4000 
        && _posCrashOrigin distance _respawnTeamPlayerMarkerPos > 1000
        && !_outOfBounds
    ) exitWith {};
	_angle = _angle + 1;
	_countX = _countX + 1;
	if (_countX > 360) then {
		_countX = 0;
		_distance = _distance - 500;
	};
};

// selecting classnames
private _pilotClass = _faction get "unitPilot";
private _helicopterClass = selectRandom (_faction get "vehiclesHelisTransport");
private _searchHeliClass =  if (_difficult) then {
    selectRandom ((_faction get "vehiclesHelisLightAttack") + (_faction get "vehiclesHelisAttack"))
} else {
    selectRandom ((_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisLightAttack"))
};
private _cargoTruckClass = selectRandom (_faction get "vehiclesTrucks");
private _boxClass = _faction get "ammobox";
private _specOpsArray = if (_difficult) then {selectRandom (_faction get "groupSpecOpsRandom")} else {selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)};

private _infantrySquadArray = selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier);

if (isNil "_pilotClass" || 
    {isNil "_helicopterClass"} || 
    {isNil "_searchHeliClass"} || 
    {isNil "_cargoTruckClass"} || 
    {isNil "_boxClass"} ||
    {isNil "_infantrySquadArray"} ||
    {isNil "_specOpsArray"}) 
exitWith {
	["LOG"] remoteExec ["A3A_fnc_missionRequest",2];
    Error("Problems with faction template, rerequesting new logistics mission.");
};

//refining crash spawn position, to avoid exploding on spawn or "Armaing" during mission
private _flatPosition = [_posCrashOrigin, 0, 1000, 0, 0, 0.4] call BIS_fnc_findSafePos;
private _crashPosition = _flatPosition findEmptyPosition [0, 100, _helicopterClass];
private _iterations = 0;
//crash position could be too close to petros, lets find out it again
while {_iterations < 30} do {
    _flatPosition = [_posCrashOrigin, 0, 1000, 0, 0, 0.4] call BIS_fnc_findSafePos;
    _crashPosition = _flatPosition findEmptyPosition [0, 100, _helicopterClass];
    if(_crashPosition distance _respawnTeamPlayerMarkerPos < 1000 && _crashPosition distance _respawnTeamPlayerMarkerPos > 4000) exitWith {};
    _iterations = _iterations + 1; 
};
if (count _crashPosition == 0) then {_crashPosition = _posCrashOrigin};

Debug_1("Helicrash position has been found after %1 iterations.", str _iterations);
Info_1("Helicrash position: %1", str _crashPosition);

{  
	[_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_crashPosition, ["ROCKS","ROCK"], 50, false, true];
{  
    _x setDamage 1;
} forEach nearestTerrainObjects [_crashPosition, ["Tree", "Bush", "BUILDING","RUIN","POWERWIND","POWERWAVE","POWERSOLAR","POWER LINES","MAIN ROAD","LIGHTHOUSE","HOUSE","HOSPITAL","HIDE","FUELSTATION","FOUNTAIN","FORTRESS","FENCE","CROSS","CHURCH","CHAPEL","BUSSTOP","BUNKER","QUAY","ROAD","SMALL TREE","STACK","TOURISM","TRACK","TRAIL","TRANSMITTER","VIEW-TOWER","WALL","WATERTOWER"], 20, false, true];

Info_2("Crash Location: %1, Aircraft: %2", _crashPosition, _helicopterClass);

//creating crashed helicopter
private _crater = "CraterLong_02_F" createVehicle _crashPosition;
private _helicopter = createVehicle [_helicopterClass, [_crashPosition select 0, _crashPosition select 1, 0.9], [], 0, "CAN_COLLIDE"];
_helicopter setDamage 0.8;
_helicopter setFuel 0;
_helicopter animateDoor ["Door_rear_source", 1, true];
clearWeaponCargoGlobal _helicopter;
clearMagazineCargoGlobal _helicopter;

private _smokeEffect = "test_EmptyObjectForSmoke" createVehicle _crashPosition; 
_smokeEffect attachTo [_helicopter,[0,1.5,-1]];
_effectsAndProps pushBack _smokeEffect;

_effectsAndProps pushBack _crater;
_vehicles pushBack _helicopter;

//creating pilot body
//pilot body will stay as monument to my failed efforts to make this mission as "rescue pilot" task 
_groupPilot = createGroup _sideX;
_pilot = [_groupPilot, _pilotClass, _crashPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
_pilotPosition = position _pilot;
_bloodSplatter = createVehicle ["BloodSplatter_01_Large_New_F", [_pilotPosition select 0, _pilotPosition select 1, (_pilotPosition select 2) + 0.05], [], 0,  "CAN_COLLIDE"];
_pilot setDamage 1;

_effectsAndProps append [_pilot, _bloodSplatter];

for "_i" from 0 to (random [3,5,6]) do {
    _firePosition = [
        _crashPosition, 
        2,
        25,
        2
    ] call BIS_fnc_findSafePos;

    [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0, _helicopter];

    private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
    [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

    private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
    [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

    _effectsAndProps append [_fireEffectEmitter, _lightEffectEmitter];
};

//creating mission marker near crash site
private _crashPositionMarker = _helicopter getRelPos [random 250,random 360];

//creating Task
private _taskId = "LOG" + str A3A_taskCount;
private _rebelTaskText = format [
    localize "STR_A3A_Missions_LOG_Helicrash_task_header", 
    _faction get "name", 
    _destinationName,
    _displayTime
];

[
    [teamPlayer,civilian],
    _taskId,
    [format [localize "STR_A3A_Missions_LOG_Helicrash_task_desc", _faction get "name", _destinationName, _displayTime], localize "STR_A3A_Missions_LOG_Helicrash_task_header", _markerX],
    _crashPositionMarker,
    false,
    0,
    true,
    "heli",
    true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

//loiter helicopter
_searchHeliData = [[(_crashPosition select 0) + random 100, (_crashPosition select 1) + random 100, 300 + random 500], 0, _searchHeliClass, _sideX] call A3A_fnc_spawnVehicle;
_searchHeliVeh = _searchHeliData select 0;
[_searchHeliVeh, _sideX] call A3A_fnc_AIVEHinit;
_searchHeliCrew = _searchHeliData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _searchHeliCrew;
_heliVehicleGroup = _searchHeliData select 2;

private _pilot = driver _searchHeliVeh;
_pilot disableAI "LIGHTS";
_pilot action ["lightOn", _searchHeliVeh];
_pilot action ["collisionlightOn", _searchHeliVeh];
//maybe this should be broadcasted
_searchHeliVeh setPilotLight true;
_searchHeliVeh setCollisionLight true;

_groups pushBack _heliVehicleGroup;
_vehicles pushBack _searchHeliVeh;

if(_searchHeliClass in (_faction get "vehiclesHelisLight")) then {
    _heliLoiterWaypoint = _heliVehicleGroup addWaypoint [_crashPosition, 0];
    _heliLoiterWaypoint setWaypointType "LOITER";
    _heliLoiterWaypoint setWaypointBehaviour "SAFE";
    [_heliVehicleGroup, 0] setWaypointLoiterRadius 400;
    [_heliVehicleGroup, 0] setWaypointLoiterType "CIRCLE_L";

    //spawning heli inf
    private _heliInfGroup = selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier);
    private _heliInfgroupX = [_missionOriginPos, _sideX, _heliInfGroup] call A3A_fnc_spawnGroup;
    {
        _x assignAsCargo _searchHeliVeh; 
        _x moveInAny _searchHeliVeh; 
        [_x] join _heliVehicleGroup; 
        [_x] call A3A_fnc_NATOinit
    } forEach units _heliInfgroupX;
    deleteGroup _heliInfgroupX;
} else {
    [_heliVehicleGroup, _crashPosition, 450] call bis_fnc_taskPatrol;
};

//spawning box
private _boxPosition = +_crashPosition;
_boxPosition set [2, (_crashPosition select 2) + 2];
private _box = _boxClass createVehicle _boxPosition;
_box allowDamage false;
// _box setVectorDirAndUp [[0,0,-1], [0,1,0]];
[_box] spawn A3A_fnc_fillLootCrate;
[_box] call A3A_Logistics_fnc_addLoadAction;

sleep 1;
_box allowDamage true;

Info_1("Box position: %1", position _box);

////////////////
//convoy spawn//
////////////////

//finding road
private _radiusX = 1500;
private _roads = [];
while {true} do {
	_roads = (position _box) nearRoads _radiusX;
	if (count _roads > 0) exitWith {};
	_radiusX = _radiusX + 25;
};
private _roadR = _roads select 0;
sleep 1;

//creating cargo vehicle
private _cargoVehicleData = [position _roadR, 0, _cargoTruckClass, _sideX] call A3A_fnc_spawnVehicle;
private _cargoVehicle = _cargoVehicleData select 0;
_cargoVehicle limitSpeed 50;
[_cargoVehicle, _sideX] call A3A_fnc_AIVEHinit;
[_cargoVehicle,"Cargo Truck"] spawn A3A_fnc_inmuneConvoy;
private _cargoVehicleGroup = _cargoVehicleData select 2;
private _cargoVehicleCrew = units _cargoVehicleGroup;
{[_x] call A3A_fnc_NATOinit} forEach _cargoVehicleCrew;
_groups pushBack _cargoVehicleGroup;
_vehicles pushBack _cargoVehicle;

_cargoGroupX = [_missionOriginPos, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _cargoVehicle; 
    _x moveInCargo _cargoVehicle; 
    [_x] join _cargoVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _cargoGroupX;
deleteGroup _cargoGroupX;

//crashsite patrollers
_patrolGroup = [_crashPosition, _sideX, _specOpsArray] call A3A_fnc_spawnGroup;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup;
_groups pushBack _patrolGroup;

[_patrolGroup, _crashPosition, 100] call bis_fnc_taskPatrol;

//moving to crash site
_cargoVehicleWp = _cargoVehicleGroup addWaypoint [position _box, 1];
//_cargoVehicleWp setWaypointType "GETOUT";
_cargoVehicleWp setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"];
_cargoVehicleWp setWaypointBehaviour "SAFE";

waitUntil {
	sleep 1;
	!alive _box ||
	{_cargoVehicle distance _box < 50 ||
    {_box distance (getMarkerPos respawnTeamPlayer) < 50 ||
	{dateToNumber date > _dateLimitNum
}}}};

if(_cargoVehicle distance _box < 50 && {alive _cargoVehicle} && {!isNull (driver _cargoVehicle)}) then {
    _allParticipatingUnits = [];
    {
        _allParticipatingUnits append (units _x);
    } forEach _groups;

    _isEnemyKnowsAboutTeamplayer = false;
    {
        _rebel = _x;
        {
            if(_x knowsAbout _rebel > 1.4) exitWith { _isEnemyKnowsAboutTeamplayer = true; };
        } forEach _allParticipatingUnits;
        if(_isEnemyKnowsAboutTeamplayer) exitWith {};
    } forEach ([500, 0, _cargoVehicle, teamPlayer] call A3A_fnc_distanceUnits);

    if(_isEnemyKnowsAboutTeamplayer) then {
        Info("Cargo truck has reached helicopter, they know about enemies, so starting doing some actions aware...");


        _cargoVehicleGroup setCombatMode "YELLOW";
        _cargoVehicleGroup setBehaviour "AWARE";

        _heliVehicleGroup setCombatMode "YELLOW";
        _heliVehicleGroup setBehaviour "AWARE";
    };

    Info("Cargo truck has reached helicopter, starting doing some actions...");

    _waypointTimeout = time + 15;
    waitUntil{sleep 1; time > _waypointTimeout };

    private _cargoSquad = units _cargoVehicleGroup; 
    {
        moveOut _x;
    } forEach _cargoSquad;

    _cargoTimeout = time + (random [40,60,80]);
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 0) then {
        Info("Putting pilot in bodybag.");
        _bodyBag = createVehicle  ["Land_Bodybag_01_black_F", position _pilot, [], 0, "CAN_COLLIDE"];
        _effectsAndProps pushBack _bodyBag;
        deleteVehicle _pilot;
    } else {
        Info("Players disrupt RIP pilot operation.");
    };

    _cargoTimeout = time + (random [40,60,80]);
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 3 && {alive _cargoVehicle}) then {
        Info("Putting ammobox inside truck");

        private _return = [_cargoVehicle, _box] call A3A_Logistics_fnc_canLoad;
        if !(_return isEqualType 0) exitWith {
            _return remoteExec ["A3A_Logistics_fnc_load", 2];
        };
    } else {
        Info("Players disrupt cargo operation.");
    };

    _cargoTimeout = time + (random [40,60,80]);
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 2) then {
        Info("Putting satchel into helicopter");
        //cargo team will plant the explosive on helicopter
        [_crashPosition, _helicopter, _cargoVehicle] spawn {
            params ["_crashPosition", "_helicopter", "_cargoVehicle"];
            waitUntil {sleep 1; _cargoVehicle distance _crashPosition > 150};
            _shell = "Sh_155mm_AMOS" createVehicle position _helicopter;
            _shell setVelocity [0,1,-1];
            _helicopter setDamage 1;
        };
    } else {
        Info("Players disrupt satchel operation.");
    };

    _cargoTimeout = time + (random [20,40,60]);
    waitUntil{sleep 1; time > _cargoTimeout };

    Info("Departing.");

    if(count waypoints _cargoVehicleGroup > 0) then {
        for "_i" from count waypoints _cargoVehicleGroup - 1 to 0 step -1 do {
            deleteWaypoint [_cargoVehicleGroup, _i];
        };
    };

    _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0];
    _cargoWp1 setWaypointType "GETIN";
    _cargoWp1 setWaypointBehaviour "SAFE";

    _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
    _cargoWp2 setWaypointType "MOVE";
    if(_isEnemyKnowsAboutTeamplayer) then {
        _cargoWp2 setWaypointBehaviour "AWARE";
    } else {
       _cargoWp2 setWaypointBehaviour "SAFE";
    };

    if(count waypoints _heliVehicleGroup > 0) then {
        for "_i" from count waypoints _heliVehicleGroup - 1 to 0 step -1 do {
            deleteWaypoint [_heliVehicleGroup, _i];
        };
    };
    _searchHeliWp1 = _heliVehicleGroup addWaypoint [_deliverySite, 2];
    _searchHeliWp1 setWaypointType "MOVE";
    if(_isEnemyKnowsAboutTeamplayer) then {
        _searchHeliWp1 setWaypointBehaviour "AWARE";
    } else {
        _searchHeliWp1 setWaypointBehaviour "SAFE";
    };
};

waitUntil {
	sleep 1;
	!alive _box ||
	_box distance _deliverySite < 50 ||
	_box distance (getMarkerPos respawnTeamPlayer) < 50 ||
	dateToNumber date > _dateLimitNum
};

switch(true) do {
    case(_box distance _deliverySite < 50 || {dateToNumber date > _dateLimitNum}): {
        Info("Box has been recovered by enemy, mission falied.");

        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;

        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        [-10,theBoss] call A3A_fnc_addScorePlayer;
    };
    case(!alive _box): {
        Info("Box has been destroyed, mission canceled.");
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
        [-300, _sideX] remoteExec ["A3A_fnc_timingCA",2];
    };
    case(_box distance (getMarkerPos respawnTeamPlayer) < 50): {
        Info("Box has been delivered to HQ, mission completed.");
        [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0, 600] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        { 
            [20*_bonus,_x] call A3A_fnc_addScorePlayer;
            [350*_bonus,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
        [250*_bonus,theBoss, true] call A3A_fnc_addMoneyPlayer;
    };
    default {
        Error("Undefined mission outcome.");
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

////////////
//Clean up//
////////////

sleep 30;

{
    deleteVehicle _x;
} forEach _effectsAndProps;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

if (alive _box && {_box distance (getMarkerPos respawnTeamPlayer) > 50}) then {
    deleteVehicle _box;
};

Info("Helicrash clean up complete.");
