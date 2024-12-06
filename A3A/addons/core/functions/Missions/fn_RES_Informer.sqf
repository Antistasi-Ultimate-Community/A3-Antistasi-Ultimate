#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Mission: Rescue Rebel Informer
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

Info("Rescue Rebel Informer task initialization started, marker: %1.");

private _side = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_side);
private _difficulty = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

private _vehicles = [];
private _groups = [];
private _effects = [];
private _props = [];

private _limit = if (_difficulty) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _destinationName = [_markerX] call A3A_fnc_localizar;

Info_2("Side: %1, difficulty: %2.", str _side, str _difficulty);

//////////////////////
//City setMagazineTurretAmmo
/////////////////////

private _cities = ["NameCityCapital","NameCity"] call SCRT_fnc_misc_getWorldPlaces;
private _isCity  = _cities findIf {(_x select 1) distance2D _positionX <= 250} == 0;
private _size = 100;
private _searchIterations = 0;

//calculating city size
private _marker1 = createMarkerLocal [format ["%1informerTask1", _markerX], _positionX];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
_marker1 setMarkerTypeLocal "hd_warning";
_marker1 setMarkerAlphaLocal 0;

private _marker2 = createMarkerLocal [format ["%1informerTask2", _markerX], _positionX];
_marker2 setMarkerShapeLocal "ELLIPSE";
_marker2 setMarkerSizeLocal [_size,_size];
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerAlphaLocal 0;

while {true} do {
    if (_isCity && {_size > 500}) exitWith {};
    if (!_isCity && {_size > 250}) exitWith {};
    if (_searchIterations > 20) exitWith {};
    private _hasBorderBuildings = (_positionX nearObjects ["House", _size]) findIf {!(_x inArea _marker1) && _x inArea _marker2} != -1;
    if (!_hasBorderBuildings) exitWith {};

    _size = _size + 20;
    _marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
    _marker2 setMarkerSizeLocal [_size,_size];
    
    _searchIterations = _searchIterations + 1;
};

Info_1("City size: %1.", str _size);

//////////////////////
//Informer position
/////////////////////
private _buildings = _positionX nearobjects ["house",_size];

if (isNil "_buildings" || {count _buildings < 0}) exitWith {
    Error("Problems with city buildings, rerequesting new rescue mission.");
    ["RES"] remoteExec ["A3A_fnc_missionRequest",2];
};

private _capableBuildings = _buildings select {!(([_x] call BIS_fnc_buildingPositions) isEqualTo []) && {!(isObjectHidden _x)}};

if (isNil "_capableBuildings" || {count _capableBuildings < 0}) exitWith {
    Error("Problems with city buildings, rerequesting new rescue mission.");
    ["RES"] remoteExec ["A3A_fnc_missionRequest",2];
};

private _informerBuilding = selectRandom _capableBuildings;
private _informerBuildingPosition = selectRandom ([_informerBuilding] call BIS_fnc_buildingPositions);

private _grpInformer = createGroup teamPlayer;
private _informer = [_grpInformer, A3A_faction_reb get "unitUnarmed", _informerBuildingPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
_informer forceAddUniform (selectRandom (A3A_faction_civ get "uniforms"));
_informer allowDamage false;
[_informer,true] remoteExec ["setCaptive",0,_informer]; //will be turned off when players are close
_informer disableAI "MOVE";
_informer disableAI "AUTOTARGET";
_informer disableAI "TARGET";
_informer setUnitPos "UP";
_informer setBehaviour "CARELESS";
_informer allowFleeing 0;
[_informer, createHashMapFromArray [["face", selectRandom (A3A_faction_reb get "faces")], ["speaker", selectRandom (A3A_faction_reb get "voices")]]] call A3A_fnc_setIdentity;

removeAllWeapons _informer;
removeAllAssignedItems _informer;

[_informer,"refugee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_informer];
_informer playMoveNow "ApanPknlMstpSnonWnonDnon_G01";

private _searchHeliClass =  if (_difficulty) then {
    selectRandom ((_faction get "vehiclesHelisLightAttack") + (_faction get "vehiclesHelisAttack"))
} else {
    selectRandom ((_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisLightAttack"))
};
private _searchHeliData = [[(_positionX select 0) + random 100, (_positionX select 1) + random 100, 300 + random 500], 0, _searchHeliClass, _side] call A3A_fnc_spawnVehicle;
private _searchHeliVeh = _searchHeliData select 0;
[_searchHeliVeh, _side] call A3A_fnc_AIVEHinit;
private _searchHeliCrew = _searchHeliData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _searchHeliCrew;
private _heliVehicleGroup = _searchHeliData select 2;


private _pilot = driver _searchHeliVeh;
_pilot disableAI "LIGHTS";
_pilot action ["lightOn", _searchHeliVeh];
_pilot action ["collisionlightOn", _searchHeliVeh];
//maybe this should be broadcasted
_searchHeliVeh setPilotLight true;
_searchHeliVeh setCollisionLight true;

if(_searchHeliClass in (_faction get "vehiclesHelisLight")) then {
    _heliLoiterWaypoint = _heliVehicleGroup addWaypoint [_positionX, 0];
    _heliLoiterWaypoint setWaypointType "LOITER";
    _heliLoiterWaypoint setWaypointBehaviour "SAFE";
    [_heliVehicleGroup, 0] setWaypointLoiterRadius 400;
    [_heliVehicleGroup, 0] setWaypointLoiterType "CIRCLE_L";

    //spawning heli inf
    private _heliInfGroup = selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier);
    private _heliInfgroupX = [_positionX, _side, _heliInfGroup] call A3A_fnc_spawnGroup;
    {
        _x assignAsCargo _searchHeliVeh; 
        _x moveInAny _searchHeliVeh; 
        [_x] join _heliVehicleGroup; 
        [_x] call A3A_fnc_NATOinit
    } forEach units _heliInfgroupX;
    deleteGroup _heliInfgroupX;
} else {
    [_heliVehicleGroup, _positionX, 450] call bis_fnc_taskPatrol;
};

_groups pushBack _heliVehicleGroup;
_vehicles pushBack _searchHeliVeh;

////////////
//Tasks
////////////
private _taskId = "RES" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_A3A_Missions_RES_Informer_task_desc", _faction get "name", _destinationName, _displayTime],
        localize "STR_A3A_Missions_RES_Informer_task_header",
        _markerX
    ],
    _positionX,
    false,
    0,
    true,
    "danger",
    true
] call BIS_fnc_taskCreate;
[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

Info("Informer has spawned, waiting until players will be close to the city");

waitUntil {sleep 1;dateToNumber date > _dateLimitNum or {spawner getVariable _markerX != 2}};

private _roadblockCount = ceil (random [1,2,4]);
private _previousRoadblockPositions = [];
private _cardinalDirections = [0,90,180,270];

Info_1("Roadblocks count: %1.", str _roadblockCount);

private _earlyEscape = false;

//placing roadblocks on different entrances to the city
for "_i" from 0 to _roadblockCount do {
    private _cardinalDirection = selectRandom _cardinalDirections;
    _cardinalDirections deleteAt (_cardinalDirections find _cardinalDirection);

    private _rawPosition = [_positionX, _size, _cardinalDirection] call BIS_fnc_relPos;
    
    private _radiusX = 20;
    private _roads = nil;
    private _dirveh = 0;
	while {_radiusX < 500} do {
		_roads = _rawPosition nearRoads _radiusX;
		_roads = _roads select { count (roadsConnectedTo _x) == 2 };
		if (count _roads > 0) exitWith {};
		_radiusX = _radiusX + 20;
	};

    if (_radiusX >= 500) then {
        _radiusX = 0;
		continue;
	} else {
        private _roadscon = roadsConnectedto (_roads select 0);
	    _dirveh = [_roads select 0, _roadscon select 0] call BIS_fnc_DirTo;
    };

    //no roads at all, aborting
    if (_i == 0 && {(isNil "_roads" || count _roads < 1)}) exitWith {
        _earlyEscape = true;
    };

    private _roadblockPosition = position (_roads select 0);   

    private _typeVehX = if(random 10 < (tierWar + (difficultyCoef / 2))) then {
        selectRandom ((_faction get "vehiclesLightAPCs") + (_faction get "vehiclesLightArmed"))
    } else {
        selectRandom (_faction get "vehiclesMilitiaLightArmed")
    };

    private _roadblockVehicleData = [_roadblockPosition, 0, _typeVehX, _side] call A3A_fnc_spawnVehicle;
    private _roadblockVeh = _roadblockVehicleData select 0;
    private _vehCrew = crew _roadblockVeh;
    {[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
    [_roadblockVeh, _side] call A3A_fnc_AIVEHinit;
    private _roadblockVehicleGroup = _roadblockVehicleData select 2;

    _roadblockVeh setDir _dirveh + 90;

    private _gunner = gunner _roadblockVeh;
    if (!isNull _gunner) then {
        _gunner lookAt (_gunner getRelPos [100, _dirveh]);
    };

    _groups pushBack _roadblockVehicleGroup;
    _vehicles pushBack _roadblockVeh;

    private _typeGroup = [
        selectRandom (_faction get "groupsMilitiaSmall"),
        selectRandom ([_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier)
    ] select _difficulty;

    private _roadblockPosition = [
    _roadblockPosition, //center
        2, //minimal distance
        15, //maximumDistance
        0, //object distance
        0, //water mode
        5, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_roadblockPosition, _roadblockPosition] //default position
    ] call BIS_fnc_findSafePos;
    private _groupX = [_roadblockPosition, _side, _typeGroup, true] call A3A_fnc_spawnGroup;
    if !(isNull _groupX) then {
        {
            [_x,"", false] call A3A_fnc_NATOinit;
        } forEach units _groupX;
    };
    _groups pushBack _groupX;
};

deleteMarkerLocal _marker1;
deleteMarkerLocal _marker2;

if (_earlyEscape) exitWith {
    Error( "Problems with road positions, rerequesting new rescue mission.");
    ["RES"] remoteExec ["A3A_fnc_missionRequest",2];
};

Info("Roadblocks have spawned.");

////////////
//Pursuers
////////////
_mrk = createMarkerLocal [format ["%1patrolarea", floor random 1000], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [300,300];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

private _typeGroup = [
    selectRandom (_faction get "groupsMilitiaSquads"),
    selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
] select _difficulty;

private _groupX = [_positionX,_side, _typeGroup] call A3A_fnc_spawnGroup;
[_groupX, "Patrol_Area", 25, 250, 100, false, _positionX, false] call A3A_fnc_patrolLoop;
{[_x] call A3A_fnc_NATOinit} forEach units _groupX;
private _dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
[_dog,_groupX] spawn A3A_fnc_guardDog;
_groups pushBack _groupX;

////////////
//Burning Garbage
////////////

private _garbageCount = ceil (random [2,3,5]);
private _garbagePool = ["Land_GarbageWashingMachine_F", "Land_GarbagePallet_F", "Land_GarbageBags_F", "Land_Wreck_Van_F"];

for "_i" from 0 to _garbageCount do {
    private _garbagePosition = [
    _positionX, //center
        0, //minimal distance
        _size, //maximumDistance
        3, //object distance
        0, //water mode
        5, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_positionX, _positionX] //default position
    ] call BIS_fnc_findSafePos;

    private _garbage = createVehicle [ (selectRandom _garbagePool), _garbagePosition, [], 0, "NONE"];
    _garbage setDir (random 360);
    
    _props pushBack _garbage;

    if ((random 100) < 30) then {
        private _smokeEffect = "test_EmptyObjectForSmoke" createVehicle _garbagePosition; 
        _smokeEffect attachTo [_garbage,[0,0,0]];

        private _fireEffect = "#particlesource" createVehicle _garbagePosition;
        [_fireEffect, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffect];
        
        private _lightEffect = "#lightpoint" createVehicle _garbagePosition; 
        [_lightEffect, 0.3] remoteExec ["setLightBrightness", 0, _lightEffect];
        [_lightEffect, [0.55, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffect];
        [_lightEffect, [0.55, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffect];

        _effects append [_smokeEffect, _fireEffect, _lightEffect];
    };
};


waitUntil {
    sleep 1;
    (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _informer < 40} != -1 || {!alive _informer || {dateToNumber date > _dateLimitNum}}
};

private _informerMarker = nil;

if (alive _informer) then {
    _informer allowDamage true;
    [_informer,false] remoteExec ["setCaptive",0,_informer];
    
    private _flarePosition = _informer getPos [random 10,random 360];
    _flarePosition set [2, (((getPosATL _informer) select 2) + (random [150,175,200]))]; 

    private _flare = createVehicle [selectRandom (_faction get "flares"), _flarePosition, [], 0, "CAN_COLLIDE"];
    _flare setVelocity [-10+random 10, -10+random 10, -0.000001];

    playSound3D [(selectRandom flareSounds), _flare, false,  getPosASL _flare, 1.5, 1, 450, 0];

    _informerMarker = createMarker ["InformerLocationMarker", (position _informer)];
    _informerMarker setMarkerTypeLocal "hd_objective";
    _informerMarker setMarkerSizeLocal [1, 1];
    _informerMarker setMarkerTextLocal (localize "STR_marker_informer_pos");
    _informerMarker setMarkerColorLocal "colorCivilian";
    _informerMarker setMarkerAlpha 1;
};

{
    private _wp = _x addWaypoint [_informer, 100];
    _wp setWaypointType "MOVE";
    _wp setWaypointSpeed "NORMAL";
    _wp setWaypointBehaviour "AWARE";
} forEach _groups;


waitUntil {
    sleep 1;
    !alive _informer || {dateToNumber date > _dateLimitNum || {(_informer distance2D (getMarkerPos "Synd_HQ") < 25)}}
};

private _bonus = if (_difficulty) then {2} else {1};

switch(true) do {
    case (dateToNumber date > _dateLimitNum): {
        Info("Time is out, fail.");

        [_side, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
        [_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;

        [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];

        [-900, _side] remoteExec ["A3A_fnc_timingCA",2];
        [-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    };
    case (!alive _informer): {
        Info("Informer died, fail.");

        [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];

        [_side, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
        [_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
        
        [-900, _side] remoteExec ["A3A_fnc_timingCA",2];
        [-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    };
    case (alive _informer && {(_informer distance2D (getMarkerPos "Synd_HQ") < 25)}): {
        Info("Informer survived and arrived to HQ, success.");
        [_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
        [1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _side] remoteExec ["A3A_fnc_timingCA",2];

        if (_difficulty) then {
            ["Large", _side] remoteExec ["A3A_fnc_selectIntel", 2];
        } else {
            ["Medium", _side] remoteExec ["A3A_fnc_selectIntel", 2];
        };

        { 
            [30*_bonus,_x] call A3A_fnc_addScorePlayer;
            [600*_bonus,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [20*_bonus, theBoss] call A3A_fnc_addScorePlayer;
        [400*_bonus,theBoss, true] call A3A_fnc_addMoneyPlayer;
    };
    default {
        Error("Unexpected behaviour, cancelling mission.");
        [_taskId, "RES", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

sleep 30;

deleteMarkerLocal _mrk;

if (!isNil "_informerMarker") then {
    deleteMarker _informerMarker;
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

{
    deleteVehicle _x;
} forEach (_effects + _props + [_informer]);

[_taskId, "RES", 1200] spawn A3A_fnc_taskDelete;

Info("Rescue Rebel Informer clean up complete.");