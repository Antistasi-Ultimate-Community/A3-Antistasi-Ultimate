#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

if (!isServer and hasInterface) exitWith{};

private _difficultX = if (random 10 < tierWar) then {true} else {false};
private _positionX = getMarkerPos _markerX;
private _sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _typeVehX = selectRandom (_faction get "vehiclesAmmoTrucks");
private _size = [_markerX] call A3A_fnc_sizeMarker;

private _road = [_positionX] call A3A_fnc_findNearestGoodRoad;
private _pos = position _road;
_pos = _pos findEmptyPosition [1,60,_typeVehX];
if (count _pos == 0) then {_pos = position _road};

private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_Missions_LOG_Ammo_task_desc",_nameDest,_displayTime],localize "STR_A3A_Missions_LOG_Ammo_task_header",_markerX],_pos,false,0,true,"rearm",true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {sleep 1;(dateToNumber date > _dateLimitNum) or {(spawner getVariable _markerX != 2 and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))}};
private _bonus = if (_difficultX) then {2} else {1};
private _truckX = objNull;
private _groupX = nil;
private _groupX1 = nil;

if ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) then {
	private _truckX = _typeVehX createVehicle _pos;
	_truckX setDir (getDir _road);
	[_truckX] spawn A3A_fnc_fillLootCrate;
	[_truckX, _sideX] call A3A_fnc_AIVEHinit;

	private _mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _pos];
	_mrk setMarkerShapeLocal "RECTANGLE";
	_mrk setMarkerSizeLocal [20,20];
	_mrk setMarkerTypeLocal "hd_warning";
	_mrk setMarkerColorLocal "ColorRed";
	_mrk setMarkerBrushLocal "DiagGrid";
	if (!debug) then {_mrk setMarkerAlphaLocal 0};
	private _typeGroup = if (_difficultX) then {
		selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
	} else {
		selectRandom ([_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier)
	};
	_groupX = [_pos,_sideX, _typeGroup] call A3A_fnc_spawnGroup;
	sleep 1;
	if (random 10 < 33) then
		{
		_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
		[_dog] spawn A3A_fnc_guardDog;
		};

	[_groupX, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

	_groupX1 = [_pos,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
	sleep 1;

	[_groupX1, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

	{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;
	{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX1;

	private _fnc_truckReturnedToBase = {
		//DistanceSqr is faster, and we're hard coding it anyway.
		(_truckX distanceSqr posHQ) < 10000;
	};

	waitUntil {sleep 3; (not alive _truckX) or (dateToNumber date > _dateLimitNum) or (call _fnc_truckReturnedToBase)};

	if (dateToNumber date > _dateLimitNum) then {
		[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
		[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
		[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
	};
	if (!alive _truckX or {(call _fnc_truckReturnedToBase)}) then {

			[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
			[0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
			[1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
			{
				[15 * _bonus,_x] call A3A_fnc_addScorePlayer;
    			[300 * _bonus,_x] call A3A_fnc_addMoneyPlayer;
			} forEach (call SCRT_fnc_misc_getRebelPlayers);
			[5,theBoss] call A3A_fnc_addScorePlayer;
			[200,theBoss, true] call A3A_fnc_addMoneyPlayer;
		};
} else {
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState;
	[-1200*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
	[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
};

[_taskId, "LOG", 1200] spawn A3A_fnc_taskDelete;
if (!isNull _truckX) then {
	// TODO: Head off to nearby base
	[_groupX] spawn A3A_fnc_groupDespawner;
	[_groupX1] spawn A3A_fnc_groupDespawner;
	[_truckX] spawn A3A_fnc_vehDespawner;
	// delete truck contents maybe?
};
