/*
	Author:
		jwoodruff40
	
	Description:
		Converts legacy faction templates on the fly to new-style templates with vehicles arrays in the hashmap tiered and names standardized, like the loadouts.
	
	Params:
		_faction <HASHMAP> <Default: None> The faction hashmap to be converted.
	
	Dependencies:
		N/A
	
	Scope:
		N/A
	
	Environment:
		N/A
	
	Usage:
		[_faction] call A3U_fnc_NAME;
	
	Return:
		_return <HASHMAP> The converted faction hashmap for further processing in fn_compatibilityLoadFaction
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_faction"];

private _keys_general = [
    "vehiclesDropPod",
    "vehiclesSDV",
    "vehiclesBasic",
    "vehiclesLightUnarmed",
    "vehiclesLightArmed",
    "vehiclesTruck",
    "vehiclesTrucks",
    "vehiclesCargoTrucks",
    "vehiclesAmmoTrucks",
    "vehiclesRepairTrucks",
    "vehiclesFuelTrucks",
    "vehiclesMedical",
    "vehiclesLightAPCs",
    "vehiclesAPCs",
    "vehiclesIFVs",
    "vehiclesTanks",
    "vehiclesAA",
    "vehiclesAirborne",
    "vehiclesLightTanks",
    "vehiclesBoat",
    "vehiclesTransportBoats",
    "vehiclesGunBoats",
    "vehiclesAmphibious",
    "vehiclesPlane",
    "vehiclesCivPlane",
    "vehiclesPlanesCAS",
    "vehiclesPlanesAA",
    "vehiclesPlanesTransport",
    "vehiclesPlanesLargeCAS",
    "vehiclesPlanesLargeAA",
    "vehiclesPlanesGunship",
    "vehiclesHelisLight",
    "vehiclesHelisTransport",
    "vehiclesHelisLightAttack",
    "vehiclesHelisAttack",
    "vehiclesAirPatrol",
    "vehiclesArtillery",
    "uavsAttack",
    "uavsPortable",
    "vehiclesPolice",
    "staticMGs",
    "staticAT",
    "staticAA",
    "staticMortars",
    "staticHowitzers",
    "vehicleRadar",
    "vehicleSam",
    "vehicleSam",
    "minefieldAT",
    "minefieldAPERS",
    "howitzerMagazineHE",
    "mortarMagazineHE",
    "mortarMagazineSmoke",
    "mortarMagazineFlare",
    "vehiclesAT",
    "vehiclesCivCar",
    "vehiclesCivTruck",
    "vehiclesCivHeli",
    "vehiclesCivBoat",
    "vehiclesCivIndustrial",
    "vehiclesCivRepair",
    "vehiclesCivMedical",
    "vehiclesCivFuel",
    "vehiclesCivSupply",
    "staticMortarMagHE",
    "staticMortarMagSmoke",
    "staticMortarMagFlare",
    "minesAT",
    "mineAT",
    "minesAPERS",
    "mineAPERS",
    "staticLowWeapons"
];
private _keys_militia = createHashMapFromArray [
    ["vehiclesMilitiaLightArmed", "vehiclesLightArmed"],
    ["vehiclesMilitiaTrucks", "vehiclesTrucks"],
    ["vehiclesMilitiaCars", "vehiclesLightUnarmed"],
    ["vehiclesMilitiaAPCs", "vehiclesAPCs"]
];
private _keys_rivals = createHashMapFromArray [
    ["vehiclesRivalsLightArmed", "vehiclesLightArmed"],
    ["vehiclesRivalsTrucks", "vehiclesTrucks"],
    ["vehiclesRivalsCars", "vehiclesLightUnarmed"],
    ["vehiclesRivalsAPCs", "vehiclesAPCs"],
    ["vehiclesRivalsTanks", "vehiclesTanks"],
    ["vehiclesRivalsHelis", "vehiclesHelis"],
    ["vehiclesRivalsUavs", "vehiclesUAVs"]
];

private _convFaction = +_faction;
private _fnc_saveVehiclesToTemplate = {
	// add weights where missing, normalize the weights,
	// then set all the vehicle keys for the faction hashmap based on the tier hashmaps
	params ["_name", "_data"];

	{
		private _tier = _forEachIndex;
		private _vehiclesData = _x;
		{
			private _vehicleType = _x;
			private _vehicles = _y;
			private _vehiclesX = _convFaction getOrDefault [_vehicleType, []];
			if (_vehicles isEqualType [] && {!isNil {_vehicles select 0}}) then {
				if (isNil {_vehicles select 1} || {(_vehicles select 1) isEqualType ""}) then { _vehicles = flatten (_vehicles apply {[_x, 1]}) };
				_vehicles = [_vehicles] call A3A_fnc_normalizeWeights;
			};
			_vehiclesX set [_tier, _vehicles];
			_convFaction set [_vehicleType, _vehiclesX];
		} forEach (_vehiclesData);
	} forEach (_data);
};

private _vehiclesData = createHashMap;
{
	_vehiclesData set [_x, _convFaction getOrDefault [_x, []]];
	_convFaction deleteAt _x;
} forEach (_keys_general);

switch true do {
	case (((keys _keys_rivals) arrayIntersect (keys _convFaction)) isNotEqualTo []): { // this is a riv template
		{
			_vehiclesData set [_y, _convFaction getOrDefault [_x, []]];
			_convFaction deleteAt _x;
		} forEach (_keys_rivals);
		["vehiclesData", [_vehiclesData]] call _fnc_saveVehiclesToTemplate;
	};
	case (((keys _keys_militia) arrayIntersect (keys _convFaction)) isEqualTo []): { // this is a reb / civ template
		["vehiclesData", [_vehiclesData]] call _fnc_saveVehiclesToTemplate;
	};
	default { // this is an occ / inv template
		private _militiaVehiclesData = +_vehiclesData;
		{
			_militiaVehiclesData set [_y, _convFaction getOrDefault [_x, []]];
			_convFaction deleteAt _x;
		} forEach (_keys_militia);
		private _militaryVehiclesData = +_vehiclesData;
		private _eliteVehiclesData = +_vehiclesData;
		["vehiclesData", [
			_militiaVehiclesData,
			_militaryVehiclesData,
			_eliteVehiclesData
		]] call _fnc_saveVehiclesToTemplate;
	};
};

_convFaction set ["vehiclesData", "sqf_converted"]; // indicates that vehiclesData was converted by this script. Not sure if it'll be needed in future.
_convFaction;