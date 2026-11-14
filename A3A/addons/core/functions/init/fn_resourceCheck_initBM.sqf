#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

private _cfg = (configFile >> "A3U" >> "traderAddons" >> "traderVehicles");

private _condition_AA = getText (_cfg >> "condition_AA");
private _condition_APC = getText (_cfg >> "condition_APC");
private _condition_ARMEDCAR = getText (_cfg >> "condition_ARMEDCAR");
private _condition_ARTILLERY = getText (_cfg >> "condition_ARTILLERY");
private _condition_BOAT = getText (_cfg >> "condition_BOAT");
private _condition_HELI = getText (_cfg >> "condition_HELI");
private _condition_PLANE = getText (_cfg >> "condition_PLANE");
private _condition_STATICAA = getText (_cfg >> "condition_STATICAA");
private _condition_STATICAT = getText (_cfg >> "condition_STATICAT");
private _condition_STATICMG = getText (_cfg >> "condition_STATICMG");
private _condition_STATICMORTAR = getText (_cfg >> "condition_STATICMORTAR");
private _condition_TANK = getText (_cfg >> "condition_TANK");
private _condition_UAV = getText (_cfg >> "condition_UAV");
private _condition_UNARMEDCAR = getText (_cfg >> "condition_UNARMEDCAR");

private _conditions = [
	[_condition_AA, "AA"], 
	[_condition_APC, "APCs"], 
	[_condition_ARMEDCAR, "Armed Cars"], 
	[_condition_ARTILLERY, "Artillery"], 
	[_condition_BOAT, "Boats"], 
	[_condition_HELI, "Helicopters"], 
	[_condition_PLANE, "Planes"], 
	[_condition_STATICAA, "Statics: AA"], 
	[_condition_STATICAT, "Statics: AT"], 
	[_condition_STATICMG, "Statics: MG"], 
	[_condition_STATICMORTAR, "Statics: Mortar"],
	[_condition_TANK, "Tanks"],
	[_condition_UAV, "UAVs"],
	[_condition_UNARMEDCAR, "Unarmed Cars"]
];

_conditions;