#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
	["_category", "", [""]]
];

private _buyableVehiclesList = [];
private _vehicleClasses = [];
private _isCivilian = false;

switch (_category) do {
    case "civilian": {
        private _civilianVehicles = (
			(FactionGoDRebel(A3A_faction_reb, "vehiclesCivCar")) +
			(FactionGoDRebel(A3A_faction_reb, "vehiclesCivTruck")) +
			(FactionGoDRebel(A3A_faction_reb, "vehiclesCivBoat"))
		) select {_x isNotEqualTo "" && {_x isEqualType ""}};
		
		private _civAircrafts = (
			(FactionGoDRebel(A3A_faction_reb, "vehiclesCivHeli")) +
			FactionGoDRebel(A3A_faction_reb, "vehiclesCivPlane")
		) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		if (_civAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_civilianVehicles append _civAircrafts;
		};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civcars": {
        private _civilianVehicles = (FactionGoDRebel(A3A_faction_reb, "vehiclesCivCar")) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civtrucks": {
        private _civilianVehicles = (FactionGoDRebel(A3A_faction_reb, "vehiclesCivTruck")) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civboats": {
        private _civilianVehicles =	(FactionGoDRebel(A3A_faction_reb, "vehiclesCivBoat")) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civheli": {
        private _civilianVehicles = [];
		private _civAircrafts = (FactionGoDRebel(A3A_faction_reb, "vehiclesCivHeli")) select {_x isNotEqualTo "" && {_x isEqualType ""}};
		if (_civAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_civilianVehicles append _civAircrafts;
		};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civplane": {
        private _civilianVehicles = [];
		
		private _civAircrafts = (FactionGoDRebel(A3A_faction_reb, "vehiclesCivPlane")) select {_x isNotEqualTo "" && {_x isEqualType ""}};
		if (_civAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_civilianVehicles append _civAircrafts;
		};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "military": {
		private _militaryVehicles = (
			FactionGoDRebel(A3A_faction_reb, "vehiclesBasic") + 
			FactionGoDRebel(A3A_faction_reb, "vehiclesTruck") + 
			FactionGoDRebel(A3A_faction_reb, "vehiclesLightUnarmed") +
			FactionGoDRebel(A3A_faction_reb, "vehiclesBoat") + 
			FactionGoDRebel(A3A_faction_reb, "vehiclesMedical")
		) select {_x isNotEqualTo [] && {_x isEqualType ""}};

		if (tierWar > 2) then {
			private _availableVehs = (FactionGoDRebel(A3A_faction_reb, "vehiclesLightArmed")) select {_x isNotEqualTo "" && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};

		if (tierWar > 3) then {
			private _availableVehs = (
				FactionGoDRebel(A3A_faction_reb, "vehiclesAT") + 
				FactionGoDRebel(A3A_faction_reb, "vehiclesAA")
			) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};

		private _milAircrafts = FactionGoDRebel(A3A_faction_reb, "vehiclesPlane") select {_x isNotEqualTo "" && {_x isEqualType ""}};
		if (_milAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_militaryVehicles append _milAircrafts;
		};

		_vehicleClasses = _militaryVehicles;
	};
	case "militarybasic": {
		private _militaryVehicles = (FactionGoDRebel(A3A_faction_reb, "vehiclesBasic")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarytrucks": {
		private _militaryVehicles = (FactionGoDRebel(A3A_faction_reb, "vehiclesTruck")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarylightunarmed": {
		private _militaryVehicles = (FactionGoDRebel(A3A_faction_reb, "vehiclesLightUnarmed")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryboats": {
		private _militaryVehicles = (FactionGoDRebel(A3A_faction_reb, "vehiclesBoat")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarymedical": {
		private _militaryVehicles =	(FactionGoDRebel(A3A_faction_reb, "vehiclesMedical"))	select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarylightarmed": {
		private _militaryVehicles =[];
		if (tierWar > 2) then {
			private _availableVehs = (FactionGoDRebel(A3A_faction_reb, "vehiclesLightArmed")) select {_x isNotEqualTo "" && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryat": {
		private _militaryVehicles =[];
		if (tierWar > 3) then {
			private _availableVehs = 
				(FactionGoDRebel(A3A_faction_reb, "vehiclesAT")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryaa": {
		private _militaryVehicles =[];
		if (tierWar > 3) then {
			private _availableVehs = 
				(FactionGoDRebel(A3A_faction_reb, "vehiclesAA")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryplane": {
		private _militaryVehicles =[];
		private _milAircrafts = FactionGoDRebel(A3A_faction_reb, "vehiclesPlane") select {_x isNotEqualTo "" && {_x isEqualType ""}};
		if (_milAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_militaryVehicles append _milAircrafts;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "static": {
		private _statics = [];
		
		if (tierWar > 2) then {
			private _availableVehs = (FactionGoDRebel(A3A_faction_reb, "staticMGs")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};

		(FactionGoDRebel(A3A_faction_reb, "staticMGs")) select {_x isNotEqualTo [] && {_x isEqualType ""}};

		if (tierWar > 3) then {
			private _availableVehs = (
				FactionGoDRebel(A3A_faction_reb, "staticAT") +
				FactionGoDRebel(A3A_faction_reb, "staticAA")
			) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};

		if (tierWar > 4) then {
			private _mortars = FactionGoDRebel(A3A_faction_reb, "staticMortars") select {_x isNotEqualTo "" && {_x isEqualType ""}};
			if (_mortars isNotEqualTo []) then {
				_statics append _mortars;
			};
		};

		_vehicleClasses = _statics;
	};
	case "staticMG": {
		private _statics = [];
		
		if (tierWar > 2) then {
			private _availableVehs = (FactionGoDRebel(A3A_faction_reb, "staticMGs")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};
		(FactionGoDRebel(A3A_faction_reb, "staticMGs")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _statics;
	};
	case "staticAT": {
		private _statics = [];
		if (tierWar > 3) then {
			private _availableVehs = (FactionGoDRebel(A3A_faction_reb, "staticAT")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};
		_vehicleClasses = _statics;
	};
	case "staticAA": {
		private _statics = [];
		if (tierWar > 3) then {
			private _availableVehs = (FactionGoDRebel(A3A_faction_reb, "staticAA")) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};
		_vehicleClasses = _statics;
	};
	case "staticMORTAR": {
		private _statics = [];
		if (tierWar > 4) then {
			private _mortars = FactionGoDRebel(A3A_faction_reb, "staticMortars") select {_x isNotEqualTo "" && {_x isEqualType ""}};
			if (_mortars isNotEqualTo []) then {
				_statics append _mortars;
			};
		};
		_vehicleClasses = _statics;
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