/*
	Author:
		Creep'nCrunch / jwoodruff40
	
	Description:
		Builds a pool of vehicles from the loaded configs, categorizing them and skipping invalid ones.
	
	Params:
		None
	
	Dependencies:
		N/A
	
	Scope:
		Server
	
	Environment:
		Unscheduled
	
	Usage:
		call ABZ_fnc_vehPoolFromConfigs;
	
	Return:
		[array of stock rows, number of skipped entries] <ARRAY>
*/
#include "..\script_component.hpp"
private _ignoreWeapons = ["horn", "smoke", "flare", "laser", "cmdispenser"];
private _fnc_armed = {
	params ["_cfg"];
	private _hasGun = ((getArray (_cfg >> "weapons")) - _ignoreWeapons) isNotEqualTo [];
	if (_hasGun) exitWith { true };
	(configProperties [_cfg >> "Turrets", "isClass _x", true]) findIf { [_x] call _fnc_armed } isNotEqualTo -1
};

private _fnc_category = {
	params ["_c", "_cfg"];
	switch true do {
		case (_c isKindOf "Tank"): { "TANK" };
		case (_c isKindOf "APC"): { "APC" };
		case (_c isKindOf "Helicopter"): { "HELI" };
		//case (_c isKindOf "Plane"): { "PLANE" }; // ! commented because it also catches fixed-wing UAVs
		case (_c isKindOf "Ship"): { "BOAT" };
		case (_c isKindOf "StaticMGWeapon"): { "STATICMG" };
		case (_c isKindOf "StaticAAWeapon"): { "STATICAA" };
		case (_c isKindOf "StaticATWeapon"): { "STATICAT" };
		case (_c isKindOf "StaticMortar"): { "STATICMORTAR" };
		case (_c isKindOf "Car"): { ["UNARMEDCAR", "ARMEDCAR"] select ([_cfg] call _fnc_armed) };
		default {
			switch (toLower getText (_cfg >> "editorSubcategory")) do {
				case "edsubcat_aas": { "AA" };
				case "edsubcat_artillery": { "ARTILLERY" };
				case "edsubcat_drones": { "UAV" };
				case "edsubcat_planes": { "PLANE" };
				default { "" };
			};
		};
	};
};

private _rows = [];
private _skipped = 0;
{
	private _c = configName _x;
	if !([_c, true] call ABZ_fnc_vehValid) then { _skipped = _skipped + 1; continue };
	private _cat = [_c, _x] call _fnc_category;
	if (_cat isEqualTo "") then { _skipped = _skipped + 1; continue };
	_rows pushBack [_c, _cat, ""];
} forEach ("true" configClasses (configFile >> "CfgVehicles"));

[_rows, _skipped]
