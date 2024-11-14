#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Eliminate a defector
if (!isServer and hasInterface) exitWith{};

private _vehicles = [];
private _groups = [];

private _faction = A3A_faction_riv;

private _isDifficult = random 10 < tierWar && {[] call SCRT_fnc_rivals_rollProbability};
private _positionX = getMarkerPos _markerX;

private _limit = if (_isDifficult) then {
	45 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _radiusX = [_markerX] call A3A_fnc_sizeMarker;
private _houses = (nearestObjects [_positionX, ["house"], _radiusX]) select {!((typeOf _x) in A3A_buildingBlacklist)};
private _posHouse = [];
private _houseX = _houses select 0;
while {count _posHouse < 3} do {
	_houseX = selectRandom _houses;
	_posHouse = _houseX buildingPos -1;
	if (count _posHouse < 3) then {_houses = _houses - [_houseX]};
};

private _max = (count _posHouse) - 1;
private _rnd = floor random _max;
private _posTraitor = _posHouse select _rnd;
private _posSol1 = _posHouse select (_rnd + 1);
private _posSol2 = (_houseX buildingExit 0);

private _nameDest = [_markerX] call A3A_fnc_localizar;

private _groupTraitor = createGroup Invaders;
private _bodyguardClass = selectRandom [
	_faction get "unitRifle",
	_faction get "unitPartisan",
	_faction get "unitEnforcer",
	_faction get "unitMercenary",
	_faction get "unitSaboteur",
	_faction get "unitOppressor"
];
private _traitor = [_groupTraitor, _faction get "unitCommander", _posTraitor, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
_traitor allowDamage false;
_traitor setPos _posTraitor;
[_traitor, selectRandom (A3A_faction_reb get "faces"), selectRandom (A3A_faction_reb get "voices")] call A3A_fnc_setIdentity;

[_traitor, 100, (random 3)] call SCRT_fnc_common_addRandomMoneyMagazine;
_traitor setVariable ["hasLaptop", true, true];
_traitor addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	if (_unit getVariable ["hasLaptopSpawned", false]) exitWith {
		_unit removeEventHandler ["Killed",_thisEventHandler];
	};

	[_unit] call SCRT_fnc_rivals_createLaptop;
	_unit setVariable ["hasLaptopSpawned", true, true];
	_unit removeEventHandler ["Killed",_thisEventHandler];
}];

private _sol1 = [_groupTraitor, _bodyguardClass, _posSol1, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
private _sol2 = [_groupTraitor, _bodyguardClass, _posSol2, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
_groupTraitor selectLeader _traitor;

{[_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _groupTraitor;
_groups pushBack _groupTraitor;

private _posTsk = (position _houseX) getPos [random 100, random 360];

private _taskId = "AS" + str A3A_taskCount;
[
	[teamPlayer,civilian],
	_taskID,
	[
		format [localize "STR_A3A_Missions_AS_RIV_Traitor_task_desc", A3A_faction_riv get "name", A3A_faction_reb get "name", _nameDest, _displayTime],
		localize "STR_A3A_Missions_AS_RIV_Traitor_task_header",
		_markerX
	],
	_posTsk,
	false,
	0,
	true,
	"run",
	true
] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

sleep 15;
_traitor allowDamage true;
{_x disableAI "MOVE"; _x setUnitPos "UP"} forEach units _groupTraitor;

waitUntil {sleep 1; (call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_positionX, distanceSPWN1, distanceSPWN1] isNotEqualTo [] || {dateToNumber date > _dateLimitNum}};

private _patrolGroups = [];

if (dateToNumber date < _dateLimitNum && alive _traitor) then {
	private _patrolCount = nil;
	private _patrolPool = nil;
	if (_isDifficult) then {
		_patrolCount = 1;
		_patrolPool = _faction get "groupsSquad";
	} else {
		_patrolCount = 2;
		_patrolPool = _faction get "groupsFireteam";
	};

	for "_i" from 0 to _patrolCount do {
		private _patrolGroup = [_positionX, Rivals, (selectRandom _patrolPool)] call A3A_fnc_RivalsSpawnGroup;
		(units _patrolGroup) apply {
			private _unit = _x;
			{_unit disableAI _x} forEach ["CHECKVISIBLE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET"];
			_unit allowDamage false;
			_unit setCaptive true;
			[_unit,""] call A3A_fnc_NATOinit;
		};
		[_groupX, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

		_groups pushBack _patrolGroup;
		_patrolGroups pushBack _patrolGroup;
	};

	if (_isDifficult) then {
		private _vehicleClass = selectRandom (A3A_faction_riv get "vehiclesRivalsLightArmed");

		private _vehiclePosAndDir = [_positionX, _vehicleClass] call SCRT_fnc_common_findSafePositionForVehicle; 
		private _patrolVehicleData = [(_vehiclePosAndDir select 0), 0, _vehicleClass, Rivals] call A3A_fnc_RivalsSpawnVehicle;
		private _patrolVeh = _patrolVehicleData select 0;
		_patrolVeh setDir (_vehiclePosAndDir select 1);
		private _patrolVehCrew = _patrolVehicleData select 1;
		private _patrolVehGroup = _patrolVehicleData select 2;

		_patrolVehCrew apply {
			private _unit = _x;
			{_unit disableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET", "ANIM"];
			_unit allowDamage false;
			_unit setCaptive true;
			[_unit] call A3A_fnc_NATOinit;
		};

		[_patrolVeh, Rivals] call A3A_fnc_AIVEHinit;

		_groups pushBack _patrolVehGroup;
		_patrolGroups pushBack _patrolVehGroup;
		_vehicles pushBack _patrolVeh;

		[_patrolVehGroup, _positionX, 250] call bis_fnc_taskPatrol;
	};
};


waitUntil {
	sleep 1;
	
	dateToNumber date > _dateLimitNum ||
	{!alive _traitor ||
	{(call SCRT_fnc_misc_getRebelPlayers) inAreaArray [_positionX, distanceSPWN, distanceSPWN] isNotEqualTo []
}}};

//////////////////////////////////////////////
//  Activate all units        	            //
//////////////////////////////////////////////
{
    private _group = _x;
    (units _group) apply {
        private _unit = _x;
        {_unit enableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET", "ANIM"];
        _unit allowDamage true;
        _unit setCaptive false;
    };
} forEach _patrolGroups;

[_positionX, _traitor, _isDifficult] spawn {
    params ["_positionX", "_traitor", "_isDifficult"];
    if (!(alive _traitor)) exitWith {};

    sleep (random [120, 240, 360]);

    private _chance = if (_isDifficult) then {20} else {10};
    if ((random 100) > _chance) exitWith {}; 

    private _event = selectRandom [200, 300];

    switch _event do {
        case 200: {
            [[_positionX], "SCRT_fnc_rivals_encounter_uavFlyby"] call A3A_fnc_scheduler;
        };
        case 300: {
            [[_positionX], "SCRT_fnc_rivals_encounter_rovingMortar"] call A3A_fnc_scheduler;
        };
    };
};

waitUntil {
	sleep 1;
	dateToNumber date > _dateLimitNum || {!alive _traitor}
};

private _factor = [1,2] select (_isDifficult);

if (!alive _traitor) then {
	[_taskId, "AS", "SUCCEEDED", true] call A3A_fnc_taskSetState;

    Debug("aggroEvent | Rebels won a rivals traitor mission");

	[20*_factor, (100/baseRivalsDecay)] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
	[10*_factor] remoteExecCall ["SCRT_fnc_rivals_addProgressToRivalsLocationReveal", 2];

	[0,300 * _factor] remoteExec ["A3A_fnc_resourcesFIA",2];
	{
		[300 * _factor,_x] call A3A_fnc_addMoneyPlayer;
		[15 * _factor,_x] call A3A_fnc_addScorePlayer;
	} forEach (call SCRT_fnc_misc_getRebelPlayers);
	[5 * _factor,theBoss] call A3A_fnc_addScorePlayer;
	[200 * _factor,theBoss, true] call A3A_fnc_addMoneyPlayer;
} else {
	[_taskId, "AS", "FAILED", true] call A3A_fnc_taskSetState;
	if (_isDifficult) then {[-20,theBoss] call A3A_fnc_addScorePlayer} else {[-10,theBoss] call A3A_fnc_addScorePlayer};
	if (dateToNumber date > _dateLimitNum) then {
		_hrT = server getVariable "hr";
		_resourcesFIAT = server getVariable "resourcesFIA";
		[-1*(round(_hrT/3)),-1*(round(_resourcesFIAT/3))] remoteExec ["A3A_fnc_resourcesFIA",2];
		[-10*_factor, 90] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
		{ A3A_curHQInfoInv = A3A_curHQInfoInv + 0.25 + random 0.5 } remoteExecCall ["call", 2];
	};
};

sleep 30;

[_taskId, "AS", 1200, true] spawn A3A_fnc_taskDelete;

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

Info("Rivals Eliminate the Defector cleanup complete.");