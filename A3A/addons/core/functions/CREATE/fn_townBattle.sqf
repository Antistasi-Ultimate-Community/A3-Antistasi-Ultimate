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

private _faction = Faction(_side);
private _factionName = _faction get "name";

private _nameDest = [_mrkDest] call A3A_fnc_localizar;
private _taskId = "townBattle" + str A3A_taskCount;
[[teamPlayer,civilian,Occupants],_taskId,[format [localize "STR_townBattle_desc",_nameDest,_factionName],format [localize "STR_townBattle_task",_nameDest,_factionName],_mrkDest],_posDest,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "townBattle", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


if (isNil "_delay") then {
    _delay = 300 + 60 * (markerPos "Synd_HQ" distance2d _posDest) / 2000;            // +1 min per 2km
};

// Create the attacking force
private _cityData = server getVariable [_mrkDest, [0,0,0,0]];
_cityData params [["_numCiv",0], ["_numVeh",0], ["_supportGov",0], ["_supportReb",0]];

private _vehCount = round (0.7 + random 0.5 + 0.13 * (sqrt _numCiv) + 1.3 * A3A_balancePlayerScale);

//params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_delay", "_modifiers", "_attackType", "_reveal"];

// May as well do it properly here
// A3A_supportStrikes pushBack [_side, "TROOPS", markerPos _mrkDest, time + 1800, 1800, _resources];

private _missionExpireTime = time + 2400;
private _missionMinTime = time + 600;

waitUntil {
    sleep 10; 
    (call SCRT_fnc_misc_getRebelPlayers) findIf {_x inArea [_posDest, 500, 500, 0, false]} != -1 || (time > _missionExpireTime);
};

if (time > _missionExpireTime) exitWith {
    Info("No players reached the battle in time, aborting.");
    [_taskId, "townBattle", "FAILED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
    [_taskId, "townBattle", 0] spawn A3A_fnc_taskDelete;

    [10,-10,_mrkDest,false] spawn A3A_fnc_citySupportChange;
};

ServerInfo_2("Launching %1 Battle Against %2 from %3", _side, _mrkDest, _mrkOrigin);

// Mostly to prevent fast travel
forcedSpawn pushBack _mrkDest; publicVariable "forcedSpawn";

// Spawn in the "civilians" (rebel defenders)
private _numCiv = (server getVariable _mrkDest) select 0;
_numCiv = 4 + round sqrt (_numCiv);
if (_numCiv > 30) then {_numCiv = 30};

private _civilians = [];
private _civGroups = [];
private _civWeapons = unlockedRifles + unlockedSniperRifles + unlockedShotguns + unlockedHandguns + unlockedSMGs;
while {count _civilians < _numCiv} do
{
    private _groupCivil = createGroup teamPlayer;
    _civGroups pushBack _groupCivil;
    private _pos = while {true} do {
        private _pos = _posDest getPos [random _size / 3,random 360];
        if (!surfaceIsWater _pos) exitWith { _pos };
    };
    for "_i" from 1 to (4 min (_numCiv - count _civilians)) do
    {
        private _identityRandom = selectRandom ["unitRifle", "unitSniper", "unitMedic", "unitSL", "unitAT", "unitUnarmed"];
        private _identity = [A3A_faction_civ, FactionGet(reb, _identityRandom)] call A3A_fnc_createRandomIdentity;
        private _civ = [_groupCivil, FactionGet(reb, _identityRandom), _pos, [], 0, "NONE", _identity] call A3A_fnc_createUnit;
        [_civ, createHashMapFromArray [["face", selectRandom (A3A_faction_civ get "faces")], ["speaker", "NoVoice"]]] call A3A_fnc_setIdentity;
        [_civ] spawn A3A_fnc_FIAinit;
        if (_identityRandom isEqualTo "unitUnarmed") then {
            [_civ, (selectRandom _civWeapons), 5, 0] call BIS_fnc_addWeapon;
            _civ forceAddUniform (selectRandom (A3A_faction_civ get "uniforms"));
            _civ addHeadgear (selectRandom (A3A_faction_civ get "headgear"));
        };
        _civ setSkill 0.5;
        _civilians pushBack _civ;
    };
    // private _groupReturn = [_groupCivil, _posDest, 100] call A3A_fnc_patrolGroupGarrison;
    [_groupCivil, "Patrol_Defend", 0, 100, -1, true, _pos, false] call A3A_fnc_patrolLoop;
};

private _data = nil;
private _modifiers = ["noairsupport", "lowair"];
_modifiers pushBack ([_side] call A3U_fnc_getTierModifier);

_data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount, _delay, _modifiers] call A3A_fnc_createAttackForceMixed;
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];

// if (tierWar >= 3 || {_side isEqualTo Invaders}) then { // Send militia or police reinforcements. Invaders get militia only
//     _data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount, _vehCount/2] call A3A_fnc_createAttackForceLandMilitia;
// } else { 
//     _data = [_side, _mrkOrigin, _mrkDest, "attack", _vehCount] call A3A_fnc_createAttackForcePolice;
// };

bigAttackInProgress = true; publicVariable "bigAttackInProgress";

// Termination conditions
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

waitUntil {
    sleep 10;
//    Debug_4("Soldiers %1 initial, %2 active. Civs %3 initial, %4 active", count _soldiers, {_x call A3A_fnc_canFight} count _soldiers, count _civilians, {alive _x} count _civilians);
    ({_x call A3A_fnc_canFight} count _soldiers < count _soldiers / 3)
    or (time > _missionMinTime and ({alive _x} count _civilians < count _civilians / 4))
    or (time > _missionExpireTime)
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

if (({_x call A3A_fnc_canFight} count _soldiers < count _soldiers / 3) or (time > _missionExpireTime)) then {
    Info_1("Rebels defeated a town attack against %1, %2", _side, _mrkDest);
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
    Info_1("Rebels lost a town attack against %1, %2", _side, _mrkDest);
    [_taskId, "townBattle", "FAILED"] call A3A_fnc_taskSetState;
    [_posDest, -20, 3000] call _fnc_adjustNearCities;
    [0,-20,_mrkDest,false] spawn A3A_fnc_citySupportChange;

    // Side pay extra to attack a city
    private _citypop = (server getVariable _mrkDest) select 0;
    [-4 * _citypop * A3A_balancePlayerScale, _side, "attack"] remoteExec ["A3A_fnc_addEnemyResources", 2];
};

sleep 60;
[_taskId, "townBattle", 0] spawn A3A_fnc_taskDelete;

bigAttackInProgress = false; publicVariable "bigAttackInProgress";
forcedSpawn = forcedSpawn - [_mrkDest]; publicVariable "forcedSpawn";

private _groupsEnemy = _crewGroups + _cargoGroups;

// Order remaining aggressor units back to base, hand them to the group despawner
{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _groupsEnemy;

// When the city marker is despawned, get rid of everything
waitUntil {sleep 5; (spawner getVariable _mrkDest == 2)};
{deleteVehicle _x} forEach _civilians;
{deleteVehicle _x} forEach _soldiers;
{deleteGroup _x} forEach _civGroups;
{deleteGroup _x} forEach _groupsEnemy;