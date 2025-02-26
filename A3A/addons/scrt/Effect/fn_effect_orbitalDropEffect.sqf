/*
    File: fn_effects.sqf
    Author: unknown
    Adopted: wersal

    Description:
        creates a visual effect of an crashing object

    Parameter(s):
        _object - vehicle or a prop to apply effects to

*/
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_object"];

private _object = _object;
private _posATL = _object modelToWorld [0,0,0];

private _ps0 = "#particlesource" createVehicleLocal _posATL;
_ps0 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard",
0, 3, [0, 0, 0.25], [0, 0, 0.5], 1, 1, 0.9, 0.3, [3.5],
[[1,1,1, 0.0], [1,1,1, 0.3], [1,1,1, 0.0]],
[0.75], 0, 0, "", "", _ps0, rad -45];
_ps0 setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 0, 0.5, [0, 0, 0, 0], 0, 0];
_ps0 setDropInterval 0.03;

private _ps1 = "#particlesource" createVehicleLocal _posATL;
_ps1 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1], "", "Billboard",
1, 30, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [8, 24, 30],
[[0.2, 0.2, 0.2, 0], [0.2, 0.2, 0.2, 0.3], [0.2, 0.2, 0.2, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]],
[0.25], 1, 0, "", "", _ps1];
_ps1 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps1 setDropInterval 0.02;

private _ps2 = "#particlesource" createVehicleLocal _posATL;
_ps2 setParticleParams [
["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 9, 16, 0], "", "Billboard",
1, 30, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [8, 24, 30],
[[0.33, 0.33, 0.33, 0], [0.33, 0.33, 0.33, 0.8], [0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]],
[0.25], 1, 0, "", "", _ps2];
_ps2 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps2 setDropInterval 0.02;

///Light it up
private _lightSource = "#lightpoint" createVehicleLocal _posATL;
_lightSource setLightColor [1,0.8,0.8];
_lightSource setLightAmbient [1,0.8,0.8];
_lightSource setLightUseFlare true;
_lightSource setLightFlareSize 30;
_lightSource setLightFlareMaxDistance 2500;
_lightSource setLightBrightness 3000;
_lightSource setLightDayLight true;
_lightSource setLightIntensity 1e6;
//_lightSource setLightAttenuation [0, 2, 4, 4, 0, 9, 10];

_ps0 attachTo [_object, [0, 0, 1]];
_ps1 attachTo [_object, [0, 0, 1]];
_ps2 attachTo [_object, [0, 0, 1]];
_lightSource attachTo [_object, [0, 0, 1]];

//setAperture 5;
waitUntil {sleep 0.1; getPos _object select 2 < 2500};
playSound3D [QPATHTOFOLDER(Sounds\Misc\Sonic.ogg), _object, false, getPosASL _object, 5, 1, 7000];

player spawn {
	for "_i" from 0 to 200 do {
		_vx = vectorup _this select 0;
		_vy = vectorup _this select 1;
		_vz = vectorup _this select 2;
		_coef = 0.01 - (0.0001 * _i);
		_this setvectorup [
		_vx+(-_coef+random (2*_coef)),
		_vy+(-_coef+random (2*_coef)),
		_vz+(-_coef+random (2*_coef))
	];
	sleep (0.01 + random 0.01);
	};
};

sleep 0.5;

//setAperture 0;

waitUntil { sleep 0.01; getPos _object select 2 < 4 }; ///0.01 because we don't wanna bounce

deleteVehicle _ps0;
deleteVehicle _ps1;
deleteVehicle _ps2;
deleteVehicle _lightSource;