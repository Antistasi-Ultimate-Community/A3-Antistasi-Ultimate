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

// if (_lowCiv) exitWith {};
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
private _factionReb = A3A_faction_reb;
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

private _groupVIP = createGroup [civilian, true];
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
private _unitTypeOcc = _faction getOrDefault ["unitOfficial", ""];
private _unitType = if (_unitTypeCiv != "") then {_unitTypeCiv} else {_unitTypeOcc};
private _identity = [A3A_faction_civ, _unitType] call A3A_fnc_createRandomIdentity;
private _vip = [_groupVIP, _unitType, _nearestRoad, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
[_vip, createHashMapFromArray [["face", selectRandom (A3A_faction_civ get "faces")], ["speaker", "NoVoice"]]] call A3A_fnc_setIdentity;
[_vip, "townVIP"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_vip];
[_vip, false, false] call A3A_fnc_FIAinit;
_vip setVariable ["spawner",false,true];
_vip setUnitPos "UP";
_vip setDir (random 360);

if ((primaryWeapon _vip) isEqualTo "") then {
    private _weapon = (selectRandom allRifles);
    private _magazine = ([_weapon] call A3A_fnc_loadout_defaultWeaponMag select 0);

    _vip addMagazineGlobal _magazine;
    _vip addWeaponGlobal _weapon;
};

[_vip, "STAND", "FULL", { (side _this) != civilian }] call BIS_fnc_ambientAnimCombat;

// Effects

private _vehicleCrashClassesRebel = (_factionReb get "vehiclesLightArmed") + (_factionReb get "vehiclesLightUnarmed") + (_factionReb get "vehiclesAT");
private _vehicleCrashClasses = (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaTrucks") + _vehicleCrashClassesRebel;
private _deadSoldierClassesCiv = [A3A_faction_civ, ["unitMan", "unitWorker"]];
private _deadSoldierClassesReb = [A3A_faction_reb, ["unitRifle", "unitSL", "unitEng", "unitLAT", "unitSniper", "unitMG", "unitExp"]];
private _deadSoldierClassesFaction = [_faction, ["unitMilitiaGrunt", "unitMilitiaMarksman", "unitMilitiaGrenadier", "unitMilitiaSniper", "unitMilitiaMedic", "unitPoliceOfficer"]];
private _deadSoldierClasses = [_deadSoldierClassesCiv, _deadSoldierClassesReb, _deadSoldierClassesFaction];
private _damagedBuildings = (nearestObjects [_pos, ["house"], _size]) select {(count ([_x] call BIS_fnc_buildingPositions)) > 0};
private _damagedBuildings = (nearestObjects [_pos, ["house"], _size]) select {(count ([_x] call BIS_fnc_buildingPositions)) > 0};

private _effectsFire = [];
private _effectsVehicle = [];
private _effectsUnits = [];

{
    if (_forEachIndex >= 100) exitWith {};
    if (random 100 < 20) then {
        private _effectsSmoke = [_x] call A3U_fnc_damageBuilding;
        _effectsFire append _effectsSmoke;
    };
} forEach _damagedBuildings;

for "_i" from 0 to round(random [4,5,6]) do {
    private _posGeneral = [_posDest, 1, (_sizeSpawn * 1.5), 0, 0, 20, 0, [], [_posDest, _posDest]] call BIS_fnc_findSafePos;
    private _nearestRoad = getPosATL ([_posGeneral, _size] call BIS_fnc_nearestRoad);

    private _posVehicle = [_posGeneral, 1, 5, 0, 0, 20, 0, [], [_nearestRoad, _nearestRoad]] call BIS_fnc_findSafePos;
    private _posUnit = [_posVehicle, 1, 30, 0, 0, 20, 0, [], [_posVehicle, _posVehicle]] call BIS_fnc_findSafePos;

    private _randomBuilding = selectRandom _damagedBuildings;
    private _randomVehicle = selectRandom _vehicleCrashClasses;

    private _fire = [_randomBuilding, 2, "BigDestructionFire"] call A3U_fnc_createFires;
    private _vehicle = [_randomVehicle, _posVehicle, _side] call A3U_fnc_createCrashedVehicle;
    private _units = [_deadSoldierClasses, _posUnit, round(random [2, 3, 5])] call A3U_fnc_createDeadSoldiers;

    if (round(random 100) < 5) then {
        _vehicle setVectorUp [1, (selectRandom [0, 1]), 0];
    };

    _effectsFire append _fire;
    _effectsVehicle pushBack _vehicle;
    _effectsUnits pushBack _units;

    uiSleep 3;
};

waitUntil {
    sleep 10; 
    // (call SCRT_fnc_misc_getRebelPlayers) findIf {_x inArea [_posDest, 500, 500, 0, false]} != -1 || (time > _missionExpireTime); - Can re-add if wanted
    !([_vip] call A3A_fnc_canFight) || {(_vip distance2D _posDest) > _sizeFail}
    or (group _vip != _groupVIP) || (time > _missionExpireTime); // Wait until the vip is joined to a player group to trigger the boom booms
};

if (time > _missionExpireTime) exitWith {
    Info("No players reached the battle in time, aborting.");
    [_taskId, _mrkDest, _closestAdminMarker, _vip] spawn _fnc_endMission;

    [_vipVehicle] spawn A3A_fnc_VEHDespawner;
    { [_x] spawn A3A_fnc_VEHDespawner } forEach _effectsVehicle;
    {deleteVehicle _x} forEach _effectsFire;
    { [_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2] } forEach _damagedBuildings;
};

if ((_vip distance2D _posDest > _sizeFail) || !([_vip] call A3A_fnc_canFight)) exitWith {
    Info("VIP was too far from the battle or unable to fight, aborting.");
    [_taskId, _mrkDest, _closestAdminMarker, _vip] spawn _fnc_endMission;

    [_vipVehicle] spawn A3A_fnc_VEHDespawner;
    { [_x] spawn A3A_fnc_VEHDespawner } forEach _effectsVehicle;
    {deleteVehicle _x} forEach _effectsFire;
    { [_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2] } forEach _damagedBuildings;
};

[1, _side, "QRFLAND", getPosATL player, 300] call A3A_fnc_showInterceptedSetupCall;

ServerInfo_3("Launching %1 Battle Against %2 from %3", _side, _mrkDest, _mrkOrigin);

bigAttackInProgress = true; publicVariable "bigAttackInProgress";

// Mostly to prevent fast travel
forcedSpawn pushBack _mrkDest; publicVariable "forcedSpawn";

private _data = nil;
private _modifiers = ["noairsupport", "lowair"];
_modifiers pushBack ([_side] call A3U_fnc_getTierModifier);

if (isNil "_delay") then {
    // _delay = 300 + 60 * (markerPos "Synd_HQ" distance2d _posDest) / 2000;            // +1 min per 2km
    _delay = 1;
};

uiSleep 180; // 3 minutes to prepare

[1, _side, "QRFLAND", getPosATL player, 60] call A3A_fnc_showInterceptedSetupCall;

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

    private _hrMultiplier = overallHRGain / 100;
    private _invertedMultiplier = 2 - _hrMultiplier;
    private _baseBattleReward = (_numCiv / 100) * _invertedMultiplier;
    private _hrAdd = round (_baseBattleReward);
    private _resourcesFIA = round (100 * _baseBattleReward);
    [_hrAdd,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
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
{ [_x] spawn A3A_fnc_VEHDespawner } forEach _effectsVehicle;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _groupsEnemy;
{ [_x] remoteExec ["A3A_fnc_repairRuinedBuilding", 2] } forEach _damagedBuildings; // This doesn't seem to work so err... lol

// When the city marker is despawned, get rid of everything
waitUntil {sleep 5; (spawner getVariable _mrkDest == 2)};
{deleteVehicle _x} forEach _soldiers;
{deleteVehicle _x} forEach _effectsFire;
{deleteVehicle _x} forEach _effectsUnits;
{deleteGroup _x} forEach _groupsEnemy;
deleteVehicle _vip;

townSkirmishes = townSkirmishes - [_mrkDest, _closestAdminMarker];