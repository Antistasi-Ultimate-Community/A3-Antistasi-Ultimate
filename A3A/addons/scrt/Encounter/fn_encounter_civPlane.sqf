#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Civilian Aircraft random event init.");

private _vehicles = [];
private _groups = [];

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_lowCiv || _civNonHuman) exitWith {
    Error("Non civilian or low civilian faction, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";    
};

private _civPlane = (A3A_faction_civ getOrDefault ["vehiclesCivPlanes", []]);
if (_civPlane isEqualTo []) exitWith {
    Error("No civ plane found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _finPosition = [_originPosition, 3500, (random 360)] call BIS_fnc_relPos;

private _spawnPosition = [_originPosition, 2400, 2600, 0, 0, 1] call BIS_fnc_findSafePos;
private _civPlaneData = [[(_spawnPosition select 0), (_spawnPosition select 1), 100 + random 200], 0, selectRandom (A3A_faction_civ get "vehiclesCivPlanes"), civilian] call A3A_fnc_spawnVehicle;
private _planeVeh = _civPlaneData select 0;
[_planeVeh, civilian] call A3A_fnc_AIVEHinit;
private _planeCrew = _civPlaneData select 1;

{[_x] spawn A3A_fnc_civilianInitEH} forEach _planeCrew;
private _planeGroup = _civPlaneData select 2;

_groups pushBack _planeGroup;
_vehicles pushBack _planeVeh;

private _height = 550 + (random 150);
_planeVeh flyInHeight _height;
_planeVeh setPosATL (_spawnPosition vectorAdd [0, 0, _height]);
_planeVeh setDir ([_planeVeh, _originPosition] call BIS_fnc_dirTo);
_planeVeh setVelocityModelSpace [0, 100, 0];

private _relativePositions = [];

{
    private _relativePosition = [_originPosition, 300, _x] call BIS_fnc_relPos;
    _relativePositions pushBack _relativePosition;
} forEach [0, 180];

{
    private _wp = _planeGroup addWaypoint [_x, _forEachIndex];
    _wp setWaypointSpeed "NORMAL";
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "SAFE";
} forEach _relativePositions;

private _wp3 = _planeGroup addWaypoint [_finPosition, 3];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";

private _timeOut = time + 600;
waitUntil { sleep 5; (currentWaypoint _planeGroup == 3) || (time > _timeOut) || !(canMove _planeVeh) || !alive (driver _planeVeh)};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";


Info("Plane Event clean up complete.");