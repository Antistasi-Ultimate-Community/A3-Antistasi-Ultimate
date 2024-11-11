params ["_markerX"];

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
//Mission: Rescue the refugees
if (!isServer and hasInterface) exitWith{};

private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;
private _POWs = [];

private _radiusX = [_markerX] call A3A_fnc_sizeMarker;
//_houses = nearestObjects [_positionX, ["house"], _radiusX];
private _houses = (nearestObjects [_positionX, ["house"], _radiusX]) select {!((typeOf _x) in A3A_buildingBlacklist)};
private _posHouse = [];
private _houseX = _houses select 0;
while {count _posHouse < 3} do {
	_houseX = selectRandom _houses;
	_posHouse = _houseX buildingPos -1;
	if (count _posHouse < 3) then {_houses = _houses - [_houseX]};
};

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _sideX = if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);

private _text = nil;
private _header = nil;
private _posTsk = nil;

if (_sideX == Occupants) then {
	_text = format [localize "STR_A3A_Missions_RES_Refugees_task_desc_1",FactionGet(reb, "name"), _nameDest,_displayTime];
	_header = format [localize "STR_A3A_Missions_RES_Refugees_task_header_1",FactionGet(reb, "name")];
	_posTsk = (position _houseX) getPos [random 100, random 360];
} else {
	_text = format [localize "STR_A3A_Missions_RES_Refugees_task_desc_2",_nameDest, _faction get "name",_displayTime];
	_header = localize "STR_A3A_Missions_RES_Refugees_task_header_2";
	_posTsk = position _houseX;
};

private _taskId = "RES" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_text,_header,_nameDest],_posTsk,false,0,true,"run",true] call BIS_fnc_taskCreate;
[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_groupPOW = createGroup teamPlayer;
for "_i" from 1 to (((count _posHouse) - 1) min 6) do {
	_unit = [_groupPOW, FactionGet(reb,"unitUnarmed"), _posHouse select _i, [], 0, "NONE"] call A3A_fnc_createUnit;
	[_unit, selectRandom (A3A_faction_reb get "faces"), selectRandom (A3A_faction_reb get "voices")] call A3A_fnc_setIdentity;
	_unit allowdamage false;
	_unit disableAI "MOVE";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	_unit setSkill 0;
	_POWs pushBack _unit;
	[_unit,"refugee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
	if (_sideX == Occupants) then {_unit setCaptive true};
	[_unit] call A3A_fnc_reDress;
	sleep 0.5;
};

sleep 5;

{_x allowDamage true} forEach _POWs;

sleep 30;
private _groupX = grpNull;
private _veh = objNull;
private _groupX1 = grpNull;
if (_sideX == Invaders) then {
	[_houseX, _difficultX] spawn
	{
		params ["_house", "_isDifficult"];
		if (_isDifficult) then {sleep 300} else {sleep (300 + random 1800)};
		if !(_taskId call BIS_fnc_taskCompleted) then
		{
			// Needs rework, probably
            		private _reveal = [_positionX , Invaders] call A3A_fnc_calculateSupportCallReveal;
            		[getPos _house, 4, ["QRF"], Invaders, _reveal] remoteExec ["A3A_fnc_createSupport", 2];
		};
	};
} else {
	_posVeh = [];
	_dirVeh = 0;
	_roads = [];
	_radius = 20;
	while {count _roads == 0} do
		{
		_roads = (getPos _houseX) nearRoads _radius;
		_radius = _radius + 10;
		};
	_road = _roads select 0;
	_posroad = getPos _road;
	_roadcon = roadsConnectedto _road; if (count _roadCon == 0) then {
        Error_1("Road has no connection :%1.",position _road);
		};
	if (count _roadCon > 0) then
		{
		_posrel = getPos (_roadcon select 0);
		_dirveh = [_posroad,_posrel] call BIS_fnc_DirTo;
		}
	else
		{
		_dirVeh = getDir _road;
		};
	_posVeh = [_posroad, 3, _dirveh + 90] call BIS_Fnc_relPos;
	_veh = (selectRandom (_faction get "vehiclesPolice")) createVehicle _posVeh;
	_veh allowDamage false;
	_veh setDir _dirVeh;
	sleep 15;
	_veh allowDamage true;
	_nul = [_veh, Occupants] call A3A_fnc_AIVEHinit;
	if ((random 100 < aggressionOccupants) or (_difficultX)) then
		{
		_groupX = [getPos _houseX,Occupants, selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)] call A3A_fnc_spawnGroup;
		sleep 1;
		}
	else
		{
		_groupX = createGroup Occupants;
		_groupX = [getPos _houseX,Occupants, _faction get "groupPoliceSquad"] call A3A_fnc_spawnGroup;
		};
	if (random 10 < 2.5) then
		{
		_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
		[_dog] spawn A3A_fnc_guardDog;
		};

	[_groupX, "Patrol_Area", 25, 50, 100, true, _positionX, true] call A3A_fnc_patrolLoop;
	
	{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;
	_groupX1 = [_houseX buildingExit 0, Occupants, _faction get "groupPolice"] call A3A_fnc_spawnGroup;
};

private _bonus = if (_difficultX) then {2} else {1};

if (_sideX == Occupants) then {
	waitUntil {sleep 1; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0) or (dateToNumber date > _dateLimitNum)};
	if ({(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0) then {
		sleep 5;
		[_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;
		_countX = {(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 150)} count _POWs;
		_hr = _countX;
		_resourcesFIA = 100 * _countX;
		[_hr,_resourcesFIA*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
		[Occupants, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
		{
			[_countX*_bonus, _x] call A3A_fnc_addScorePlayer;
			[_countX*_bonus*10,_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);

		private _bonusAmount = round (_countX*_bonus/2);
		[_bonusAmount,theBoss] call A3A_fnc_addScorePlayer;
		[(_bonusAmount*10),theBoss, true] call A3A_fnc_addMoneyPlayer;
		{[_x] join _groupPOW; [_x] orderGetin false} forEach _POWs;
	} else {
		[_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
		[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
	};
} else {
	waitUntil {sleep 1; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _POWs > 0)};
	if ({alive _x} count _POWs == 0) then {
		[_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
		[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
	} else {
		[_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;
		_countX = {(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 150)} count _POWs;
		_hr = _countX;
		_resourcesFIA = 100 * _countX;
		[_hr,_resourcesFIA*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
		{
			[_countX*_bonus, _x] call A3A_fnc_addScorePlayer;
			[_countX*_bonus*10,_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);

		private _bonusAmount = round (_countX*_bonus/2);
		[_bonusAmount,theBoss] call A3A_fnc_addScorePlayer;
		[(_bonusAmount*10),theBoss, true] call A3A_fnc_addMoneyPlayer;
		{[_x] join _groupPOW; [_x] orderGetin false} forEach _POWs;
	};
};

sleep 60;
_items = [];
_ammunition = [];
_weaponsX = [];
{
_unit = _x;
if (_unit distance getMarkerPos respawnTeamPlayer < 150) then
	{
	{if (not(([_x] call BIS_fnc_baseWeapon) in unlockedWeapons)) then {_weaponsX pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _unit;
	{if (not(_x in unlockedMagazines)) then {_ammunition pushBack _x}} forEach magazines _unit;
	_items = _items + (items _unit) + (primaryWeaponItems _unit) + (assignedItems _unit) + (secondaryWeaponItems _unit);
	};
deleteVehicle _unit;
} forEach _POWs;
deleteGroup _groupPOW;
{boxX addWeaponCargoGlobal [_x,1]} forEach _weaponsX;
{boxX addMagazineCargoGlobal [_x,1]} forEach _ammunition;
{boxX addItemCargoGlobal [_x,1]} forEach _items;

if (_sideX == Occupants) then
{
	if (!isNull _veh) then { [_veh] spawn A3A_fnc_vehDespawner };
	if (!isNull _groupX1) then { [_groupX1] spawn A3A_fnc_groupDespawner };
	[_groupX] spawn A3A_fnc_groupDespawner;
};

[_taskId, "RES", 1200] spawn A3A_fnc_taskDelete;
