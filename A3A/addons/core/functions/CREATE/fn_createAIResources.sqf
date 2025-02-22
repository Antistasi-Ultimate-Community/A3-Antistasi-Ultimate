#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

//Not sure if that ever happens, but it reduces redundance
if(spawner getVariable _markerX == 2) exitWith {};

ServerInfo_1("Spawning Airbase %1", _markerX);

private _civs = [];
private _soldiers = [];
private _dogs = [];
private _groups = [];
private _vehiclesX = [];
private _spawnsUsed = [];

private _positionX = getMarkerPos _markerX;
private _size = [_markerX] call A3A_fnc_sizeMarker;

private _frontierX = [_markerX] call A3A_fnc_isFrontline;
private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

private _isFIA = random 10 > (tierWar + difficultyCoef) and {!(_frontierX)};

if (_frontierX) then {
	_roads = _positionX nearRoads _size;
	if (count _roads != 0) then
	{
		private _dist = 0;
		private _road = objNull;
		{if ((position _x) distance _positionX > _dist) then {_road = _x;_dist = position _x distance _positionX}} forEach _roads;
		private _roadscon = roadsConnectedto _road;
		private _roadcon = objNull;
		{if ((position _x) distance _positionX > _dist) then {_roadcon = _x}} forEach _roadscon;
		private _dirveh = [_roadcon, _road] call BIS_fnc_DirTo;

		private _groupX = createGroup _sideX;
		_groups pushBack _groupX;
		private _pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;

		if (_faction getOrDefault ["noSandbag", false]) then {		
			private _typeVehX = selectRandom (_faction get "staticAT");
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
			private _typeVehX = selectRandom (_faction get "staticAT");
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
			[_group, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;
			_groups pushBack _group;
			{[_x] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _group;
		};
	};
};

private _garrison = garrison getVariable [_markerX,[]];
_garrison = _garrison call A3A_fnc_garrisonReorg;
private _radiusX = count _garrison;
private _patrol = true;
//If one is missing, there are no patrols??
if (_radiusX < ([_markerX] call A3A_fnc_garrisonSize)) then {
	_patrol = false;
} else {
	//No patrol if patrol area overlaps with an enemy site
	_patrol = ((markersX findIf {(getMarkerPos _x inArea _mrk) && {sidesX getVariable [_x, sideUnknown] != _sideX}}) == -1);
};
if (_patrol) then {
	[_markerX, _positionX, _sideX, _faction, 4] call SCRT_fnc_location_createPatrols;
};

private _typeVehX = _faction get "flag";
private _flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];
_flagX allowDamage false;
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
_vehiclesX pushBack _flagX;
if (flagTexture _flagX != (_faction get "flagTexture")) then {[_flagX,(_faction get "flagTexture")] remoteExec ["setFlagTexture",_flagX]};

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];
private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_lowCiv isEqualTo false) then {
	private _spawnedCivilians = [_markerX, 4] call A3A_fnc_createResourceCiv;
	if !(isNil "_spawnedCivilians") then {
		_groups pushBack (_spawnedCivilians # 0);
		_civs append (_spawnedCivilians # 1);
	};
};

private _spawnParameter = [_markerX, "Vehicle"] call A3A_fnc_findSpawnPosition;
private _veh = nil;

if (_spawnParameter isEqualType []) then {
	_spawnsUsed pushBack _spawnParameter#2;
	private _typeVehX = call {
		if (FactionGet(civ,"vehiclesCivRepair") isEqualTo [] and random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesRepairTrucks") };
		if (FactionGet(civ,"vehiclesCivFuel") isEqualTo [] and random 1 < 0.1) exitWith { selectRandom (_faction get "vehiclesFuelTrucks") };
		private _types = if (!_isFIA) then {
			(_faction get "vehiclesTrucks") + (_faction get "vehiclesCargoTrucks")
		} else {
			_faction get "vehiclesMilitiaTrucks"
		};
		_types = _types select { _x in FactionGet(all,"vehiclesCargoTrucks") };
		if (count _types == 0) then { _types = (_faction get "vehiclesCargoTrucks") } else { _types }; // failsafe didn't work?
		selectRandom _types;
	};
	isNil {
		_veh = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
		_veh setDir (_spawnParameter select 1);
	};
	_vehiclesX pushBack _veh;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	sleep 1;
};

{ _x setVariable ["originalPos", getPos _x] } forEach _vehiclesX;

private _array = [];
private _subArray = [];
private _countX = 0;
_radiusX = _radiusX -1;
while {_countX <= _radiusX} do {
	_array pushBack (_garrison select [_countX,7]);
	_countX = _countX + 8;
};

for "_i" from 0 to (count _array - 1) do {
	_groupX = if (_i == 0) then {
		[_positionX,_sideX, (_array select _i),true, false] call A3A_fnc_spawnGroup;
	} else {
		private _spawnPosition = [_positionX, 10, 50, 5, 0, -1, 0] call A3A_fnc_getSafePos;
		[_spawnPosition, _sideX, (_array select _i), false, true] call A3A_fnc_spawnGroup
	};
	_groups pushBack _groupX;

	{
		[_x, _markerX] call A3A_fnc_NATOinit;
		_soldiers pushBack _x;
	} forEach units _groupX;

	if (_i == 0) then {
		private _garrisonGroup = [_groupX, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;
		if (count _garrisonGroup > 0) then {
			_groups append _garrisonGroup;
		};
	} else {
		[_groupX, "Patrol_Defend", 0, 100, -1, true, _positionX, false] call A3A_fnc_patrolLoop;
	};
};

["locationSpawned", [_markerX, "Resource", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1; (spawner getVariable _markerX == 2)};

_spawnsUsed call A3A_fnc_freeSpawnPositions;

deleteMarker _mrk;

{ if (alive _x) then { deleteVehicle _x } } forEach _soldiers;
{ deleteVehicle _x } forEach _civs;
{ deleteVehicle _x } forEach _dogs;
{ deleteGroup _x } forEach _groups;

{
	// delete all vehicles that haven't been captured
	if (_x getVariable ["ownerSide", _sideX] == _sideX) then {
		if (_x distance2d (_x getVariable "originalPos") < 100) then { deleteVehicle _x }
		else { if !(_x isKindOf "StaticWeapon") then { [_x] spawn A3A_fnc_VEHdespawner } };
	};
} forEach _vehiclesX;
["locationSpawned", [_markerX, "Resource", false]] call EFUNC(Events,triggerEvent);
