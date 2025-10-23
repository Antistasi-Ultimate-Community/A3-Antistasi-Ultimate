#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Vehicle Patrol Event Init.");

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

private _frontLine = (outposts + milbases + airportsX + resourcesX + factories + citiesX) select {([_x] call A3A_fnc_isFrontlineNoFIA && {sidesX getVariable [_x,sideUnknown] != teamPlayer})};

if !(_frontLine isEqualTo []) exitWith {
    Error("Position is near frontline, need to select appropriate event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _vehicles = [];
private _groups = [];
private _potentialOutposts = (outposts + milbases + airportsX + resourcesX + factories) select {
    sidesX getVariable [_x, sideUnknown] != teamPlayer && {(getMarkerPos _x) distance2D _player < distanceSPWN}
};

if (_potentialOutposts isEqualTo []) exitWith {
    Info("No outposts in proximity, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _spawnPosition = [_originPosition, 600, distanceSPWN, 0, 0, 1] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

while {true} do {
    _road = _spawnPosition nearRoads _radiusX;
    if (count _road > 0) exitWith {};
    _radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto (_road select 0);
private _dirveh = if (count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _outpost = selectRandom _potentialOutposts;
private _side = sidesX getVariable [_outpost, sideUnknown];
private _faction = Faction(_side);

private _isFia = if (random 10 > (tierWar + difficultyCoef)) then {true} else {false};
private _vehicleClass = if (_isFia) then {
    selectRandomWeighted (
        (FactionGetMilitia(_faction, "vehiclesLightArmed")) +
        (FactionGetMilitia(_faction, "vehiclesAPCs")) +
        (FactionGetMilitia(_faction, "vehiclesHelisLight"))
    );
} else {
    selectRandomWeighted (
        (FactionGoDTiered(_faction, "vehiclesAPCs")) +
        (FactionGoDTiered(_faction, "vehiclesIFVs")) +
        (FactionGoDTiered(_faction, "vehiclesLightTanks")) +
        (FactionGoDTiered(_faction, "vehiclesAirPatrol")) +
        (FactionGoDTiered(_faction, "vehiclesHelisLightAttack"))
    );
};

if (_vehicleClass == "") exitWith {
    Info("No vehicle class, aborting Vehicle Patrol Event.");
    [VEH_PATROL] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _patrolVehicle1Data = [_roadPosition, _dirveh, _vehicleClass, _side] call A3A_fnc_spawnVehicle;
private _patrolVehicle1 = _patrolVehicle1Data select 0;
_patrolVehicle1 limitSpeed 50;
[_patrolVehicle1, _side] call A3A_fnc_AIVEHinit;

private _patrolVehicle1Crew = _patrolVehicle1Data select 1;
{[_x] call A3A_fnc_NATOinit} forEach _patrolVehicle1Crew;
private _patrolGroup1 = _patrolVehicle1Data select 2;

_groups pushBack _patrolGroup1;
_vehicles pushBack _patrolVehicle1;

private _typeCargoGroup = [_vehicleClass, _side] call A3A_fnc_cargoSeats;
private _cargoGroup = [_roadPosition, _side, _typeCargoGroup, true,false] call A3A_fnc_spawnGroup;

{
    _x assignAsCargo _patrolVehicle1;
	_x moveInCargo _patrolVehicle1;
} forEach (units _cargoGroup);
(units _cargoGroup) join _patrolGroup1;

private _relativePositions = [];
{
    private _relativePosition = [_roadPosition, random [300,400,600], _x] call BIS_fnc_relPos;
    _relativePositions pushBack _relativePosition;
} forEach [0, 90, 180];

{
    private _rndPosition = [_x, 0, 100, 0, 0, 0.75] call BIS_fnc_findSafePos;
    private _road = objNull;
    private _radiusX = 5;
    while {true} do {
        _road = _rndPosition nearRoads _radiusX;
        if (count _road > 0) exitWith {};
        _radiusX = _radiusX + 5;
    };
    private _roadPosition = getPos (_road select 0);
    private _wp = _patrolGroup1 addWaypoint [_roadPosition, _forEachIndex];
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "AWARE";
} forEach _relativePositions;

private _wp1 = _patrolGroup1 addWaypoint [_roadPosition, 0];
_wp1 setWaypointType "CYCLE";

#if __A3_DEBUG__
_mrkFinal = createMarkerLocal [format ["Arty%1", random 100], (position _patrolVehicle1)];
_mrkFinal setMarkerShapeLocal "ICON";
_mrkFinal setMarkerTypeLocal "hd_destroy";
_mrkFinal setMarkerColorLocal "ColorRed";
_mrkFinal setMarkerAlphaLocal 1;
#endif

private _timeOut = time + 1800;
waitUntil { 
    sleep 5; 
    time > _timeOut || 
    {isNull _patrolVehicle1 || 
    {(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (position _patrolVehicle1) < distanceSPWN} == -1
}}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Vehicle Patrol clean up complete.");