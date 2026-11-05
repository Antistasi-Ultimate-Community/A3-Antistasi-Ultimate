/*
	Author:
		Creep'nCrunch / jwoodruff40
	
	Description:
		Checks if a vehicle class is a valid class to be stocked at a bazaar stall.
		Legacy vendor (arms dealer / blackmarket trader) can stock all vehicle types; normal vendors do not stock UAVs, artillery, or static weapons.
	
	Params:
		_c <STRING> Vehicle class to check
		_legacy <BOOL> Whether the vendor is the legacy vendor
	
	Dependencies:
		N/A
	
	Scope:
		Server
	
	Environment:
		Unscheduled
	
	Usage:
		["veh_class", false] call ABZ_fnc_vehValid;
	
	Return:
		_valid <BOOL>
*/
params [["_c", "", [""]], ["_legacy", false, [true]]];
private _cfg = configFile >> "CfgVehicles" >> _c;

// not valid anywhere
private _valid = switch true do {
	case (!isClass _cfg);
	case ((_c select [0,4]) isEqualTo "A3A_");
	case (getText (_cfg >> "displayName") isEqualTo "");
	case (getNumber (_cfg >> "scope") isEqualTo 0);
	case (getNumber (_cfg >> "transportAmmo") > 0);
	case (getNumber (_cfg >> "transportFuel") > 0);
	case (getNumber (_cfg >> "transportRepair") > 0): { false };
	default { _c isKindOf "LandVehicle" || {_c isKindOf "Ship"} || {_c isKindOf "Air"} };
};

if (!_valid) exitWith { false };
if (_legacy) exitWith { true };

_valid = switch true do {
	// not valid at standard (non-legacy) vendors
	case (getNumber (_cfg >> "isUav") isNotEqualTo 0);
	case (getNumber (_cfg >> "artilleryScanner") isNotEqualTo 0);
	case (_c isKindOf "Plane");
	case (_c isKindOf "StaticWeapon"): { false };

	// valid at standard vendors if it passes all previous checks
	default { true };
};

_valid;
