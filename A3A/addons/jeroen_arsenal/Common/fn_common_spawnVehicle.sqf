#include "defineCommon.inc"

params["_jn_type", "_location"];
private _config = (missionConfigFile >> "Vehicles" >> _jn_type);
private _type = getText(_config >> "type");
private _fuel = (_config >> "fuel");
private _repair = (_config >> "repair");

private _vehicle = _type createVehicle _location; 
_vehicle setVariable ["jn_type",_jn_type];

