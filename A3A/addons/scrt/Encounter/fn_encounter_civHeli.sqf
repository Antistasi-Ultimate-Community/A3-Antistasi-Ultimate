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

private _civHeli = (A3A_faction_civ getOrDefault ["vehiclesCivHeli", []]);
if (_civHeli isEqualTo []) exitWith {
    Error("No civ heli found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _finPosition = [_originPosition, 2500, (random 360)] call BIS_fnc_relPos;

private _spawnPosition = [_originPosition, 1400, 1600, 0, 0, 1] call BIS_fnc_findSafePos;
private _civHeliData = [[(_spawnPosition select 0), (_spawnPosition select 1), 100 + random 200], 0, selectRandom (A3A_faction_civ get "vehiclesCivHeli"), civilian] call A3A_fnc_spawnVehicle;
private _heliVeh = _civHeliData select 0;
[_heliVeh, civilian] call A3A_fnc_AIVEHinit;
private _heliCrew = _civHeliData select 1;

if (random 100 < 30) then {
    private _civ = [(_civHeliData select 2), A3A_faction_civ get "unitPress", [0,0,0], [],0, "NONE"] call A3A_fnc_createUnit;
    _civ assignAsCargo _heliVeh;
    _civ moveInCargo _heliVeh;
};

{[_x] spawn A3A_fnc_civilianInitEH} forEach _heliCrew;
private _heliGroup = _civHeliData select 2;

_groups pushBack _heliGroup;
_vehicles pushBack _heliVeh;

_heliVeh flyInHeight (100 + (random 150));

private _relativePositions = [];

{
    private _relativePosition = [_originPosition, 300, _x] call BIS_fnc_relPos;
    _relativePositions pushBack _relativePosition;
} forEach [0, 180];

{
    private _wp = _heliGroup addWaypoint [_x, _forEachIndex];
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointType "MOVE";
    _wp setWaypointBehaviour "SAFE";
} forEach _relativePositions;

private _wp3 = _heliGroup addWaypoint [_finPosition, 3];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";

private _timeOut = time + 600;
waitUntil { sleep 5; (currentWaypoint _heliGroup == 3) || (time > _timeOut) || !(canMove _heliVeh) || !alive (driver _heliVeh)};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";


Info("Heli Event clean up complete.");