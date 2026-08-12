#include "..\..\script_component.hpp"

params ["_cargo"];

// We want to use logistics cfg and get the value there, instead of creating a new cfg
private _config = [_cargo] call A3A_logistics_fnc_getCargoConfig;

private _cargoExplosive = getNumber (_config >> "isExplosive");
 
_cargoExplosive;