#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX", "_antennaDead"];

//Mission: Repair the antenna
if (!isServer and hasInterface) exitWith{};

(60 call SCRT_fnc_misc_getTimeLimit) params ["_dateLimitNum", "_displayTime"];

private _nameDest = [_markerX] call A3A_fnc_localizar;

private _taskId = "REP" + str A3A_taskCount;
[
	[teamPlayer, civilian],
	_taskId,
	[
		format [localize "STR_A3A_Missions_REP_Antenna_task_desc",FactionGet(occ,"name"),_nameDest,_displayTime],
		localize "STR_A3A_Missions_REP_Antenna_task_header",
		_markerX
	],
	getPos _antennaDead,
	false, 0, true, "Destroy", true
] call BIS_fnc_taskCreate;
[_taskId, "REP", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (spawner getVariable _markerX != 2)};

private _truckCreated = false;

if (spawner getVariable _markerX != 2) then {
	_truckCreated = true;
	private _size = [_markerX] call A3A_fnc_sizeMarker;
	private _road = [getPos _antennaDead] call A3A_fnc_findNearestGoodRoad;
	private _pos = position _road;
	_pos = _pos findEmptyPosition [1,60,"B_T_Truck_01_repair_F"];
	private _veh = createVehicle [selectRandomWeighted (FactionGet(occ,"vehiclesRepairTrucks")), _pos, [], 0, "NONE"];
	_veh allowdamage false;
	_veh setDir (getDir _road);
	[_veh, Occupants] call A3A_fnc_AIVEHinit;
	private _groupX = createGroup Occupants;

	sleep 5;
	_veh allowDamage true;

	for "_i" from 1 to 3 do {
		_unit = [_groupX, FactionGet(occ,"unitCrew"), _pos, [], 0, "NONE"] call A3A_fnc_createUnit;
		[_unit,""] call A3A_fnc_NATOinit;
		sleep 2;
	};

	waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or (not alive _veh)};

	if (not alive _veh) then {
		[_taskId, "REP", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [Occupants, 15, 90] remoteExec ["A3A_fnc_addAggression", 2];
        [Invaders, 5, 60] remoteExec ["A3A_fnc_addAggression", 2];
		[1200, Occupants] remoteExec ["A3A_fnc_timingCA",2];
		{
			[10,_x] call A3A_fnc_addScorePlayer;
    		[250,_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[5,theBoss] call A3A_fnc_addScorePlayer;
		[150,theBoss, true] call A3A_fnc_addMoneyPlayer;
	};
};


if (dateToNumber date > _dateLimitNum) then {
	if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then {
		[_taskId, "REP", "SUCCEEDED"] call A3A_fnc_taskSetState;
        [Occupants, 15, 90] remoteExec ["A3A_fnc_addAggression", 2];
        [Invaders, 5, 60] remoteExec ["A3A_fnc_addAggression", 2];
		[1200, Occupants] remoteExec ["A3A_fnc_timingCA",2];
		{ 
			[10,_x] call A3A_fnc_addScorePlayer;
    	   	[250,_x] call A3A_fnc_addMoneyPlayer; 
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[5,theBoss] call A3A_fnc_addScorePlayer;
		[150,theBoss, true] call A3A_fnc_addMoneyPlayer;
	} else {
		[_taskId, "REP", "FAILED"] call A3A_fnc_taskSetState;
		//[5,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-600, Occupants] remoteExec ["A3A_fnc_timingCA",2];
		[-10,theBoss] call A3A_fnc_addScorePlayer;
	};
	[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];
};

[_taskId, "REP", 30] spawn A3A_fnc_taskDelete;

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

// could make these guys return home, too much work atm
if (isNil "_groupX") exitWith {};
[_groupX] spawn A3A_fnc_groupDespawner;
[_veh] spawn A3A_fnc_vehDespawner;
