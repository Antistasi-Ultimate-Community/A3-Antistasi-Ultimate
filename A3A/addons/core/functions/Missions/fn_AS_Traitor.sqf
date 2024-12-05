#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX"];

//Mission: Assassinate a traitor
if (!isServer and hasInterface) exitWith{};

private _difficultX = random 10 < tierWar;
private _positionX = getMarkerPos _markerX;

private _limit = if (_difficultX) then {
	30 call SCRT_fnc_misc_getTimeLimit
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

private _groupTraitor = createGroup Occupants;

private _arrayAirports = airportsX select {sidesX getVariable [_x,sideUnknown] == Occupants};

if (_arrayAirports isEqualTo []) exitWith {
	["AS"] remoteExec ["A3A_fnc_missionRequest",2];
    Info("No airport left, rerolling another AS mission.");
};

private _base = [_arrayAirports, _positionX] call BIS_Fnc_nearestPosition;
private _posBase = getMarkerPos _base;

private _bodyguardClass = [FactionGet(occ,"unitRifle")] call SCRT_fnc_unit_getTiered;

private _traitorIdentity = [A3A_faction_reb, FactionGet(occ,"unitTraitor")] call A3A_fnc_createRandomIdentity;
_traitorIdentity set ["speaker", "NoVoice"];
_traitor = [_groupTraitor, FactionGet(occ,"unitTraitor"), _posTraitor, [], 0, "NONE", _traitorIdentity] call A3A_fnc_createUnit;
_traitor allowDamage false;
_traitor setPos _posTraitor;

//corrupt traitor always carries some dirty money
[_traitor, 100, (random 3)] call SCRT_fnc_common_addRandomMoneyMagazine;

private _sol1 = [_groupTraitor, _bodyguardClass, _posSol1, [], 0, "NONE"] call A3A_fnc_createUnit;
private _sol2 = [_groupTraitor, _bodyguardClass, _posSol2, [], 0, "NONE"] call A3A_fnc_createUnit;
_groupTraitor selectLeader _traitor;

private _posTsk = (position _houseX) getPos [random 100, random 360];

private _taskId = "AS" + str A3A_taskCount;
[
	[teamPlayer,civilian],
	_taskID,
	[
		format [localize "STR_A3A_Missions_AS_Traitor_task_desc",FactionGet(occ,"name"),_nameDest,_displayTime],
		localize "STR_A3A_Missions_AS_Traitor_task_header",
		_markerX
	],
	_posTsk,
	false,
	0,
	true,
	"Kill",
	true
] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

traitorIntel = false; publicVariable "traitorIntel";

{[_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _groupTraitor;
private _posVeh = [];
private _dirVeh = 0;
private _roads = [];
private _radius = 20;
while {count _roads == 0} do {
	_roads = (getPos _houseX) nearRoads _radius;
	_radius = _radius + 10;
};

private _road = _roads select 0;
private _posroad = getPos _road;
_roadcon = roadsConnectedto _road;
if (count _roadCon == 0) then {
    Error_1("Road has no connection :%1.",position _road);
};
if (count _roadCon > 0) then {
	private _posrel = getPos (_roadcon select 0);
	_dirveh = [_posroad,_posrel] call BIS_fnc_DirTo;
} else {
	_dirVeh = getDir _road;
};

private _posVeh = [_posroad, 3, _dirveh + 90] call BIS_Fnc_relPos;
private _vehType = selectRandom (FactionGet(reb,"vehiclesLightUnarmed"));
private _veh = _vehType createVehicle _posVeh;
_veh allowDamage false;
_veh setDir _dirVeh;
sleep 15;
_veh allowDamage true;
_traitor allowDamage true;
[_veh, Occupants] call A3A_fnc_AIVEHinit;
{_x disableAI "MOVE"; _x setUnitPos "UP"} forEach units _groupTraitor;

private _typeGroup = if (random 10 < tierWar) then {
	selectRandom ([(Faction(Occupants)), "groupsTierSquads"] call SCRT_fnc_unit_flattenTier)
} else {
	FactionGet(occ,"groupPoliceSquad")
};
private _groupX = [_positionX,Occupants, _typeGroup] call A3A_fnc_spawnGroup;
sleep 1;
if (random 10 < 2.5) then {
	_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
	[_dog] spawn A3A_fnc_guardDog;
	};
[_groupX, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;
{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;

waitUntil {
	sleep 1;
	traitorIntel ||
	{dateToNumber date > _dateLimitNum or
	{not alive _traitor or
	{{_traitor knowsAbout _x > 1.4} count ([500,0,_traitor,teamPlayer] call A3A_fnc_distanceUnits) > 0
}}}};

if ({_traitor knowsAbout _x > 1.4} count ([500,0,_traitor,teamPlayer] call A3A_fnc_distanceUnits) > 0) then {
	{_x enableAI "MOVE"} forEach units _groupTraitor;
	_traitor assignAsDriver _veh;
	[_traitor] orderGetin true;
	_wp0 = _groupTraitor addWaypoint [_posVeh, 0];
	_wp0 setWaypointType "GETIN";
	_wp1 = _groupTraitor addWaypoint [_posBase,1];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "CARELESS";
	_wp1 setWaypointSpeed "FULL";
};

waitUntil  {
	sleep 1;
	traitorIntel ||
	{dateToNumber date > _dateLimitNum or
	{!alive _traitor or
	{_traitor distance _posBase < 20
}}}};

if (!alive _traitor || {traitorIntel}) then {
	[_taskId, "AS", "SUCCEEDED", true] call A3A_fnc_taskSetState;
	if(traitorIntel && (alive _traitor)) then {
		{[petros,"hint", localize "STR_hints_AS_traitor_intel"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([500,0,_traitor,teamPlayer] call A3A_fnc_distanceUnits);

		moveOut _traitor;
		_traitor join grpNull;
		_traitor setCaptive true;
		_traitor stop true;
		_traitor setUnitPos "UP";
		_traitor playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";

		_wp1 = _groupTraitor addWaypoint [_posBase];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointBehaviour "CARELESS";
		_wp1 setWaypointSpeed "FULL";
	};

	_factor = 1;
	if(_difficultX) then {_factor = 2;};
    Debug("aggroEvent | Rebels won a traitor mission");
	[Occupants, 15 * _factor, 120] remoteExec ["A3A_fnc_addAggression",2];
	[0,300 * _factor] remoteExec ["A3A_fnc_resourcesFIA",2];
	{
		[300 * _factor,_x] call A3A_fnc_addMoneyPlayer;
		[15 * _factor,_x] call A3A_fnc_addScorePlayer;
	} forEach (call SCRT_fnc_misc_getRebelPlayers);
	[5 * _factor,theBoss] call A3A_fnc_addScorePlayer;
	[200 * _factor,theBoss, true] call A3A_fnc_addMoneyPlayer;
}
else
{
	[_taskId, "AS", "FAILED", true] call A3A_fnc_taskSetState;
	if (_difficultX) then {[-20,theBoss] call A3A_fnc_addScorePlayer} else {[-10,theBoss] call A3A_fnc_addScorePlayer};
	if (dateToNumber date > _dateLimitNum) then {
		_hrT = server getVariable "hr";
		_resourcesFIAT = server getVariable "resourcesFIA";
		[-1*(round(_hrT/3)),-1*(round(_resourcesFIAT/3))] remoteExec ["A3A_fnc_resourcesFIA",2];
	}
	else {
		// Add some rebel HQ info to occupants. Must be done on server.
		{ A3A_curHQInfoOcc = A3A_curHQInfoOcc + 0.25 + random 0.5 } remoteExecCall ["call", 2];
	};
};

sleep 30;

traitorIntel = false;
publicVariable "traitorIntel";
[_taskId, "AS", 1200, true] spawn A3A_fnc_taskDelete;

[_groupX] spawn A3A_fnc_groupDespawner;
[_groupTraitor] spawn A3A_fnc_groupDespawner;
[_veh] spawn A3A_fnc_vehDespawner;
