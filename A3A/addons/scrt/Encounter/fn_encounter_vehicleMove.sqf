#include "..\defines.inc"
#include "Constants.inc"
FIX_LINE_NUMBERS()

Info( "Vehicle Move Event Init.");

private _vehicles = [];
private _groups = [];

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _potentialOutposts = (outposts + milbases + airportsX + resourcesX + factories) select {
    sidesX getVariable [_x, sideUnknown] != teamPlayer && {(getMarkerPos _x) distance2D _player < distanceSPWN}
};

if (_potentialOutposts isEqualTo []) exitWith {
    Info("No outposts in proximity, aborting Vehicle Move Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _outpost = selectRandom _potentialOutposts;
private _side = sidesX getVariable [_outpost, sideUnknown];
private _faction = Faction(_side);
private _outpostPosition = getMarkerPos _outpost;

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

private _truckClass = selectRandomWeighted (
    (FactionGoDTiered(_faction, "vehiclesAmmoTrucks")) +
    (FactionGoDTiered(_faction, "vehiclesRepairTrucks")) +
    (FactionGoDTiered(_faction, "vehiclesFuelTrucks")) +
    (FactionGoDTiered(_faction, "vehiclesMedical"))
);

if (_truckClass == "") exitWith {
    Error("No trucks, problems with template, aborting Vehicle Move Event.");
    [VEH_MOVE] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _truckVehicleData = [_roadPosition, _dirveh, _truckClass, _side] call A3A_fnc_spawnVehicle;

private _truckVehicle = _truckVehicleData select 0;
_truckVehicle limitSpeed 50;
[_truckVehicle, _side] call A3A_fnc_AIVEHinit;

private _truckVehicleCrew = _truckVehicleData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _truckVehicleCrew;
private _truckGroup = _truckVehicleData select 2;

_groups pushBack _truckGroup;
_vehicles pushBack _truckVehicle;

private _wp = _truckGroup addWaypoint [_outpostPosition, 0];
_wp setWaypointSpeed "LIMITED";
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";

private _timeOut = time + 1800;
waitUntil { 
    sleep 5; 
    time > _timeOut || 
    {isNull _truckVehicle || 
    {(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (position _truckVehicle) < distanceSPWN} == -1
}}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Vehicle Move clean up complete.");