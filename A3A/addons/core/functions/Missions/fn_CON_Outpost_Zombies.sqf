#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Conquer the outpost, with zombies (zombie modset) - we want this to look the exact same as a conquest mission until you get there
if (!isServer and hasInterface) exitWith{};

private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

private _limit = if (_difficultX) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
}; _limit params ["_dateLimitNum", "_displayTime"];

private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];
if !(_civNonHuman) exitWith {
	["CON"] remoteExec ["A3A_fnc_missionRequest",2];
    Info("Current civ faction is not non-human. Rerolling");
};

private _markerSide = sidesX getVariable [_markerX, sideUnknown];

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _textX = "";
private _taskName = "";

switch (true) do 
{
	case (_markerX in resourcesX): 
	{
		_textX = format [localize "STR_CON_Outpost_resources_desc", _nameDest, _displayTime];
		_taskName = localize "STR_CON_Outpost_resources_task";
	};
	case (_markerX in controlsX): 
	{
		_textX = format [localize "STR_CON_Outpost_controls_desc", _nameDest, _displayTime];
		_taskName = localize "STR_CON_Outpost_controls_task";
	};
	default 
	{
		_textX = format [localize "STR_CON_Outpost_outposts_desc", _nameDest, _displayTime];
		_taskName = localize "STR_CON_Outpost_outposts_task";
	};
};

private _taskId = "CON" + str A3A_taskCount;
[
	[teamPlayer, civilian],
	_taskId,
	[_textX, _taskName, _markerX],
	_positionX,
	false,
	0,
	true,
	"Target",
	true
] call BIS_fnc_taskCreate;
[_taskId, "CON", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {
	sleep 5;
	((call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_positionX, 200, 200] isNotEqualTo []) || {dateToNumber date > _dateLimitNum}
};

if (dateToNumber date > _dateLimitNum) exitWith {};

// Handle side change for inv/occ
private _groupSide = Invaders;
if (_markerSide == Invaders) then {
	_groupSide = Occupants;
};

private _groupZombies = createGroup _groupSide;
[3, 3, (random [5,7,9]), _positionX, _groupZombies] spawn A3U_fnc_spawnZombieWaves;

waitUntil {
	sleep 10;
	(sidesX getVariable [_markerX,sideUnknown] == teamPlayer) || {dateToNumber date > _dateLimitNum}
};

if (dateToNumber date > _dateLimitNum) then {
	[_taskId, "CON", "FAILED", true] call A3A_fnc_taskSetState;
} else {
	[_taskId, "CON", "SUCCEEDED", true] call A3A_fnc_taskSetState;

	if (_difficultX) then {
		[0,800] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-25,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[1800, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{ 
			[450, _x] call A3A_fnc_addMoneyPlayer;
			[20, _x] call A3A_fnc_addScorePlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[20, theBoss] call A3A_fnc_addScorePlayer;
        [200,theBoss, true] call A3A_fnc_addMoneyPlayer;
	} else {
		[0,600] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-20,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[1200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{ 
			[250, _x] call A3A_fnc_addMoneyPlayer;
			[10, _x] call A3A_fnc_addScorePlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[10, theBoss] call A3A_fnc_addScorePlayer;
        [100, theBoss, true] call A3A_fnc_addMoneyPlayer;
	};
};

[_taskId, "CON", 1200] spawn A3A_fnc_taskDelete;

[_groupZombies] spawn A3A_fnc_groupDespawner;