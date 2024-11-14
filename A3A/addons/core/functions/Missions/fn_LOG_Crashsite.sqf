#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


if (!isServer and hasInterface) exitWith {};

//Mission: Retrive valuable data


params ["_markerX"];

Info ("Crashsite");

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
// if this chooses a control (which it can) it has no name. 
// As such the task description will show as "Go to the supposed crash site in ."

//creating array for cleanup
private _vehicles = [];
private _groups = [];
private _effectsAndProps = [];

//choosing enemy delivery target site
private _potentialSites = outposts + milbases + airportsX;
_potentialSites = _potentialSites select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
private _deliverySite = getMarkerPos _markerX;

if (count _potentialSites > 0) then {
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
        && _posCrashOrigin distance _respawnTeamPlayerMarkerPos > 2000
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
private _reconVehicleDroppod = _faction getOrDefault ["vehiclesDropPod", []];

private _reconVehicleClass = selectRandom ((_faction get "vehiclesPlanesTransport") + (_faction get "uavsAttack") + _reconVehicleDroppod); //  + _reconVehicleDroppod
private _pilotClass = _faction get "unitPilot";

if (_reconVehicleClass in _reconVehicleDroppod) exitWith { 
    [_markerX] call A3A_fnc_LOG_Crashsite_Satellite;
};

private _searchHeliClassLight = _faction getOrDefault ["vehiclesHelisLight", []];
private _searchHeliClassLightAttack = _faction getOrDefault ["vehiclesHelisLightAttack", []];
private _searchHeliClassAttack = _faction getOrDefault ["vehiclesHelisAttack", []];
private _searchHeliClass = [];

if (_searchHeliClassLight isEqualTo [] && {_searchHeliClassLightAttack isEqualTo []} && {_searchHeliClassAttack isEqualTo []}) then {
    _searchHeliClass = [];
} else {
    _searchHeliClass =  if (_difficult) then {
        selectRandom ((_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisLightAttack") + (_faction get "vehiclesHelisAttack"))
    } else {
        selectRandom ((_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisLightAttack"))
    };
};

private _cargoTruckClass = selectRandom (_faction get "vehiclesTrucks");

private _blackboxClass = "";

//our blackbox
if ("lowTech" in A3A_factionEquipFlags) then {
   _blackboxClass = "Land_MetalCase_01_medium_F";
} else {
   _blackboxClass = "Land_PortableServer_01_black_F";
};

private _specOpsArray = if (_difficult) then {selectRandom (_faction get "groupSpecOpsRandom")} else {selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)};
//new
private _infantrySquadArray = selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier);

if (isNil "_reconVehicleClass" || {isNil "_cargoTruckClass"} || {isNil "_specOpsArray"}) exitWith {
	["LOG"] remoteExec ["A3A_fnc_missionRequest",2];
    Error("Problems with faction template, rerequesting new logistics mission.");
};

//refining crash spawn position, to avoid exploding on spawn or "Armaing" during mission
private _flatPosition = [_posCrashOrigin, 0, 1000, 0, 0, 0.4] call BIS_fnc_findSafePos;
private _crashPosition = _flatPosition findEmptyPosition [0, 100, _reconVehicleClass];
private _iterations = 0;
//crash position could be too close to petros, lets find out it again
while {_iterations < 30} do {
    _flatPosition = [_posCrashOrigin, 0, 1000, 0, 0, 0.4] call BIS_fnc_findSafePos;
    _crashPosition = _flatPosition findEmptyPosition [0, 100, _reconVehicleClass];
    if(_crashPosition distance _respawnTeamPlayerMarkerPos < 2000 && _crashPosition distance _respawnTeamPlayerMarkerPos > 4000) exitWith {};
    _iterations = _iterations + 1; 
};
if (count _crashPosition == 0) then {_crashPosition = _posCrashOrigin};

Debug_1("Crashsite position has been found after %1 iterations.", str _iterations);
Info_1("Crashsite position: %1", str _crashPosition);

//creating mission marker near crash site
private _reconVehiclePlaceholder = createVehicle ["Land_Can_V2_F", [_crashPosition select 0, _crashPosition select 1, 0.9], [], 0, "CAN_COLLIDE"];
//hide
_reconVehiclePlaceholder hideObjectGlobal true;

private _crashPositionMarker = _reconVehiclePlaceholder getRelPos [random 1,random 1];

private _startTime = 15 call SCRT_fnc_misc_getTimeLimit;
private _startTimeNum = _startTime select 0;
private _startTimeDisplay = _startTime select 1;

//creating Task
private _taskId = "LOG" + str A3A_taskCount;
private _rebelTaskText = format [
    localize "STR_A3A_Missions_LOG_crashsite_task_header", 
    _faction get "name", 
    _destinationName,
    _displayTime
];

[
    [teamPlayer,civilian],
    _taskId,
    [format [localize "STR_A3A_Missions_LOG_crashsite_task_desc", _faction get "name", _startTimeDisplay, _displayTime], localize "STR_A3A_Missions_LOG_crashsite_task_header", _markerX],
    _crashPositionMarker,
    false,
    0,
    true,
    "land",
    true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

///checking if players reached minimum distance to start vfx or if time limit has passed
private _missionStart = serverTime;
waitUntil {
    sleep 30;
    (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_crashPosition, 1500, 1500] isNotEqualTo [] || {_missionStart >= serverTime + 600 }
};
sleep 60; ///prep time

///

// This is the "crashing" vehicle, hence dummy
private _reconVehicleDummy = createVehicle [_reconVehicleClass, [0, 0, 250], [], 0, "NONE"];
private _quad = createVehicle ["I_Quadbike_01_F", [0, 0, 250], [], 0, "NONE"];
_reconVehicleDummy attachTo [_quad];
_reconVehicleDummy setDamage 0.2;
_initPos = _crashPosition getPos [2500, random 360];
_angleOffset = -32;
_quad setPos (_initPos vectorAdd [0,0,1000]);

_forwardVector = vectorDir _quad;
_upVector = vectorUp _quad;

_targetVector = (getPos _quad) vectorFromTo _crashPosition;
_quad setVectorDir _targetVector;
_newForwardVector = vectorDir _quad;
_angleCos = _newForwardVector vectorCos _targetVector;
_angle = acos(_angleCos) + _angleOffset;

_quad setVectorUp [-cos (getDir _quad + 90), sin (getDir _quad + 90), 1 / (tan _angle)];
_quad setVectorDirAndUp [vectorUp _quad, vectorDir _quad vectorMultiply -1];

_vel = velocity _quad;
_dir = vectorDir _quad;
_additionalSpeed = 130; // in m/s
_targetVector = [-cos (getDir _quad + 90), sin (getDir _quad + 90), 1 / (tan (_angle - 90))];
_quad setVelocity (_targetVector vectorMultiply _additionalSpeed);
_reconVehicleDummy setVectorUp _targetVector;

//VFX
_bomb1 = "ammo_Missile_Cruise_01" createVehicle [getPos _quad select 0, getPos _quad select 1 ,0];
[_quad] call SCRT_fnc_effect_crashingEffects;

private _crashsiteActual = getPosATL _quad;
_bomb2 = "ammo_Missile_Cruise_01" createVehicle [(_crashsiteActual  select 0),(_crashsiteActual  select 1),0];

private _crater = "CraterLong_02_F" createVehicle _crashsiteActual;
private _reconVehicle = createVehicle [_reconVehicleClass, [_crashsiteActual select 0, _crashsiteActual select 1, 5], [], 0, "CAN_COLLIDE"];
_reconVehicle allowDamage false;
_reconVehicle setPos [_crashsiteActual select 0, _crashsiteActual select 1, 5];
clearWeaponCargoGlobal _reconVehicle;
clearMagazineCargoGlobal _reconVehicle;

deletevehicle _reconVehicleDummy;
deletevehicle _quad;

_reconVehicle setDamage 0.6;
_reconVehicle animateDoor ["Door_rear_source", 1, true];

private _smokeEffect = "test_EmptyObjectForSmoke" createVehicle _crashsiteActual; 
_smokeEffect attachTo [_reconVehicle,[0,1.5,-1]];
_effectsAndProps pushBack _smokeEffect;

_effectsAndProps pushBack _crater;

{  
	[_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_reconVehicle, ["ROCKS","ROCK"], 50, false, true];

{  
    _x setDamage 1;
} forEach nearestTerrainObjects [_reconVehicle, ["Tree", "Bush", "BUILDING","RUIN","POWERWIND","POWERWAVE","POWERSOLAR","POWER LINES","MAIN ROAD","LIGHTHOUSE","HOUSE","HOSPITAL","HIDE","FUELSTATION","FOUNTAIN","FORTRESS","FENCE","CROSS","CHURCH","CHAPEL","BUSSTOP","BUNKER","QUAY","ROAD","SMALL TREE","STACK","TOURISM","TRACK","TRAIL","TRANSMITTER","VIEW-TOWER","WALL","WATERTOWER"], 20, false, true];


Info_2("Crash Location: %1, Aircraft: %2", _crashsiteActual, _reconVehicle);

_groupPilot = createGroup _sideX;
_pilot = "";
_pilotPosition = "";
_bloodSplatter = "";

if (typeOf _reconVehicle in (_faction get "vehiclesPlanesTransport")) then { 
    _pilot = [_groupPilot, _pilotClass, _crashsiteActual, [], 0, "NONE"] call A3A_fnc_createUnit;
    _pilotPosition = position _pilot;
    _bloodSplatter = createVehicle ["BloodSplatter_01_Large_New_F", [_pilotPosition select 0, _pilotPosition select 1,0/*  + 0.05 */], [], 0,  "CAN_COLLIDE"];
    _pilot setDamage 1;
    _effectsAndProps append [_pilot, _bloodSplatter];
};

for "_i" from 0 to (random [3,5,6]) do {
    private _firePosition = 
    [
        _crashsiteActual, 
        2,
        25,
        2
    ] call BIS_fnc_findSafePos;

    [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0, _reconVehicle];

    private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
    [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

    private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
    [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

    _effectsAndProps append [_fireEffectEmitter, _lightEffectEmitter];
};
//

//spawning box
private _boxPosition = +_crashsiteActual;
_boxPosition set [2, (_crashsiteActual select 2) + 5];
private _box = _blackboxClass createVehicle _boxPosition;
_box allowDamage false;
_box setVectorDirAndUp [[0,0,0], [0,1,0]];

[_box] call A3A_Logistics_fnc_addLoadAction;

sleep 1;
_reconVehicle allowDamage true;
_box allowDamage true;

Info_1("Box position: %1", position _box);

////////////////
//convoy spawn//
///////////////

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
_cargoVehicle limitSpeed 85;
[_cargoVehicle, _sideX] call A3A_fnc_AIVEHinit;
[_cargoVehicle,"Cargo Truck"] spawn A3A_fnc_inmuneConvoy;
private _cargoVehicleGroup = _cargoVehicleData select 2;
private _cargoVehicleCrew = units _cargoVehicleGroup;
{[_x] call A3A_fnc_NATOinit} forEach _cargoVehicleCrew;
_groups pushBack _cargoVehicleGroup;
_vehicles pushBack _cargoVehicle;

//
_cargoGroupSpawnpositon = getPosATL _cargoVehicle;
private _cargoVehicle2 = objNull;
private _cargoVehicle2driver = "";
//

_cargoGroupX = [_missionOriginPos, _sideX, _specOpsArray] call A3A_fnc_spawnGroup;

{
    _x assignAsCargo _cargoVehicle; 
    _x moveInCargo _cargoVehicle; 
    [_x] join _cargoVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _cargoGroupX;
deleteGroup _cargoGroupX;

//moving to crash site
_cargoVehicleWp = _cargoVehicleGroup addWaypoint [position _box, 1];
//_cargoVehicleWp setWaypointType "GETOUT";
_cargoVehicleWp setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"];
_cargoVehicleWp setWaypointBehaviour "SAFE";

private _searchHeliData = [];
private _searchHeliVeh = [];
private _searchHeliCrew = [];
private _heliVehicleGroup = [];
private _pilot = "";
if (_searchHeliClass isNotEqualTo []) then {
    //loiter helicopter
    _searchHeliData = [[(_cargoGroupSpawnpositon select 0) + random 100, (_cargoGroupSpawnpositon select 1) + random 100, 50 + random 75], 0, _searchHeliClass, _sideX] call A3A_fnc_spawnVehicle;
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
};

private _heliInfGroup = [];
private _totalSeats = [];
private _heliInfGroupSize = [];
if (_searchHeliClass isNotEqualTo []) then {
   _heliInfGroup = [_missionOriginPos, _sideX, _specOpsArray] call A3A_fnc_spawnGroup;
   _groups pushBack _heliInfGroup;
   {
        _x assignAsCargo _searchHeliVeh; 
        _x moveInCargo _searchHeliVeh; 
        [_x] join _heliInfGroup; // _heliVehicleGroup
        [_x] call A3A_fnc_NATOinit;
    } forEach units _heliInfGroup;

    {
        private _index = _searchHeliVeh getCargoIndex _x;
        if (_index == -1) then {
            deleteVehicle _x;
        };
    } forEach units _heliInfGroup;
    
    _landPos = [_crashsiteActual, 30, 100, 10, 0, 0.25, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
    _totalSeats = [typeOf _cargoVehicle, false] call BIS_fnc_crewCount; 
    _heliInfGroupSize = count units _heliInfGroup;
    if(_searchHeliClass in (_faction get "vehiclesHelisLight")) then {
        private _roll = random 100;
		if(_roll >= 50) then {
            [_searchHeliVeh, _heliInfGroup, _crashsiteActual, _cargoGroupSpawnpositon, _heliVehicleGroup] spawn A3A_fnc_fastrope;
        } else {
            [_searchHeliVeh, _heliVehicleGroup,_heliInfGroup, _crashsiteActual, _cargoGroupSpawnpositon, _landPos] spawn A3A_fnc_combatLanding;    
        };
        if (_totalSeats - 2 < _heliInfGroupSize) then { // -2 because cargo will take at most 2 seats
            sleep 8; // just to make sure cargovehicles won't collide
            private _cargoVehicleData2 = [_cargoGroupSpawnpositon , 0, _cargoTruckClass, _sideX] call A3A_fnc_spawnVehicle; //Just to make sure that everyone can RTB
            _cargoVehicle2 = _cargoVehicleData2 select 0;
            _cargoVehicle2 limitSpeed 85;
            [_cargoVehicle2, _sideX] call A3A_fnc_AIVEHinit;
            //[_cargoVehicle2,"Cargo Truck"] spawn A3A_fnc_inmuneConvoy;
            _vehicles pushBack _cargoVehicle2;
            _cargoVehicle2Wp = group driver _cargoVehicle2 addWaypoint [position _box, 1];
            //_cargoVehicleWp setWaypointType "GETOUT";
            _cargoVehicleWp setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"];
            _cargoVehicle2Wp setWaypointBehaviour "SAFE";
            _cargoVehicle2Wp setWaypointCompletionRadius 20;
            _cargoVehicle2driver = driver _cargoVehicle2;
        };
    } else {
        _heliVehicleGroupWP2 = _heliVehicleGroup  addWaypoint [position _box, 1];
        _heliVehicleGroupWP2 setWaypointType "LOITER";
        // _heliVehicleGroupWP2 setWaypointBehaviour "AWARE";
        _heliVehicleGroupWP2 setWaypointBehaviour "SAFE";
        [_heliVehicleGroup, 0] setWaypointLoiterRadius 400;
        [_heliVehicleGroup, 0] setWaypointLoiterType "CIRCLE_L";
        // [_heliVehicleGroup, 0] setWaypointCombatMode "RED";
    };
};

private _taskId2 = "LOG" + str A3A_taskCount;
private _rebelTaskText = format [
    localize "STR_A3A_Missions_LOG_crashsite_task_header", 
    _faction get "name", 
    _destinationName,
    _displayTime
];

if ((getPosASL _box) select 2 < 0) then { //in case box ends up underwater
    _box setVariable ["SalvageCrate", true, true];
    [_box] remoteExec ["SCRT_fnc_common_addActionMove", [teamPlayer, civilian], _box];
};

if (!isNil "traderMarker") then { //checking if trader is spawned
    [
        [teamPlayer,civilian],
        _taskId2,
        [format [localize "STR_A3A_Missions_LOG_crashsite_task_alt", _faction get "name", _destinationName, _displayTime], localize "STR_A3A_Missions_LOG_crashsite_task_header", _markerX],
        traderMarker,
        false,
        0,
        true,
        "whiteboard",
        true
    ] call BIS_fnc_taskCreate;
    [_taskId2, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
};

if (!isNil "traderMarker") then { // check if trader is present
    if (!isNull _cargoVehicle2 || alive _cargoVehicle2) then 
    {
        waitUntil
        {
            sleep 1;
            !(alive _box)
            ||
            {_cargoVehicle distance _box < 50} 
            ||
            {_cargoVehicle2 distance _box < 50} 
            ||
            {_box distance (getMarkerPos respawnTeamPlayer) < 50}
            ||
            {_box distance (getMarkerPos traderMarker) < 50}
            ||
            {dateToNumber date > _dateLimitNum}
        };
    } else {
        waitUntil 
        {
            sleep 1;
            !(alive _box)
            ||
            {_cargoVehicle distance _box < 50}
            ||
            {_box distance (getMarkerPos respawnTeamPlayer) < 50}
            ||
            {_box distance (getMarkerPos traderMarker) < 50}
            ||
            {dateToNumber date > _dateLimitNum}
        };
    };
} else {
    if (!isNull _cargoVehicle2 || alive _cargoVehicle2) then 
    {
        waitUntil 
        {
            sleep 1;
            !(alive _box)
            ||
            {_cargoVehicle distance _box < 50} 
            ||
            {_cargoVehicle2 distance _box < 50} 
            ||
            {_box distance (getMarkerPos respawnTeamPlayer) < 50} 
            ||
            {dateToNumber date > _dateLimitNum}
        };
    } else {
        waitUntil 
        {
            sleep 1;
            !(alive _box)
            ||
            {_cargoVehicle distance _box < 50} 
            ||
            {_box distance (getMarkerPos respawnTeamPlayer) < 50} 
            ||
            {dateToNumber date > _dateLimitNum}
        };
    };
};

if (_cargoVehicle distance _box < 50 || _cargoVehicle2 distance _box < 50 && (alive _cargoVehicle || alive _cargoVehicle2) && (!isNull (driver _cargoVehicle) || !isNull (driver _cargoVehicle2))) then {
    _allParticipatingUnits = [];

    {
        _allParticipatingUnits append (units _x);
    } forEach _groups;

    _isEnemyKnowsAboutTeamplayer = false;
    {
        private _rebel = _x;
        {
            if(_x knowsAbout _rebel > 1.4) exitWith { _isEnemyKnowsAboutTeamplayer = true; };
        } forEach _allParticipatingUnits;
        if(_isEnemyKnowsAboutTeamplayer) exitWith {};
    } forEach ([500, 0, _cargoVehicle, teamPlayer] call A3A_fnc_distanceUnits);

    if(_isEnemyKnowsAboutTeamplayer) then {
        Info("One of Cargo trucks has reached recon vehicle, they know about enemies, so starting doing some actions aware...");


        _cargoVehicleGroup setCombatMode "YELLOW";
        _cargoVehicleGroup setBehaviour "AWARE";

        _heliInfGroup setCombatMode "YELLOW";
        _heliInfGroup setBehaviour "AWARE";

        _heliVehicleGroup setCombatMode "YELLOW";
        _heliVehicleGroup setBehaviour "AWARE";
    };

    Info("One of Cargo trucks has reached recon vehicle, starting doing some actions...");

    _waypointTimeout = time + 15;
    waitUntil{sleep 1; time > _waypointTimeout };

    private _cargoSquad = units _cargoVehicleGroup; 
    {
        moveOut _x;
    } forEach _cargoSquad;

    _cargoTimeout = time + (random [25,30,35]);
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 3 && {alive _cargoVehicle} && _cargoVehicle distance _box < 50) then {
        Info("Putting blackbox inside truck");
        private _return = [_cargoVehicle, _box] call A3A_Logistics_fnc_canLoad;
        if !(_return isEqualType 0) exitWith {
            _return remoteExec ["A3A_Logistics_fnc_load", 2];
        };
    } else {
        if (alive _cargoVehicle2) then {
            Info("Putting blackbox inside second truck");
            private _return = [_cargoVehicle2, _box] call A3A_Logistics_fnc_canLoad;
            if !(_return isEqualType 0) then {
                _return remoteExec ["A3A_Logistics_fnc_load", 2];
            } else {
                Info("Players disrupt cargo operation.");
            };
        };
    };

    _cargoTimeout = time + (random [25,30,35]);
    waitUntil{sleep 1; time > _cargoTimeout };

    if(({alive _x} count units _cargoVehicleGroup) > 2) then {
        Info("Putting satchel into recon vehicle");
        //cargo team will plant the explosive on reconvehicle
        [_crashPosition, _reconVehicle, _cargoVehicle] spawn {
            params ["_crashPosition", "_reconVehicle", "_cargoVehicle"];
            waitUntil {sleep 1; _cargoVehicle distance _crashPosition > 150};
            _shell = "Sh_155mm_AMOS" createVehicle position _reconVehicle;
            _shell setVelocity [0,1,-1];
            _reconVehicle setDamage 1;
        };
    } else {
        if (({alive _x} count units _heliInfGroup) > 2) then {
                Info("Putting satchel into recon vehicle");
                //heli team will plant the explosive on reconvehicle
                [_crashPosition, _reconVehicle, _cargoVehicle] spawn {
                params ["_crashPosition", "_reconVehicle", "_cargoVehicle"];
                waitUntil {sleep 1; _cargoVehicle distance _crashPosition > 150};
                _shell = "Sh_155mm_AMOS" createVehicle position _reconVehicle;
                _shell setVelocity [0,1,-1];
                _reconVehicle setDamage 1;
            };
        } else {
            Info("Players disrupt satchel operation.");
        };
    };

    _cargoTimeout = time + (random [15,20,25]);
    waitUntil{sleep 1; time > _cargoTimeout };

    Info("Departing.");

    if(count waypoints _cargoVehicleGroup > 0) then {
        for "_i" from count waypoints _cargoVehicleGroup - 1 to 0 step -1 do {
            deleteWaypoint [_cargoVehicleGroup, _i];
        };
    };
    if (_searchHeliClass isNotEqualTo []) then {
        if(count waypoints _heliInfGroup  > 0) then {
            for "_i" from count waypoints _heliInfGroup  - 1 to 0 step -1 do {
                deleteWaypoint [_heliInfGroup , _i];
            };
        };
    };

    if ((!isNull _cargoVehicle2 || alive _cargoVehicle2) && (_cargoVehicle2 distance2D _reconVehicle < 50)) then {

        {
            _x assignAsCargo _cargoVehicle2;  
            [_x] call A3A_fnc_NATOinit;
        } forEach units _heliInfGroup;

        [_cargoVehicle2driver] join _heliInfGroup;
        _cargoVehicle2driver assignAsDriver _cargoVehicle2;
        if (_searchHeliClass isNotEqualTo []) then {
            _heliInfWp1 = _heliInfGroup addWaypoint [_cargoVehicle2, 0];
            _heliInfWp1 setWaypointType "GETIN";
            _heliInfWp1 setWaypointBehaviour "SAFE";

            _heliInfWp2 = _heliInfGroup addWaypoint [_deliverySite, 1];
            _heliInfWp2 setWaypointType "MOVE";

            if (_cargoVehicle distance2D _reconVehicle > 50) then {

                {
                    _x assignAsCargo _cargoVehicle2;
                    [_x] join _heliInfGroup;  
                    [_x] call A3A_fnc_NATOinit;
                } forEach units _cargoVehicleGroup;

                _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0]; //_cargoVehicle2
                _cargoWp1 setWaypointType "GETIN";
                _cargoWp1 setWaypointBehaviour "SAFE";

                _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
                _cargoWp2 setWaypointType "MOVE";
            } else {
                _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0]; //_cargoVehicle
                _cargoWp1 setWaypointType "GETIN";
                _cargoWp1 setWaypointBehaviour "SAFE";

                _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
                _cargoWp2 setWaypointType "MOVE";
            };

            if(_isEnemyKnowsAboutTeamplayer) then {
                _cargoWp2 setWaypointBehaviour "AWARE";
                _heliInfWp2 setWaypointBehaviour "AWARE";
            } else {
                _cargoWp2 setWaypointBehaviour "SAFE";
                _heliInfWp2 setWaypointBehaviour "SAFE";
            };
        } else {
            if (_cargoVehicle distance2D _reconVehicle > 50) then {

                {
                   _x assignAsCargo _cargoVehicle2;
                   [_x] join _heliInfGroup;  
                   [_x] call A3A_fnc_NATOinit;
                } forEach units _cargoVehicleGroup;

                _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0]; //_cargoVehicle2 //I don't know why _box is used
                _cargoWp1 setWaypointType "GETIN";
                _cargoWp1 setWaypointBehaviour "SAFE";

                _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
                _cargoWp2 setWaypointType "MOVE";
            } else {
                _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0]; //_cargoVehicle
                _cargoWp1 setWaypointType "GETIN";
                _cargoWp1 setWaypointBehaviour "SAFE";

                _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
                _cargoWp2 setWaypointType "MOVE";
            };

            if(_isEnemyKnowsAboutTeamplayer) then {
                _cargoWp2 setWaypointBehaviour "AWARE";
                _heliInfWp2 setWaypointBehaviour "AWARE";
            } else {
                _cargoWp2 setWaypointBehaviour "SAFE";
                _heliInfWp2 setWaypointBehaviour "SAFE";
            };
        };

    } else {
        if (_searchHeliClass isNotEqualTo []) then {

            {
                _x assignAsCargo _cargoVehicle;  
                [_x] join _cargoVehicleGroup; 
                [_x] call A3A_fnc_NATOinit;
            } forEach units _heliInfGroup;

            _heliInfWp1 = _heliInfGroup addWaypoint [_box, 0]; //_cargoVehicle
            _heliInfWp1 setWaypointType "GETIN";
            _heliInfWp1 setWaypointBehaviour "SAFE";

            _heliInfWp2 = _heliInfGroup addWaypoint [_deliverySite, 1];
            _heliInfWp2 setWaypointType "MOVE"; 

            _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0]; //_cargoVehicle
            _cargoWp1 setWaypointType "GETIN";
            _cargoWp1 setWaypointBehaviour "SAFE";

            _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
            _cargoWp2 setWaypointType "MOVE";

            if(_isEnemyKnowsAboutTeamplayer) then {
                _cargoWp2 setWaypointBehaviour "AWARE";
                _heliInfWp2 setWaypointBehaviour "AWARE";
            } else {
                _cargoWp2 setWaypointBehaviour "SAFE";
                _heliInfWp2 setWaypointBehaviour "SAFE";
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
        } else {
            _cargoWp1 = _cargoVehicleGroup addWaypoint [_box, 0]; //_cargoVehicle
            _cargoWp1 setWaypointType "GETIN";
            _cargoWp1 setWaypointBehaviour "SAFE";

            _cargoWp2 = _cargoVehicleGroup addWaypoint [_deliverySite, 1];
            _cargoWp2 setWaypointType "MOVE";

            if(_isEnemyKnowsAboutTeamplayer) then {
                _cargoWp2 setWaypointBehaviour "AWARE";
            } else {
                _cargoWp2 setWaypointBehaviour "SAFE";
            };
        };
    };
};

if (!isNil "traderMarker") then { //checking if trader is spawned
    waitUntil 
    {
        sleep 1;
        !(alive _box)
        ||
        _box distance _deliverySite < 50 
        ||
        _box distance (getMarkerPos respawnTeamPlayer) < 50
        ||
        _box distance (getMarkerPos traderMarker) < 50
        ||
        dateToNumber date > _dateLimitNum
    };
} else {
    waitUntil 
    {
        sleep 1;
        !(alive _box)
        ||
        _box distance _deliverySite < 50 
        ||
        _box distance (getMarkerPos respawnTeamPlayer) < 50
        ||
        dateToNumber date > _dateLimitNum
    };
};

switch(true) do 
{
    case(_box distance _deliverySite < 50 || {dateToNumber date > _dateLimitNum}):
    {
        Info("Box has been recovered by enemy, mission failed.");

        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
        [_taskId2, "LOG", "FAILED"] call A3A_fnc_taskSetState;

        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2]; // isn't this function running on the server? Might aswell just turn the remoteExecs to call/spawn
        [-10,theBoss] call A3A_fnc_addScorePlayer;
        if (dateToNumber date > _dateLimitNum) then {
            private _hrT = server getVariable "hr";
            private _resourcesFIAT = server getVariable "resourcesFIA";
            [-1*(round(_hrT/3)),-1*(round(_resourcesFIAT/3))] remoteExec ["A3A_fnc_resourcesFIA",2];
            [-10, 90] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
            { A3A_curHQInfoInv = A3A_curHQInfoInv + 0.25 + random 0.5 } remoteExecCall ["call", 2];
	    }; //If players fail, enemy will get location of the HQ
    };
    case(!alive _box):
    {
        Info("Box has been destroyed, mission canceled.");
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
        [_taskId2, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
        [-300, _sideX] remoteExec ["A3A_fnc_timingCA",2];
    };
    case(_box distance (getMarkerPos respawnTeamPlayer) < 50):
    {
        Info("Box has been delivered to HQ, mission completed.");
        [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [_taskId2, "LOG", "CANCELED"] call A3A_fnc_taskSetState;

        [0, 600] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];

        { 
            [20*_bonus,_x] call A3A_fnc_addScorePlayer;
            [350*_bonus,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);

        [10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
        [250*_bonus,theBoss,true] call A3A_fnc_addMoneyPlayer;
        ["Large", _sideX] remoteExec ["A3A_fnc_selectIntel", 2];

        for "_i" from 0 to 3 do {
            [(position _box), 6000, 1200, false] spawn SCRT_fnc_common_recon;
            if (hideEnemyMarkers) then {
                if (random 100 >= 70) then {
                    private _zoneAmount = selectRandom [1,2];
                    [_zoneAmount] call A3U_fnc_revealRandomZones;
                };
            };
            uiSleep 60;
        };

        deleteVehicle _box;
    };
    case(_box distance (getMarkerPos traderMarker) < 50):
    {
        Info("Box has been delivered to arms trader, mission completed.");

        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
        [_taskId2, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0, 1200] remoteExec ["A3A_fnc_resourcesFIA",2];
        [3600, _sideX] remoteExec ["A3A_fnc_timingCA",2];

        { 
            [30*_bonus,_x] call A3A_fnc_addScorePlayer;
            [700*_bonus,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        
        [20*_bonus,theBoss] call A3A_fnc_addScorePlayer;
        [500*_bonus,theBoss, true] call A3A_fnc_addMoneyPlayer;
        // [20] call SCRT_fnc_trader_setTraderDiscount;
    };
    default
    {
        Error("Undefined mission outcome.");
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
        [_taskId2, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

////////
//Clean up//
////////

sleep 20;

{
    deleteVehicle _x;
} forEach _effectsAndProps;

{
    deleteVehicle _x;
} forEach _vehicles;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
[_taskId2, "LOG", 1200] spawn A3A_fnc_taskDelete;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

deleteVehicle _box;


Info("Crashsite clean up complete.");