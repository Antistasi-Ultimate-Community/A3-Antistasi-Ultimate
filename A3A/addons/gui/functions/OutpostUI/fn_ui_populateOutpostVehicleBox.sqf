#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
	["_category", "", [""]]
];

private _buyableVehiclesList = [];
private _vehicleClasses = [];
private _isCivilian = false;

switch (_category) do {
	case "lightarmed": {
		private _militaryVehicles = [];

		if (tierWar > 2) then {
			private _availableVehs = (A3A_faction_reb get 'vehiclesLightArmed') select {_x isNotEqualTo ""};
			_militaryVehicles append _availableVehs;
		};

		_vehicleClasses = _militaryVehicles;
	};
	case "AT": {
		private _militaryVehicles = [];
		
		if (tierWar > 3) then {
			private _availableVehs = 
				(A3A_faction_reb get 'vehiclesAT') select {_x isNotEqualTo []};
			_militaryVehicles append _availableVehs;
		};

		_vehicleClasses = _militaryVehicles;
	};
	case "AA": {
		private _militaryVehicles = [];
		
		if (tierWar > 3) then {
			private _availableVehs = 
				(A3A_faction_reb get 'vehiclesAA') select {_x isNotEqualTo []};
			_militaryVehicles append _availableVehs;
		};

		_vehicleClasses = _militaryVehicles;
	};
	default {
		Error_1("Invalid vehicle category, given was %1", _category);
	};
};

{
	private _vehiclePrice = [_x] call A3A_fnc_vehiclePrice;
	_buyableVehiclesList pushBack [_x, _vehiclePrice, _isCivilian];
} forEach _vehicleClasses;

_buyableVehiclesList;