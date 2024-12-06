#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Rescue the prisoners
if (!isServer and hasInterface) exitWith{};

private _faction = A3A_faction_riv;

private _difficultX = random 10 < tierWar && {([] call SCRT_fnc_rivals_rollProbability)};
private _positionX = getMarkerPos _markerX;

private _groups = [];
private _POWs = [];

private _limit = if (_difficultX) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	120 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _nameDest = [_markerX] call A3A_fnc_localizar;

private _taskId = "RES" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_Missions_RIV_RES_Prisoners_task_desc",_faction get "name", _nameDest, _displayTime],localize "STR_A3A_Missions_RIV_RES_Prisoners_task_header",_markerX],_positionX,false,0,true,"run",true] call BIS_fnc_taskCreate;
[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _posHouse = [];
private _countX = 0;
//_houses = nearestObjects [_positionX, ["house"], 50];
private _houses = (nearestObjects [_positionX, ["house"], 50]) select {!((typeOf _x) in A3A_buildingBlacklist)};
private _houseX = "";
private _potentials = [];
for "_i" from 0 to (count _houses) - 1 do {
	_houseX = (_houses select _i);
	_posHouse = [_houseX] call BIS_fnc_buildingPositions;
	if (count _posHouse > 1) then {_potentials pushBack _houseX};
};

if (count _potentials > 0) then {
	_houseX = selectRandom _potentials;
	_posHouse = [_houseX] call BIS_fnc_buildingPositions;
	_countX = (count _posHouse) - 1;
	if (_countX > 7) then {_countX = 7};
} else {
	_countX = round random 7;
	for "_i" from 0 to _countX do {
		_postmp = [_positionX, 5, random 360] call BIS_Fnc_relPos;
		_posHouse pushBack _postmp;
	};
};

private _grpPOW = createGroup teamPlayer;

for "_i" from 0 to _countX do {
	private _unit = [_grpPOW, FactionGet(reb,"unitUnarmed"), (_posHouse select _i), [], 0, "NONE"] call A3A_fnc_createUnit;
	[_unit, createHashMapFromArray [["face", selectRandom (A3A_faction_reb get "faces")], ["speaker", selectRandom (A3A_faction_reb get "voices")]]] call A3A_fnc_setIdentity;
	_unit allowDamage false;
	_unit setCaptive true;
	_unit disableAI "MOVE";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	_unit setUnitPos "UP";
	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	//_unit disableAI "ANIM";
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	sleep 1;
	//if (alive _unit) then {_unit playMove "UnaErcPoslechVelitele1";};
	_POWS pushBack _unit;
	[_unit,"prisonerX"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
	[_unit] call A3A_fnc_reDress;
};

_groups pushBack _grpPOW;

sleep 5;

{_x allowDamage true} forEach _POWS;

waitUntil {sleep 1; 
{alive _x} count _POWs == 0 or 
{(call SCRT_fnc_misc_getRebelPlayers) inAreaArray [getMarkerPos _markerX, distanceSPWN1, distanceSPWN1] isNotEqualTo [] or
{{(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0 or 
{dateToNumber date > _dateLimitNum
}}}};

private _patrolMrk = nil;

if (dateToNumber date < _dateLimitNum && {alive _x} count _POWs > 0) then {
	private _patrolCount = nil;
	private _patrolPool = nil;

	if (_difficultX) then {
		_patrolCount = 2;
		_patrolPool = (_faction get "groupsSquad") + (_faction get "groupsFireteam");
	} else {
		_patrolCount = 1;
		_patrolPool = (_faction get "groupsFireteam");
	};

	_patrolMrk = createMarkerLocal [format ["%1patrolarea", floor random 10000], (position _houseX)];
	_patrolMrk setMarkerShapeLocal "RECTANGLE";
	_patrolMrk setMarkerSizeLocal [50,50];
	_patrolMrk setMarkerTypeLocal "hd_warning";
	_patrolMrk setMarkerColorLocal "ColorRed";
	_patrolMrk setMarkerBrushLocal "DiagGrid";
	_patrolMrk setMarkerAlphaLocal 0;

	for "_i" from 1 to _patrolCount do {
		private _patrolGroup = [_positionX, Rivals, (selectRandom _patrolPool)] call A3A_fnc_RivalsSpawnGroup;
		(units _patrolGroup) apply {
			[_x] call A3A_fnc_NATOinit;
		};
		[_patrolGroup, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;

		_groups pushBack _patrolGroup;
	};
};

if (_difficultX) then {
	[_positionX, 300, 101] spawn SCRT_fnc_rivals_encounter_carDemo;
};


waitUntil {sleep 1; {alive _x} count _POWs == 0 or {{(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0 or {dateToNumber date > _dateLimitNum}}};

if (dateToNumber date > _dateLimitNum) then {
	if (spawner getVariable _markerX == 2) then {
		{
			if (group _x == _grpPOW) then {
				_x setDamage 1;
			};
		} forEach _POWS;
	} else {
		{
		if (group _x == _grpPOW) then
			{
			_x setCaptive false;
			_x enableAI "MOVE";
			_x doMove _positionX;
			};
		} forEach _POWS;
	};
};

waitUntil {sleep 1; {alive _x} count _POWs == 0 or {{(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0}};

private _bonus = if (_difficultX) then {2} else {1};

if ({alive _x} count _POWs == 0) then {
	[_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
	{[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false} forEach _POWs;
	[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;

	{ A3A_curHQInfoInv = A3A_curHQInfoInv + 0.15 + random 0.3 } remoteExecCall ["call", 2];
} else {
	sleep 5;
	[_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;
	_countX = {(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 150)} count _POWs;
	_hr = 2 * (_countX);
	_resourcesFIA = 100 * _countX*_bonus;
	[_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
	[0,10*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[Occupants, -(_countX * 1.5), 90] remoteExec ["A3A_fnc_addAggression",2];

	{
		[_countX, _x] call A3A_fnc_addScorePlayer;
		[_countX*10,_x] call A3A_fnc_addMoneyPlayer;
	} forEach (call SCRT_fnc_misc_getRebelPlayers);

	private _bonusAmount = round (_countX*_bonus/2);
	[_bonusAmount,theBoss] call A3A_fnc_addScorePlayer;
    [(_bonusAmount*10),theBoss, true] call A3A_fnc_addMoneyPlayer;

	{[_x] join _grpPOW; [_x] orderGetin false} forEach _POWs;

	[15*_bonus, (100/baseRivalsDecay)] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
	[5*_bonus] remoteExecCall ["SCRT_fnc_rivals_addProgressToRivalsLocationReveal", 2];
};

sleep 60;

private _items = [];
private _ammunition = [];
private _weaponsX = [];
{
	private _unit = _x;
	if (_unit distance getMarkerPos respawnTeamPlayer < 150) then {
		{if (not(([_x] call BIS_fnc_baseWeapon) in unlockedWeapons)) then {_weaponsX pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _unit;
		{if (not(_x in unlockedMagazines)) then {_ammunition pushBack _x}} forEach magazines _unit;
		_items = _items + (items _unit) + (primaryWeaponItems _unit) + (assignedItems _unit) + (secondaryWeaponItems _unit);
	};
	deleteVehicle _unit;
} forEach _POWs;

if (!isNil "_patrolMrk") then {
	deleteMarker _patrolMrk;
};

{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

{boxX addWeaponCargoGlobal [_x,1]} forEach _weaponsX;
{boxX addMagazineCargoGlobal [_x,1]} forEach _ammunition;
{boxX addItemCargoGlobal [_x,1]} forEach _items;

[_taskId, "RES", 1200] spawn A3A_fnc_taskDelete;
