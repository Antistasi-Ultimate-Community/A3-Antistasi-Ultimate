#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Police Hostage Event Init");

private _vehicles = [];
private _groups = [];

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _cities = citiesX select {sidesX getVariable [_x, sideUnknown] != teamPlayer && {spawner getVariable _x != 2}};

if (_cities isEqualTo []) exitWith {
    Info("No neutral cities available, aborting event.");
    [POLICE_HOSTAGE] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _city = selectRandom _cities;
private _cityPos = getMarkerPos _city;

private _road = objNull;
private _radius = 0;
while {isNull _road && _radius < 300} do {
    _road = selectRandom (_cityPos nearRoads _radius);
    _radius = _radius + 50;
};

if (isNull _road) exitWith {
    Error("No road found for event");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

// After finding the road _road
private _roadcon = roadsConnectedTo _road;
private _roadDir = if (count _roadcon > 0) then {
    [_road, _roadcon select 0] call BIS_fnc_dirTo
} else {
    random 360
};
private _roadPos = getPos _road;

// Position for the vehicle (left side of the road center)
private _vehiclePos = _roadPos getPos [4, _roadDir - 90]; // 4m left from center
private _vehicleDir = _roadDir;

// Spawn police vehicle
private _policeVeh = selectRandomWeighted (FactionGetTiered(A3A_faction_occ, "vehiclesPolice"));
private _vehData = [_vehiclePos, _vehicleDir, _policeVeh, Occupants] call A3A_fnc_spawnVehicle;
private _policeVehicle = _vehData#0;
[_policeVehicle, Occupants] call A3A_fnc_AIVEHinit;
[_policeVehicle, ["BeaconsStart", 1]] remoteExecCall ["animate", 0, _policeVehicle];

// Positions for hostages (right side of the road)
private _hostageArea = _roadPos getPos [5, _roadDir + 90]; // 5m right from road
private _hostageDir = _roadDir + 180; // Facing opposite direction

// Create hostages in a line
private _hostageGroup = createGroup [civilian, true];
private _hostageCount = 2 + floor random 3;

for "_i" from 0 to (_hostageCount - 1) do {
    private _pos = _hostageArea getPos [1.5 * _i, _hostageDir]; 
    private _hostage = [_hostageGroup, FactionGet(civ, "unitMan"), _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
	_hostage disableAI "PATH";
    _hostage setCaptive true;
    _hostage switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    _hostage setDir _hostageDir;
};

// Police officer in front of the vehicle
private _policeGroup = createGroup [Occupants, true];
private _frontPos = _policeVehicle getPos [3.5, _vehicleDir]; // 3m in front of vehicle
private _staticCop = [_policeGroup, FactionGet(occ, "unitPoliceGrunt"), _frontPos, [], 0, "NONE"] call A3A_fnc_createUnit;
_staticCop setDir (_vehicleDir - 180);
doStop _staticCop;

// Patrolling police officer
private _patrolCop = [_policeGroup, FactionGet(occ, "unitPoliceGrunt"), _policeVehicle getPos [-3, _vehicleDir - 90], [], 0, "NONE"] call A3A_fnc_createUnit;

// For the patrolling police officer
[_patrolCop, _hostageArea] spawn {
    params ["_cop", "_center"];
    while {alive _cop} do {
        private _angle = random 360;
        private _movePos = _center getPos [2 + random 0.5, _angle];
        _cop doMove _movePos;
        waitUntil {unitReady _cop || !alive _cop};
    };
};

_groups pushBack _hostageGroup;

private _timeOut = time + 1800;

waitUntil {
    sleep 10;
    time > _timeOut || 
    {(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _roadPos < 1400} == -1}
};

{ [_x] spawn A3A_fnc_vehDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_groupDespawner } forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";
Info("Hostage Event cleanup complete");