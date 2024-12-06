#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Mission: Rescue the smugglers
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

Info("Shipwreck mission init.");
private _effects = [];
private _POWs = [];
private _vehicles = [];
private _groups = [];
private _props = [];

private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

//////////////////////
//Mission position
/////////////////////
private _shorePosition = [
    _positionX, //center
    0, //minimal distance
    1500, //maximumDistance
    0, //object distance
    0, //water mode
    1, //maximum terrain gradient
    1, //shore mode
    [], //blacklist positions
    [[0,0,0], [0,0,0]] //default position
] call BIS_fnc_findSafePos;

if (_shorePosition isEqualTo [0,0,0]) exitWith {
    Error("Problems with shore position, rerequesting new rescue mission.");
    ["RES"] remoteExec ["A3A_fnc_missionRequest",2];
};

private _shoreMarker = createMarkerLocal ["ShoreMarker", _shorePosition];
_shoreMarker setMarkerSizeLocal [200, 200];
_shoreMarker setMarkerColorLocal "ColorUNKNOWN";
_shoreMarker setMarkerShapeLocal "RECTANGLE";
_shoreMarker setMarkerAlphaLocal 0;

private _shipPosition = [
    _shorePosition,
    100,
    500,
    0,
    2,
    1,
    0,
    [],
    [[0,0,0], [0,0,0]]
] call BIS_fnc_findSafePos;
private _ship = "C_Boat_Civil_04_F" createVehicle _shipPosition;
private _outOfBounds = _shipPosition findIf { (_x < 0) || {_x > worldSize}} != -1;

if (!(surfaceIsWater _shipPosition) || {_outOfBounds}) then {
    private _iterations = 0;
    private _radiusX = 250;
    while {_iterations < 50} do {
        _shipPosition = [
            _shorePosition,
            100,
            _radiusX,
            0,
            2,
            1,
            0,
            [],
            [[0,0,0], [0,0,0]]
        ] call BIS_fnc_findSafePos;

        _ship setPos _shipPosition;
        _outOfBounds = (position _ship) findIf { (_x < 0) || {_x > worldSize}} != -1;

        if(surfaceIsWater _shipPosition && !(_outOfBounds)) exitWith {};
        _radiusX = _radiusX + 100;
        _iterations = _iterations + 1;
    };
};

if (_shipPosition isEqualTo [0,0,0]) exitWith {
    Error("Problems with ship position, rerequesting new rescue mission.")
    deleteVehicle _ship;
    ["RES"] remoteExec ["A3A_fnc_missionRequest",2];
};


//////////////////////
//Objects and AI spawn
/////////////////////
_ship setDir (([_ship, _shorePosition] call BIS_fnc_dirTo) + random 90);

private _fire = createVehicle ["test_EmptyObjectForFireBig", position _ship, [], 0 , "CAN_COLLIDE"];
_fire attachTo [_ship, [0, 5, 3]];
_effects pushBack _fire;

//////////////////////
//Task
/////////////////////
private _limit = if (_difficultX) then {
	60 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _taskId = "RES" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_A3A_Missions_RES_Shipwreck_task_desc", _nameDest, _displayTime],
        localize "STR_A3A_Missions_RES_Shipwreck_task_header",
        _markerX
    ],
    _shorePosition,
    false,
    0,
    true,
    "boat",
    true
] call BIS_fnc_taskCreate;
[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1;dateToNumber date > _dateLimitNum or {(call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_shorePosition, distanceSPWN1, distanceSPWN1] isNotEqualTo []}};

private _grpPOW = createGroup teamPlayer;
private _smugglerCount = random [3, 5, 6];

for "_i" from 0 to _smugglerCount do {
    private _unit = [_grpPOW, FactionGet(reb,"unitUnarmed"), _shorePosition, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_unit, createHashMapFromArray [["face", selectRandom (A3A_faction_reb get "faces")], ["speaker", selectRandom (A3A_faction_reb get "voices")]]] call A3A_fnc_setIdentity;
	_unit allowDamage false;
	_unit setCaptive true;
	_unit disableAI "MOVE";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	_unit setUnitPos "UP";
	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	//_unit disableAI "ANIM";
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	sleep 1;
	_POWS pushBack _unit;
	[_unit,"prisonerX"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
	[_unit] call A3A_fnc_reDress;
};

{
    _x allowDamage true;
} forEach _POWS;

private _boatClass = selectRandom (_faction get "vehiclesGunBoats");
private _officerClass = _faction get "unitOfficial";
private _truckClass = selectRandom (_faction get "vehiclesTrucks");

private _infantrySquadArray = [
    selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier),
    selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
] select _difficultX;

if (isNil "_infantrySquadArray" || {isNil "_boatClass"} || {isNil "_officerClass"} || {isNil "_truckClass"}) exitWith {
    Error("Problems with unit templates, rerequesting new rescue mission.");
	["RES"] remoteExec ["A3A_fnc_missionRequest",2];
};

private _searchBoatPosition = [
    _shipPosition, //center
    5, //minimal distance
    400, //maximumDistance
    5, //object distance
    2, //water mode
    1, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_shipPosition, _shipPosition] //default position
] call BIS_fnc_findSafePos;

private _boatData = [_searchBoatPosition, 0, _boatClass, _sideX] call A3A_fnc_spawnVehicle;
_boatVeh = _boatData select 0;
[_boatVeh, _sideX] call A3A_fnc_AIVEHinit;
_boatCrew = _boatData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _boatCrew;
_boatGroup = _boatData select 2;

[_boatGroup, _shipPosition, 250] call bis_fnc_taskPatrol;

_groups pushBack _boatGroup;
_vehicles pushBack _boatVeh;

private _patrolGroup1 = [_shorePosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup1;

[_patrolGroup1, _shorePosition, 100] call bis_fnc_taskPatrol;

private _patrolGroup2 = [_shorePosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup2;

[_patrolGroup2, _shorePosition, 200] call bis_fnc_taskPatrol;

_groups append [_patrolGroup1, _patrolGroup2];

private _officerPosition = [
    _shorePosition, //center
    0, //minimal distance
    20, //maximumDistance
    2, //object distance
    0, //water mode
    1, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_shorePosition, _shorePosition] //default position
] call BIS_fnc_findSafePos;

private _officerGroup = createGroup _sideX;
private _officer = [_officerGroup, _officerClass, _shorePosition, [], 0, "NONE"] call A3A_fnc_createUnit;
[_officer] call A3A_fnc_NATOinit;
_officer setDir ([_officer, selectRandom _POWS] call BIS_fnc_dirTo);

_groups pushBack _officerGroup;


private _truckPosition = [
    _shorePosition, //center
    0, //minimal distance
    50, //maximumDistance
    4, //object distance
    0, //water mode
    1, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_shorePosition, _shorePosition] //default position
] call BIS_fnc_findSafePos;

private _truckData = [_truckPosition, 0, _truckClass, _sideX] call A3A_fnc_spawnVehicle;
_truckVeh = _truckData select 0;
(driver _truckVeh) action ["lightOff", _truckVeh];  
sleep 0.5;
[_truckVeh, _sideX] call A3A_fnc_AIVEHinit;
_truckCrew = _truckData select 1;
{deleteVehicle _x} forEach _truckCrew;
_truckGroup = _truckData select 2;
deleteGroup _truckGroup;

_truckVeh setDir ([_truckVeh, selectRandom _POWS] call BIS_fnc_dirTo);

_vehicles pushBack _truckVeh;

//////////////////////
//Props
/////////////////////
private _propPosition = [
    _shorePosition, //center
    0, //minimal distance
    30, //maximumDistance
    2, //object distance
    0, //water mode
    1, //maximum terrain gradient
    0, //shore mode
    [], //blacklist positions
    [_shorePosition, _shorePosition] //default position
] call BIS_fnc_findSafePos;

private _boatProp = createVehicle ["Land_Boat_01_abandoned_red_F", _propPosition, [], 0, "NONE"];
_boatProp setDir (180 + ([_ship, _boatProp] call BIS_fnc_dirTo));

_propPosition = [
    _shorePosition,
    0,
    30, 
    2,
    0,
    1,
    0,
    [],
    [_shorePosition, _shorePosition]
] call BIS_fnc_findSafePos;

private _boxProp = createVehicle ["Land_PlasticCase_01_large_F", _propPosition, [], 0, "NONE"];
private _gearProp = createVehicle ["Land_FishingGear_01_F", _propPosition, [], 0, "NONE"];

{
    _x setVectorUp surfaceNormal position _x;
    _props pushBack _x;
} forEach [_boatProp, _gearProp, _boxProp];

waitUntil {
    sleep 5;
    private _players = call SCRT_fnc_misc_getRebelPlayers;
    (_players findIf {_x inArea _shoreMarker} != -1) || {dateToNumber date > _dateLimitNum}
};

Error("Rebels in area, setting things in motion...");

if(random 100 < 50) then {
    Info("Sinking ship.");
    [_ship, _fire] spawn {
        params ["_burningShip", "_fireEffect"];
        private _time = time + 15;
        waitUntil {sleep 1; time > _time};
        private _shell = "R_230mm_HE" createVehicle position _burningShip;
        _shell setVelocity [0,1,-1];

        sleep 3;
        [_burningShip, "LEFT", 90] spawn SCRT_fnc_common_sinkShip;

        sleep 30;
        deleteVehicle _fireEffect;
    };
};

waitUntil {
    sleep 1; 
    ({alive _x} count _POWs == 0) or 
    ({(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0) or 
    (dateToNumber date > _dateLimitNum)
};

if (dateToNumber date > _dateLimitNum) then {
	if ((call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_shorePosition, distanceSPWN1, distanceSPWN1] isEqualTo []) then {
		{
            if (group _x == _grpPOW) then {
                _x setDamage 1;
            };
		} forEach _POWS;
	}
	else {
		{
            if (group _x == _grpPOW) then {
                [_x,false] remoteExec ["setCaptive",0,_x];
                _x setCaptive false;
                _x enableAI "MOVE";
                _x doMove _positionX;
            };
		} forEach _POWS;
	};
};

waitUntil {
    sleep 1; 
    ({alive _x} count _POWs == 0) or 
    ({(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0)
};

_bonus = if (_difficultX) then {2} else {1};

if ({alive _x} count _POWs == 0) then {
	[_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
	{
        [_x,false] remoteExec ["setCaptive",0,_x]; 
        _x setCaptive false;
    } forEach _POWs;
    [-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
} else {
	sleep 5;
    [_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;

    private _rebels = call SCRT_fnc_misc_getRebelPlayers;

	_countX = {(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 150)} count _POWs;
	_resourcesFIA = 100 * _countX * _bonus;
	[_countX, _resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
	[0, 10 *_bonus, _positionX] remoteExec ["A3A_fnc_citySupportChange",2];

    private _aggroValue = -(_countX * 1.5);
    [_sideX, _aggroValue, 90] remoteExec ["A3A_fnc_addAggression",2];

	{ 
        [_countX*10,_x] call A3A_fnc_addMoneyPlayer;
        [_countX, _x] call A3A_fnc_addScorePlayer;
    } forEach _rebels;

    private _bonusAmount = round (_countX*_bonus/2);
	[_bonusAmount,theBoss] call A3A_fnc_addScorePlayer;
    [(_bonusAmount*10),theBoss, true] call A3A_fnc_addMoneyPlayer;

	{
        [_x] join _grpPOW; 
        [_x] orderGetin false
    } forEach _POWs;

    private _ammoBox = (_faction get "ammobox") createVehicle (getMarkerPos "Synd_HQ");
    _ammoBox hideObjectGlobal true;
    [_ammoBox] spawn A3A_fnc_fillLootCrate;
    sleep 15;
    clearMagazineCargoGlobal _ammoBox;
    clearWeaponCargoGlobal _ammoBox;
    _ammoBox hideObjectGlobal false;

    [localize "STR_A3A_Missions_RES_Shipwreck_task_header", localize "STR_A3A_Missions_RES_Shipwreck_tip_1"] remoteExecCall ["A3A_fnc_customHint", teamPlayer];
};

//////////////
// CLEANUP
//////////////
sleep 60;

_items = [];
_ammunition = [];
_weaponsX = [];
{
_unit = _x;
    if (_unit distance getMarkerPos respawnTeamPlayer < 150) then {
	{if (!(([_x] call BIS_fnc_baseWeapon) in unlockedWeapons)) then {_weaponsX pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _unit;
	{if (!(_x in unlockedMagazines)) then {_ammunition pushBack _x}} forEach magazines _unit;
	    _items = _items + (items _unit) + (primaryWeaponItems _unit) + (assignedItems _unit) + (secondaryWeaponItems _unit);
	};
    deleteVehicle _unit;
} forEach _POWs;
deleteGroup _grpPOW;

{
    boxX addWeaponCargoGlobal [_x,1]
} forEach _weaponsX;
{
    boxX addMagazineCargoGlobal [_x,1]
} forEach _ammunition;
{
    boxX addItemCargoGlobal [_x,1]
} forEach _items;

[_taskId, "RES", 1200] spawn A3A_fnc_taskDelete;

{
    deleteVehicle _x;
} forEach _effects + _props;

deleteMarker _shoreMarker;
deleteMarker "ShoreMarker";

{
    [_x] spawn A3A_fnc_vehDespawner
} forEach _vehicles;

{
    [_x] spawn A3A_fnc_groupDespawner
} forEach _groups;


Info("Shipwreck clean up complete.");