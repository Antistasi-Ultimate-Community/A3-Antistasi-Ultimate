#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

private _rivalsTaskChance = 5;
private _traderTaskChance = 5;

private _missionChance = 5 * A3A_activePlayerCount;
if ((!bigAttackInProgress) and (random 100 < _missionChance)) then {[] spawn A3A_fnc_missionRequest};

// sleep 3;

private _numWreckedAntennas = count antennasDead;
//Probability of spawning a mission in.
private _shouldSpawnRepairThisTick = round(random 100) < 15;
if (_numWreckedAntennas > 0 && {_shouldSpawnRepairThisTick && {!("REP" in A3A_activeTasks)}}) then {
    private _potentials = [];
    {
        if (!isNil "_x" && {!isNull _x}) then {
            _markerX = [markersX, _x] call BIS_fnc_nearestPosition;
            if (sidesX getVariable [_markerX,sideUnknown] == Occupants and {spawner getVariable _markerX == 2}) exitWith {
                _potentials pushBack [_markerX,_x];
            };
        };
    } forEach antennasDead;
    if (count _potentials > 0) then {
        private _potential = selectRandom _potentials;
        [[_potential select 0,_potential select 1],"A3A_fnc_REP_Antenna"] call A3A_fnc_scheduler;
    };
} else {
    private _changingX = false;
    {
        private _chance = 5;
        if (_x in resourcesX and {sidesX getVariable [_x,sideUnknown] == Invaders}) then {
            _chance = 20
        };
        if (random 100 < _chance) then {
            _changingX = true;
            destroyedSites = destroyedSites - [_x];
            _nameX = [_x] call A3A_fnc_localizar;
            ["TaskSucceeded", ["", format [localize "STR_notifiers_city_rebuilt",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
            sleep 2;
        };
    } forEach ((destroyedSites - citiesX) select {sidesX getVariable [_x,sideUnknown] != teamPlayer});
    if (_changingX) then {publicVariable "destroyedSites"};
};

// sleep 4;

if (areRivalsEnabled && tierWar > 3 && !areRivalsDiscovered && !isRivalsDiscoveryQuestAssigned) then {
    Info_1("Rivals roll: %1", _rivalsTaskChance);
    if (random 100 < _rivalsTaskChance) then {
        Info("Assigning Rivals Discovery Task...");
        [] call SCRT_fnc_rivals_prepareQuest;
    } else {
        _rivalsTaskChance = [
            _rivalsTaskChance + 5,
            _rivalsTaskChance + 10
        ] select (sunOrMoon < 1);
    };
};

if (tierWar > 2 && !isTraderQuestCompleted && !isTraderQuestAssigned) then {
    Info_1("Arms Dealer roll: %1", _traderTaskChance);
    if (random 100 < _traderTaskChance) then {
        Info("Assigning Arms Dealer Task...");
        [] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];
    } else {
        _traderTaskChance = _traderTaskChance + 2;
    };
};

if (areRivalsDiscovered && {!areRivalsDefeated}) then {
    [random [5,7,10]] call SCRT_fnc_rivals_addProgressToRivalsLocationReveal;
};