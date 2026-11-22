#include "defineCommon.inc"



params["_vehicle"];

private _type = typeOf _vehicle;
private _cfg = (configFile >> "CfgVehicles" >> _type);
private _simulation = getText (_cfg >> "simulation");


private _index = switch (toLower _simulation) do {
	case "car";
	case "carx": {
		TYPE_CAR;
	};
	case "tank";
	case "tankx": {
		[TYPE_STATIC, TYPE_ARMOR] select (getNumber (_cfg >> "maxspeed") > 0);
	};
	case "helicopter";
	case "helicopterx";
	case "helicopterrtd": {
		TYPE_HELI;
	};
	case "airplane";
	case "airplanex": {
		TYPE_PLANE;
	};
	case "ship";
	case "shipx";
	case "submarinex": {
		TYPE_NAVAL;
	};
	default {-1};
};

//return
_index
