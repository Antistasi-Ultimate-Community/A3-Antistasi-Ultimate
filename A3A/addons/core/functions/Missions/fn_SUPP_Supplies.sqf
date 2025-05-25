#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Logistic supplies
if (!isServer and hasInterface) exitWith{};

private _groups = [];
private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

private _faction = Faction(Occupants);

private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
} else {
	60 call SCRT_fnc_misc_getTimeLimit
};
_limit params ["_dateLimitNum", "_displayTime"];

private _nameDest = [_markerX] call A3A_fnc_localizar;
private _taskId = "SUPP" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_A3A_Missions_SUPP_Supplies_task_desc",_nameDest,_displayTime],format [localize "STR_A3A_Missions_SUPP_Supplies_task_header", _nameDest],_markerX],_positionX,false,0,true,"Heal",true] call BIS_fnc_taskCreate;
[_taskId, "SUPP", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

//Creating the box
private _pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"Land_FoodSacks_01_cargo_brown_F"];
private _truckX = "Land_FoodSacks_01_cargo_brown_F" createVehicle _pos;
_truckX enableRopeAttach true;
_truckX allowDamage false;
[_truckX] call A3A_Logistics_fnc_addLoadAction;
_truckX addAction ["Delivery infos",
	{
		_text = format [localize "STR_A3A_Missions_SUPP_Supplies_tip",(_this select 0) getVariable "destinationX"]; //This need a rework
		[localize "STR_A3A_Missions_SUPP_Supplies_tip_header", _text] remoteExecCall ["A3A_fnc_customHint",_this select 2];	//This need a rework
	},
	nil,
	0,
	false,
	true,
	"",
	"(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"
];
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
//{_x reveal _truckX} forEach (allPlayers - (entities "HeadlessClient_F"));
_truckX setVariable ["destinationX",_nameDest,true];

[_truckX,localize "STR_marker_supply_box"] spawn A3A_fnc_inmuneConvoy;

waitUntil {sleep 1; dateToNumber date > _dateLimitNum or {spawner getVariable _markerX != 2}};


if ((spawner getVariable _markerX != 2) and {!(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)}) then {
	private _typeGroup = [
		_faction get "groupPoliceTeam",
		_faction get "groupPoliceSquad"
	] select _difficultX;

	private _groupX = [_positionX, Occupants, _typeGroup] call A3A_fnc_spawnGroup;
	[_groupX, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;
	{[_x] call A3A_fnc_NATOinit} forEach units _groupX;

	_groups pushBack _groupX;
};

waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) or ((_truckX distance _positionX < 40) and (isNull attachedTo _truckX) and (isNull ropeAttachedTo _truckX)) or (isNull _truckX)};

private _bonus = if (_difficultX) then {2} else {1};
if ((dateToNumber date > _dateLimitNum) or {isNull _truckX}) then {
	[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
	[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
} else {
	private _countX = if (_difficultX) then {90} else {180};

	if (_difficultX && {spawner getVariable _markerX != 2 && {!(sidesX getVariable [_markerX,sideUnknown] == teamPlayer)}}) then {
		Info("Rebels in area, spawning additional group.");

		private _typeGroup = [
		    _faction get "groupPoliceSquad",
		    selectRandom ([
		        [_faction, "groupsTierSquads", 0] call SCRT_fnc_unit_flattenTier,
		        [_faction, "groupsTierSquadsNoAA", 0] call SCRT_fnc_unit_flattenTier
		    ] select (random 100 > 40))
		] select _difficultX;

		private _group2Position = [_positionX, 450, 700, 0, 0] call BIS_fnc_findSafePos;
		private _groupX2 = [_group2Position, Occupants, _typeGroup] call A3A_fnc_spawnGroup;
		{[_x] call A3A_fnc_NATOinit} forEach units _groupX;
		_groups pushBack _groupX2;

		private _groupX2WP = _groupX2 addWaypoint [(position _truckX), 0];
		_groupX2WP setWaypointType "MOVE";
		_groupX2WP setWaypointCombatMode "YELLOW";
		_groupX2WP setWaypointSpeed "FULL";
	};

	{_friendX = _x;
		if (captive _friendX) then {
			[_friendX,false] remoteExec ["setCaptive",0,_friendX];
			_friendX setCaptive false;
		};
		{
			if (side _x == Occupants and _x distance _positionX < distanceSPWN) then {
				if (_x distance _positionX < 300) then {_x doMove _positionX} else {_x reveal [_friendX,4]};
			};
			if ((side _x == civilian) and (_x distance _positionX < 300) and (vehicle _x == _x)) then {_x doMove position _truckX};
		} forEach allUnits;
	} forEach ([300,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
	while {_countX > 0 and {dateToNumber date < _dateLimitNum and {!isNull _truckX}}} do {
		while {(_countX > 0) and (_truckX distance _positionX < 40) and ({[_x] call A3A_fnc_canFight} count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits) == count ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) and ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits == 0) and (dateToNumber date < _dateLimitNum) and (isNull attachedTo _truckX)} do {
			_formatX = format [localize "STR_A3A_Missions_SUPP_Supplies_enemynear", _countX];
			{if (isPlayer _x) then {[petros,"hint",_formatX,localize "STR_A3A_Missions_SUPP_Supplies_tip_header"] remoteExec ["A3A_fnc_commsMP",_x]}} forEach ([80,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits);
			sleep 1;
			_countX = _countX - 1;
		};
		if (_countX > 0) then {
			if (((_truckX distance _positionX > 40) or (not([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits)) or ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits != 0)) and (alive _truckX)) then {{[petros,"hint","Stay close to the crate, and clean all BLUFOR presence in the surroundings or count will restart", localize "STR_A3A_Missions_SUPP_Supplies_tip_header"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([100,0,_truckX,teamPlayer] call A3A_fnc_distanceUnits)};
			waitUntil {sleep 1; ((_truckX distance _positionX < 40) and ([80,1,_truckX,teamPlayer] call A3A_fnc_distanceUnits) and ({(side _x == Occupants) and (_x distance _truckX < 50)} count allUnits == 0)) or (dateToNumber date > _dateLimitNum) or (isNull _truckX)};
		};
		if (_countX < 1) exitWith {};
	};
	if ((dateToNumber date < _dateLimitNum) and !(isNull _truckX)) then {
		[petros,"hint", format [localize "STR_A3A_Missions_SUPP_Supplies_success", _nameDest], localize "STR_A3A_Missions_SUPP_Supplies_tip_header"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
		[_taskId, "SUPP", "SUCCEEDED"] call A3A_fnc_taskSetState;
		{ 
			[15*_bonus,_x] call A3A_fnc_addScorePlayer;
    		[300*_bonus,_x] call A3A_fnc_addMoneyPlayer;
		} forEach (call SCRT_fnc_misc_getRebelPlayers);
		[5*_bonus,theBoss] call A3A_fnc_addScorePlayer;
    	[100*_bonus,theBoss, true] call A3A_fnc_addMoneyPlayer;
		[-15*_bonus,15*_bonus,_markerX] remoteExec ["A3A_fnc_citySupportChange",2];
		Debug("aggroEvent | Rebels won a supply mission");
		[Occupants, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
	} else {
		[_taskId, "SUPP", "FAILED"] call A3A_fnc_taskSetState;
		[5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		[-10*_bonus,theBoss] call A3A_fnc_addScorePlayer;
	};
};

deleteVehicle _truckX;
private _emptybox = "Land_Pallet_F" createVehicle (getpos _truckX);
[_emptybox] spawn A3A_fnc_postmortem;

[_taskId, "SUPP", 900] spawn A3A_fnc_taskDelete;
