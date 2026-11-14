//	Author: Leopard20, Larrow
// 
//	Description:
//	Creates singular small explosion effect roughly hand grenade size.
//
//	Returns:
//	Nothing
//
// 	How to use: 
// 	_position remoteExec ["SCRT_fnc_effect_createSmallExplosionEffect", 0];
//
if (!hasInterface) exitWith {};

private _pos = _this;
private _emitters = [];

private _explosion = "#particlesource" createVehicleLocal _pos; 
_explosion setParticleClass "GrenadeExp";
_explosion setParticleParams [
    [
        "\A3\data_f\ParticleEffects\Universal\Universal",
        16,
        0,
        32,
        0
    ],
    "",
    "Billboard",
    0.3,
    0.3,
    [ 0,0,0 ],
    [ 0,1,0 ],
    0,
    10,
    7.9,
    0.1,
    [ 0.0125 * 0.3 + 4, 0.0125 * 0.3 + 1 ],
    [ [1,1,1,-6],[1,1,1,0] ],
    [ 1 ],
    0.2,
    0.2,
    "",
    "",
    _this,
    0,
    false,
    0.6,
    [ [ 30,30,30,0 ],[ 0,0,0,0 ] ]
];

_explosion setParticleRandom [
    0,
    [ 0.4,0.1,0.4 ],
    [ 0.2,0.5,0.2 ],
    90,
    0.5,
    [ 0,0,0,0 ],
    0,
    0,
    1,
    0.0
];
_explosion setParticleCircle [0,[ 0,0,0 ]];

_emitters pushBack [ _explosion, 0.2];


private _smoke = "#particlesource" createVehicleLocal _pos; 
_smoke setParticleClass "GrenadeSmoke1";
_smoke setParticleParams [
    [
        "\A3\data_f\ParticleEffects\Universal\Universal",
        16,
        9,
        1,
        0
    ],
    "",
    "Billboard",
    1,
    8,
    [ 0,0,0 ],
    [ 0,1.5,0 ],
    0,
    0.0522,
    0.04,
    0.24,
    [ 0.013 * 8 + 3, 0.0125 * 8 + 6, 0.013 * 8 + 8, 0.013 * 8 + 10 ],
    [ [0.7,0.7,0.7,0.36],[0.8,0.8,0.8,0.24],[0.85,0.85,0.85,0.14],[0.9,0.9,0.9,0.08],[0.9,0.9,0.9,0.04],[1,1,1,0.01] ],
    [ 1000 ],
    0.2,
    0.2,
    "",
    "",
    _this,
    0,
    false,
    0.6,
    [ [ 30,30,30,0 ],[ 0,0,0,0 ] ]
    ];
    _smoke setParticleRandom [
    2,
    [ 0.8,0.2,0.8 ],
    [ 2.5,3.5,2.5 ],
    3,
    0.4,
    [ 0,0,0,0 ],
    0.5,
    0.02,
    1,
    0.0
];
_smoke setParticleCircle [0,[ 0,0,0 ]];
_smoke setDropInterval ( 0.08 );

_emitters pushBack [_smoke, 3];

private _light = "#lightPoint" createVehicleLocal _pos; 
_light setLightAmbient [ 0,0,0 ];
_light setLightBrightness 10;
_light setLightColor [ 1,0.6,0.4 ];
_light setLightIntensity 10000;
_light setLightAttenuation [
    0,
    0,
    0,
    2.2,
    500,
    1000
];
_emitters pushBack [ _light, 0.2];

private _time = time;
while {_emitters isNotEqualTo []} do {
    {
        _x params[ "_source", "_length" ];
        if ( time > _time + _length ) then {
            deleteVehicle _source;
            _emitters set[_forEachIndex, objNull];
        };
    } forEach _emitters;
    _emitters = _emitters - [ objNull ];
};
