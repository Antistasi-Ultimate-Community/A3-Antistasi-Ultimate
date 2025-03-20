#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Mission: Catch airdrop
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

Info ("Airdrop mission init.");

private _vehicles = [];
private _groups = [];
private _boxes = [];

private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

//////////////////////
//Task
/////////////////////
private _limit = if (_difficultX) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _nameDest = [_markerX] call A3A_fnc_localizar;

private _taskId = "LOG" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_A3A_Missions_DES_Airdrop_task_desc", _nameDest, _displayTime],
        localize "STR_A3A_Missions_LOG_Airdrop_task_header",
        _markerX
    ],
    _positionX,
    false,
    0,
    true,
    "plane",
    true
] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1; (call SCRT_fnc_misc_getRebelPlayers) findIf {_x inArea [_positionX, 75, 75, 0, false]} != -1 or {dateToNumber date > _dateLimitNum}};

[petros,"sideChat",localize "STR_chats_airdrop_pilot_drop_cargo_zone"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];   

Info("Setting things in motion...");

private _escortClass = if(_difficultX) then { 
    selectRandomWeighted ((_faction get "vehiclesAPCs") + (_faction get "vehiclesLightAPCs"))
} else {
    selectRandomWeighted ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightUnarmed"))
};

if (isNil "_escortClass") exitWith {
	["LOG"] remoteExec ["A3A_fnc_missionRequest",2];
    Error("Problems with faction templates, rerequesting new logistics mission.");
};

private _squad1Position = [
    _positionX,
    600,
    distanceSPWN,
    3,
    0,
    0.7,
    0,
    [],
    [_positionX, _positionX]
] call BIS_fnc_findSafePos;

//spawning airdrop interceptors
private _escortVehicleData = [_squad1Position, 0, _escortClass, _sideX] call A3A_fnc_spawnVehicle;
private _escortVeh = _escortVehicleData select 0;

private _infantrySquadArray  = [_escortClass, _sideX] call A3A_fnc_cargoSeats;

Info_2("Vehicle: %1, infantry array: %2", _escortClass, str _infantrySquadArray);

private _vehCrew = crew _escortVeh;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_escortVeh, _sideX] call A3A_fnc_AIVEHinit;
private _escortVehicleGroup = _escortVehicleData select 2;
_groups pushBack _escortVehicleGroup;
_vehicles pushBack _escortVeh;

//spawning airdrop interceptor inf
private _typeGroup = selectRandom ([_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier);
private _groupX = [_squad1Position, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _escortVeh; 
    _x moveInCargo _escortVeh; 
    [_x] join _escortVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _groupX;
deleteGroup _groupX;

_infGroup1 = [_squad1Position, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{
    [_x] call A3A_fnc_NATOinit;
} forEach units _infGroup1;
_groups pushBack _infGroup1;

if(_difficultX) then {
    private _squad2Position = [
        _positionX,
        600,
        distanceSPWN,
        3,
        0,
        0.7,
        0,
        [],
        [_positionX, _positionX]
    ] call BIS_fnc_findSafePos;

    _infGroup2 = [_squad2Position, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
    {
        [_x] call A3A_fnc_NATOinit;
    } forEach units _infGroup2;
    _groups pushBack _infGroup2;

    _infGroup2Wp = _infGroup2 addWaypoint [_positionX, 1];
    _infGroup2Wp setWaypointType "MOVE";
    _infGroup2Wp setWaypointBehaviour "AWARE";
    _infGroup2Wp setWaypointSpeed "FULL";
    Info_1("Additional Group: %1", _infGroup2);
};

//moving to airdrop location
private _escortWP = _escortVehicleGroup addWaypoint [_positionX, 0];
_escortWP setWaypointType "MOVE";
_escortWP setWaypointBehaviour "AWARE";
_escortWP setWaypointSpeed "FULL";
Info_2("Placed Group: %1 in Lite Vehicle and set waypoint %2", _typeGroup, _positionX);

_infGroup1Wp = _infGroup1 addWaypoint [_positionX, 1];
_infGroup1Wp setWaypointType "MOVE";
_infGroup1Wp setWaypointBehaviour "AWARE";
_infGroup1Wp setWaypointSpeed "FULL";
Info_1("Group: %1", _infGroup1);

waitUntil {
    sleep 1;
    private _smokes = _positionX nearObjects ["SmokeShell", 200];
    count _smokes > 0 || {dateToNumber date > _dateLimitNum}
};

Info("Players are inside, looking for smoke grenades.");

private _smokes = _positionX nearObjects ["SmokeShell", 200];
private _planeVeh = objNull;

if(count _smokes > 0) then {
    Info("Smoke detected, spawning airplane.");

    private _initialPlanePosition = [
        _positionX,
        1500,
        2000,
        0,
        0,
        1,
        0,
        [],
        [_positionX, _positionX]
    ] call BIS_fnc_findSafePos;
    private _height = random [500, 1000, 1300];
    private _direction = [_initialPlanePosition, _positionX] call BIS_fnc_DirTo;

    _planeType = selectRandomWeighted (FactionGet(reb, "vehiclesPlane"));
    _planeData = [[_initialPlanePosition select 0, _initialPlanePosition select 1, _height], _direction, _planeType, teamPlayer] call A3A_fnc_spawnVehicle;
    _planeVeh = _planeData select 0;
    _planeVeh setPosATL [getPosATL _planeVeh select 0, getPosATL _planeVeh select 1, _height];
    _planeVeh disableAI "TARGET";
    _planeVeh disableAI "AUTOTARGET";
    _planeVeh flyInHeight 105;

    private _minAltASL = ATLToASL [_positionX select 0, _positionX select 1, 0];
    _planeVeh flyInHeightASL [(_minAltASL select 2) +100, (_minAltASL select 2) +100, (_minAltASL select 2) +100];

    _planeGroup = _planeData select 2;
    _groups pushBack _planeGroup;

    driver _planeVeh setCaptive true;

    private _smokes = _positionX nearObjects ["SmokeShell", 200];
    private _dropPosition = _positionX;

    if(count _smokes > 0) then {
        private _smoke = _smokes select 0;
        _dropPosition = position _smoke;
    };

    _wp1 = group _planeVeh addWaypoint [_dropPosition, 0];
    _wp1 setWaypointType "MOVE";
    _wp1 setWaypointSpeed "LIMITED";
    _wp1 setWaypointBehaviour "CARELESS";

    sleep 2;
    private _textX = format [localize "STR_chats_airdrop_pilot_smoke", mapGridPosition _positionX];
    [driver _planeVeh,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];   
};

waitUntil {
    sleep 1;
    (!(isNull _planeVeh) && {_planeVeh inArea [_positionX, 100, 100, 0, false]}) || (dateToNumber date > _dateLimitNum) || !(alive _planeVeh)
};

private _airDropHappened = false;

if(alive _planeVeh) then {
    Info("Airdropping cargo.");
    [driver _planeVeh,"sideChat",localize "STR_chats_airdrop_pilot_drop_cargo"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

    private _boxType = [
        "CargoNet_01_barrels_F",
        "Land_FoodSacks_01_cargo_brown_F"
    ] select (random 100 < 50);

    _planeVeh allowDamage false;
    sleep 1;
    private _box1 = [_boxType,position _planeVeh] call SCRT_fnc_common_airdropCargo;
    _box1 enableRopeAttach true;
    _box1 allowDamage false;
    [_box1] call A3A_Logistics_fnc_addLoadAction;
    [_box1, teamPlayer] call A3A_fnc_AIVEHinit;
    
    //at least one dropped box counts as successful airdrop
    _airDropHappened = true;

    sleep 1;

    private _box2Class = [ 
        (["CargoNet_01_barrels_F", "Land_FoodSacks_01_cargo_brown_F"] select (random 100 < 50)),
        _faction get "ammobox"
    ] select _difficultX;

    private _box2 = [_box2Class,position _planeVeh] call SCRT_fnc_common_airdropCargo;
    _box2 enableRopeAttach true;
    _box2 allowDamage false;
    [_box2] call A3A_Logistics_fnc_addLoadAction;
    [_box2, teamPlayer] call A3A_fnc_AIVEHinit;

    if (_box2Class isEqualTo (_faction get "ammobox")) then {
        [_box2] spawn A3A_fnc_fillLootCrate;
    };

    _boxes append [_box1, _box2];

    if(sunOrMoon < 1) then {
        [_box1, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _box1];
        [_box2, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _box2];
    };

    sleep 5;
    [driver _planeVeh,"sideChat",localize "STR_chats_airdrop_pilot_drop_cargo_end"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
    private _finalPosition = [_positionX, 3000, random 360] call BIS_fnc_relPos;
    _wp2 = group _planeVeh addWaypoint [_finalPosition, 1];
    _wp2 setWaypointSpeed "FULL";
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointStatements ["true","deleteVehicle this"];

    driver _planeVeh setCaptive false;
    _planeVeh allowDamage true;
};

waitUntil {sleep 1;  dateToNumber date > _dateLimitNum || {!(_airDropHappened) || {_boxes findIf {_x distance (getMarkerPos respawnTeamPlayer) < 25} != -1}}};

private _boxesOnRebelHq = false;
{
    if(_x distance (getMarkerPos respawnTeamPlayer) < 25) exitWith {
        _boxesOnRebelHq = true;
    };
} forEach _boxes;


switch(true) do {
    case (_boxesOnRebelHq): {
        Info("Success, Boxes on HQ.");
        //make sure that all boxes will be counted, so let's wait a little
        sleep 5;

        private _boxesCount = { _x distance (getMarkerPos respawnTeamPlayer) < 25 } count _boxes;

        {
            if ((typeOf _x) isEqualTo (_faction get "ammobox")) then {
                [_x] remoteExec ["jn_fnc_arsenal_cargoToArsenal",2];
            };
        } forEach _boxes;

        { 
            [300 * _boxesCount,_x] call A3A_fnc_addMoneyPlayer;
            [10 * _boxesCount, _x] call A3A_fnc_addScorePlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [10, theBoss] call A3A_fnc_addScorePlayer;
        [250, theBoss, true] call A3A_fnc_addMoneyPlayer;

        [_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
    };
    case (dateToNumber date > _dateLimitNum): {
        Info("Fail, mission Expired.");
        [2, "Fail, mission Expired.", _fileName, true] call A3A_fnc_log;
        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
        [-25,theBoss] call A3A_fnc_addScorePlayer;
    }; 
    //if plane crashed before, then mission failed, but it's not our fault
    case (!(_airDropHappened)): {
        Info("Fail, plane was shot down.");
        [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
    };
    default {
        Warning("Unknown condition, aborting mission");
        [_taskId, "LOG", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

sleep 30;

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;

{
    deleteVehicle _x;
} forEach _boxes;

{
    [_x] spawn A3A_fnc_vehDespawner
} forEach _vehicles;

{
    [_x] spawn A3A_fnc_groupDespawner
} forEach _groups;

if(!isNil "_planeVeh" || {!isNull _planeVeh}) then {
    deleteVehicle _planeVeh;
};

Info("Airdrop cleanup complete.");
