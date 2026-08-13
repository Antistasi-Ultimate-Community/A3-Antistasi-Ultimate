params ["_vehicleClass", ["_position", [0,0,0]], ["_side", teamPlayer]];

private _crashedVehicle = ([_position, (random 360), _vehicleClass, grpNull] call A3A_fnc_spawnVehicle) select 0;
{deleteVehicle _x} forEach (crew _crashedVehicle);
[_crashedVehicle, _side] call A3A_fnc_AIVEHinit;
_crashedVehicle setDamage random [0.5, 0.6, 0.7];
_crashedVehicle setFuel 0;

_crashedVehicle;