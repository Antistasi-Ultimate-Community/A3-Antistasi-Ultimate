#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Post Ambush Vehicle Event Init.");

private _vehicles = [];
private _groups = [];
private _others = [];
private _difficult = random 10 < tierWar;

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

private _originPosition = position _player;

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _controlsX = ([controlsX, _player, true] call A3A_fnc_findIfNearAndHostile) select {
    private _markerPos = getMarkerPos _x;
    private _distance = _markerPos vectorDistance _originPosition;
    private _isOnRoad = isOnRoad _markerPos;
    !_isOnRoad && (_distance > 600) && (_distance <= 1300);
};

if (_controlsX isEqualTo []) exitWith {
    Error("No controls markers found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _outpost = selectRandom _controlsX;

private _side = sidesX getVariable [_outpost, sideUnknown];
private _faction = Faction(_side);
private _outpostPosition = getMarkerPos _outpost;

if (_outpostPosition isEqualTo []) exitWith {
    Info("No spawn positions in proximity, aborting Heli slingload cargo Event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

_AirDropPosition = [_outpostPosition, 100, 300, 10, 0, 10, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos; ///pos player , distance distance spwn

_AirDropPositionActuall = [_AirDropPosition, 40, 100, 10, 0, 5, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;

private _specOpsArray = if (_difficult) then {selectRandom (_faction get "groupSpecOpsRandom")} else {selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)}; 
_InfGroup = [_AirDropPositionActuall, _side, _specOpsArray] call A3A_fnc_spawnGroup;
{[_x] call A3A_fnc_NATOinit} forEach units _InfGroup;
_InfGroup setBehaviourStrong "SAFE";
private _wp = _InfGroup addWaypoint [_AirDropPosition, 50];
_wp setWaypointType "SAD";
/* if (_difficult) then {
	_UAVtype = selectRandom (_faction get "uavsPortable");
	_uav = createVehicle [_UAVtype, _AirDropPositionActuall, [], 0, "FLY"];
	[_side, _uav] call A3A_fnc_createVehicleCrew;
	_vehicles pushBack _uav;
	_groupUAV = group (crew _uav select 1);
	{[_x] joinSilent _InfGroup} forEach units _groupUAV;
}; */
_groups pushBack _InfGroup;
[_InfGroup, "Patrol_Attack", 0, 50, 100, true, _AirDropPosition, true] call A3A_fnc_patrolLoop;

private _timeOut = time + 1200;

waitUntil { 
    sleep 2; 
    time > _timeOut || 
    {
        (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _AirDropPosition < 1400} == -1
    } || 
    {
        (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _AirDropPosition > 800} == -1
    }
};

private _smokeGrenade = "SmokeShellRed" createVehicle _AirDropPosition;

private _smokes = _AirDropPosition nearObjects ["SmokeShell", 200];
private _planeVeh = objNull;

if(count _smokes > 0) then {
    Info("Smoke detected, spawning airplane.");

    private _initialPlanePosition = [
        _AirDropPosition,
        2000,
        3000,
        0,
        0,
        1,
        0,
        [],
        [_AirDropPosition, _AirDropPosition]
    ] call BIS_fnc_findSafePos;
    private _height = random [200, 300, 400];
    private _direction = [_initialPlanePosition, _AirDropPosition] call BIS_fnc_DirTo;

    _planeType = selectRandomWeighted (FactionGetTiered(_faction, "vehiclesPlanesTransport"));
    _planeData = [[_initialPlanePosition select 0, _initialPlanePosition select 1, _height], _direction, _planeType, _side] call A3A_fnc_spawnVehicle;
    _planeVeh = _planeData select 0;
    _planeVeh setPosATL [getPosATL _planeVeh select 0, getPosATL _planeVeh select 1, _height];
    _planeVeh disableAI "TARGET";
    _planeVeh disableAI "AUTOTARGET";
    _planeVeh flyInHeight 80;

    private _minAltASL = ATLToASL [_AirDropPosition select 0, _AirDropPosition select 1, 0];
    _planeVeh flyInHeightASL [(_minAltASL select 2) +100, (_minAltASL select 2) +100, (_minAltASL select 2) +100];

    _planeGroup = _planeData select 2;
    _groups pushBack _planeGroup;

    driver _planeVeh setCaptive true;

    private _smokes = _AirDropPosition nearObjects ["SmokeShell", 200];
    private _dropPosition = _AirDropPosition;

    if(count _smokes > 0) then {
        private _smoke = _smokes select 0;
        _dropPosition = position _smoke;
    };

    _wp1 = group _planeVeh addWaypoint [_dropPosition, 0];
    _wp1 setWaypointType "MOVE";
    //_wp1 setWaypointSpeed "LIMITED";
    _wp1 setWaypointBehaviour "CARELESS";
};

waitUntil {
    sleep 1;
    (!(isNull _planeVeh) && {_planeVeh inArea [_AirDropPosition, 900, 900, 0, false]}) || time > _timeOut || !(alive _planeVeh) || (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _AirDropPosition < 1400} == -1
};

_planeVeh limitSpeed 200;
_planeVeh flyInHeight 60;

waitUntil {
    sleep 1;
    (!(isNull _planeVeh) && {_planeVeh inArea [_AirDropPosition, 100, 100, 0, false]}) || time > _timeOut || !(alive _planeVeh) || (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _AirDropPosition < 1400} == -1
};


if(alive _planeVeh) then {
    
    private _boxType = selectRandom [
        "CargoNet_01_barrels_F",
        "Land_FoodSacks_01_cargo_brown_F", (selectRandomWeighted (_faction get "vehiclesLightArmed"))
    ]; //change the boxes

    _planeVeh allowDamage false;
    sleep 1;
    private _box1 = [_boxType,position _planeVeh] call SCRT_fnc_common_airdropCargo;
    _box1 enableRopeAttach true;
    _box1 allowDamage false;
    [_box1] call A3A_Logistics_fnc_addLoadAction;
    [_box1, _side] call A3A_fnc_AIVEHinit;

	driver _planeVeh setCaptive false;
    _planeVeh allowDamage true;

    sleep 1;

    private _box2Class = [ 
        (["CargoNet_01_barrels_F", "Land_FoodSacks_01_cargo_brown_F"] select (random 100 < 50)),
        _faction get "ammobox"
    ] select _difficult;

    private _box2 = [_box2Class,position _planeVeh] call SCRT_fnc_common_airdropCargo;
    _box2 enableRopeAttach true;
    _box2 allowDamage false;
    [_box2] call A3A_Logistics_fnc_addLoadAction;
    [_box2, _side] call A3A_fnc_AIVEHinit;

    if (_box2Class isEqualTo (_faction get "ammobox")) then {
        [_box2] spawn A3A_fnc_fillLootCrate;
    };

    _vehicles append [_box1, _box2];

    if(sunOrMoon < 1) then {
        [_box1, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _box1];
        [_box2, [0, 0, 1]] remoteExec ["SCRT_fnc_common_attachLightSource", 0, _box2];
    };

    sleep 5;
    private _finalPosition = [_AirDropPosition, 3000, random 360] call BIS_fnc_relPos;
    _wp2 = group _planeVeh addWaypoint [_finalPosition, 200];
    _wp2 setWaypointSpeed "FULL";
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointStatements ["true","deleteVehicle _planeVeh"];
};

_planeVeh limitSpeed 1000;
_planeVeh flyInHeight 200;

waitUntil { 
    sleep 5; 
    time > _timeOut ||
    {
		(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _AirDropPosition < 1400} == -1
	}
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Post Ambush Vehicle Event clean up complete.");