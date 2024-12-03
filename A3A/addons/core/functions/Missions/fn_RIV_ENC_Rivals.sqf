#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

//Mission: Investigate Battlefield
if (!isServer and hasInterface) exitWith {};
if (!areRivalsEnabled || {areRivalsDiscovered || {areRivalsDefeated}}) exitWith {};

private _fnc_fire = {
	params ["_position", "_effects"];
	for "_i" from 0 to (random [3,5,6]) do {
		private _firePosition = [
			_position, 
			2,
			25,
			2
		] call BIS_fnc_findSafePos;

		private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
		[_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

		private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
		[_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
		[_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
		[_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

		_effects append [_fireEffectEmitter, _lightEffectEmitter];
	};
};

private _vehicles = [];
private _effects = [];
private _groups = [];

private _markerPosition = getMarkerPos _marker;

private _road = objNull;
private _roadRadius = 5;

while {true} do {
    _road = _markerPosition nearRoads _roadRadius;
    if (count _road > 1) exitWith {};
    _roadRadius = _roadRadius + 5;
};

private _roadcon = roadsConnectedto (selectRandom _road);
private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _crater = createVehicle ["Crater", _roadPosition, [], 0, "NONE"];

private _vehicleClass = selectRandom ((A3A_faction_riv get "vehiclesRivalsCars") + (A3A_faction_riv get "vehiclesRivalsLightArmed"));
private _crashedVehicle = createVehicle [_vehicleClass, [_roadPosition select 0, _roadPosition select 1, 0.2], [], 0, "CAN_COLLIDE"];
_crashedVehicle setDir _dirveh;
_crashedVehicle setDamage 0.7;
_crashedVehicle setHit ["wheel_2_1_steering", 1];
_crashedVehicle setHit ["wheel_1_1_steering", 1];
_crashedVehicle setFuel 0.3;
[_crashedVehicle, Rivals] call A3A_fnc_AIVEHinit;

_vehicles append [_crater, _crashedVehicle];

[_roadPosition, _effects] call _fnc_fire;

private _damagedBuildings = (nearestObjects [_roadPosition, ["house"], 350]) select {(count ([_x] call BIS_fnc_buildingPositions)) > 0};
private _damagedBuilding = nil;
if (count _damagedBuildings > 0) then {
	_damagedBuilding = selectRandom _damagedBuildings;
	_damagedBuilding setDamage ((random 0.5)+0.4);
	private _damagedBuildingPos = position _damagedBuilding;
	private _damagedBuildingCollision = 2 boundingBoxReal _damagedBuilding;
	private _p1 = _damagedBuildingCollision select 0;
	private _p2 = _damagedBuildingCollision select 1;
	private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

	private _bAtlPos = (getPosATL _damagedBuilding);
	private _bMinHeightAsl = ATLToASL _bAtlPos;
	private _bMaxHeightAsl = ATLToASL ([_bAtlPos select 0, _bAtlPos select 1, _maxHeight]);

	private _realRoofHeightAsl = ((lineIntersectsSurfaces [_bMaxHeightAsl, _bMinHeightAsl]) select 0) select 0;

	if (!isNil "_realRoofHeightAsl") then {
		private _smoke = createVehicle ["test_EmptyObjectForSmoke", _damagedBuildingPos, [], 0 , "CAN_COLLIDE"];
		_smoke setPosASL _realRoofHeightAsl;
		_effects pushBack _smoke;
	};
	_damagedBuilding animate ["door_1A_move",1];
	_damagedBuilding animate ["door_1B_move",1];
	_damagedBuilding animate ["door_2_rot",1];
	_damagedBuilding animate ["door_3_rot",1];

};

private _leaderIntelGroup = createGroup Rivals;
private _intelLeader = [_leaderIntelGroup, A3A_faction_riv get "unitCL", _markerPosition, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
_intelLeader setVariable ["canBeInterrogated", true]; //to remove search intel action
_intelLeader setDamage 0.7;
_intelLeader setCaptive true;
_intelLeader removeItems "FirstAidKit";
_intelLeader setSpeaker "NoVoice";
_intelLeader allowDamage false;
private _hmd = hmd _intelLeader;
_intelLeader unassignItem _hmd;
_intelLeader removeItem _hmd;
{_intelLeader disableAI _x} forEach ["CHECKVISIBLE", "MOVE", "COVER", "SUPPRESSION", "FSM", "TARGET", "AUTOTARGET", "ANIM"];
removeAllActions _intelLeader;

_groups pushBack _leaderIntelGroup;

private _anim = selectRandom [
	"Acts_StaticDeath_01",
	"Acts_StaticDeath_02",
	"Acts_StaticDeath_03",
	"Acts_StaticDeath_04", 
	"Acts_StaticDeath_05",
	"Acts_StaticDeath_05", 
	"Acts_StaticDeath_06",
	"Acts_StaticDeath_07",
	"Acts_StaticDeath_08",
	"Acts_StaticDeath_09",
	"Acts_StaticDeath_10"
];
[_intelLeader, _anim] remoteExecCall ["switchMove", _intelLeader];
private _timeOut = time + 2;
waitUntil {_timeOut < time};

_intelLeader setDamage 1;

if (!isNil "_damagedBuilding") then {
	private _emptyPos = [];
	_emptyPos = (getPosATL _damagedBuilding) findEmptyPosition [0,100, "C_Hatchback_01_sport_F"];

	if (_emptyPos isEqualTo []) then {
		private _vehPos = position _crashedVehicle;
		private _emptyPos = [
			_vehPos, 
			2,
			50,
			5,
			0, //water mode
			1, //maximum terrain gradient
			0, //shore mode
			[], //blacklist positions
			[_vehPos, _vehPos] //default position
		] call BIS_fnc_findSafePos;
		_emptyPos = selectRandom ([_damagedBuilding] call BIS_fnc_buildingPositions);
	};

	_intelLeader setPos _emptyPos;
	[(position _damagedBuilding), _effects] call _fnc_fire;
} else {
	private _vehPos = position _crashedVehicle;
	private _leaderPosition = [
		_vehPos, 
		2,
		50,
		5,
		0, //water mode
		1, //maximum terrain gradient
		0, //shore mode
		[], //blacklist positions
		[_vehPos, _vehPos] //default position
	] call BIS_fnc_findSafePos;

	_intelLeader setPos _leaderPosition;
};

private _bloodSplat = createVehicle [
	(selectRandom ["BloodPool_01_Large_New_F", "BloodSplatter_01_Large_New_F", "BloodSplatter_01_Medium_New_F", "BloodPool_01_Medium_New_F"]),
	// [_position select 0, _position select 1, ((getPosATL _intelLeader) select 2) - 0.15], 
	(position _intelLeader),
	[], 
	0,
	"CAN_COLLIDE"
];

private _grassCutter = createVehicle [
	"Land_ClutterCutter_medium_F",
	(position _intelLeader),
	[], 
	0,
	"CAN_COLLIDE"
];

private _position = [(position _intelLeader), 1, (random 360)] call SCRT_fnc_misc_extendPosition;
private _laptopPosition = [_position select 0, _position select 1, ((getPosATL _intelLeader) select 2) + 1];

private _laptop = [
	(selectRandom ["Land_laptop_03_closed_black_F", "Land_laptop_03_closed_sand_F", "Land_laptop_03_closed_olive_F"]),
	_laptopPosition,
	(random 360)
] call SCRT_fnc_misc_createBelonging;
[_laptop, "rivals_quest"] remoteExec ["A3A_fnc_flagaction", [teamPlayer,civilian], _laptop];

private _rivalsGroup = createGroup Rivals;
private _rivalsClasses = selectRandom (A3A_faction_riv get "groupsSentry"); 
for "_i" from 0 to count _rivalsClasses - 1 do {
	private _bodyPosition = [
		_roadPosition, //center
		5, //minimal distance
		50, //maximumDistance
		10, //object distance
		0, //water mode
		0, //maximum terrain gradient
		0, //shore mode
		[], //blacklist positions
		[_roadPosition, _roadPosition] //default position
	] call BIS_fnc_findSafePos;
    private _soldier = [_rivalsGroup, (_rivalsClasses select _i), _bodyPosition, [], 0, "NONE"] call A3A_fnc_RivalsCreateUnit;
    [_soldier] call A3A_fnc_NATOinit;

	private _anim = selectRandom [
		"Acts_StaticDeath_01",
		"Acts_StaticDeath_02",
		"Acts_StaticDeath_03",
		"Acts_StaticDeath_04", 
		"Acts_StaticDeath_05",
		"Acts_StaticDeath_06",
		"Acts_StaticDeath_07",
		"Acts_StaticDeath_08",
		"Acts_StaticDeath_09",
		"Acts_StaticDeath_10"
	];
	[_soldier, _anim] remoteExecCall ["switchMove", _soldier];
	sleep 0.5;
	_soldier setDamage 1;
	private _dir = [_soldier, _crashedVehicle] call BIS_fnc_dirTo;
	_soldier setDir (_dir - 180);
	_soldier removeItems "FirstAidKit";	
};

_groups pushBack _rivalsGroup;

[format [(localize "STR_rivals_intel"), A3A_faction_occ get "name"], true] remoteExec ["A3A_fnc_showIntel", [teamPlayer, civilian]];

sleep 2;

_vehicles append [_laptop, _bloodSplat, _grassCutter];

private _taskId = "RIV_ENC" + str A3A_taskCount;
private _intelLeaderPosition = position _intelLeader;

[
    [teamPlayer,civilian],
    _taskId,
    [
        format [(localize "STR_rivals_quest_description"),A3A_faction_occ get "name"],
        (localize "STR_rivals_quest_header"),
        _marker
    ],
    _intelLeaderPosition,
    false,
    0,
    true,
    "navigate",
    true
] call BIS_fnc_taskCreate;
[_taskId, "RIV_ENC", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

waitUntil {
    sleep 2;
    (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _roadPosition <= distanceSPWN} != -1
};

waitUntil {sleep 2;!isNil "rivalsLaptop"};

sleep 2.5;

["Music_Roaming_Night_Fragment_02_30s"] remoteExecCall ["playMusic", [teamPlayer, civilian]];

 
[
	"RivalsActivityDetected", 
	[
		(localize "STR_rivals_unknown_transmission_header"), 
		"SWYgeW91J3JlIHJlYWRpbmcgdGhpcyB5b3UncmUgYXdlc29tZSE"
	]
] remoteExecCall ["BIS_fnc_showNotification", [teamPlayer, civilian]];

sleep 8;

_nul = [] spawn {
	sleep 60;
	[
		format [(localize "STR_rivals_intel_first_task"), ([] call SCRT_fnc_misc_getWorldName), A3A_faction_riv get "name", A3A_faction_riv get "nameLeader"], true
	] remoteExec ["A3A_fnc_showIntel", [teamPlayer, civilian]];
};

//laptop may be changed in the rivals_searchData thus why global var is used there
[_intelLeader, _marker] spawn {
	params ["_intelLeader", "_marker"];

	sleep 4;

	playSound3D ["x\A3A\addons\core\Sounds\Misc\BombCountdown.ogg", rivalsLaptop, false, getPosASL rivalsLaptop, 2.5, 1, 100]; 

	private _timeOut = time + 2;
	waitUntil {_timeOut < time};

	private _charge = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,0]; 
	_charge setPosWorld (position rivalsLaptop); 
	_charge setDamage 1; 

	_intelLeader allowDamage true;
	_intelLeader setDamage 1;
	deleteVehicle rivalsLaptop;

	[_marker, false, 1000] spawn A3A_fnc_blackout;
};

Info("Laptop is activated, spawning additional group.");

(90 call SCRT_fnc_misc_getTimeLimit) params ["_dateLimitNum", "_displayTime"];


sleep 2;

[[_markerPosition, true], "SCRT_fnc_rivals_encounter_rovingMortar"] call A3A_fnc_scheduler;


[
    [teamPlayer,civilian],
    _taskId,
    [
		format [(localize "STR_rivals_quest_update_description"), _displayTime],
		format [(localize "STR_rivals_quest_update_header"), A3A_faction_riv get "name"],
        _marker
    ],
    _roadPosition,
    false,
    0,
    true,
    "navigate",
    true
] call BIS_fnc_taskCreate;
[_taskId, "RIV_ENC", "ASSIGNED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];
_taskId call BIS_fnc_taskSetCurrent;

private _group1Position = [
		_roadPosition, //center
		400, //minimal distance
		700, //maximumDistance
		2, //object distance
		0, //water mode
		0, //maximum terrain gradient
		0, //shore mode
		[], //blacklist positions
		[_roadPosition, _roadPosition] //default position
	] call BIS_fnc_findSafePos;
private _group1 = [_group1Position, Rivals, selectRandom (A3A_faction_riv get "groupsFireteam")] call A3A_fnc_RivalsSpawnGroup;
_groups pushBack _group1;
private _group1Wp = _group1 addWaypoint [_laptopPosition, 5];
_group1Wp setWaypointType "MOVE";
_group1Wp setWaypointCombatMode "YELLOW";
_group1Wp setWaypointSpeed "FULL";
// _group1 spawn A3A_fnc_attackDrillAI;

private _group2Position = [
		_roadPosition, //center
		400, //minimal distance
		700, //maximumDistance
		2, //object distance
		0, //water mode
		0, //maximum terrain gradient
		0, //shore mode
		[], //blacklist positions
		[_roadPosition, _roadPosition] //default position
	] call BIS_fnc_findSafePos;
private _group2 = [_group2Position, Rivals, selectRandom (A3A_faction_riv get "groupsFireteam")] call A3A_fnc_RivalsSpawnGroup;
_groups pushBack _group2;
private _group2Wp = _group2 addWaypoint [_laptopPosition, 5];
_group2Wp setWaypointType "MOVE";
_group2Wp setWaypointCombatMode "YELLOW";
_group2Wp setWaypointSpeed "FULL";
// _group2 spawn A3A_fnc_attackDrillAI;

{
	[_x] call A3A_fnc_NATOinit;
} forEach ((units _group1) + (units _group2));

_road = objNull;
_roadRadius = 5;

while {true} do {
    _road = _group1Position nearRoads _roadRadius;
    if (count _road > 1) exitWith {};
    _roadRadius = _roadRadius + 5;
};

_roadcon = roadsConnectedto (selectRandom _road);
_dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_DirTo} else {random 360};
_roadPosition = getPos (_road select 0);

private _rivalVehData = [_roadPosition, 0, selectRandom (A3A_faction_riv get "vehiclesRivalsLightArmed"), Rivals] call A3A_fnc_RivalsSpawnVehicle;
private _rivalVeh = _rivalVehData select 0;
[_rivalVeh, Rivals] call A3A_fnc_AIVEHinit;
private _rivalVehCrew = _rivalVehData select 1;
{[_x] call A3A_fnc_NATOinit} forEach _rivalVehCrew;
private _rivalVehGroup = _rivalVehData select 2;

private _rivalVehGroupWp = _rivalVehGroup addWaypoint [_laptopPosition, 5];
_rivalVehGroupWp setWaypointType "MOVE";
_rivalVehGroupWp setWaypointCombatMode "YELLOW";
_rivalVehGroupWp setWaypointSpeed "NORMAL";

_groups pushBack _rivalVehGroup;
_vehicles pushBack _rivalVeh;

private _aliveCount = 0;
private _isEveryoneDead = false;

waitUntil  {
	sleep 5;
	_aliveCount = {alive _x} count ((units _group1) + (units _group2));
	_isEveryoneDead = (call SCRT_fnc_misc_getRebelPlayers) findIf {alive _x && {_x distance2D _intelLeaderPosition < 1000}} == -1;
	Info_2("%1 Group Alive: %2", A3A_faction_riv get "name", str _aliveCount);
	(dateToNumber date > _dateLimitNum) || {_aliveCount < 2 || {_isEveryoneDead}} 
};

switch (true) do {
	case (dateToNumber date > _dateLimitNum): {
		Info("Date limit exceeded");
	};
	case (_aliveCount < 2): {
		Info("Rivals squad has less than 2 alive members.");
	};
	case (_isEveryoneDead): {
		Info("Everyone is dead");
	};
};

if (dateToNumber date < _dateLimitNum && {(call SCRT_fnc_misc_getRebelPlayers) findIf {alive _x && {_x distance2D _intelLeaderPosition < 1000}} != -1}) then {
	[0,10,_markerPosition] remoteExec ["A3A_fnc_citySupportChange",2];
	{ 
		[10,_x] call A3A_fnc_addScorePlayer;
    	[300,_x] call A3A_fnc_addMoneyPlayer;
	 } forEach (call SCRT_fnc_misc_getRebelPlayers);
	[10,theBoss] call A3A_fnc_addScorePlayer;
    [200,theBoss, true] call A3A_fnc_addMoneyPlayer;
};

sleep 10;
[] remoteExecCall ["SCRT_fnc_rivals_activate", 2];
[_taskId, "RIV_ENC", "SUCCEEDED"] call A3A_fnc_taskSetState;

sleep 30;

{deleteVehicle _x} forEach _effects;
{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

[_taskId, "RIV_ENC", 1200] spawn A3A_fnc_taskDelete;

Info("Investigate the Battleground task cleanup completed.");