
params ["_class", "_pos", ["_dir", 0], ["_special", "CAN_COLLIDE"]];

private _object = createVehicle [_class, _pos, [], 0, _special];		
_object setDir _dir;

_object
