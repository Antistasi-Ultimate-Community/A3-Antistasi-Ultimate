params [["_position", [0,0,0]], ["_type", "BigDestructionFire"]];

if (_position isEqualTo [0,0,0]) exitWith {};

private _fireEffectEmitter = "#particlesource" createVehicle _position;
[_fireEffectEmitter, _type] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

private _lightEffectEmitter = "#lightpoint" createVehicle _position; 
[_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
[_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
[_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

private _effects = [_fireEffectEmitter, _lightEffectEmitter];

_effects;