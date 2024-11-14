#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params["_marker"];

if (!isServer and hasInterface) exitWith {};

private _milAdministrationPos = getMarkerPos _marker;
private _milAdministrationIndex = A3A_milAdministrations findIf { _milAdministrationPos distance2D _x < 30 };
if (_milAdministrationIndex isEqualTo -1) exitWith {
	Error_1("For some reason %1 mil administration has no corresponding building, aborting.", _marker);
};

private _milAdministration = A3A_milAdministrations select _milAdministrationIndex;

if (_milAdministration isEqualTo objNull) exitWith {
	Error_1("For some reason mil administration %1 object is null, aborting.", _marker);
};
if (!alive _milAdministration) exitWith {
	Warning_1("Mil Admin building %1 was destroyed before (should not spawn at all, suspicious), aborting.", _marker);
};

private _side = sidesX getVariable [_marker, sideUnknown];

if (_side isEqualTo sideUnknown) exitWith {
	Error_1("For some reason mil administration %1 side is %2, aborting.", _marker, str _side);
};

Info_2("Spawning military administration personel for %1 marker on %2 position.", _marker, str _milAdministrationPos);

private _vehicles = [];
private _groups = [];
private _soldiers = [];
private _POWs = [];

private _isDifficult = [_marker] call A3A_fnc_isFrontline || {random 10 < tierWar + aggressionOccupants/10};
private _faction = Faction(_side);

private _leader = "";
private _unitPool = [];
private _carPool = [];

if (_isDifficult) then {
	_leader = FactionGet(occ,"unitMilitiaGrunt");
	_unitPool = [
		(_faction get "unitMilitiaGrunt"),
		(_faction get "unitMilitiaMarksman"),
		(_faction get "unitMilitiaGrenadier"),
		(_faction get "unitMilitiaSniper"),
		(_faction get "unitMilitiaMedic")
	];
	_carPool = _faction get "vehiclesMilitiaCars";
} else {
	_leader = (_faction get "unitPoliceOfficer");
	_unitPool = [(_faction get "unitPoliceGrunt")];
	_carPool = _faction get "vehiclesPolice";
};

///////////////////////
//  Patrol   		 //
///////////////////////

private _patrolGroupRoster = [_leader, selectRandom _unitPool];
private _patrolPosition = [
	_milAdministrationPos,
	0,
	200,
	3,
	0,
	1,
	0,
	[],
	[_milAdministrationPos, _milAdministrationPos]
] call BIS_fnc_findSafePos;

private _patrolGroup = [_patrolPosition, _side, _patrolGroupRoster] call A3A_fnc_spawnGroup;
{
	[_x] call A3A_fnc_NATOinit;
	_soldiers pushBack _x;
} forEach units _patrolGroup;
[_patrolGroup, _milAdministrationPos, 250] call bis_fnc_taskPatrol;
_groups pushBack _patrolGroup;


///////////////////////
//  Garrison  		 //
///////////////////////

private _positionsTuple = _milAdministration call SCRT_fnc_common_getMilAdminGarrisonPositions;
private _buildingPositions = _positionsTuple select 0;
private _soldierPositions = _positionsTuple select 1;
private _cratePositions = _positionsTuple select 2;
private _leaderPositions = _positionsTuple select 3;
private _powPositions = _positionsTuple select 4;

private _soilderCount = if (_isDifficult) then {round (random [4, 6, 8])} else {round (random [3, 5, 7])};
private _garrisonGroup = createGroup _side;
private _pickedIndexes = [];
for "_i" from 0 to _soilderCount do {
	private _buildingPosIndex = selectRandom _soldierPositions;
	private _findIndex = _pickedIndexes find _buildingPosIndex;
	while {_findIndex != -1} do {
		_buildingPosIndex = selectRandom _soldierPositions;
		_findIndex = _pickedIndexes find _buildingPosIndex;
	};
	_pickedIndexes pushBack _buildingPosIndex;

	private _buildingPosition = _buildingPositions select _buildingPosIndex;
	if (isNil "_buildingPosition") then {
		continue;
	};
	private _soldier = [_garrisonGroup, (selectRandom _unitPool), _buildingPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
	_soldier allowDamage false;
	_soldier setunitpos "UP";
	_soldier disableAI "PATH";
	[_soldier] call A3A_fnc_NATOinit;
	sleep 0.5;
	_soldier allowDamage true;
	_soldiers pushBack _soldier;
};
_groups pushBack _garrisonGroup;

/////////////
//  POWs  //
///////////

private _grpPOW = nil;

private _powCd = garrison getVariable [_marker + "_powCD", 0];
if (_powCd == 0) then {
	_grpPOW = createGroup teamPlayer;
	private _powCount = random [1, 3, 5];

	for "_i" from 0 to _powCount do {
		private _buildingPosIndex = selectRandom _powPositions;
		private _buildingPosition = _buildingPositions select _buildingPosIndex;

		_unit = [_grpPOW, FactionGet(reb,"unitUnarmed"), _buildingPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
		_unit allowDamage false;
		[_unit,true] remoteExec ["setCaptive",0,_unit];
		_unit setCaptive true;
		_unit disableAI "MOVE";
		_unit disableAI "AUTOTARGET";
		_unit disableAI "TARGET";
		_unit setUnitPos "UP";
		_unit setBehaviour "CARELESS";
		_unit allowFleeing 0;
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		_POWS pushBack _unit;
		[_unit,"prisonerFlee"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
		[_unit] call A3A_fnc_reDress;
	};

	{
		_x allowDamage true;
	} forEach _POWS;
} else {
	private _newValue = _powCd - time;
	if (_newValue < 0) then {_newValue = 0};
	garrison setVariable [_marker + "_powCD", _newValue];
};


///////////////////////
//  Parked vehicle   //
///////////////////////

private _road = objNull;
private _radiusX = 5;

while {true} do {
	_road = _milAdministrationPos nearRoads _radiusX;
	if (count _road > 0) exitWith {};
	_radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto (_road select 0);
private _dirveh = if(count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_DirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _vehClass = selectRandom _carPool;
private _spawnPos = (getPos (_road select 0)) findEmptyPosition [0, 10, _vehClass];
if (isNil "_spawnPos") then {
	_spawnPos = getPos (_road select 0);
};

private _parkedVehicle = createVehicle [_vehClass, _spawnPos, [], 0, "NONE"];
_parkedVehicle setDir _dirveh + 45;
[_parkedVehicle, _side] call A3A_fnc_AIVEHinit;

if (!_isDifficult) then {
	[_parkedVehicle, ["BeaconsStart", 1]] remoteExecCall ["animate", 0, _parkedVehicle];
};

_vehicles pushBack _parkedVehicle;
{ _x setVariable ["originalPos", getPos _x] } forEach _vehicles;


///////////////////////
//  Officer		 	 //
///////////////////////

private _groupCollaborant = createGroup _side;
private _buildingPosIndex = selectRandom _leaderPositions;
private _buildingPosition = _buildingPositions select _buildingPosIndex;

private _collaborant = [_groupCollaborant, (_faction get "unitOfficial"), _buildingPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
_collaborant setPosATL _buildingPosition;
_collaborant setunitpos "UP";
_collaborant disableAI "PATH";
[_collaborant] call A3A_fnc_NATOinit;

_soldiers pushBack _collaborant;
_groups pushBack _groupCollaborant;

///////////////////////
//  Equipment box    //
///////////////////////

private _ammoBox = if (garrison getVariable [_marker + "_lootCD", 0] == 0) then {
	private _ammoBoxPosition = _buildingPositions select (selectRandom _cratePositions);
	_ammoBoxPosition = _ammoBoxPosition vectorAdd [0,0,1];
	private _ammoBoxType = _faction get "equipmentBox";
	private _ammoBox = createVehicle [_ammoBoxType, [0, 0, 0], [], 0, "CAN_COLLIDE"];
	_ammoBox allowDamage false;
	_ammoBox setPosATL _ammoBoxPosition;
	_ammoBox setDir (getDir _milAdministration);

	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_ammoBox addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];

	private _playerCount = count (allPlayers - entities "HeadlessClient_F");
	private _crateContents = selectRandom [
		[_ammoBox, 2, _playerCount, 0, 0, 1, (round random [6,8,9]), 0, 0, 0, 0, 0, 0, 0, 0, 1, _playerCount, 0, 0],
		[_ammoBox, 3, _playerCount, 0, 0, 1, (round random [4,5,7]), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[_ammoBox, 4, _playerCount, 0, 0, 1, (round random [6,8,9]), 1, 1, 0, 0, 0, 0, 1, 0, 0, _playerCount, 0, 0]
	];

	_crateContents call A3A_fnc_fillLootCrate;
	[_ammoBox, nil, true] call A3A_Logistics_fnc_addLoadAction;
	[_ammoBox] remoteExec ["SCRT_fnc_common_addActionMove", [teamPlayer, civilian], _ammoBox];

	sleep 2;
	_ammoBox allowDamage true;

	_ammoBox;
};

waitUntil {sleep 1; spawner getVariable _marker == 2 or {!alive _milAdministration or {!alive _collaborant}}};

switch (true) do {
	case (!alive _collaborant): {
		Info_1("Military Administration %1 was captured - collaborant has been killed.", _marker);
		[_milAdministration, "CAPTURE"] call SCRT_fnc_location_removeMilAdmin;
	};
	case (!alive _milAdministration): {
		Info_1("Military Administration %1 was destroyed.", _marker);
		[_milAdministration, "DESTROY"] call SCRT_fnc_location_removeMilAdmin;
	};
};

waitUntil {sleep 1; (spawner getVariable _marker == 2)};

{deleteVehicle _x} forEach (_soldiers select {alive _x});
{deleteGroup _x} forEach _groups;

{
	// delete all vehicles that haven't been stolen
	if (_x getVariable ["ownerSide", _side] == _side) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehicles;

// If loot crate was stolen, set the cooldown
if (!isNil "_ammoBox") then {
	if ((alive _ammoBox) and (_ammoBox distance2d _milAdministrationPos < 100)) exitWith { deleteVehicle _ammoBox };
	if (alive _ammoBox) then { [_ammoBox] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_marker] call A3A_fnc_garrisonSize);
	garrison setVariable [_marker + "_lootCD", _lootCD, true];
};

if (count (units _grpPOW) != count _POWs) then {
	private _powCD = 120*16 / ([_marker] call A3A_fnc_garrisonSize);
	garrison setVariable [_marker + "_powCD", time + 3600, true];
};

// {deleteVehicle _x} forEach _POWs;
// deleteGroup _grpPOW;
if (!isNil "_grpPOW") then {
	[_grpPOW] spawn A3A_fnc_groupDespawner;
};

["locationSpawned", [_marker, "MilAdmin", false]] call EFUNC(Events,triggerEvent);