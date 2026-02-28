#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Mission: Ambush Officer
if (!isServer && hasInterface) exitWith{};

params ["_missionOrigin"];

Info("Ambush Officer mission init.");

//arrays for cleanup
private _vehicles = [];
private _groups = [];

private _missionOriginPos = getMarkerPos _missionOrigin;
private _difficult = random 10 < tierWar;
private _sideX = if (sidesX getVariable [_missionOrigin,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);

Info_3("Origin: %1, Hardmode: %2, Controlling Side: %3", _missionOrigin, _difficult, str _sideX);

private _limit = if (_difficult) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _departingLimit = if (_difficult) then {
	10 call SCRT_fnc_misc_getTimeLimit
} else {
	20 call SCRT_fnc_misc_getTimeLimit
};
_departingLimit params ["_departingDateLimitNum", "_departingDisplayTime"];

private _originName = [_missionOrigin] call A3A_fnc_localizar;

//choosing enemy destination site
private _potentialSites = (outposts + milbases + airportsX + resourcesX + factories + seaports) select {
    private _potentialPos = getMarkerPos _x;
    sidesX getVariable [_x,sideUnknown] == _sideX && 
    {[_x, _missionOrigin] call A3A_fnc_arePositionsConnected && 
    {_missionOriginPos distance _potentialPos < 2500 && 
    {_missionOriginPos distance _potentialPos > 1200}}}
};

private _destinationSite = nil;
if(count _potentialSites > 0) then {
    _destinationSite = selectRandom _potentialSites;
};

if (isNil "_destinationSite") exitWith {
    ["AS"] remoteExec ["A3A_fnc_missionRequest",2];
    Error("Problems with finding proper delivery site, rerequesting new AS mission.");
};

private _destinationName = [_destinationSite] call A3A_fnc_localizar;
private _destinationPosition = getMarkerPos _destinationSite;

private _markerColor = if(_sideX == Occupants) then {"colorBLUFOR"} else {"colorOPFOR"};
private _markerPosition = [_destinationPosition select 0, (_destinationPosition select 1) + 50, _destinationPosition select 2];

private _officerDestinationMarker = createMarker ["OfficerDestinationMarker", _markerPosition];
_officerDestinationMarker setMarkerType "hd_objective";
_officerDestinationMarker setMarkerSize [1, 1];
_officerDestinationMarker setMarkerText (localize "STR_officer_dest_pos");
_officerDestinationMarker setMarkerColor _markerColor;
_officerDestinationMarker setMarkerAlpha 1;

Info_2("Origin: %1, Destination: %2", str _missionOrigin, str _destinationSite);

// selecting classnames
private _officerClass = _faction get "unitOfficial";
private _escortVehicleClass = if(_difficult) then {selectRandom (_faction get "vehiclesAPCs")} else {selectRandom (_faction get "vehiclesTrucks")};
private _officerVehicleClass = if(_difficult) then { selectRandom (_faction get "vehiclesLightArmed") } else { selectRandom (_faction get "vehiclesLightUnarmed") };
private _infantrySquadArray = selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier);

if (isNil "_officerClass" || {isNil "_officerVehicleClass" || {isNil "_escortVehicleClass" || {isNil "_infantrySquadArray"}}}) exitWith {
    Error("Classname problems, rerequesting new AS mission.");
    ["AS"] remoteExec ["A3A_fnc_missionRequest",2];
};

Info_4("Officer: %1, officer vehicle: %2, escort vehicle: %3, infantry squad: %4", _officerClass, _officerVehicleClass, _escortVehicleClass, str _infantrySquadArray);

////////////////
//convoy spawn//
////////////////

//finding road
private _radiusX = 100;
private _roads = [];
while {true} do {
	_roads = _missionOriginPos nearRoads _radiusX;
	if (count _roads > 1) exitWith {};
	_radiusX = _radiusX + 50;
};
private _roadE = _roads select 1;
private _roadR = _roads select 0;
sleep 1;

//creating Task
private _rebelTaskText = format [
    localize "STR_A3A_Missions_AS_Ambush_task_desc", 
    _originName, 
    _destinationName,
    _departingDisplayTime,
    _displayTime,
    _faction get "name"
];
private _taskId = "AS" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [_rebelTaskText, format [localize "STR_A3A_Missions_AS_Ambush_task_header", _faction get "name"], _missionOrigin],
    (position _roadR),
    false,
    0,
    true,
    "car",
    true
] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


//spawning escort
private _escortVehicleData = [position _roadE, 0, _escortVehicleClass, _sideX] call A3A_fnc_spawnVehicle;
private _escortVeh = _escortVehicleData select 0;
_escortVeh limitSpeed 45;
[_escortVeh, "Officer Convoy"] spawn A3A_fnc_inmuneConvoy;
private _escortVehCrew = crew _escortVeh;
{[_x] call A3A_fnc_NATOinit} forEach _escortVehCrew;
[_escortVeh, _sideX] call A3A_fnc_AIVEHinit;
private _escortVehicleGroup = _escortVehicleData select 2;
_groups pushBack _escortVehicleGroup;
_vehicles pushBack _escortVeh;

//spawning escort inf
private _groupX = [position _roadE, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{
    _x assignAsCargo _escortVeh; 
    // _x moveInCargo _escortVeh; 
    [_x] join _escortVehicleGroup; 
    [_x] call A3A_fnc_NATOinit;
} forEach units _groupX;
deleteGroup _groupX;

//officer and his vehicle
private _officerVehicleData = [position _roadR, 0, _officerVehicleClass, _sideX] call A3A_fnc_spawnVehicle;
private _officerVeh = _officerVehicleData select 0;
_officerVeh limitSpeed 45;
[_officerVeh, "Officer Convoy"] spawn A3A_fnc_inmuneConvoy;
private _officerVehCrew = crew _officerVeh;
{[_x] call A3A_fnc_NATOinit} forEach _officerVehCrew;
[_officerVeh, _sideX] call A3A_fnc_AIVEHinit;
private _officerVehicleGroup = _officerVehicleData select 2;
_groups pushBack _officerVehicleGroup;
_vehicles pushBack _officerVeh;

private _groupOfficer = createGroup _sideX;
private _officer =  [_groupOfficer, _officerClass, position _roadR, [], 0, "NONE"] call A3A_fnc_createUnit;
_officer allowDamage false;

[_officer] join _officerVehicleGroup; 
[_officer] call A3A_fnc_NATOinit;
_officerVehicleGroup selectLeader _officer;
deleteGroup _groupOfficer;

sleep 2;
_officer allowDamage true;
_officer assignAsCargo _officerVeh; 
_officer moveInCargo _officerVeh; 

Info("Waiting before starting convoy movement...");

waitUntil {sleep 1;dateToNumber date > _dateLimitNum || {dateToNumber date > _departingDateLimitNum || {!alive _officer}}};

Info("Setting things in motion...");

if (alive _officer) then {
    private _officerWP = _officerVehicleGroup addWaypoint [_destinationPosition, 5];
    _officerWP setWaypointType "MOVE";
    _officerWP setWaypointBehaviour "SAFE";
    Info_1("Officer Vehicle Waypoint: %1", str _destinationPosition);
};

sleep 5;

if ((units _escortVehicleGroup) findIf {alive _x} != -1) then {
    private _escortWP = _escortVehicleGroup addWaypoint [_destinationPosition, 5];
    _escortWP setWaypointType "MOVE";
    _escortWP setWaypointBehaviour "SAFE";
    Info_1("Escort Vehicle Waypoint: %1", str _destinationPosition);
};

waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || _officer inArea _destinationSite || !(alive _officer)
};

switch(true) do {
    case (_officer inArea _destinationSite || {dateToNumber date > _dateLimitNum}): {
        Info("Officer has reached destination or time is out, fail.");

        [_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;

        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        [-10,theBoss] call A3A_fnc_addScorePlayer;
    };
    case (!alive _officer): {
        Info("Officer died, success.");
        [_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [0, 600] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        { 
            [20,_x] call A3A_fnc_addScorePlayer;
            [400,_x] call A3A_fnc_addMoneyPlayer;
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [10,theBoss] call A3A_fnc_addScorePlayer;
        [400,theBoss, true] call A3A_fnc_addMoneyPlayer;
    };
    default {
        Error("Unexpected behaviour, cancelling mission.");
        [_taskId, "AS", "CANCELED"] call A3A_fnc_taskSetState;
    };
};


sleep 30;

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;

deleteMarker _officerDestinationMarker;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

Info("Officer Ambush clean up complete.");