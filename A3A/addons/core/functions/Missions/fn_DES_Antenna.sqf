#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_antenna"];

//Mission: Destroy the antenna
if (!isServer and hasInterface) exitWith{};

private _markerX = [markersX, _antenna] call BIS_fnc_nearestPosition;

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _positionX = getPos _antenna;

private _side = sidesX getVariable [_markerX, sideUnknown];

private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	120 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _mrkFinal = createMarker [format ["DES%1", random 100], _positionX];
_mrkFinal setMarkerShape "ICON";

private _taskId = "DES" + str A3A_taskCount;
[
	[teamPlayer,civilian],
	_taskId,
	[
		[ "STR_A3A_Missions_DES_Antenna_task_desc",_nameDest,_displayTime,FactionGet(occ,"name")],
		[ "STR_A3A_Missions_DES_Antenna_task_header"],
		_mrkFinal
	],
	_positionX,
	false,
	0,
	true,
	"Destroy",
	true
	] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
waitUntil {sleep 1; dateToNumber date > _dateLimitNum or {!alive _antenna or {!(sidesX getVariable [_markerX,sideUnknown] == Occupants)}}};

private _bonus = if (_difficultX) then {2} else {1};

if (dateToNumber date > _dateLimitNum) then {
	[_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
	[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    [_side, -5, 60] remoteExec ["A3A_fnc_addAggression", 2];
} else {
	sleep 15;
	[_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [_side, 15, 90] remoteExec ["A3A_fnc_addAggression", 2];
	[600*_bonus, _side] remoteExec ["A3A_fnc_timingCA",2];
    { 
		[10*_bonus,_x] call A3A_fnc_addScorePlayer;
    	[400*_bonus,_x] call A3A_fnc_addMoneyPlayer;
	} forEach (call SCRT_fnc_misc_getRebelPlayers);
	
	[10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    [200*_bonus,theBoss, true] call A3A_fnc_addMoneyPlayer;
};

deleteMarker _mrkFinal;

[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;
