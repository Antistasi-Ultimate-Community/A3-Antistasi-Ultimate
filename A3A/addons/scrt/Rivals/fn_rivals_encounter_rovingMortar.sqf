#include "..\defines.inc"
FIX_LINE_NUMBERS()

#include "Constants.inc"


params [
    ["_overridePosition", []],
    ["_isInstant", false]
];

Info("Roving  Mortar random event init.");

private _vehicles = [];
private _groups = [];

private _originPosition = nil;
private _earlyEscape = false;
private _logMessage = nil;
private _logSeverity = -1;

if (_overridePosition isEqualTo []) then {
    _originPosition = [] call SCRT_fnc_rivals_findSuitableEncounterPosition;
} else {
    _originPosition = _overridePosition;
};

if (_originPosition isEqualTo []) exitWith {
    Info("No suitable position for event, cooldowning...");
    isRivalEventInProgress = false;
    publicVariableServer "isRivalEventInProgress";
    rivalEventCooldown = 300;
    publicVariableServer "rivalEventCooldown";
};

if (_overridePosition isNotEqualTo []) then {
    private _players = [1000, _originPosition] call SCRT_fnc_common_getNearPlayers;
    private _player = selectRandom _players; 

    _originPosition = position (selectRandom _players);
};

private _supportName = format ["%1rovingmortar%2", random 10000, random 10000];

private _precision = 0;
private _revealCall = 0;

switch (inactivityLevelRivals) do {
	case 5: {
		_precision = 0.5;
		_revealCall = 0.8;
	};
	case 4: {
		_precision = 1;
		_revealCall = 0.6;
	};
	case 3: {
		_precision = 2;
		_revealCall = 0.4;
	};
	case 2: {
		_precision = 3;
		_revealCall = 0.2;
	};
	case 1: {
		_precision = 3.5;
		_revealCall = 0.1;
	};
};

server setVariable [format ["%1_targets", _supportName], [[[_originPosition, _precision], _revealCall]], true];

Info_1("%1 will be used as center of the event.", str _originPosition);

private _spawnPosition = [_originPosition, 1200, 2000, 8, 0, 1] call BIS_fnc_findSafePos;
private _sites = (outposts + airportsX + resourcesX + factories + seaports + milbases) select {sidesX getVariable [_x, sideUnknown] != Rivals};

//if too close to some outposts - reroll if possible
if (count _sites > 0 && {_sites findIf {private _markerPos = getMarkerPos _x; _markerPos distance2D _spawnPosition < 800 } != -1 }) then {
    private _iterations = 0;
    private _radius = 1200;
    while {_iterations < 50} do {
        _spawnPosition = [_originPosition, 1200, _radius, 8, 0, 1] call BIS_fnc_findSafePos;

        private _isClose = _sites findIf { private _markerPos = getMarkerPos _x; _markerPos distance2D _spawnPosition < 1200 } != -1;

        if(!_isClose) exitWith {};
        _radius = _radius + 50;
        _iterations = _iterations + 1;
    };
};

private _mortar = [selectRandom (A3A_faction_riv get "staticMortars"), _spawnPosition, 5, 5, true] call A3A_fnc_safeVehicleSpawn;
[_mortar, Rivals] call A3A_fnc_AIVEHinit;
_vehicles pushBack _mortar;

Info_1("Roving mortar has been created at %1 position.", str _spawnPosition);

private _mortarGroup = [Rivals, _mortar, A3A_faction_riv get "unitRifle"] call A3A_fnc_RivalsCreateVehicleCrew;
_groups pushBack _mortarGroup;

_mortar setVariable ["shellType", A3A_faction_riv get "mortarMagazineHE", true];
[_mortar] call A3A_fnc_addArtilleryTrailEH;

private _patrolPosition = [
    _spawnPosition,
    0,
    50,
    2,
    0,
    1,
    0,
    [],
    [_spawnPosition, _spawnPosition]
] call BIS_fnc_findSafePos;

private _carPos =  [_spawnPosition, (random [4,6,8]), (random 360)] call BIS_fnc_relPos;
private _car = (selectRandom (A3A_faction_riv get "vehiclesRivalsCars")) createVehicle _spawnPosition;
private _dirCar = [_mortar, _car] call BIS_fnc_dirTo;
_car setDir _dirCar + (random 90);
[_car, Rivals] call A3A_fnc_AIVEHinit;
_car engineOn true;

_vehicles pushBack _car;

private _patrolGroup = [_patrolPosition, Rivals, (selectRandom (A3A_faction_riv get "groupsSentry"))] call A3A_fnc_RivalsSpawnGroup;
{
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup;
[_patrolGroup, _spawnPosition, 150] call bis_fnc_taskPatrol;
_groups pushBack _patrolGroup;

//Setting up the EH for support destruction
_mortar addEventHandler
[
    "Killed",
    {
        params ["_mortar"];
        ["TaskSucceeded", ["", format [localize "STR_notifiers_roving_mortar_crew_destroyed", A3A_faction_riv get "name"]]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        [10, 60] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
    }
];

_mortar addEventHandler
[
    "GetIn",
    {
        params ["_vehicle", "_role", "_unit", "_turret"];
        if(side (group _unit) == teamPlayer) then
        {
			["TaskSucceeded", ["", format [localize "STR_notifiers_roving_mortar_stolen", A3A_faction_riv get "name"]]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
            [10, 60] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
            _vehicle setVariable ["Stolen", true, true];
            _vehicle removeAllEventHandlers "GetIn";
        };
    }
];

_mortarGroup setVariable ["Mortar", _mortar, true];
{
    _x addEventHandler
    [
        "Killed",
        {
            params ["_unit"];
            private _group = group _unit;
            if({alive _x} count (units _group) == 0) then
            {
                ["TaskSucceeded", ["", format [localize "STR_notifiers_roving_mortar_crew_killed", A3A_faction_riv get "name"]]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
                [10, 60] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
            };
        }
    ];
} forEach (units _mortarGroup);

private _setupTime = if (_isInstant) then {10} else {60 - (((5 - inactivityLevelRivals) + 1) * 5)};
private _minSleepTime = (1 - ((5 - inactivityLevelRivals) + 1) * 0.1) * _setupTime;
private _sleepTime = _minSleepTime + random (_setupTime - _minSleepTime);

_mortarGroup deleteGroupWhenEmpty true;
[_mortar, _mortarGroup, _supportName, _sleepTime] spawn SCRT_fnc_rivals_mortarRoutine;

private _timeOut = time + 1800;
waitUntil { sleep 5; (time > _timeOut) || (_mortar getVariable ['isFireMissionEnded', false]) || !alive _mortar};

{
	[_x] spawn A3A_fnc_vehDespawner;
} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

//usually overriden position means that encounter used as support or task event (yeah,it's dirty)
if (isNil "_overridePosition") then {
    isRivalEventInProgress = false;
    publicVariableServer "isRivalEventInProgress";

    rivalEventCooldown = [] call SCRT_fnc_rivals_getEventCooldown;
    publicVariableServer "rivalEventCooldown";
};

Info("Roving mortar event cleanup successfully finished.");