/*
	Maintainer:
		jwoodruff40 / Creep'nCrunch
	
	Description:
		Creates the mortar pits for a zone
	
	Params:
		_markerX <STRING> Zone marker
		_sideX <SIDE> Zone side
	
	Dependencies:
		SCRT_fnc_unit_getTiered
		A3A_fnc_findSpawnPosition
		A3A_fnc_createUnit
		A3A_fnc_NATOinit
		A3A_fnc_AIVEHinit
		A3A_fnc_artilleryAdd
	
	Scope:
		Server
	
	Environment:
		Scheduled
	
	Usage:
		([_markerX, _sideX] call A3A_fnc_createZoneMortars) params ["_groups", "_soldiers", "_vehicles", "_props", "_spawnsUsed"];
	
	Return:
		[_groups, _soldiers, _vehicles, _props, _spawnsUsed] <ARRAY>
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markerX", "_sideX"];

private _faction = Faction(_sideX);
private _positionX = getMarkerPos _markerX;
private _groups = [];
private _soldiers = [];
private _vehicles = [];
private _props = [];
private _spawnsUsed = [];

private _groupX = createGroup _sideX;
_groups pushBack _groupX;
private _typeUnit = [_faction get "unitTierStaticCrew"] call SCRT_fnc_unit_getTiered;

while {true} do {
	if (A3U_disableMortars) exitWith {
		Debug("Exiting mortar creation; Param was set to disabled.");
	};
	private _spawnParameter = [_markerX, "Mortar"] call A3A_fnc_findSpawnPosition;
	if !(_spawnParameter isEqualType []) exitWith {}; // exit the loop when we run out of valid spawn positions

	_spawnsUsed pushBack _spawnParameter#2;

	private _typeVehX = selectRandom (_faction get "staticMortars");
	private _veh = _typeVehX createVehicle (_spawnParameter select 0);
	_veh setDir (_spawnParameter select 1);
	private _unit = [_groupX, _typeUnit, _positionX, [], 0, "CAN_COLLIDE"] call A3A_fnc_createUnit;
	_unit moveInGunner _veh;
	[_unit, _markerX] call A3A_fnc_NATOinit;
	[_veh, _sideX] call A3A_fnc_AIVEHinit;
	[_groupX] call A3A_fnc_artilleryAdd;
	_soldiers pushBack _unit;
	_vehicles pushBack _veh;

	private _mortarPos = _spawnParameter select 0;
	{
		private _relativePosition = [_mortarPos, 4, _x] call BIS_fnc_relPos;
		private _sandbag = createVehicle [_faction get "sandbagRound", _relativePosition, [], 0, "CAN_COLLIDE"];
		_sandbag setDir ([_sandbag, _mortarPos] call BIS_fnc_dirTo);
		_sandbag setVectorUp surfaceNormal position _sandbag;
		_props pushBack _sandbag;
	} forEach [0, 90, 180, 270];
};

[_groups, _soldiers, _vehicles, _props, _spawnsUsed]
