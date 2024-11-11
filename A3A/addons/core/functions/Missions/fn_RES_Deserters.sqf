#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX"];
//Mission: Rescue the prisoners
if (!isServer and hasInterface) exitWith{};
private _effects = [];
private _Deserters = [];
private _vehicles = [];
private _groups = [];
private _props = [];
private _sideX = if (sidesX getVariable [_markerX, sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;
private _limit = if (_difficultX) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	120 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];
private _nameDest = [_markerX] call A3A_fnc_localizar;
private _posHouse = [];
private _countX = 0;
//_houses = nearestObjects [_positionX, ["house"], 50];
private _houses = (nearestObjects [_positionX, ["house"], 2000]) select {!((typeOf _x) in A3A_buildingBlacklist)}; ///some other way is needed, currently can spawn inside outpost
private _houseX = "";
private _potentials = [];
private _spawnPos = [];
for "_i" from 0 to (count _houses) - 1 do {
	_houseX = (_houses select _i);
	_posHouse = [_houseX] call BIS_fnc_buildingPositions;
	if (count _posHouse > 1) then {_potentials pushBack _houseX};
};
if (count _potentials > 0) then {
	_houseX = selectRandom _potentials;
	_spawnPos = _houseX;
	_posHouse = [_houseX] call BIS_fnc_buildingPositions;
	_countX = (count _posHouse);
	if (_countX > 10) then {_countX = 10};
} else {
	_countX = (round random 4) + 3;
	_spawnPos = _positionX;
	for "_i" from 0 to _countX do {
		_postmp = [_positionX, 5, random 360] call BIS_Fnc_relPos;
		_posHouse pushBack _postmp;
	};
};
diag_log _countX;
private _taskId = "RES" + str A3A_taskCount;
if (count _potentials > 0) then {
	[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_Missions_RES_Deserters_task_desc",_nameDest,_displayTime],localize "STR_A3A_Missions_RES_Deserters_task_header",_markerX],_spawnPos,false,0,true,"run",true] call BIS_fnc_taskCreate;///add stringtables
	[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
} else {
	[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_Missions_RES_Deserters_task_desc",_nameDest,_displayTime],localize "STR_A3A_Missions_RES_Deserters_task_header",_markerX],_positionX,false,0,true,"run",true] call BIS_fnc_taskCreate;
	[_taskId, "RES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
};
waitUntil {
    sleep 1;
    (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_spawnPos, distanceSPWN1, distanceSPWN1] isNotEqualTo [] || {dateToNumber date > _dateLimitNum}
};  ///uncomment later
private _infantrySquadArray = [
    selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier),
    selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
] select _difficultX;
private _vehiclePatrol = "";
private _stolenVehicle = "";
_vehiclePatrolType = selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesMilitiaTrucks"));
_stolenVehicleType = if (_difficultX) then {
    selectRandom ((_faction get "vehiclesLightAPCs") +(_faction get "vehiclesLightArmed") + (_faction get "vehiclesTrucks"));
} else {
    selectRandom ((_faction get "vehiclesLightArmed") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaCars") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesMilitiaTrucks"));
}; 
private _nearbyPos = [_spawnPos, 200, 300, 3, 0, 5, 0] call BIS_fnc_findSafePos;
private _patrolGroup1 = [_nearbyPos, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach units _patrolGroup1;
private _PatrolvehData  = [_nearbyPos, 0,_vehiclePatrolType, _sideX] call A3A_fnc_spawnVehicle;
private _Patrolveh = _PatrolvehData select 0;
private _vehCrew = _PatrolvehData select 1;
private _patrolVehgroup = _PatrolvehData select 2;
{ 
    [_x] call A3A_fnc_NATOinit;
} forEach _vehCrew;
[_Patrolveh, _sideX] call A3A_fnc_AIVEHinit;
private _stolenVehicleSpawnPos = [_spawnPos, 5, 50, 3, 0, 5, 0] call BIS_fnc_findSafePos;
private _stolenVehicle = createVehicle [_stolenVehicleType, _stolenVehicleSpawnPos, [], 0, "NONE"];
[_stolenVehicle, teamPlayer] call A3A_fnc_AIVEHinit;
//private _stolenVehgroup = group driver _StolenVehGroup;///not sure how to transfer command of units inside vehicle to player, so for now vehicle will stay empty
private _patrolGroup2 = [];
private _soldersPatrol = [];
if (_difficultX) then {
	_nearbyPos = [_spawnPos, 100, 150, 3, 0, 20, 0] call BIS_fnc_findSafePos;
	_patrolGroup2 = [_nearbyPos, _sideX, _infantrySquadArray] call A3A_fnc_spawnGroup;
	_soldersPatrol append units _patrolGroup2;
	{ 
    	[_x] call A3A_fnc_NATOinit;
	} forEach units _patrolGroup2;
};
_soldersPatrol append units _patrolGroup1;
_soldersPatrol append units _patrolVehgroup;
waitUntil {
    sleep 1;
    (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_spawnPos, 500, 500] isNotEqualTo [] || {dateToNumber date > _dateLimitNum}
};
[_patrolGroup1, _stolenVehicleSpawnPos, 15] call bis_fnc_taskPatrol;
[_patrolVehgroup, _stolenVehicleSpawnPos, 15] call bis_fnc_taskPatrol;
if (_difficultX) then {
	[_patrolGroup2, _stolenVehicleSpawnPos, 15] call bis_fnc_taskPatrol;
};
private _grpDeserters = createGroup teamPlayer;
private _unit = objNull;
private _unitTypes = [(_faction get "unitMilitiaGrunt"),(_faction get "unitMilitiaMarksman"),
(_faction get "unitMilitiaGrenadier"),(_faction get "unitMilitiaSniper"),
(_faction get "unitMilitiaMedic"),(_faction get "unitCrew"),(_faction get "unitPilot"),
"loadouts_occ_militia_Grenadier","loadouts_occ_military_Grenadier","loadouts_occ_elite_Grenadier",
"loadouts_occ_militia_LAT","loadouts_occ_military_LAT","loadouts_occ_elite_LAT",
"loadouts_occ_militia_MachineGunner","loadouts_occ_military_MachineGunner","loadouts_occ_elite_MachineGunner","loadouts_occ_militia_Rifleman","loadouts_occ_military_Rifleman",
"loadouts_occ_elite_Rifleman","loadouts_occ_militia_Marksman","loadouts_occ_military_Marksman","loadouts_occ_elite_Marksman","loadouts_occ_militia_Sniper",
"loadouts_occ_military_Sniper","loadouts_occ_elite_Sniper"];
for "_i" from 0 to _countX do {
	_unitRandom = selectRandom _unitTypes;
	if (_sideX == Occupants) then {
		if (count _potentials > 0) then {
			
			_unit = [_grpDeserters, _unitRandom,_spawnPos, [], 3, "NONE"] call A3A_fnc_createUnit;
			[_unit, selectRandom (A3A_faction_occ get "faces"), selectRandom (A3A_faction_occ get "voices")] call A3A_fnc_setIdentity;
		} else {
			_unit = [_grpDeserters, _unitRandom, (_posHouse select _i), [], 0, "NONE"] call A3A_fnc_createUnit;
			[_unit, selectRandom (A3A_faction_occ get "faces"), selectRandom (A3A_faction_occ get "voices")] call A3A_fnc_setIdentity;
		};
	} else {
		if (count _potentials > 0) then {
			_unit = [_grpDeserters, _unitRandom, (_posHouse select _i), [], 0, "NONE"] call A3A_fnc_createUnit;
			[_unit, selectRandom (A3A_faction_inv get "faces"), selectRandom (A3A_faction_inv get "voices")] call A3A_fnc_setIdentity;
		} else {
			_unit = [_grpDeserters, _unitRandom,_spawnPos, [], 3, "NONE"] call A3A_fnc_createUnit;
			[_unit, selectRandom (A3A_faction_inv get "faces"), selectRandom (A3A_faction_inv get "voices")] call A3A_fnc_setIdentity;
		};
	};
	_unit allowDamage false;
	_unit setCaptive true;
	_unit disableAI "MOVE";
	_unit disableAI "AUTOTARGET";
	_unit disableAI "TARGET";
	_unit setUnitPos "UP";
	_unit setBehaviour "CARELESS";
	_unit allowFleeing 0;
	_Deserters pushBack _unit;
	[_unit,"deserter"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
};
sleep 5;
waitUntil {
    sleep 1;
    (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [getPos _Patrolveh, 400, 400] isNotEqualTo [] || {dateToNumber date > _dateLimitNum}
};

{
_x setCaptive false;
_x enableAI "MOVE";
_x enableAI "AUTOTARGET";
_x enableAI "TARGET";
_x setUnitPos "UP";
_x setBehaviour "AWARE";
} forEach _Deserters;
sleep 30;
{_x allowDamage true;} forEach _Deserters;

if (count _soldersPatrol <= (count (_soldersPatrol))/2) then { ///doesn't work , maybe just send it anyway?
	private _reveal = [_spawnPos , _sideX] call A3A_fnc_calculateSupportCallReveal;
    [_spawnPos, 4, ["QRF"], _sideX, _reveal] remoteExec ["A3A_fnc_createSupport", 2];
};//sending QRF if things didn't go well for patrol group	
	
//};
waitUntil {sleep 1; {alive _x} count _Deserters == 0 or {{(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 50)} count _Deserters > 0}};
private _bonus = if (_difficultX) then {2} else {1};
if ({alive _x} count _Deserters == 0) then {
	[_taskId, "RES", "FAILED"] call A3A_fnc_taskSetState;
	{[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false} forEach _Deserters;
	[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
} else {
	sleep 5;
	[_taskId, "RES", "SUCCEEDED"] call A3A_fnc_taskSetState;
	_countX = {(alive _x) and (_x distance getMarkerPos respawnTeamPlayer < 150)} count _Deserters;
	_hr = 2 * (_countX);
	_resourcesFIA = 100 * _countX*_bonus;
	[_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];
	[0,10*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[Occupants, -(_countX * 1.5), 90] remoteExec ["A3A_fnc_addAggression",2];
	{
		[_countX, _x] call A3A_fnc_addScorePlayer;
		[_countX*10,_x] call A3A_fnc_addMoneyPlayer;
	} forEach (call SCRT_fnc_misc_getRebelPlayers);
	for "_i" from 0 to 2 do {
        [(getMarkerPos respawnTeamPlayer), 6000, 1200, false] spawn SCRT_fnc_common_recon;
        if (hideEnemyMarkers) then {
            [(selectRandom [2,3])] call A3U_fnc_revealRandomZones;
        };
        uiSleep 60;
    };
	private _bonusAmount = round (_countX*_bonus/2);
	[_bonusAmount,theBoss] call A3A_fnc_addScorePlayer;
    [(_bonusAmount*10),theBoss, true] call A3A_fnc_addMoneyPlayer;
	{[_x] join _grpDeserters; [_x] orderGetin false} forEach _Deserters;
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
} forEach _Deserters;
deleteGroup _grpDeserters;
{boxX addWeaponCargoGlobal [_x,1]} forEach _weaponsX;
{boxX addMagazineCargoGlobal [_x,1]} forEach _ammunition;
{boxX addItemCargoGlobal [_x,1]} forEach _items;/// add every item deserter have to the box, current system seems doesn't work
[_taskId, "RES", 1200] spawn A3A_fnc_taskDelete;
