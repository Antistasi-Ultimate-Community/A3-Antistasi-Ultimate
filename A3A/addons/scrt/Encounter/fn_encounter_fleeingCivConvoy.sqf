#include "..\defines.inc"
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

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_lowCiv || _civNonHuman) exitWith {
    Error("Non civilian or low civilian faction, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";    
};

private _originPosition = position _player;

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _city = if (_originPosition isEqualType "") then {_originPosition} else {[citiesX, _originPosition] call BIS_fnc_nearestPosition};

if (_city isEqualTo []) exitWith {
    Info("No cities in proximity, aborting civ convoy Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _anotherCity = selectRandom (citiesX select {_x != _city});

private _spawnPosition = [_originPosition, 600, distanceSPWN, 0, 0, 1] call BIS_fnc_findSafePos;
private _side = civilian;
private _faction = Faction(_side);
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

private _convoy = [];

private _civVehicles = selectRandomWeighted ((_faction get "vehiclesCivCar") + (_faction get "vehiclesCivIndustrial") + (_faction get "vehiclesCivFuel"));

if (_civVehicles == "") exitWith {
    Error("No civ vehicles available, aborting Vehicle Move Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _posOrigin = navGrid select ([_city] call A3A_fnc_getMarkerNavPoint) select 0;
private _posDest = navGrid select ([_anothercity] call A3A_fnc_getMarkerNavPoint) select 0;
private _route = [_posOrigin, _posDest] call A3A_fnc_findPath;
private _pathState = [];

_route = _route apply { _x select 0 };			// reduce to position array
if (_route isEqualTo []) then { _route = [_posOrigin, _posDest] };

private _fnc_spawnConvoyVehicle = {
    params ["_vehType", "_markName"];
    ServerDebug_1("Spawning vehicle type %1", _vehType);

    // Find location down route
    _pathState = [_route, [10, 0] select (count _pathState == 0), _pathState] call A3A_fnc_findPosOnRoute;
    while {true} do {
        // make sure there are no other vehicles within 10m
        if (count (ASLtoAGL (_pathState#0) nearEntities 10) == 0) exitWith {};
        _pathState = [_route, 10, _pathState] call A3A_fnc_findPosOnRoute;
    };

    private _veh = createVehicle [_vehType, ASLtoAGL (_pathState#0) vectorAdd [0,0,0.5]];               // Give it a little air
    private _vecUp = (_pathState#1) vectorCrossProduct [0,0,1] vectorCrossProduct (_pathState#1);       // correct pitch angle
    _veh setVectorDirAndUp [_pathState#1, _vecUp];
    _veh allowDamage false;

    private _group = [_side, _veh] call A3A_fnc_createVehicleCrew;
    {_x allowDamage false; _x disableAI "MINEDETECTION" } forEach (units _group);
    (driver _veh) stop true;
    deleteWaypoint [_group, 0];

    _veh;
};

private _convoyobj = [];
private _cargoSpace = objNull;
private _cargospaceResized = objNull;
private _cargo = objNull;

private _fnc_fillcargo = {
	params ["_vehObj","_civVehicles"];
	private _vehdriver = driver _vehObj;
	private _vehObjgroup = group _vehdriver;
    if (civTraffic isEqualTo 2) then {
	    _cargoSpace = [_civVehicles, true] call BIS_fnc_crewCount;
        _cargoSpace = _cargoSpace - 1;
	    _vehObj setVehicleLock "LOCKED";
	     while {_cargoSpace != 1} do { ///driver already exists
            
        };
        for _i from 1 to _cargoSpace do {
            _cargo = [_vehObjgroup, FactionGet(civ,"unitMan"), getPos _vehObj, [], 10] call A3A_fnc_createUnit;
            _cargo moveInAny _vehObj; 
            _cargo disableAI "MOVE";
		    _cargoSpace = _cargoSpace - 1; //round random [1,3,5]; 
		    if (_cargoSpace < 1) then{
			    _cargospace = 1;
		    }; 
            group _cargo deleteGroupWhenEmpty true;
        };
	};
};

for '_i' from round random 3 to 5 do
{
    private _civVehicles = selectRandomWeighted ((_faction get "vehiclesCivCar") + (_faction get "vehiclesCivIndustrial") + (_faction get "vehiclesCivFuel"));
	private _vehObj = [_civVehicles, "civillian"] call _fnc_spawnConvoyVehicle;
	//[_vehObj,_civVehicles] call _fnc_fillcargo;
	_convoyobj pushBack _vehObj;
	_convoy pushBack _civVehicles;
};

_route = _route select [_pathState#2, count _route]; 	// remove navpoints that we already passed while spawning

reverse _convoyobj; //otherwise convoy lead is in the back
private _text = (localize "STR_marker_civ_convoy");
{
    [_x, _route, _convoyobj, 60, false] spawn A3A_fnc_vehicleConvoyTravel;
	//[_x, localize "STR_marker_civ_convoy", false] spawn A3A_fnc_inmuneConvoy;			// Disabled the stuck-vehicle hacks
    sleep 2;
} forEach _convoyobj;

[_convoyobj select 0, localize "STR_marker_civ_convoy", true] spawn A3A_fnc_inmuneConvoy;			// Disabled the stuck-vehicle hacks

private _civGroups = [];

{
	[_x, _side] call A3A_fnc_civVEHinit;
	_groups = group driver _x;
	private _wp = _groups addWaypoint [_posDest, 10];
	_wp setWaypointSpeed "NORMAL";
	//_wp setWaypointType "GETOUT";
	_wp setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"]; /////NEEDS TO BE TESTED
	_wp setWaypointBehaviour "SAFE";
	_civGroups pushBack _groups;
	_vehicles pushBack _x;
} forEach _convoyobj;

private _timeOut = time + 1200;
waitUntil {sleep 5; time > _timeOut};

//{_x setVehicleLock "UNLOCKED"} forEach _convoyobj;


{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _civGroups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Vehicle Move clean up complete.");