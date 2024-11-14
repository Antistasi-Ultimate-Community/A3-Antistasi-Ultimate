params ["_markerX"];

//Mission: Conquer the outpost
if (!isServer and hasInterface) exitWith{};

private _zones = (outposts + seaports + resourcesX + factories);
private _zonesFrontline = [_zones select {[_x] call A3A_fnc_isFrontlineNoFIA}];
if (_markerX in _zonesFrontline && !(_markerX in controlsX)) exitWith {
	[[_markerX],"A3A_fnc_CON_Outpost_Compet"] remoteExec ["A3A_fnc_scheduler",2];
};

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _positionX = getMarkerPos _markerX;

private _limit = if (_difficultX) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	90 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _markerSide = sidesX getVariable [_markerX, sideUnknown];

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _textX = "";
private _taskName = "";

switch (true) do {
	case (_markerX in resourcesX): {
		_textX = format [localize "STR_CON_Outpost_resources_desc", _nameDest, _displayTime];
		_taskName = localize "STR_CON_Outpost_resources_task";
	};
	case (_markerX in controlsX): {
		_textX = format [localize "STR_CON_Outpost_controls_desc", _nameDest, _displayTime];
		_taskName = localize "STR_CON_Outpost_controls_task";
	};
	default {
		_textX = format [localize "STR_CON_Outpost_outposts_desc", _nameDest, _displayTime];
		_taskName = localize "STR_CON_Outpost_outposts_task";
	};
};

private _taskId = "CON" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskName,_markerX],_positionX,false,0,true,"Target",true] call BIS_fnc_taskCreate;
[_taskId, "CON", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1; dateToNumber date > _dateLimitNum or {sidesX getVariable [_markerX,sideUnknown] == teamPlayer}};

if (dateToNumber date > _dateLimitNum) then {
	[_taskId, "CON", "FAILED"] call A3A_fnc_taskSetState;
	if (_difficultX) then {
		[25,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-1200, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-20,theBoss] call A3A_fnc_addScorePlayer;
	} else {
		[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600, _markerSide] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_addScorePlayer;
	};
} else {
	sleep 10;
	[_taskId, "CON", "SUCCEEDED"] call A3A_fnc_taskSetState;
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
