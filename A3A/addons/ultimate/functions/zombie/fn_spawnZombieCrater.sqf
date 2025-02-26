params ["_crater", "_pos"];

private _craterProp = _crater createVehicle [0,0,0];
_craterProp setPosATL _pos;

private _particleSource = "#particlesource" createVehicle ASLToAGL _pos;
_particleSource setParticleClass "MineCircleDust";
[_particleSource, 0.005] remoteExec ["setDropInterval", 0];

private _soundSource = "#particlesource" createVehicle ASLToAGL _pos;
[_soundSource, [(selectRandom ["Smasher_hit", "Goliath_GroundHit"]), 300, 2, 0, 0]] remoteExec ["say3D", 0];

[_craterProp, _particleSource, _soundSource];