#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

//Mission: Capture military administration
if (!isServer and hasInterface) exitWith{};

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _milAdministrationPos = getMarkerPos _marker;

private _limit = if (_difficultX) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _markerSide = sidesX getVariable [_marker, sideUnknown];

private _nameDest = [_marker] call A3A_fnc_localizar;
private _textX = [ "STR_CON_MilAdmin_desc", _nameDest, _displayTime];
private _taskName = [ "STR_CON_MilAdmin_task"];

private _taskId = "CON" + str A3A_taskCount;
[ [teamPlayer,civilian],
  _taskId,
  [ _textX,
    _taskName,
    _marker
  ],
  _milAdministrationPos,
  false,
  0,
  true,
  "attack",
  true
  ] call BIS_fnc_taskCreate;
[_taskId, "CON", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];


private _milAdministrationIndex = A3A_milAdministrations findIf { _milAdministrationPos distance2D _x < 30 };
if (_milAdministrationIndex isEqualTo -1) exitWith {
	Error_1("For some reason %1 mil administration has no corresponding building, aborting.", _marker);
};

private _milAdministration = A3A_milAdministrations select _milAdministrationIndex;
private _positionsTuple = _milAdministration call SCRT_fnc_common_getMilAdminGarrisonPositions;
private _buildingPositions = _positionsTuple select 0;

waitUntil {sleep 1; dateToNumber date > _dateLimitNum or {sidesX getVariable [_marker,sideUnknown] == teamPlayer}};

if (dateToNumber date > _dateLimitNum) then {
	[_taskId, "CON", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[25,0,_milAdministrationPos] remoteExec ["A3A_fnc_citySupportChange",2];
		[-1800, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_addScorePlayer;
	} else {
		[5,0,_milAdministrationPos] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_addScorePlayer;
	};
} else {
	sleep 10;
	[_taskId, "CON", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[0,800] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-25,0,_milAdministrationPos] remoteExec ["A3A_fnc_citySupportChange",2];
		[1800, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{ 
			[600, _x] call A3A_fnc_addMoneyPlayer;
			[20, _x] call A3A_fnc_addScorePlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[20, theBoss] call A3A_fnc_addScorePlayer;
        [200,theBoss, true] call A3A_fnc_addMoneyPlayer;
	} else {
		[0,600] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-20,0,_milAdministrationPos] remoteExec ["A3A_fnc_citySupportChange",2];
		[1200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		{ 
			[400, _x] call A3A_fnc_addMoneyPlayer;
			[10, _x] call A3A_fnc_addScorePlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[10, theBoss] call A3A_fnc_addScorePlayer;
        [100, theBoss, true] call A3A_fnc_addMoneyPlayer;
	};
};

[_taskId, "CON", 1200] spawn A3A_fnc_taskDelete;
