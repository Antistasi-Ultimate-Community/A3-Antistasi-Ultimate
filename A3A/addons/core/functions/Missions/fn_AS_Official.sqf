params ["_markerX"];

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//Mission: Assassinate an official
if (!isServer and hasInterface) exitWith{};

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _leave = false;
private _contactX = objNull;
private _groupContact = grpNull;
private _tsk = "";
private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);
private _positionX = getMarkerPos _markerX;

private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

_nameDest = [_markerX] call A3A_fnc_localizar;
private _taskString = format [
	localize "STR_A3A_Missions_AS_Official_task_desc",
	_faction get "name",
	[_markerX] call A3A_fnc_localizar,
	_displayTime
];

private _taskId = "AS" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_taskString,format [localize "STR_A3A_Missions_AS_Official_task_header", _faction get "name"],_markerX],_positionX,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _grp = createGroup _sideX;
private _officialClass = _faction get "unitOfficial";
private _official = [_grp, _officialClass, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;

private _bodyguardClass = FactionGetTiered(_faction, "unitRifle");
private _pilot = [_grp, _bodyguardClass, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
if (_difficultX) then {
	for "_i" from 1 to 4 do {
	_pilot = [_grp, _bodyguardClass, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
	};
};

_grp selectLeader _official;
sleep 1;

[_grp, "Patrol_Area", 25, 50, 100, false, [], true] call A3A_fnc_patrolLoop;

{[_x] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _grp;

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or (not alive _official)};

if (!alive _official) then {
	[_taskId, "AS", "SUCCEEDED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[0,600] remoteExec ["A3A_fnc_resourcesFIA",2];
		[2400, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{
			[45,_x] call A3A_fnc_addScorePlayer;
    		[800,_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[10,theBoss] call A3A_fnc_addScorePlayer;
		[400,theBoss, true] call A3A_fnc_addMoneyPlayer;
		[_markerX,60] call A3A_fnc_addTimeForIdle;
	} else {
		[0,300] remoteExec ["A3A_fnc_resourcesFIA",2];
		[1800, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		{
			[25,_x] call A3A_fnc_addScorePlayer;
    		[500,_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[5,theBoss] call A3A_fnc_addScorePlayer;
		[200,theBoss, true] call A3A_fnc_addMoneyPlayer;
		[_markerX,30] call A3A_fnc_addTimeForIdle;
	};
} else {
	[_taskId, "AS", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[-1200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-40,theBoss] call A3A_fnc_addScorePlayer;
		[_markerX,-60] call A3A_fnc_addTimeForIdle;
	} else {
		[-600, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_addScorePlayer;
		[_markerX,-30] call A3A_fnc_addTimeForIdle;
	};
};

sleep 30;

{deleteVehicle _x} forEach units _grp;
deleteGroup _grp;

[_taskId, "AS", 1200] spawn A3A_fnc_taskDelete;
