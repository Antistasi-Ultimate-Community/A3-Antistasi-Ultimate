/*
    Author:
        Silence
    
    Description:
        Creates occupant/invader town battle attack
    
    Params:
        _side <SIDE> | Occupants or Invaders
        _mrkDest <STRING> | Destination marker (town)
        _mrkOrigin <STRING> | Origin marker (base)
        _delay <SCALAR> <DEFAULT: Auto> | Optional, delay in seconds before sending attack

    Dependencies:
        areOccupantsDefeated, areInvadersDefeated, forcedSpawn, bigAttackInProgress
    
    Scope:
        Server, haven't confirmed HC
    
    Environment:
        Scheduled
    
    Usage:
        [_side, _mrkDest, _mrkOrigin, _delay] call A3A_fnc_townBattle;
    
    Return:
        N/A
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_endMission = {
    params ["_taskId", "_mrkDest", "_closestAdminMarker", ["_vip", ObjNull]];

    [_taskId, "townBattle", "FAILED"] call A3A_fnc_taskSetState;

    [10,-10,_mrkDest,false] spawn A3A_fnc_citySupportChange;
    townSkirmishes = townSkirmishes - [_mrkDest, _closestAdminMarker];
    bigAttackInProgress = false; publicVariable "bigAttackInProgress";

    sleep 60;
    [_taskId, "townBattle", 0] spawn A3A_fnc_taskDelete;
    deleteVehicle _vip;
};

private _fnc_adjustNearCities = {
    params ["_position", "_maxSupport", "_maxDist"];
    {
        private _dist = getMarkerPos _x distance2d _position;
        if (_dist > _maxDist) then { continue };
        private _suppChange = linearConversion [0, _maxDist, _dist, _maxSupport, 0, true];
        [0,_suppChange,_x,false] spawn A3A_fnc_citySupportChange;		// don't scale this by pop
    } forEach citiesX;
};

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_lowCiv) exitWith {};
// if (_civNonHuman) exitWith {};

if (!isServer) exitWith { Error("Server-only function miscalled") };

params ["_side", "_mrkDest", "_mrkOrigin", "_delay"];

if (_side isEqualTo Occupants && {areOccupantsDefeated}) exitWith {
    Info("Occupants had been defeated earlier, aborting battle.");
};

if (_side isEqualTo Invaders && {areInvadersDefeated}) exitWith {
    Info("Invaders had been defeated earlier, aborting battle.");
};

private _posDest = getMarkerPos _mrkDest;
private _posOrigin = getMarkerPos _mrkOrigin;
private _size = [_mrkDest] call A3A_fnc_sizeMarker;
private _sizeSpawn = 50 min _size;
private _sizeFail = 50 max _size; // Minimum size of 50m

private _faction = Faction(_side);
private _factionName = _faction get "name";

private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _taskId = "townBattle" + str A3A_taskCount;
[[teamPlayer,civilian,Occupants],_taskId,[format [localize "STR_townBattle_desc",_nameDest,_factionName],format [localize "STR_townBattle_task",_nameDest,_factionName],_mrkDest],_posDest,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "townBattle", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _closestAdminMarker = [milAdministrationsX, _posDest] call BIS_fnc_nearestPosition;
townSkirmishes append [_mrkDest, _closestAdminMarker]; // Should probably move to A3A_townData in future

// Create the attacking force
private _cityData = A3A_townData get _mrkDest;
_cityData params [["_numCiv",0], ["_numVeh",0], ["_supportGov",0], ["_supportReb",0]];

private _vehCount = round (0.7 + random 1 + 0.13 * (sqrt _numCiv) + 1.3 * A3A_balancePlayerScale);

// May as well do it properly here
// A3A_supportStrikes pushBack [_side, "TROOPS", markerPos _mrkDest, time + 1800, 1800, _resources];

private _missionExpireTime = time + 2400;

private _groupVIP = createGroup [teamPlayer, true];
private _civWeapons = unlockedRifles + unlockedSniperRifles + unlockedShotguns + unlockedHandguns + unlockedSMGs;

// Spawn "vip" vehicle
private _pos = [_posDest, 1, (_sizeSpawn / 2), 3, 0, 20, 0, [], [_posDest, _posDest]] call BIS_fnc_findSafePos;
private _nearestRoad = getPosATL ([_pos, _sizeSpawn] call BIS_fnc_nearestRoad);
if (_nearestRoad isEqualTo ObjNull) then {_nearestRoad = _pos};

private _vehicleClass = selectRandom ["vehiclesLightArmed", "vehiclesLightUnarmed", "vehiclesAT", "vehiclesCivCar", "vehiclesCivSupply"];
private _vipVehicleClass = selectRandom (A3A_faction_reb getOrDefault [_vehicleClass, A3A_faction_reb get "vehiclesBasic"]);
private _vipVehicleData = [_nearestRoad, (random 360), _vipVehicleClass, _groupVIP] call A3A_fnc_spawnVehicle;
private _vipVehicle = _vipVehicleData select 0;
{deleteVehicle _x} forEach (crew _vipVehicle);

// Spawn "vip", currently hardcoded to Occ officer
private _unitTypeCiv = A3A_faction_civ getOrDefault ["unitVIP", ""];
private _unitTypeOcc = A3A_faction_occ getOrDefault ["unitOfficial", ""];
private _unitType = if (_unitTypeCiv != "") then {_unitTypeCiv} else {_unitTypeOcc};
private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
private _vip = [_groupVIP, _unitType, _nearestRoad, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
[_vip, createHashMapFromArray [["face", selectRandom (A3A_faction_civ get "faces")], ["speaker", "NoVoice"]]] call A3A_fnc_setIdentity;
[_vip, "townVIP"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_vip];
[_vip, false, false] call A3A_fnc_FIAinit;
_vip setVariable ["spawner",false,true];
_vip setUnitPos "UP";
removeAllWeapons _vip;

// private _posVIP = [_groupVIP, _posDest, 30] call A3A_fnc_patrolGroupGarrison;

// Spawn in the "civilians" (rebel defenders)
private _numCiv = 9 min (3 + round sqrt (_numCiv));

private _civilians = [];
private _civGroups = [];
private _groupCivil = createGroup [teamPlayer, true];
_civGroups pushBack _groupCivil;
while {count _civilians <= _numCiv} do
{
    private _pos = [_nearestRoad, 1, _sizeSpawn, 3, 0, 20, 0, [], [_posDest, _posDest]] call BIS_fnc_findSafePos;
    for "_i" from 1 to 3 do
    {
        private _identityRandom = selectRandom ["unitRifle", "unitSniper", "unitMedic", "unitSL", "unitAT", "unitUnarmed"];
        private _identity = [A3A_faction_civ, FactionGet(reb, _identityRandom)] call A3A_fnc_createRandomIdentity;
        private _civ = [_groupCivil, FactionGet(reb, _identityRandom), _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
        if (_identityRandom isEqualTo "unitUnarmed") then {
            [_civ, createHashMapFromArray [["face", selectRandom (A3A_faction_civ get "faces")], ["speaker", "NoVoice"]]] call A3A_fnc_setIdentity;
            [_civ, (selectRandom _civWeapons), 5, 0] call BIS_fnc_addWeapon;
            _civ forceAddUniform (selectRandom (A3A_faction_civ get "uniforms"));
            _civ addHeadgear (selectRandom (A3A_faction_civ get "headgear"));
        };
        _civ setSkill 0.5;
        _civilians pushBack _civ;
        [_civ] call A3A_fnc_FIAinit;
        _civ setVariable ["spawner",false,true];
    };
};

// private _groupReturn = [_groupCivil, _posDest, _size] call A3A_fnc_patrolGroupGarrison; // The peasants arrive
[_groupCivil, "Patrol_Defend", 0, _size, -1, true, _posDest, false] call A3A_fnc_patrolLoop;

waitUntil {
    sleep 10; 
    // (call SCRT_fnc_misc_getRebelPlayers) findIf {_x inArea [_posDest, 500, 500, 0, false]} != -1 || (time > _missionExpireTime); - Can re-add if wanted
    !([_vip] call A3A_fnc_canFight) || {(_vip distance2D _posDest) > _sizeFail}
    or (group _vip != _groupVIP) || (time > _missionExpireTime); // Wait until the vip is joined to a player group to trigger the boom booms
};

if (time > _missionExpireTime) exitWith {
    Info("No players reached the battle in time, aborting.");
    [_taskId, _mrkDest, _closestAdminMarker, _vip] spawn _fnc_endMission;
    {deleteVehicle _x} forEach (units _groupCivil);
    [_vipVehicle] spawn A3A_fnc_VEHDespawner;
};

if ((_vip distance2D _posDest > _sizeFail) || !([_vip] call A3A_fnc_canFight)) exitWith {
    Info("VIP was too far from the battle or unable to fight, aborting.");
    [_taskId, _mrkDest, _closestAdminMarker, _vip] spawn _fnc_endMission;
    {deleteVehicle _x} forEach (units _groupCivil);
    [_vipVehicle] spawn A3A_fnc_VEHDespawner;
};

ServerInfo_3("Launching %1 Battle Against %2 from %3", _side, _mrkDest, _mrkOrigin);

[1, _side, "QRFLAND", getPosATL player, 1] call A3A_fnc_showInterceptedSetupCall;

bigAttackInProgress = true; publicVariable "bigAttackInProgress";

// Mostly to prevent fast travel
forcedSpawn pushBack _mrkDest; publicVariable "forcedSpawn";

private _data = nil;
private _modifiers = ["noairsupport", "lowair"];
_modifiers pushBack ([_side] call A3U_fnc_getTierModifier);

if (isNil "_delay") then {
    _delay = 300 + 60 * (markerPos "Synd_HQ" distance2d _posDest) / 2000;            // +1 min per 2km
};

_data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount, _delay, _modifiers] call A3A_fnc_createAttackForceMixed;
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];

// if (tierWar >= 3 || {_side isEqualTo Invaders}) then { // Send militia or police reinforcements. Invaders get militia only
//     _data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount, _vehCount/2] call A3A_fnc_createAttackForceLandMilitia;
// } else { 
//     _data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount] call A3A_fnc_createAttackForcePolice;
// };

// Termination conditions
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

private _soldiersWin = round(count _soldiers * 0.3); // 30% ish
private _missionMinTime = time + 600;

waitUntil {
    sleep 10;
    ({_x call A3A_fnc_canFight} count _soldiers <= _soldiersWin)
    or ([_vip] call A3A_fnc_canFight isEqualTo false || {(_vip distance2D _posDest) > _sizeFail})
    or (time > _missionMinTime || {time > _missionExpireTime})
    // or ({alive _x} count _civilians < count _civilians / 4) - Removed for now, since adding vip
};

private _canSucceed = (({_x call A3A_fnc_canFight} count _soldiers <= _soldiersWin) || time > _missionMinTime);
if (_canSucceed) then {
    Info_2("Rebels defeated a town attack against %1, %2", _side, _mrkDest);
    [_taskId, "townBattle", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [_posDest, 10, 3000] call _fnc_adjustNearCities;
    [_mrkDest, true] call A3A_fnc_cityChangeSide;

    [_side, -10, 90] remoteExec ["A3A_fnc_addAggression",2];
    {
        [round (7*tierWar), _x] call A3A_fnc_addScorePlayer;
        [round (75*tierWar), _x] call A3A_fnc_addMoneyPlayer;
    } forEach (call SCRT_fnc_misc_getRebelPlayers);

    [10,theBoss] call A3A_fnc_addScorePlayer;
    [round (100*((tierWar/3) max 1)), theBoss, true] call A3A_fnc_addMoneyPlayer;
} else {
    Info_2("Rebels lost a town attack against %1, %2", _side, _mrkDest);
    [_taskId, "townBattle", "FAILED"] call A3A_fnc_taskSetState;
    [_posDest, -20, 3000] call _fnc_adjustNearCities;
    [0,-20,_mrkDest,false] spawn A3A_fnc_citySupportChange;

    // Side pay extra to attack a city
    [-4 * _numCiv * A3A_balancePlayerScale, _side, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];
};

sleep 60;
[_taskId, "townBattle", 0] spawn A3A_fnc_taskDelete;

bigAttackInProgress = false; publicVariable "bigAttackInProgress";
forcedSpawn = forcedSpawn - [_mrkDest]; publicVariable "forcedSpawn";

private _groupsEnemy = _crewGroups + _cargoGroups;

// Order remaining aggressor units back to base, hand them to the group despawner
[_vipVehicle] spawn A3A_fnc_VEHDespawner;
{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _groupsEnemy;

// When the city marker is despawned, get rid of everything
waitUntil {sleep 5; (spawner getVariable _mrkDest == 2)};
{deleteVehicle _x} forEach _civilians;
{deleteVehicle _x} forEach _soldiers;
{deleteGroup _x} forEach _civGroups;
{deleteGroup _x} forEach _groupsEnemy;
deleteVehicle _vip;

townSkirmishes = townSkirmishes - [_mrkDest, _closestAdminMarker];