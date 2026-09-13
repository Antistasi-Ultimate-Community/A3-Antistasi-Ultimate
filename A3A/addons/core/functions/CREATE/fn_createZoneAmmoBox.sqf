/*
	Author:
		jwoodruff40
	
	Description:
		Create flag for marker
	
	Params:
		_markerX <STRING> <Default: NONE>
	
	Dependencies:
		N/A
	
	Scope:
		N/A
	
	Environment:
		Server, unscheduled
	
	Usage:
		[_markerX] call A3A_fnc_createZoneAmmoBox;
	
	Return:
		_return <ARRAY>
			0: _ammoBoxX <OBJECT>
			1: _spawn <STRING>

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

if (isNil "_markerX" || {!(_markerX isEqualType "")}) exitWith { Error_1("Invalid marker: %1 for ammo box creation.", _markerX) };

private _sideX = sidesX getVariable [_markerX,sideUnknown];
if (_sideX isEqualTo sideUnknown) exitWith { Error_2("Invalid side: %1 for marker %2 ammo box creation.", _sideX, _markerX) };

if (garrison getVariable [_markerX + "_lootCD", 0] isNotEqualTo 0) exitWith { Info_1("Skipping ammo box spawn at marker %1 as it is on cooldown.", _markerX) };

private _positionX = getMarkerPos (_markerX);
private _faction = Faction(_sideX);
private _typeVehX = _faction get "ammobox";
private ["_ammoBoxX", "_return"];

private _spawnParameter = [_markerX, "ammo"] call A3A_fnc_findSpawnPosition;
if (_spawnParameter isEqualType []) then {
	_ammoBoxX = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
	_ammoBoxX setDir (_spawnParameter select 1); // this probably doesn't matter, but eh why not?
	_return = [_ammoBoxX, _spawnParameter select 2];
} else {
	Debug_1("Could not find ammo box placement marker for marker %1; falling back to marker center.", _markerX);
	_ammoBoxX = [_typeVehX, _positionX, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
	_return = [_ammoBoxX, nil];
};

// Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
_ammoBoxX addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
[_ammoBoxX] spawn A3A_fnc_fillLootCrate;
if (_markerX in seaports) then {
	[_ammoBoxX] spawn {
		sleep 1;    //make sure fillLootCrate finished clearing the crate
		{
			_this#0 addItemCargoGlobal [_x, round random [2,6,8]];
		} forEach (A3A_faction_reb get "diveGear");
	};
};
if (_markerX in airportsX) then {
	[_ammoBoxX] spawn {
		sleep 1;    //make sure fillLootCrate finished clearing the crate
		{
			_this#0 addItemCargoGlobal [_x, round random [5,15,15]];
		} forEach (A3A_faction_reb get "flyGear");
	};
};
[_ammoBoxX, nil, true] call A3A_Logistics_fnc_addLoadAction;

_return;