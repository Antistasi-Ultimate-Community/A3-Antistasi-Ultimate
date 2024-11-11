#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

ServerInfo_1("Spawning Military Base %1", _markerX);

private _vehiclesX = [];
private _groups = [];
private _soldiers = [];
private _props = [];
private _dogs = []; //dogs are used in fn_location_createPatrols, removing this variable will break spawn
private _spawnsUsed = [];

private _positionX = getMarkerPos (_markerX);

private _size = [_markerX] call A3A_fnc_sizeMarker;

private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _busy = false;	//if (dateToNumber date > server getVariable _markerX) then {false} else {true};
private _nVeh = round (_size/60);

private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

/////////////////////////////
// SPAWNING SAM SITE	  //
////////////////////////////
private _radarType = _faction getOrDefault ["vehicleRadar", ""];
private _samType = _faction getOrDefault ["vehicleSam", ""];

// In case of array
if (_radarType isEqualType [] && {_radarType isNotEqualTo []}) then {_radarType = selectRandom _radarType};
if (_samType isEqualType [] && {_samType isNotEqualTo []}) then {_samType = selectRandom _samType};

// In case of empty array
if (_samType isEqualType [] && {_samType isEqualTo []}) then {_samType = ""};
if (_radarType isEqualType [] && {_radarType isEqualTo []}) then {_radarType = ""};

diag_log _radarType;
diag_log _samType;

if (garrison getVariable [_markerX + "_samDestroyedCD", 0] == 0) then 
{
	if (_radarType != "" && {_samType != ""}) then 
	{
		private _spawnParameter = [_markerX, "Sam"] call A3A_fnc_findSpawnPosition;
		if !(_spawnParameter isEqualType []) exitWith {};
		_spawnsUsed pushBack _spawnParameter#2;

		{
			private _aaVehicle = nil;
			isNil {
				// _aaVehicle = createVehicle [_x, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
				// _aaVehicle setDir (_spawnParameter select 1);
				_aaVehicle = [_x, _spawnParameter select 0, 25, 10, true] call A3A_fnc_safeVehicleSpawn;
				_aaVehicle setDir (_spawnParameter select 1);
			};

			private _aaGroup = [_sideX, _aaVehicle] call A3A_fnc_createVehicleCrew;
			[_aaVehicle, _sideX] call A3A_fnc_AIVEHinit;

			_soldiers append (units _aaGroup); //not sure if needed
			_groups pushBack _aaGroup;
			_vehiclesX pushBack _aaVehicle;

			//radar rotation
			if(_x isEqualTo _radarType) then {
				_aaVehicle spawn {
					while {alive _this} do {
						{
							_this lookAt (_this getRelPos [100, _x]);
							sleep 2.45;
						} forEach [120, 240, 0];
					};
				};
				_aaVehicle setVehicleRadar 1;
				_aaVehicle setVehicleReportRemoteTargets true;
			};

			_aaVehicle setVariable ["A3A_samMarker", _markerX];
			_aaVehicle addEventHandler ["Killed", { 
				private _marker = _this#0 getVariable ["A3A_samMarker", ""];
				if (_marker isNotEqualTo "") then {
					private _varName = _marker + "_samDestroyedCD";
					private _previousValue = garrison getVariable [_varName, 0];
					garrison setVariable [_varName, (_previousValue + 900), true];
				};
			}];
		} forEach [_radarType, _samType];
	};
};

/////////////////////////////
// Self-propelled AA 	  //
////////////////////////////

if (random 10 < (tierWar + difficultyCoef)) then {
	private _max = if (_frontierX) then {2} else {1};
	for "_i" from 1 to _max do {
		private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
		
		if !(_spawnParameter isEqualType []) exitWith {};
		_spawnsUsed pushBack _spawnParameter#2;

		private _veh = nil;
		isNil {
			_veh = createVehicle [selectRandom (_faction get "vehiclesAA"), (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
			_veh setDir (_spawnParameter select 1);
		};

		_groupVeh = [_sideX, _veh] call A3A_fnc_createVehicleCrew;
		{[_x,_markerX] call A3A_fnc_NATOinit} forEach units _groupVeh;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		_soldiers append units _groupVeh;
		_groups pushBack _groupVeh;
		[_groupVeh, "Patrol_Area", 25, 100, 250, true, _positionX, false] call A3A_fnc_patrolLoop;
		_vehiclesX pushBack _veh;

		sleep 1;
		[(gunner _veh), 300] spawn SCRT_fnc_common_scanHorizon;
	};
};

/////////////////////////////
// Heavy Patrol Vehicle   //
////////////////////////////

if (random 100 < (40 + tierWar * 6)) then {
	private _heavyVehPool =  (_faction get "vehiclesTanks") + (_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightTanks");
	private _type = selectRandom _heavyVehPool;

	private _road = [_positionX] call A3A_fnc_findNearestGoodRoad;
	if (_road distance2D _positionX > 800) exitWith {};

	private _heavyVehicle = [_type, (position _road), 15, 10] call A3A_fnc_safeVehicleSpawn;
	if (isNull _heavyVehicle) exitWith {};

	private _crewType = [_sideX, _heavyVehicle] call A3A_fnc_crewTypeForVehicle;
	private _group = createGroup _sideX;

	_group = [_group, _heavyVehicle, _crewType] call A3A_fnc_createVehicleCrew;

	[_heavyVehicle, _sideX] call A3A_fnc_AIVEHinit;
	{[_x,_markerX] call A3A_fnc_NATOinit} forEach (units _group);

	if (_type in ((_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs"))) then {
		sleep 1;
		private _troopGroup = [(position _road), _sideX, (selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier))] call A3A_fnc_spawnGroup;
		{_x assignAsCargo _heavyVehicle;_x moveInCargo _heavyVehicle; _soldiers pushBack _x; [_x] joinSilent _group; [_x,"",false] call A3A_fnc_NATOinit} forEach units _troopGroup;
		deleteGroup _troopGroup;
	};

	_soldiers append (units _group);
	_groups pushBack _group;
	_vehiclesX pushBack _heavyVehicle;		
};

private _boatType = selectRandom (_faction get "vehiclesGunBoats");
private _mrkMar = seaSpawn select {getMarkerPos _x inArea _markerX};
if (count _mrkMar > 0) then {
	private _pos = (getMarkerPos (_mrkMar select 0)) findEmptyPosition [0,20,_typeVehX];
	private _vehicle=[_pos, 0,_boatType, _sideX] call A3A_fnc_spawnVehicle;
	private _veh = _vehicle select 0;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	private _vehCrew = _vehicle select 1;
	{[_x,_markerX] call A3A_fnc_NATOinit} forEach _vehCrew;
	private _groupVeh = _vehicle select 2;
	_soldiers append _vehCrew;
	[_groupVeh, "Patrol_Water", 25, 200, -1, true, _pos] call A3A_fnc_patrolLoop;
	_groups pushBack _groupVeh;
	_vehiclesX pushBack _veh;
	sleep 1;
};

if (_frontierX) then {
	private _roads = _positionX nearRoads _size;
	if (count _roads != 0) then {
		private _groupX = createGroup _sideX;
		_groups pushBack _groupX;
		private _typeVehX = selectRandom (_faction get "staticAT");

		if (_faction getOrDefault ["noSandbag", false]) then {		
			private _veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPos _pos;
			_veh setDir _dirVeh + 180;
			private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;
			private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			[_unit,_markerX] call A3A_fnc_NATOinit;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_soldiers pushBack _unit;
		} else {
			private _bunker = (_faction get "sandbag") createVehicle _pos;
			_vehiclesX pushBack _bunker;
			_bunker setDir _dirveh;
			_pos = getPosATL _bunker;
			private _veh = _typeVehX createVehicle _positionX;
			_vehiclesX pushBack _veh;
			_veh setPos _pos;
			_veh setDir _dirVeh + 180;
			private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;
			private _unit = [_groupX, _typeUnit, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
			_unit moveInGunner _veh;
			[_unit,_markerX] call A3A_fnc_NATOinit;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_soldiers pushBack _unit;
		};
	};
};


private _mrk = createMarkerLocal [format ["%1patrolarea", random 100], _positionX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanceSPWN/2),(distanceSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerDirLocal (markerDir _markerX);
if (!debug) then {_mrk setMarkerAlphaLocal 0};

//maybe it's no longer needed after all..?
private _additionalGarrison = [_sideX, _markerX] call SCRT_fnc_garrison_rollOversizeGarrison;
if (_additionalGarrison isNotEqualTo []) then {
	for "_i" from 0 to (count _additionalGarrison) - 1 do {
		private _groupTypes = _additionalGarrison select _i;
		private _group = [_positionX, _sideX, _groupTypes, false, true] call A3A_fnc_spawnGroup;
		if !(isNull _group) then {
			sleep 1;
			[_group, "Patrol_Defend", 0, 200, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
			_groups pushBack _group;
			{[_x] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _group;
		};
	};
};

private _garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;

private _radiusX = count _garrison;
private _patrol = true;

if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then {
	_patrol = false;
} else {
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};

if (_patrol) then {
	[_markerX, _positionX, _sideX, _faction, 5] call SCRT_fnc_location_createPatrols;
};
private _countX = 0;

// Mortar spawning
private _groupX = createGroup _sideX;
_groups pushBack _groupX;
private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;
while {true} do {
	private _spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
	if (_spawnParameter isEqualType false) exitWith {};

	_spawnsUsed pushBack _spawnParameter#2;

	_typeVehX = selectRandom (_faction get "staticMortars");
	_veh = _typeVehX createVehicle (_spawnParameter select 0);
	_veh setDir (_spawnParameter select 1);
	_unit = [_groupX, _typeUnit, _positionX, [], 0, "CAN_COLLIDE"] call A3A_fnc_createUnit;
	_unit moveInGunner _veh;
	[_unit,_markerX] call A3A_fnc_NATOinit;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	[_groupX] call A3A_fnc_artilleryAdd;
	_soldiers pushBack _unit;
	_vehiclesX pushBack _veh;
	sleep 1;

	private _mortarPos = _spawnParameter select 0;
	{
		private _relativePosition = [_mortarPos, 4, _x] call BIS_fnc_relPos;
		private _sandbag = createVehicle [_faction get "sandbagRound", _relativePosition, [], 0, "CAN_COLLIDE"];
		_sandbag setDir ([_sandbag, _mortarPos] call BIS_fnc_dirTo);
		_sandbag setVectorUp surfaceNormal position _sandbag;
		_props pushBack _sandbag;
	} forEach [0, 90, 180, 270];
};

private _ret = [_markerX,_size,_sideX,_frontierX] call A3A_fnc_milBuildings;

_groups pushBack (_ret select 0);
_vehiclesX append (_ret select 1);
_soldiers append (_ret select 2);
_spawnsUsed append (_ret select 3);

{[_x, _sideX] call A3A_fnc_AIVEHinit} forEach (_ret select 1);

if(random 100 < (50 + tierWar * 3)) then {
	_large = (random 100 < (40 + tierWar * 2));
	[_markerX, _large] spawn A3A_fnc_placeIntel;
};

private _typeVehX = _faction get "flag";
private _flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];

_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];

_vehiclesX pushBack _flagX;
if (flagTexture _flagX != (_faction get "flagTexture")) then {[_flagX,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_flagX]};


private _fnc_createAmmobox = {
	private _ammoBoxType = _faction get "ammobox";
	private _ammoBox = [_ammoBoxType, _positionX, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
	// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
	_ammoBox addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
	[_ammoBox] spawn A3A_fnc_fillLootCrate;
	[_ammoBox, nil, true] call A3A_Logistics_fnc_addLoadAction;

	_ammoBox;
};

private _ammobox1 = nil;
private _ammobox2 = nil;

// Only create ammoBox if it's been recharged (see reinforcementsAI)
if (garrison getVariable [_markerX + "_lootCD", 0] == 0) then {
	_ammobox1 = call _fnc_createAmmobox;
	_ammobox2 = call _fnc_createAmmobox;
};

if (!_busy) then {
	private _vehTypesHeavy = (_faction get "vehiclesAPCs") + (_faction get "vehiclesLightAPCs") + (_faction get "vehiclesTanks") +(_faction get "vehiclesLightTanks");
	for "_i" from 1 to (round (random 2)) do {
		_spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
		if (_spawnParameter isEqualType []) then
		{
			_spawnsUsed pushBack _spawnParameter#2;
			private _veh = nil;
			isNil {
				_veh = createVehicle [selectRandom _vehTypesHeavy, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
				_veh setDir (_spawnParameter select 1);
			};
			_vehiclesX pushBack _veh;
			[_veh, _sideX] call A3A_fnc_AIVEHinit;
			_nVeh = _nVeh -1;
			sleep 1;
		};
	};
};

private _vehTypesLight = 
	(_faction get "vehiclesLightArmed") + 
	(_faction get "vehiclesLightUnarmed") + 
	(_faction get "vehiclesTrucks") + 
	(_faction get "vehiclesAmmoTrucks") + 
	(_faction get "vehiclesRepairTrucks") + 
	(_faction get "vehiclesFuelTrucks") + 
	(_faction get "vehiclesMedical");
_countX = 0;

while {_countX < _nVeh && {_countX < 3}} do {
	private _typeVehX = selectRandom _vehTypesLight;
	private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
	if(_spawnParameter isEqualType []) then
	{
		_spawnsUsed pushBack _spawnParameter#2;
		private _veh = nil;
		isNil {
			_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "CAN_COLLIDE"];
			_veh setDir (_spawnParameter select 1);
		};
		_vehiclesX pushBack _veh;
		[_veh, _sideX] call A3A_fnc_AIVEHinit;
		sleep 1;
		_countX = _countX + 1;
	}
	else
	{
		//No further spaces to spawn vehicle
		_countX = _nVeh;
	};
};

{ _x setVariable ["originalPos", getPosATL _x] } forEach _vehiclesX;

private _array = [];
private _subArray = [];
_countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do {
	_array pushBack (_garrison select [_countX,7]);
	_countX = _countX + 8;
};
for "_i" from 0 to (count _array - 1) do {
	private _groupX = if (_i == 0) then {
		[_positionX, _sideX, (_array select _i), true, false] call A3A_fnc_spawnGroup;
	} else {
		private _spawnPosition = [_positionX, 50, 100, 5, 0, -1, 0] call A3A_fnc_getSafePos;
		[_spawnPosition, _sideX, (_array select _i), false, true] call A3A_fnc_spawnGroup;
	};
	_groups pushBack _groupX;
	{
		[_x, _markerX] call A3A_fnc_NATOinit; 
		_soldiers pushBack _x;
	} forEach units _groupX;
	if (_i == 0) then {
		// Sets first loop as garrison, returns additional defense groups if not enough positions found.
		private _additionalGroups = [_groupX, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;
		_groups append _additionalGroups;
	} else {
		[_groupX, "Patrol_Defend", 0, 200, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
	};
};

["locationSpawned", [_markerX, "Milbase", true]] call EFUNC(Events,triggerEvent);


waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

_spawnsUsed call A3A_fnc_freeSpawnPositions;

deleteMarker _mrk;
{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _dogs;
{ deleteGroup _x } forEach _groups;
{ deleteVehicle _x } forEach _props;

{
	// delete all vehicles that haven't been stolen
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;

_spawnsUsed call A3A_fnc_freeSpawnPositions;

// If loot crate was stolen, set the cooldown
if (!isNil "_ammoBox1") then {
	if ((alive _ammoBox1) and (_ammoBox1 distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox1 };
	if (alive _ammoBox1) then { [_ammoBox1] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};
if (!isNil "_ammoBox2") then {
	if ((alive _ammoBox2) and (_ammoBox2 distance2d _positionX < 100)) exitWith { deleteVehicle _ammoBox2 };
	if (alive _ammoBox2) then { [_ammoBox2] spawn A3A_fnc_VEHdespawner };
	private _lootCD = 120*16 / ([_markerX] call A3A_fnc_garrisonSize);
	garrison setVariable [_markerX + "_lootCD", _lootCD, true];
};

["locationSpawned", [_markerX, "Milbase", false]] call EFUNC(Events,triggerEvent);
