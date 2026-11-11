// Living enemy AI (men and crewed vehicles) within a radius of a position.
// [_pos or object, _radius] -> [units]
params [["_pos", [0,0,0], [[], objNull]], ["_r", 100, [0]]];
if (_pos isEqualType objNull) then { _pos = getPosATL _pos };
if (_r <= 0) exitWith { [] };

private _sides = call ABZ_fnc_enemySides;
(_pos nearEntities [["CAManBase", "LandVehicle", "Air", "Ship"], _r]) select {
	alive _x && {(side _x) in _sides} && {!isPlayer _x}
}
