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
        private _civilianVehicles = 
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesCivCar", 0)) +
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesCivTruck", 0)) +
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesCivBoat", 0)) select {_x isNotEqualTo "" && {_x isEqualType ""}};
		
		private _civAircrafts = (FactionGoDTieredFT(A3A_faction_reb, "vehiclesCivHeli", 0)) + FactionGoDTieredFT(A3A_faction_reb, "vehiclesCivPlane", 0);
		if (_civAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_civilianVehicles append _civAircrafts;
		};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civcars": {
        private _civilianVehicles = (FactionGetTieredFT(A3A_faction_reb, "vehiclesCivCar", 0)) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civtrucks": {
        private _civilianVehicles = (FactionGetTieredFT(A3A_faction_reb, "vehiclesCivTruck", 0)) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civboats": {
        private _civilianVehicles =	(FactionGetTieredFT(A3A_faction_reb, "vehiclesCivBoat", 0)) select {_x isNotEqualTo "" && {_x isEqualType ""}};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civheli": {
        private _civilianVehicles = [];
		private _civAircrafts = (FactionGetTieredFT(A3A_faction_reb, "vehiclesCivHeli", 0));
		if (_civAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_civilianVehicles append _civAircrafts;
		};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "civplane": {
        private _civilianVehicles = [];
		
		private _civAircrafts = (FactionGetTieredFT(A3A_faction_reb, "vehiclesCivPlane", 0));
		if (_civAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_civilianVehicles append _civAircrafts;
		};

		_isCivilian = true;
		_vehicleClasses = _civilianVehicles;
    };
	case "military": {
		private _militaryVehicles = 
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesBasic", 0)) + 
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesTruck", 0)) + 
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesLightUnarmed", 0)) +
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesBoat", 0)) + 
			(FactionGetTieredFT(A3A_faction_reb, "vehiclesMedical", 0))
		select {_x isNotEqualTo [] && {_x isEqualType ""}};

		if (tierWar > 2) then {
			private _availableVehs = (FactionGetTieredFT(A3A_faction_reb, "vehiclesLightArmed", 0)) select {_x isNotEqualTo "" && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};

		if (tierWar > 3) then {
			private _availableVehs = 
				(FactionGetTieredFT(A3A_faction_reb, "vehiclesAT", 0)) + 
				(FactionGetTieredFT(A3A_faction_reb, "vehiclesAA", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};

		private _milAircrafts = FactionGetTieredFT(A3A_faction_reb, "vehiclesPlane", 0);
		if (_milAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_militaryVehicles append _milAircrafts;
		};

		_vehicleClasses = _militaryVehicles;
	};
	case "militarybasic": {
		private _militaryVehicles = (FactionGetTieredFT(A3A_faction_reb, "vehiclesBasic", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarytrucks": {
		private _militaryVehicles = (FactionGetTieredFT(A3A_faction_reb, "vehiclesTruck", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarylightunarmed": {
		private _militaryVehicles = (FactionGetTieredFT(A3A_faction_reb, "vehiclesLightUnarmed", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryboats": {
		private _militaryVehicles = (FactionGetTieredFT(A3A_faction_reb, "vehiclesBoat", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarymedical": {
		private _militaryVehicles =	(FactionGetTieredFT(A3A_faction_reb, "vehiclesMedical", 0))	select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _militaryVehicles;
	};
	case "militarylightarmed": {
		private _militaryVehicles =[];
		if (tierWar > 2) then {
			private _availableVehs = (FactionGetTieredFT(A3A_faction_reb, "vehiclesLightArmed", 0)) select {_x isNotEqualTo "" && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryat": {
		private _militaryVehicles =[];
		if (tierWar > 3) then {
			private _availableVehs = 
				(FactionGetTieredFT(A3A_faction_reb, "vehiclesAT", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryaa": {
		private _militaryVehicles =[];
		if (tierWar > 3) then {
			private _availableVehs = 
				(FactionGetTieredFT(A3A_faction_reb, "vehiclesAA", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_militaryVehicles append _availableVehs;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "militaryplane": {
		private _militaryVehicles =[];
		private _milAircrafts = FactionGetTieredFT(A3A_faction_reb, "vehiclesPlane", 0);
		if (_milAircrafts isNotEqualTo [] && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}) then {
			_militaryVehicles append _milAircrafts;
		};
		_vehicleClasses = _militaryVehicles;
	};
	case "static": {
		private _statics = [];
		
		if (tierWar > 2) then {
			private _availableVehs = (FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};

		(FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};

		if (tierWar > 3) then {
			private _availableVehs = 
				(FactionGetTieredFT(A3A_faction_reb, "staticAT", 0)) +
				(FactionGetTieredFT(A3A_faction_reb, "staticAA", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};

		if (tierWar > 4) then {
			private _mortars = FactionGetTieredFT(A3A_faction_reb, "staticMortars", 0);
			if (_mortars isNotEqualTo []) then {
				_statics append _mortars;
			};
		};

		_vehicleClasses = _statics;
	};
	case "staticMG": {
		private _statics = [];
		
		if (tierWar > 2) then {
			private _availableVehs = (FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};
		(FactionGetTieredFT(A3A_faction_reb, "staticMGs", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
		_vehicleClasses = _statics;
	};
	case "staticAT": {
		private _statics = [];
		if (tierWar > 3) then {
			private _availableVehs = (FactionGetTieredFT(A3A_faction_reb, "staticAT", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};
		_vehicleClasses = _statics;
	};
	case "staticAA": {
		private _statics = [];
		if (tierWar > 3) then {
			private _availableVehs = (FactionGetTieredFT(A3A_faction_reb, "staticAA", 0)) select {_x isNotEqualTo [] && {_x isEqualType ""}};
			_statics append _availableVehs;
		};
		_vehicleClasses = _statics;
	};
	case "staticMORTAR": {
		private _statics = [];
		if (tierWar > 4) then {
			private _mortars = FactionGetTieredFT(A3A_faction_reb, "staticMortars", 0);
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