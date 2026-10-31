if (!hasInterface) exitWith {};

private _object = _this;
private _pos = position _object;

private _gasEffect = "#particlesource" createVehicleLocal _pos; 
_gasEffect setParticleCircle [0, [0, 0, 0]]; 
_gasEffect setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]; 
_gasEffect setParticleParams [ 
    ["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 9, 1],  
    "",  
    "Billboard",  
    1,  
    32,  
    [0, 0, 0],  
    [0, 0, 0.5],  
    0,  
    10.2,  
    7.9,  
    0.5,  
    [16, 32, 48],  
    [[0.450, 0.556, 0.215, 0.5], [0.662, 0.768, 0.411, 0.25], [0.921, 0.960, 0.811, 0]],  
    [0.125],  
    1,  
    0,  
    "",  
    "",  
    _object 
];  
_gasEffect setDropInterval 0.4; 
_gasEffect attachTo [_object, [0, 0, 2]]; 

private _timeOut = time + 140;
waitUntil {sleep 1; time > _timeOut};
deleteVehicle _gasEffect;
