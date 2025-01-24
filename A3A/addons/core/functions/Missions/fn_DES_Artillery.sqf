#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Destroy Artillery
if (!isServer and hasInterface) exitWith{};

Info("Artillery mission init.");

private _missionOriginPos = getMarkerPos _markerX;

private _difficult = if (random 10 < tierWar) then {true} else {false};
private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);

private _limit = if (_difficult) then {
	60 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _groups = [];
private _vehicles = [];
private _props = [];

// selecting classnames
private _artilleryClass = nil;
private _artilleryShellClass = nil;
private _mgClass = nil;
private _mgCrewClass = nil;

private _mortarsPool = _faction getOrDefault ["staticMortars", []];
private _artilleryPool = _faction getOrDefault ["vehiclesArtillery", []];
private _howitzersPool = _faction getOrDefault ["staticHowitzers", []];

private _mortarMagazine = _faction get "mortarMagazineHE";
private _artilleryMagazine = _faction get "magazines";
private _howitzerMagazine = _faction get "howitzerMagazineHE";

private _infantrySquadArray = [
    selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier),
    selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
] select _difficult;

switch (true) do 
{ 
	case (tierWar < 6): 
	{
		private _potentialArtillery = (_howitzersPool + _mortarsPool);
		_artilleryClass = selectRandom (_potentialArtillery select {_x isNotEqualTo []});
		_artilleryShellClass = if (_artilleryClass in _howitzersPool) then 
        {
            _howitzerMagazine
        } else {
            _mortarMagazine
        };
	};
	default
	{
		private _potentialArtillery = (_howitzersPool + _artilleryPool);
		_artilleryClass = selectRandom (_potentialArtillery select {_x isNotEqualTo []});
		_artilleryShellClass = if (_artilleryClass in _howitzersPool) then 
        {
            _howitzerMagazine
        } else {
            selectRandom (_artilleryMagazine get _artilleryClass);
        };
	};
};

_mgClass = selectRandom (_faction get "staticMGs");
_mgCrewClass = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;

if (isNil "_artilleryClass" || {isNil "_artilleryShellClass" || {isNil "_mgClass" || {isNil "_mgCrewClass"}}}) exitWith {
	["DES"] remoteExec ["A3A_fnc_missionRequest",2];
    Error_4("Problems with faction template classes(%1, %2, %3, %4), rerequesting new destroy mission.", _artilleryClass, _artilleryShellClass, _mgClass, _mgCrewClass);
};

Info_5("Artillery: %1, Artillery Shell: %2, Static: %3, Squad: %4, MG Crew: %5", _artilleryClass, _artilleryShellClass, _mgClass, str _infantrySquadArray, _mgCrewClass);

//////////////////////
//Artillery and it's target
/////////////////////
{  
	[_x, true] remoteExec ["hideObject", 0];
} forEach nearestTerrainObjects [_missionOriginPos, [], 10, false, true];

private _artilleryData = [_missionOriginPos, 0, _artilleryClass, _sideX] call A3A_fnc_spawnVehicle;
private _artilleryVeh = _artilleryData select 0;
_artilleryVeh setDir (random 360);
_artilleryVeh allowDamage false;
[_artilleryVeh, _sideX, true] call A3A_fnc_AIVEHinit;
private _artilleryCrew = _artilleryData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _artilleryCrew;
private _artilleryGroup = _artilleryData select 2;

_groups pushBack _artilleryGroup;
_vehicles pushBack _artilleryVeh;

//selecting any close site to player
private _potentialSites = (outposts + milbases + airportsX + resourcesX + factories + seaports) select {
    private _potentialPos = getMarkerPos _x;
    sidesX getVariable [_x,sideUnknown] == teamPlayer && {_missionOriginPos distance _potentialPos < 2500}
};
_potentialSites pushBack "Synd_HQ"; //sorry, Petros

private _targetSite = selectRandom _potentialSites;
private _targetPosition = getMarkerPos _targetSite;

Info_1("Target Outpost: %1", _targetSite);

//finding suitable position for artillery
private _artilleryPosition = [_missionOriginPos, 0, 800, 3, 0, 0.6] call BIS_fnc_findSafePos;
_artilleryVeh setPos _artilleryPosition;

if(!(_targetPosition inRangeOfArtillery [[_artilleryVeh], _artilleryShellClass]) && {isOnRoad _artilleryVeh}) then {
    private _radiusX = 600;
    while {true} do {
        _artilleryPosition = [_missionOriginPos, 0, _radiusX, 3, 0, 0.6] call BIS_fnc_findSafePos;
        _artilleryVeh setPos _artilleryPosition;
        if(_targetPosition inRangeOfArtillery [[_artilleryVeh], _artilleryShellClass] && {!(isOnRoad _artilleryVeh)}) exitWith {};
        _radiusX = _radiusX + 100;
    };
};

Info("Artillery Position: %1", str _artilleryPosition);

//////////////////////
//Task
/////////////////////
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _taskId = "DES" + str A3A_taskCount;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [localize "STR_A3A_Missions_DES_Artillery_task_desc", _nameDest, _displayTime],
        localize "STR_A3A_Missions_DES_Artillery_task_header",
        _markerX
    ],
    _artilleryPosition,
    false,
    0,
    true,
    "destroy",
    true
] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_artilleryVeh allowDamage true;

waitUntil {sleep 1; dateToNumber date > _dateLimitNum or {!alive _artilleryVeh or {(spawner getVariable _markerX != 2 and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))}}};

private _firedEh = nil;

if (alive _artilleryVeh) then {
    //////////////////////
    //Artillery vehicle preparations
    /////////////////////
    {
        private _relativePosition = [_artilleryPosition, 7, _x] call BIS_Fnc_relPos;
        private _barrier = createVehicle [_faction get "sandbagRound", _relativePosition, [], 0, "CAN_COLLIDE"];
        _barrier setDir ([_barrier, _artilleryPosition] call BIS_fnc_dirTo);
        _barrier setVectorUp surfaceNormal position _barrier;
        _props pushBack _barrier;
    } forEach [0, 90, 180, 270];

    (_artilleryVeh call BIS_fnc_getPitchBank) params ["_vx","_vy"];
    if (([_vx,_vy] findIf {_x > 80 || _x < -80}) != -1) then {	
        _artilleryVeh allowDamage false;
        [_artilleryVeh] spawn {
            params ["_unflippableVehicle"];
            _unflippableVehicle allowDamage false;
            _unflippableVehicle setVectorUp [0,0,1];
            _unflippableVehicle setPosATL [(getPosATL _unflippableVehicle) select 0, (getPosATL _unflippableVehicle) select 1, 0];
            sleep 1;
            _unflippableVehicle allowDamage true;
        };
    };

    {  
        [_x, true] remoteExec ["hideObject", 0, _artilleryVeh];
    } forEach nearestTerrainObjects [_artilleryPosition, [], 50, false, true];

    //////////////////////
    //Artillery fake fire
    /////////////////////
    _firedEh = _artilleryVeh addEventHandler ["Fired", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
        deleteVehicle _projectile;

        if (!local _unit) then {
            private _clientId = owner _unit;
            [_unit, 1] remoteExec ["setVehicleAmmo", _clientId];
        } else {
            _unit setVehicleAmmo 1;
        };
    }];

    [_artilleryVeh, _targetPosition, _artilleryShellClass] spawn {
        params ["_veh", "_targetPos", "_shell"];
        while {alive _veh} do {
            _veh doArtilleryFire [_targetPos, _shell, round (random [1,2,3])];
            sleep 60;
        };
        Info("Exited artillery firing loop...");
    };
};

if ((spawner getVariable _markerX != 2) and {!(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)}) then {
    //////////////
    //Infantry and MG
    /////////////
    private _mgPosition = [_artilleryPosition, 0, 200, 2, 0, 0.6] call BIS_fnc_findSafePos;
    private _camonet = createVehicle ["CamoNet_BLUFOR_open_F", _mgPosition, [], 0, "CAN_COLLIDE"];
    _props pushBack _camonet;

    private _mgGroup = createGroup _sideX; 
    private _staticVeh = createVehicle [_mgClass, _mgPosition, [], 0, "CAN_COLLIDE"];
    [_staticVeh, _sideX] call A3A_fnc_AIVEHinit;
    private _mgCrew = [_mgGroup, _mgCrewClass, _mgPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_mgCrew] call A3A_fnc_NATOinit;
    _mgCrew moveInGunner _staticVeh;

    _vehicles pushBack _staticVeh;
    _groups pushBack _mgGroup;

    {
        private _relativePosition = [_mgPosition, 4, _x] call BIS_Fnc_relPos;
        private _sandbag = createVehicle [_faction get "sandbagRound", _relativePosition, [], 0, "CAN_COLLIDE"];
        _sandbag setDir ([_sandbag, _mgPosition] call BIS_fnc_dirTo);
        _sandbag setVectorUp surfaceNormal position _sandbag;
        _props pushBack _sandbag;
    } forEach [0, 90, 180, 270];


    private _patrolGroup1 = [_mgPosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
    { 
        [_x] call A3A_fnc_NATOinit;
    } forEach units _patrolGroup1;
    _groups pushBack _patrolGroup1;

    [_patrolGroup1, _artilleryPosition, 50] call bis_fnc_taskPatrol;

    private _patrolGroup2 = [_mgPosition, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
    { 
        [_x] call A3A_fnc_NATOinit;
    } forEach units _patrolGroup2;
    _groups pushBack _patrolGroup2;

    [_patrolGroup2, _artilleryPosition, 200] call bis_fnc_taskPatrol;
};

waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || !(alive _artilleryVeh) || _artilleryCrew findIf {alive _x} == -1
};

switch (true) do {
    case (alive _artilleryVeh && {_artilleryCrew findIf {alive _x} != -1}): {
        Info("Artillery will fire at rebel position for some time, fail.");
        [_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
        [-900, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        [-15,theBoss] call A3A_fnc_addScorePlayer;

        if (!isNil "_firedEh") then {
            _artilleryVeh removeEventHandler ["Fired", _firedEh];
        };
        [_artilleryVeh] call A3A_fnc_addArtilleryTrailEH;
        _shellCount = round(random [2,4,7]);
        sleep 1;
        _artilleryVeh doArtilleryFire [_targetPosition, _artilleryShellClass, _shellCount];
        sleep 60; //shelling...
    };
    case (!(alive _artilleryVeh) || {_artilleryCrew findIf {alive _x} == -1}): {
        Info("Artillery is destroyed, success.");
        [_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;

        [0, 400] remoteExec ["A3A_fnc_resourcesFIA",2];
        [1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
        { 
            [25,_x] call A3A_fnc_addScorePlayer;
            [400,_x] call A3A_fnc_addMoneyPlayer; 
        } forEach (call SCRT_fnc_misc_getRebelPlayers);
        [15,theBoss] call A3A_fnc_addScorePlayer;
        [200,theBoss, true] call A3A_fnc_addMoneyPlayer;

    };
    default {
        Warning("Unexpected behaviour, cancelling mission.");
        [_taskId, "DES", "CANCELED"] call A3A_fnc_taskSetState;
    };
};

sleep 30;

[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;

if (!isNil "_firedEh") then {
    _artilleryVeh removeEventHandler ["Fired", _firedEh];
};

{[_x] spawn A3A_fnc_vehDespawner} forEach (_vehicles + _props);
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

Info("Destroy Artillery clean up complete.");
