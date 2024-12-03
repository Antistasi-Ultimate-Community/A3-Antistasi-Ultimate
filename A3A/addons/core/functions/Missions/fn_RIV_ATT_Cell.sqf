#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

//Mission: Kill Cell Leader
if (!isServer and hasInterface) exitWith {};

private _fnc_createLight = {
    params [["_position", []]];
    if (_position isEqualTo []) exitWith {};

    private _light = createVehicle ["#lightpoint", _position, [], 0 , "CAN_COLLIDE"];
    [_light, 8.4] remoteExecCall ["setLightBrightness", 0, _light];
    [_light, [0.3, 0.1, 0.05]] remoteExecCall ["setLightAmbient", 0, _light];
    [_light, [0.3, 0.1, 0.05]] remoteExecCall ["setLightColor", 0, _light];

    _light
};

Info_1("Kill Cell Leader task initialization started, marker: %1.", _marker);

private _vehicles = [];
private _groups = [];
private _effects = [];
private _props = [];

(90 call SCRT_fnc_misc_getTimeLimit) params ["_dateLimitNum", "_displayTime"];

private _isDifficult = random 10 < tierWar && ([] call SCRT_fnc_rivals_rollProbability);
private _positionX = getMarkerPos _marker;

Info_1("Is difficult: %1.", str _isDifficult);

///////////////////////////////
//  Calculating city size	 //
///////////////////////////////
private _cities = ["NameCityCapital","NameCity"] call SCRT_fnc_misc_getWorldPlaces;
private _isCity  = _cities findIf {(_x select 1) distance2D _positionX <= 250} == 0;
private _size = 200;
private _searchIterations = 0;

private _marker1 = createMarkerLocal [format ["%1cellTask1", _marker], _positionX];
_marker1 setMarkerShapeLocal "ELLIPSE";
_marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
_marker1 setMarkerTypeLocal "hd_warning";
_marker1 setMarkerAlphaLocal 0;

private _marker2 = createMarkerLocal [format ["%1cellTask1", _marker], _positionX];
_marker2 setMarkerShapeLocal "ELLIPSE";
_marker2 setMarkerSizeLocal [_size,_size];
_marker2 setMarkerTypeLocal "hd_warning";
_marker2 setMarkerAlphaLocal 0;

while {true} do {
    if (_isCity && {_size > 500}) exitWith {};
    if (!_isCity && {_size > 275}) exitWith {};
    if (_searchIterations > 20) exitWith {};
    private _hasBorderBuildings = (_positionX nearObjects ["House", _size]) findIf {!(_x inArea _marker1) && _x inArea _marker2} != -1;
    if (!_hasBorderBuildings) exitWith {};

    _size = _size + 20;
    _marker1 setMarkerSizeLocal [(_size - 20),(_size - 20)];
    _marker2 setMarkerSizeLocal [_size,_size];
    
    _searchIterations = _searchIterations + 1;
};

Info_1("City size: %1.", str _size);

//////////////////////////////////////////////
//  Damaged buildings	                    //
//////////////////////////////////////////////
private _damagedBuildings = (nearestObjects [_positionX, ["house"], _size]) select {(count ([_x] call BIS_fnc_buildingPositions)) > 0};
private _damagedBuildingsCount = round (random [1,2,3]);

if (count _damagedBuildings > 0) then {
    for "_i" from 0 to _damagedBuildingsCount do {
        private _damagedBuilding = selectRandom _damagedBuildings;
        _damagedBuilding setDamage ((random 0.5)+0.4);
        private _damagedBuildingPos = position _damagedBuilding;
        private _damagedBuildingCollision = 2 boundingBoxReal _damagedBuilding;
        private _p1 = _damagedBuildingCollision select 0;
        private _p2 = _damagedBuildingCollision select 1;
        private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

        private _bAtlPos = (getPosATL _damagedBuilding);
        private _bMinHeightAsl = ATLToASL _bAtlPos;
        private _bMaxHeightAsl = ATLToASL ([_bAtlPos select 0, _bAtlPos select 1, _maxHeight]);

        private _realRoofHeightAsl = ((lineIntersectsSurfaces [_bMaxHeightAsl, _bMinHeightAsl]) select 0) select 0;

        if (!isNil "_realRoofHeightAsl") then {
            private _fire = createVehicle ["test_EmptyObjectForFireBig", _damagedBuildingPos, [], 0 , "CAN_COLLIDE"];
            _fire setPosASL _realRoofHeightAsl;

            private _light = [(position _fire)] call _fnc_createLight;
            _effects append [_light, _fire];
        };
        _damagedBuilding animate ["door_1A_move",1];
        _damagedBuilding animate ["door_1B_move",1];
        _damagedBuilding animate ["door_2_rot",1];
        _damagedBuilding animate ["door_3_rot",1];
    };
};

if ((random 100) < 30) then {
    [_marker, false, _size] spawn A3A_fnc_blackout;
};

//////////////////////////////////////////////
//  Leader position and bodyguards	        //
//////////////////////////////////////////////
private _buildings = _positionX nearobjects ["house",_size];

if (isNil "_buildings" || {count _buildings < 0}) exitWith {
    Error("Problems with city buildings, cell leader will be spawned outside of building.");
};

private _capableBuildings = _buildings select {count ([_x] call BIS_fnc_buildingPositions) > 1 && {!(isObjectHidden _x)}};

if (isNil "_capableBuildings" || {count _capableBuildings < 0}) exitWith {
    Error("Problems with city buildings, cell leader will be spawned outside of building.");
	_isTargetOutside = true;
};

private _targetGroup = createGroup Rivals;
_groups pushBack _targetGroup;

private _targetBuilding = selectRandom _capableBuildings;
private _targetPos = position _targetBuilding;

//////////////////////////////////////////////
//  Task        	                        //
//////////////////////////////////////////////
private _taskId = "RIV_ATT" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_RIV_ATT_cell_text", A3A_faction_riv get "name", ([_marker] call A3A_fnc_localizar), _displayTime],
        format [localize "STR_RIV_ATT_cell_header", A3A_faction_riv get "name"],
        _marker
    ],
    _targetPos,
    false,
    0,
    true,
    "kill",
    true
] call BIS_fnc_taskCreate;
[_taskId, "RIV_ATT", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1; (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_targetPos, distanceSPWN1, distanceSPWN1] isNotEqualTo [] || {dateToNumber date > _dateLimitNum}};

private _buildingPositions = [_targetBuilding] call BIS_fnc_buildingPositions;
private _targetBuildingPositionIndex = random (round ((count _buildingPositions) - 1));
private _targetBuildingPosition = _buildingPositions select _targetBuildingPositionIndex;

private _occupiedIndexes = [_targetBuildingPosition];
private _target = [_targetGroup, A3A_faction_riv get "unitCommander", _targetBuildingPosition, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;

if (_isDifficult) then {
    for "_i" from 1 to (round (random [1,2,4])) do {
        private _nonOccupiedIndex = -1;

        {
            if (!(_forEachIndex in _occupiedIndexes)) exitWith {
                _occupiedIndexes pushBack _forEachIndex;
                _nonOccupiedIndex = _forEachIndex;
            };
        } forEach _buildingPositions;

        if (_nonOccupiedIndex != -1) then {
            private _guardClassName = selectRandom [
                "loadouts_riv_militia_Mercenary",
                "loadouts_riv_militia_Partisan",
                "loadouts_riv_militia_Oppressor",
                "loadouts_riv_militia_Saboteur",
                "loadouts_riv_militia_Enforcer"
            ];
            private _guardBuildingPos = _buildingPositions select _nonOccupiedIndex;
            private _guard = [_targetGroup, _guardClassName, _guardBuildingPos, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
        };
    };
};

(units _targetGroup) apply {
    private _unit = _x;
    {_unit disableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET", "ANIM"];
    _unit setUnitPos "UP";
    _unit allowDamage false;
    _unit setCaptive true;
    [_unit] call A3A_fnc_NATOinit;
};

_targetGroup selectLeader _target;
[_target, 100, (random 3)] call SCRT_fnc_common_addRandomMoneyMagazine;

//////////////////////////////
//  Barricades	            //
//////////////////////////////
private _previousRoadblockPositions = [];
private _cardinalDirections = [0,90,180,270];

private _barricadeTypes = [
    "Land_Barricade_01_10m_F", 
    "Land_Barricade_01_4m_F", 
    "Land_WoodPile_large_F", 
    "Land_Fortress_01_bricks_v1_F"
];

for "_i" from 0 to (count _cardinalDirections) - 1 do {
    private _cardinalDirection = _cardinalDirections select _i;

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

    //no roadblocks
    if (_i == 0 && {(isNil "_roads" || count _roads < 1)}) exitWith {};

    private _barricadePos = position (_roads select 0);   
    private _barricadeType = selectRandom _barricadeTypes;

    //AI tends to avoid PhysX objects so there is some chance that it won't continously ram the barricade
    private _canOpener = createVehicle ["Land_CanOpener_F", _barricadePos, [], 0 , "CAN_COLLIDE"]; 
    _canOpener hideObjectGlobal true;
    private _barricade = createVehicle [_barricadeType, _barricadePos, [], 0 , "CAN_COLLIDE"]; 
    _canOpener disableCollisionWith _barricade;

    _barricade setVectorUp surfaceNormal position _barricade;

#if __A3_DEBUG__
    private _localMarker = createMarkerLocal [format ["%1barr%2", random 10000, random 10000], (position _barricade)];
    _localMarker setMarkerSizeLocal [1,1];
    _localMarker setMarkerAlpha 1; 
    _localMarker setMarkerTypeLocal "hd_dot";
    _localMarker setMarkerColorLocal "ColorRed";
#endif
    
    _props append [_canOpener, _barricade];
};

deleteMarkerLocal _marker1;
deleteMarkerLocal _marker2;

//////////////////////////////
//  Tires and wrecks        //
//////////////////////////////
private _wreckCount = round (random [1,1,2]);
private _wreckPool = [
    "Land_Wreck_Skodovka_F", 
    "Land_Wreck_Car_F", 
    "Land_Wreck_Car3_F", 
    "Land_Wreck_Offroad2_F", 
    "Land_V3S_wreck_F", 
    "Land_Wreck_Truck_dropside_F", 
    "Land_Wreck_Ural_F",
    "Land_Tyres_F"
];

for "_i" from 0 to _wreckCount do {
    private _position = [
        _positionX, //center
        0, //minimal distance
        _size, //maximumDistance
        5, //object distance
        0, //water mode
        0, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_positionX, _positionX] //default position
    ] call BIS_fnc_findSafePos;

    private _class = selectRandom _wreckPool;
    private _wreck = createVehicle [_class, _position, [], 0 , "NONE"];
    _wreck setDir (random 360);
    _wreck setVectorUp surfaceNormal position _wreck;
    _vehicles pushBack _wreck;

    if (_class isEqualTo "Land_Tyres_F") then {
        private _smoke = createVehicle ["test_EmptyObjectForSmoke", _position, [], 0 , "CAN_COLLIDE"];
        _effects pushBack _smoke;
    } else {
        private _fire = createVehicle ["test_EmptyObjectForFireBig", _position, [], 0 , "CAN_COLLIDE"];

        private _light = [(position _fire)] call _fnc_createLight;
        _effects append [_light, _fire];
    };
};

//////////////////////////////////////////////
//  Patrols 	                            //
//////////////////////////////////////////////

private _patrolCount = nil;
private _patrolPool = nil;
if (_isDifficult) then {
    _patrolCount = 1;
    _patrolPool = A3A_faction_riv get "groupsSquad";
} else {
    _patrolCount = 2;
    _patrolPool = A3A_faction_riv get "groupsFireteam";
};

for "_i" from 0 to _patrolCount do {
    private _position = [
        _positionX, //center
        0, //minimal distance
        _size, //maximumDistance
        5, //object distance
        0, //water mode
        0, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_positionX, _positionX] //default position
    ] call BIS_fnc_findSafePos;
    private _patrolGroup = [_position, Rivals, (selectRandom _patrolPool)] call A3A_fnc_RivalsSpawnGroup;
    (units _patrolGroup) apply {
        private _unit = _x;
        {_unit disableAI _x} forEach ["CHECKVISIBLE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET"];
        _unit allowDamage false;
        _unit setCaptive true;
        [_unit] call A3A_fnc_NATOinit;
    };
    [_patrolGroup, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;

    _groups pushBack _patrolGroup;
};

if (_isDifficult) then {
    private _position = [
        _targetPos, //center
        0, //minimal distance
        100, //maximumDistance
        5, //object distance
        0, //water mode
        0, //maximum terrain gradient
        0, //shore mode
        [], //blacklist positions
        [_targetPos, _targetPos] //default position
    ] call BIS_fnc_findSafePos;
    private _sentry = [_position, Rivals, (selectRandom (A3A_faction_riv get "groupsSentry"))] call A3A_fnc_RivalsSpawnGroup;
    (units _sentry) apply {
        private _unit = _x;
        {_unit disableAI _x} forEach ["CHECKVISIBLE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET"];
        _unit allowDamage false;
        _unit setCaptive true;
        [_unit] call A3A_fnc_NATOinit;
    };
    [_sentry, _targetPos, 100] call bis_fnc_taskPatrol;
    _groups pushBack _sentry;
};

//////////////////////////////////////////////
//  Patrol vehicle 	                        //
//////////////////////////////////////////////
private _vehicleClass = if (_isDifficult) then {
    selectRandom ((A3A_faction_riv get "vehiclesRivalsLightArmed") + (A3A_faction_riv get "vehiclesRivalsAPCs") + (A3A_faction_riv get "vehiclesRivalsTanks"));
} else {
    selectRandom (A3A_faction_riv get "vehiclesRivalsLightArmed");
};

private _vehiclePosAndDir = [_positionX, _vehicleClass] call SCRT_fnc_common_findSafePositionForVehicle; 
private _patrolVehicleData = [(_vehiclePosAndDir select 0), 0, _vehicleClass, Rivals] call A3A_fnc_RivalsSpawnVehicle;
private _patrolVeh = _patrolVehicleData select 0;
_patrolVeh setDir (_vehiclePosAndDir select 1);
private _patrolVehCrew = _patrolVehicleData select 1;
private _patrolVehGroup = _patrolVehicleData select 2;

_patrolVehCrew apply {
    private _unit = _x;
    {_unit disableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET", "ANIM"];
    _unit allowDamage false;
    _unit setCaptive true;
    [_unit] call A3A_fnc_NATOinit;
};

[_patrolVeh, Rivals] call A3A_fnc_AIVEHinit;

_groups pushBack _patrolVehGroup;
_vehicles pushBack _patrolVeh;

[_patrolVehGroup, _positionX, 250] call bis_fnc_taskPatrol;

//////////////////////////////////////////////
//  Loot or Vehicle	with loot               //
//////////////////////////////////////////////
private _iterations = 0;
private _lootContainerPosition = nil;

while {true} do {
    _lootContainerPosition = [
		_targetPos, //center
		0, //minimal distance
		30, //maximumDistance
		7, //object distance
		0, //water mode
		0.45, //maximum terrain gradient
		0, //shore mode
		[], //blacklist positions
		[_targetPos, _targetPos] //default position
	] call BIS_fnc_findSafePos;

    if (!(isOnRoad _lootContainerPosition)) exitWith {};
    if (_iterations isEqualTo 50) exitWith {};
    _iterations = _iterations + 1;
};

private _cacheType = A3A_faction_riv get "ammobox";
private _emptyPos = _lootContainerPosition findEmptyPosition [0, 15, _cacheType];
if (_emptyPos isNotEqualTo []) then {
	_lootContainerPosition = _emptyPos;
};

private _direction = random 360;
//fake loot container for findEmptyPosition as it can't work with dynamic objects
_lootContainer = ["Land_PaperBox_closed_F", (AGLToASL _lootContainerPosition)] call BIS_fnc_createSimpleObject;
private _lootContainerPosition = position _lootContainer;

private _propsCount = round (random [1,2,4]);
private _propsPool = [
    "Land_PaperBox_closed_F", 
    "Land_PaperBox_open_full_F", 
    "CargoNet_01_box_F",
    "Land_MetalBarrel_F"
];

for "_i" from 0 to _propsCount do {
    private _propClass = selectRandom _propsPool;
    private _propPosition = _lootContainerPosition findEmptyPosition [2, 10, _propClass];

    if (_propPosition isEqualTo []) then {
        continue;
    };

    private _prop = [_propClass, (AGLToASL _propPosition)] call BIS_fnc_createSimpleObject;
    _prop setDir (random 360);
    _prop setVectorUp surfaceNormal getPos _prop;
    _props pushBack _prop;
};

deleteVehicle _lootContainer;

_lootContainer = createVehicle [_cacheType, _lootContainerPosition, [], 0 , "CAN_COLLIDE"];
[_lootContainer] spawn A3A_fnc_fillLootCrate;
_lootContainer allowDamage false;
_lootContainer setDir _direction;
_lootContainerPosition = position _lootContainer;

// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
_lootContainer addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
[_lootContainer] call A3A_Logistics_fnc_addLoadAction;

private _camoNet = createVehicle ["CamoNet_BLUFOR_F", _lootContainerPosition, [], 0 , "CAN_COLLIDE"];
_camoNet setDir _direction;

private _truckClass = selectRandom (A3A_faction_riv get "vehiclesRivalsTrucks");
private _vehiclePosAndDir = [_lootContainerPosition, _truckClass] call SCRT_fnc_common_findSafePositionForVehicle; 
private _truck = createVehicle [_truckClass, (_vehiclePosAndDir select 0), [], 0 , "CAN_COLLIDE"];
_truck setDir (_vehiclePosAndDir select 1);
[_truck, Rivals] call A3A_fnc_AIVEHinit;

_vehicles append [_camoNet, _truck, _lootContainer];

Info_1("Loot container on %1 position.", str (position _lootContainer));

waitUntil {
    sleep 2;
    (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_positionX, distanceSPWN, distanceSPWN] isNotEqualTo []
    || {!alive _target
    || {dateToNumber date > _dateLimitNum
}}};


{
        [_x,false] remoteExec ["setCaptive",0,_x];
} forEach ((call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_positionX, distanceSPWN1, distanceSPWN1]);

_lootContainer allowDamage true;

//////////////////////////////////////////////
//  Activate all units        	            //
//////////////////////////////////////////////
{
    private _group = _x;
    (units _group) apply {
        private _unit = _x;
        {_unit enableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET", "ANIM"];
        _unit allowDamage true;
        _unit setCaptive false;
    };
} forEach _groups;

////////////////////////////////////////////////////////////////////////////////////////////
// Eradicate BLUFOR for better performance and feeling of previous firefight  	          //
////////////////////////////////////////////////////////////////////////////////////////////
if (sidesX getVariable [_marker, sideUnknown] == Occupants) then {
    Info_1("Killing some of the BLUFOR units in the %1.", _marker);
    [_positionX, _size] spawn {
        params ["_positionX", "_size"];

        //wait for a bit so units will be spawned and spread out a little
        sleep 30;

        private _units = allUnits select {
            side _x isEqualTo Occupants && 
            {_x distance2D _positionX <= (_size * 1.5) && 
            {!(_x call SCRT_fnc_misc_isInHouse) && 
            {vehicle _x isEqualTo _x}}}
        };

        _units apply {
            if ((random 100) < 75) then {
                _x setDamage 1;
            };
        };
    };
};

//////////////////////////////
//  Car Demo	            //
//////////////////////////////
private _carCount = if (_isDifficult) then {round (random [2,3,3])} else {round (random [1,2,4])};

Info_1("Car Demos count: %1", str _carCount);

for "_i" from 0 to _carCount do {
   [_positionX, _size, 101] spawn SCRT_fnc_rivals_encounter_carDemo;
};

[_positionX, _target, _isDifficult] spawn {
    params ["_positionX", "_target", "_isDifficult"];
    if (!(alive _target)) exitWith {};

    sleep (random [120, 240, 360]);

    private _chance = if (_isDifficult) then {30} else {15};
    if ((random 100) > _chance) exitWith {}; 

    private _event = selectRandom [200, 300];

    switch _event do {
        case 200: {
            [[_positionX], "SCRT_fnc_rivals_encounter_uavFlyby"] call A3A_fnc_scheduler;
        };
        case 300: {
            [[_positionX], "SCRT_fnc_rivals_encounter_rovingMortar"] call A3A_fnc_scheduler;
        };
    };
};


waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || {!alive _target}
};

switch(true) do {
    case (dateToNumber date > _dateLimitNum): {
        Info("Time is out, cancelling task.");
        [_taskId, "RIV_ATT", "CANCELED"] call A3A_fnc_taskSetState;
    };
    case (!alive _target): {
        Info("Cell leader has died, success.");
        [_taskId, "RIV_ATT", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [0, 1500] remoteExec ["A3A_fnc_resourcesFIA",2];
        { 
            [50,_x] call A3A_fnc_addScorePlayer;
            [800,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [25,theBoss] call A3A_fnc_addScorePlayer;
        [400,theBoss, true] call A3A_fnc_addMoneyPlayer;

        [_marker, "CELL"] remoteExecCall ["SCRT_fnc_rivals_destroyLocation",2];
    };
    default {
        Error("Unexpected behaviour, cancelling mission.");
        [_taskId, "RIV_ATT", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

[_taskId, "RIV_ATT", 5] spawn A3A_fnc_taskDelete;

sleep 60;

{deleteVehicle _x} forEach _effects;
{deleteVehicle _x} forEach _props;
{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

Info("Kill Cell Leader cleanup complete.");