#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_marker"];
//Mission: Prevent transfer of gear and vehicels to Rivals
if (!isServer and hasInterface) exitWith {};
private _positionX = getMarkerPos _marker;
private _hideoutPosition = [
    _positionX, //center
    0, //minimal distance
    300, //maximumDistance
    0, //object distance
    0, //water mode
    0.3, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_positionX, _positionX] //default position
] call BIS_fnc_findSafePos;
private _radGrad = [_hideoutPosition, 0] call BIS_fnc_terrainGradAngle;
private _outOfBounds = _hideoutPosition findIf { (_x < 0) || {_x > worldSize}} != -1;
private _InvBases = (airportsX + milbases + outposts + seaports + factories + resourcesX) select {sidesX getVariable [_x, sideUnknown] == Invaders};
private _isTooCloseToOutposts = _InvBases findIf { _hideoutPosition distance2d (getMarkerPos _x) < 500 || _hideoutPosition inArea _x } != -1;
private _CloseToOutposts = _InvBases findIf { _hideoutPosition distance2d (getMarkerPos _x) < 1000 || _hideoutPosition inArea _x } != -1;
private _transferConvoyPossibleSpawnMarkers = _InvBases select {_hideoutPosition distance2d (getMarkerPos _x) < 4000}; //
if (_transferConvoyPossibleSpawnMarkers isEqualTo []) exitWith {
    [[_marker],"A3A_fnc_RIV_ATT_Hideout"] remoteExec ["A3A_fnc_scheduler",2];
};
private _transferConvoySpawnPosMarker = selectRandom _transferConvoyPossibleSpawnMarkers;
private _transferConvoySpawnPos = getMarkerPos _transferConvoySpawnPosMarker;
private _fnc_createLight = {
    params [["_position", []]];
    if (_position isEqualTo []) exitWith {};
    private _light = createVehicle ["#lightpoint", _position, [], 0 , "CAN_COLLIDE"];
    [_light, 8.4] remoteExecCall ["setLightBrightness", 0, _light];
    [_light, [0.3, 0.1, 0.05]] remoteExecCall ["setLightAmbient", 0, _light];
    [_light, [0.3, 0.1, 0.05]] remoteExecCall ["setLightColor", 0, _light];
    _light
};
Info_1("Prevent transfer task initialization started, marker: %1.", _marker);
///add fail condition (increase rivals activity)
private _vehicles = [];
private _groups = [];
private _sideX = Invaders;
private _faction = Faction(_sideX);
(90 call SCRT_fnc_misc_getTimeLimit) params ["_dateLimitNum", "_displayTime"];
private _isDifficult = if (random 10 < tierWar) then {true} else {false};
Info_1("Is difficult: %1.", str _isDifficult);
//mitigation of negative terrain gradient
if(!(_radGrad > -0.25 && _radGrad < 0.25) || {isOnRoad _hideoutPosition || {surfaceIsWater _hideoutPosition || {_outOfBounds || {_isTooCloseToOutposts}}}}) then {
    private _radiusX = 100;
    while {true} do {
        _hideoutPosition = [
            _positionX, //center
            0, //minimal distance
            _radiusX, //maximumDistance
            0, //object distance
            0, //water mode
            0.3, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_positionX, _positionX] //default position
        ] call BIS_fnc_findSafePos;
        _radGrad = [_hideoutPosition, 0] call BIS_fnc_terrainGradAngle;
        _outOfBounds = _hideoutPosition findIf { (_x < 0) || {_x > worldSize}} != -1;
        _isTooCloseToOutposts = _InvBases findIf { _hideoutPosition distance2d (getMarkerPos _x) < 300 || _hideoutPosition inArea _x } != -1;
        if ((_radGrad > -0.25 && _radGrad < 0.25) && {!(isOnRoad _hideoutPosition) && {!(surfaceIsWater _hideoutPosition) && {!_outOfBounds && {!_isTooCloseToOutposts}}}}) exitWith {};
        _radiusX = _radiusX + 5;
    };
};
{  
	[_x, true] remoteExec ["hideObject", 0, true];
} forEach nearestTerrainObjects [_hideoutPosition, [], 50, false, true];
private _posOrigin = navGrid select ([_transferConvoySpawnPosMarker] call A3A_fnc_getMarkerNavPoint) select 0;
private _posDest = navGrid select ([_marker] call A3A_fnc_getMarkerNavPoint) select 0;
private _route = [_posOrigin, _posDest] call A3A_fnc_findPath;
private _pathState = [];
_route = _route apply { _x select 0 };			// reduce to position array
if (_route isEqualTo []) then { _route = [_posOrigin, _posDest] };
//private _route = [_transferConvoySpawnPos, _hideoutPosition] call A3A_fnc_findPath;
//////////////////////////////////////////////
//  Task        	                        //
//////////////////////////////////////////////
private _taskId = "RIV_ATT" + str A3A_taskCount;
[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_RIV_ATT_transfer_text", A3A_faction_riv get "name", ([_marker] call A3A_fnc_localizar), _displayTime],
        format [localize "STR_RIV_ATT_transfer_header", A3A_faction_riv get "name"],
        _marker
    ],
    _hideoutPosition,
    false,
    0,
    true,
    "destroy",///maybe change the icon
    true
] call BIS_fnc_taskCreate;
[_taskId, "RIV_ATT", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
waitUntil {
    sleep 1;
    (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_hideoutPosition, distanceSPWN1, distanceSPWN1] isNotEqualTo [] || {dateToNumber date > _dateLimitNum}
};
private _lootContainer = nil;
private _vehObj = nil;
if (dateToNumber date < _dateLimitNum) then {
    private _tempVeh = "Land_LampShabby_off_F" createVehicleLocal _hideoutPosition;
    private _atlPos = getPosATL _tempVeh;
    deleteVehicle _tempVeh;
    private _compositionMap = createHashMapFromArray [
        ["COMP1", SCRT_fnc_composition_rivals1],
        ["COMP2", SCRT_fnc_composition_rivals2],
        ["COMP3", SCRT_fnc_composition_rivals3]
    ];
    private _fnc = _compositionMap get (selectRandom ["COMP1", "COMP2", "COMP3"]);
    private _objects = [_atlPos, (random 360), (call _fnc)] call BIS_fnc_objectsMapper;
    {_x setVectorUp surfaceNormal getPos _x} forEach _objects;
    _vehicles append _objects;
    //////////////////////////////////////////////
    //  Loot or Vehicle	with loot               //
    //////////////////////////////////////////////
    private _iterations = 0;
    private _lootContainerPosition = nil;
    while {true} do {
        _lootContainerPosition = [
            _hideoutPosition, //center
            0, //minimal distance
            25, //maximumDistance
            3, //object distance
            0, //water mode
            0.45, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_hideoutPosition, _hideoutPosition] //default position
        ] call BIS_fnc_findSafePos;
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
    private _propsCount = round (random [1,2,2]);
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
        _vehicles pushBack _prop;
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
    private _truckClass = selectRandom (A3A_faction_riv get "vehiclesRivalsTrucks");
    private _vehiclePosAndDir = [_lootContainerPosition, _truckClass, 50, true] call SCRT_fnc_common_findSafePositionForVehicle; 
    private _truck = createVehicle [_truckClass, (_vehiclePosAndDir select 0), [], 0 , "CAN_COLLIDE"];
    _truck setDir (_vehiclePosAndDir select 1);
    [_truck, Rivals] call A3A_fnc_AIVEHinit;
    _vehicles append [_truck, _lootContainer];
    if (_isDifficult) then {
        _truckPosition = position _truck;
        private _prizeClass = selectRandom ((A3A_faction_riv get "vehiclesRivalsLightArmed") + (A3A_faction_riv get "vehiclesRivalsCars") + (A3A_faction_riv get "vehiclesRivalsAPCs") + (A3A_faction_riv get "vehiclesRivalsTanks") + (A3A_faction_riv get "vehiclesRivalsHelis"));
        private _vehiclePosAndDir = [_truckPosition, _prizeClass, 50, true] call SCRT_fnc_common_findSafePositionForVehicle; 
        private _prizeVehicle = createVehicle [_prizeClass, (_vehiclePosAndDir select 0), [], 0 , "CAN_COLLIDE"];
        _prizeVehicle setDir (_vehiclePosAndDir select 1);
        [_prizeVehicle, Rivals] call A3A_fnc_AIVEHinit;
        _vehicles append [_prizeVehicle];
    };
    
    Info_1("Loot container on %1 position.", str (position _lootContainer));
    {
        [_x,false] remoteExec ["setCaptive",0,_x];
    } forEach ((call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_hideoutPosition, distanceSPWN1, distanceSPWN1]);
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
            _hideoutPosition, //center
            0, //minimal distance
            150, //maximumDistance
            5, //object distance
            0, //water mode
            0, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_hideoutPosition, _hideoutPosition] //default position
        ] call BIS_fnc_findSafePos;
        private _patrolGroup = [_position, Rivals, (selectRandom _patrolPool)] call A3A_fnc_spawnGroup;
        {[_x] call A3A_fnc_NATOinit;} forEach (units _patrolGroup);
        
        [_patrolGroup, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;
        _groups pushBack _patrolGroup;
    };
    if (_isDifficult) then {
        private _position = [
            _hideoutPosition, //center
            0, //minimal distance
            50, //maximumDistance
            5, //object distance
            0, //water mode
            0, //maximum terrain gradient
            0, //shore mode
            [], //blacklist positions
            [_hideoutPosition, _hideoutPosition] //default position
        ] call BIS_fnc_findSafePos;
        private _sentry = [_position, Rivals, (selectRandom (A3A_faction_riv get "groupsSentry"))] call A3A_fnc_spawnGroup;
        {[_x] call A3A_fnc_NATOinit} forEach (units _sentry);
        [_sentry, _hideoutPosition, 100] call bis_fnc_taskPatrol;
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
    private _vehiclePosAndDir = [_hideoutPosition, _vehicleClass, 250, true] call SCRT_fnc_common_findSafePositionForVehicle; 
    private _patrolVehicleData = [(_vehiclePosAndDir select 0), 0, _vehicleClass, Rivals] call A3A_fnc_spawnVehicle;
    private _patrolVeh = _patrolVehicleData select 0;
    _patrolVeh setDir (_vehiclePosAndDir select 1);
    private _patrolVehCrew = _patrolVehicleData select 1;
    private _patrolVehGroup = _patrolVehicleData select 2;
    {[_x] call A3A_fnc_NATOinit} forEach _patrolVehCrew;
    [_patrolVeh, Rivals] call A3A_fnc_AIVEHinit;
    _groups pushBack _patrolVehGroup;
    _vehicles pushBack _patrolVeh;
    [_patrolVehGroup, _hideoutPosition, 250] call bis_fnc_taskPatrol;
    /* _nul = [_hideoutPosition, _lootContainer, _isDifficult] spawn {
        params ["_hideoutPosition", "_lootContainer", "_isDifficult"];
        sleep (random [120, 240, 360]);
        private _chance = if (_isDifficult) then {30} else {15};
        if ((random 100) > _chance && {!isNil "_lootContainer" && {alive _lootContainer && {!(_lootContainer inArea [getMarkerPos respawnTeamPlayer, 50, 50, 0, false])}}}) then {
            private _event = selectRandom [200, 300];
            switch _event do {
                case 200: {
                    [[_hideoutPosition], "SCRT_fnc_rivals_encounter_uavFlyby"] call A3A_fnc_scheduler;
                };
                case 300: {
                    [[_hideoutPosition], "SCRT_fnc_rivals_encounter_rovingMortar"] call A3A_fnc_scheduler;
                };
            };
        }; 
        terminate _thisScript;
    }; */
    sleep 5; 
    _lootContainer allowDamage true;
    private _vehicletransfer = if (_isDifficult) then { selectRandom ((_faction get "vehiclesCargoTrucks") + (A3A_faction_riv get "vehiclesRivalsAPCs") + (A3A_faction_riv get "vehiclesRivalsTanks"));
        } else {
            selectRandom ((_faction get "vehiclesCargoTrucks") + (A3A_faction_riv get "vehiclesRivalsLightArmed"));
        }; ///check if vehicle is cargo truck or vehicle to transfer, if cargo truck create or move loot crate to truck.
    private _escortvehicle = if (_isDifficult) then {
        selectRandom ((_faction get "vehiclesLightAPCs") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightArmed") + 
        (_faction get "vehiclesTrucks"));
    } else {
        selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesMilitiaLightArmed") + 
        (_faction get "vehiclesMilitiaCars") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesMilitiaTrucks"));
    }; //check if vehicle is truck, if yes create a group and move in
    private _convoylead = if (_isDifficult) then {
        selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesTrucks"));
    } else {
        selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesMilitiaLightArmed") + 
        (_faction get "vehiclesMilitiaCars") + (_faction get "vehiclesMilitiaTrucks") + (_faction get "vehiclesLightUnarmed"));
    };
    
    private _vehiclesX = [];
    private _markNames = [];
    private _soldiers = [];
    private _fnc_spawnConvoyVehicle = {
        params ["_vehType", "_markName"];//,""
        ServerDebug_1("Spawning vehicle type %1", _vehType);
        // Find location down route
        _pathState = [_route, [20, 0] select (count _pathState == 0), _pathState] call A3A_fnc_findPosOnRoute;
        while {true} do {
            // make sure there are no other vehicles within 10m
            if (count (ASLtoAGL (_pathState#0) nearEntities 10) == 0) exitWith {};
            _pathState = [_route, 10, _pathState] call A3A_fnc_findPosOnRoute;
        };
        private _veh = createVehicle [_vehType, ASLtoAGL (_pathState#0) vectorAdd [0,0,0.5]];               // Give it a little air
        private _vecUp = (_pathState#1) vectorCrossProduct [0,0,1] vectorCrossProduct (_pathState#1);       // correct pitch angle
        _veh setVectorDirAndUp [_pathState#1, _vecUp];
        _veh allowDamage false;
        private _group = [_sideX, _veh] call A3A_fnc_createVehicleCrew;
        { [_x, nil, nil] call A3A_fnc_NATOinit; _x allowDamage false; _x disableAI "MINEDETECTION" } forEach (units _group);
        _soldiers append (units _group);
        (driver _veh) stop true;
        deleteWaypoint [_group, 0];													// groups often start with a bogus waypoint
        [_veh, _sideX] call A3A_fnc_AIVEHinit;
        _vehiclesX pushBack _veh;
        _markNames pushBack _markName;
        _veh;
    };
        
    private _convoyVehicles = [];
    private _specOpsArray = if (_isDifficult) then {selectRandom (_faction get "groupSpecOpsRandom")} else {selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)};
    private _vehEscort = [_escortvehicle, "Escort vehicle"] call _fnc_spawnConvoyVehicle;
    if (_escortvehicle in FactionGet(all,"vehiclesArmor")) then { _vehEscort allowCrewInImmobile true };			// move this to AIVEHinit at some point?
    /* if (_escortvehicle in FactionGet(all,"vehiclesMilitiaTrucks") || _escortvehicle in FactionGet(all,"vehiclesMilitiaTrucks") || _escortvehicle in FactionGet(all,"vehiclesMilitiaTrucks") || _escortvehicle in FactionGet(all,"vehiclesMilitiaCars") || 
    _escortvehicle in FactionGet(all,"vehiclesLightUnarmed")) then { */
        private _groupEsc = [_positionX, _sideX, _specOpsArray] call A3A_fnc_spawnGroup;				// Unit limit?
        {[_x, nil, nil] call A3A_fnc_NATOinit;_x assignAsCargo _vehEscort ;_x moveInCargo _vehEscort ;} forEach units _groupEsc;
        {
            private _index = _vehEscort getCargoIndex _x;
            if (_index == -1) then {
                deleteVehicle _x;
            };
        } forEach units _groupEsc;
        _soldiers append (units _groupEsc);
    //};
    _convoyVehicles pushBack _vehEscort;
    // Objective vehicle
    sleep 2;
    private _objText = if (_isDifficult) then {localize "STR_marker_convoy_objective_space"} else {localize "STR_marker_convoy_objective"};
    private _vehObj = [_vehicletransfer, _objText] call _fnc_spawnConvoyVehicle;
    private _return = [_vehObj, _lootContainer] call A3A_Logistics_fnc_canLoad;
    if (_vehicletransfer in FactionGet(all,"vehiclesCargoTrucks")) then {
        if !(_return isEqualType 0) then {
            _lootContainer setPos [getPos _vehObj select 0, getPos _vehObj select 1, (getPos _vehObj select 2) + 5];
            _return remoteExec ["A3A_Logistics_fnc_load", 2];
        };  
    };
    _convoyVehicles pushBack _vehObj;
    sleep 1;
    private _vehLead = [_convoylead, "Convoy Lead"] call _fnc_spawnConvoyVehicle;
    if (_convoylead in FactionGet(all,"vehiclesArmor")) then { _vehLead allowCrewInImmobile true };			// move this to AIVEHinit at some point?
    //if (_convoylead in FactionGet(all,"vehiclesMilitiaTrucks") || _convoylead in FactionGet(all,"vehiclesMilitiaTrucks") || _convoylead in FactionGet(all,"vehiclesMilitiaTrucks") || _convoylead in FactionGet(all,"vehiclesMilitiaCars") || _convoylead in FactionGet(all,"vehiclesLightUnarmed")) then {
        private _groupEsc = [_positionX, _sideX, _specOpsArray] call A3A_fnc_spawnGroup;				// Unit limit?
        {[_x, nil, nil] call A3A_fnc_NATOinit;_x assignAsCargo _vehLead ;_x moveInCargo _vehLead ;} forEach units _groupEsc;
        _soldiers append (units _groupEsc);
        {
            private _index = _vehLead getCargoIndex _x;
            if (_index == -1) then {
                deleteVehicle _x;
            };
        } forEach units _groupEsc;
    //};
    _convoyVehicles pushBack _vehLead;
    _vehicles append _convoyVehicles;
    //_route = _route apply { _x select 0 };			// reduce to position array
    if (_route isEqualTo []) then { _route = [_posOrigin, _posDest] };
    //_route = _route select [_pathState#2, count _route];        // remove navpoints that we already passed while spawning
    // This array is used to share remaining convoy vehicles between threads
    reverse _convoyVehicles;
    reverse _markNames;
    {
        (driver _x) stop false;
        [_x, _route, _convoyVehicles, 30,true] spawn A3A_fnc_vehicleConvoyTravel;
	    [_x, _markNames#_forEachIndex, false] spawn A3A_fnc_inmuneConvoy;			// Disabled the stuck-vehicle hacks
        sleep 1;
    } forEach _convoyVehicles;
    waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || {(!isNil "_lootContainer" && (!alive  _lootContainer || _lootContainer inArea [getMarkerPos respawnTeamPlayer, 50, 50, 0, false]))} || {(!isNil "_vehObj" && (!alive _vehObj || _vehObj inArea [getMarkerPos respawnTeamPlayer, 50, 50, 0, false]))} //and all rivals are dead?
    };
};
switch(true) do {
    case (dateToNumber date > _dateLimitNum): {
        Info("Time is out, cancelling task.");
        [_taskId, "RIV_ATT", "CANCELED"] call A3A_fnc_taskSetState;
    };
    case (!isNil "_vehObj" && {(!alive _vehObj || {_vehObj inArea [getMarkerPos respawnTeamPlayer, 50, 50, 0, false]})}): {
        Info("Transfer vehicle destroyed or stolen, success.");
        [_taskId, "RIV_ATT", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [0, 1500] remoteExec ["A3A_fnc_resourcesFIA",2];
        { 
            [50,_x] call A3A_fnc_addScorePlayer;
            [800,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [25,theBoss] call A3A_fnc_addScorePlayer;
        [400,theBoss, true] call A3A_fnc_addMoneyPlayer;
        [_marker, "HIDEOUT"] remoteExecCall ["SCRT_fnc_rivals_destroyLocation",2];
    };
    case (!isNil "_lootContainer" && {(!alive _lootContainer || {_lootContainer inArea [getMarkerPos respawnTeamPlayer, 50, 50, 0, false]})}): {
        Info("Transfer vehicle destroyed or stolen, success.");
        [_taskId, "RIV_ATT", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [0, 1500] remoteExec ["A3A_fnc_resourcesFIA",2];
        { 
            [50,_x] call A3A_fnc_addScorePlayer;
            [800,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [25,theBoss] call A3A_fnc_addScorePlayer;
        [400,theBoss, true] call A3A_fnc_addMoneyPlayer;
        [_marker, "HIDEOUT"] remoteExecCall ["SCRT_fnc_rivals_destroyLocation",2];
    };
    default {
        Error("Unexpected behaviour, cancelling mission.");
        [_taskId, "RIV_ATT", "CANCELED"] call A3A_fnc_taskSetState;
    };
};
[_taskId, "RIV_ATT", 5] spawn A3A_fnc_taskDelete;
sleep 30;
{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
Info("Kill Cell Leader cleanup complete.");
