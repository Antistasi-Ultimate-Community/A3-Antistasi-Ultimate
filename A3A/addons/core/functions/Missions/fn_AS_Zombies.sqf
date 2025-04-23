#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Stop infestation, basically a punishment but with zombies (zombie modset)
if (!isServer and hasInterface) exitWith {};

private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];
if !(_civNonHuman) exitWith {
	["AS"] remoteExec ["A3A_fnc_missionRequest",2];
    Info("Current civ faction is not non-human. Rerolling");
};

private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

if (_sideX isNotEqualTo teamPlayer) exitWith {
    Info("City is not player owned. Checking for suitable cities.");

	private _citiesPlayer = citiesX select {sidesX getVariable [_x, sideUnknown] == teamPlayer};

	if (_citiesPlayer isEqualTo []) then {
		["AS"] remoteExec ["A3A_fnc_missionRequest",2];
		Info("No suitable city was found. Rerolling");
	} else {
		_markerX = selectRandom _citiesPlayer;
	};
};

private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
}; _limit params ["_dateLimitNum", "_displayTime"];

private _radiusX = [_markerX] call A3A_fnc_sizeMarker;
private _nameDest = [_markerX] call A3A_fnc_localizar;

private _posTask = _positionX getPos [random 100, random 360];
private _taskId = "AS" + str A3A_taskCount;
[
	[teamPlayer,civilian],
	_taskID,
	[
		format [localize "STR_A3A_Missions_AS_Zombies_task_desc", _nameDest, _displayTime],
		localize "STR_A3A_Missions_AS_Zombies_task_header",
		_markerX
	],
	_positionX,
	false,
	0,
	true,
	"Kill",
	true
] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

// Wait until players are close enough to the city to trigger mission
waitUntil {
	sleep 5;
	((call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_positionX, 600, 600] isNotEqualTo []) || {dateToNumber date > _dateLimitNum}
};

if (dateToNumber date > _dateLimitNum) exitWith {};

private _groupZombies = createGroup Invaders;
[8, 3, (random [5,7,9]), _positionX, _groupZombies, _taskId] spawn A3U_fnc_spawnZombieWaves;

// Wait until all zombies are dead (waves fnc returns true) or mission is expired
waitUntil {
	sleep 10;
	private _aliveZombies = {alive _x || {_x getVariable ["ACE_isUnconscious", false] isEqualTo false}} count units _groupZombies;
	(missionNamespace getVariable [_taskID+"_done", false] isEqualTo true) || {dateToNumber date > _dateLimitNum}
};

if (dateToNumber date > _dateLimitNum) then {
	[_taskId, "AS", "FAILED", true] call A3A_fnc_taskSetState;

    destroyedSites = destroyedSites + [_markerX];
    publicVariable "destroyedSites";

    [_markerX] call A3A_fnc_destroyCity;
    sidesX setVariable [_markerX, Invaders, true];
    garrison setVariable [_markerX, [], true];
    [_markerX] call A3A_fnc_mrkUpdate;
} else {
	[_taskId, "AS", "SUCCEEDED", true] call A3A_fnc_taskSetState;

	if (_difficultX) then {
		[0, 2000] remoteExec ["A3A_fnc_resourcesFIA",2];
		[0, 20, _positionX] remoteExec ["A3A_fnc_citySupportChange",2];

		{ 
			[20, _x] call A3A_fnc_addScorePlayer;
			[500, _x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
	} else {
		[0, 1000] remoteExec ["A3A_fnc_resourcesFIA",2];
		[0, 10, _positionX] remoteExec ["A3A_fnc_citySupportChange",2];

		{ 
			[10, _x] call A3A_fnc_addScorePlayer;
			[250, _x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
	};
};

[_taskId, "AS", 1200, true] spawn A3A_fnc_taskDelete;

[_groupZombies] spawn A3A_fnc_groupDespawner;