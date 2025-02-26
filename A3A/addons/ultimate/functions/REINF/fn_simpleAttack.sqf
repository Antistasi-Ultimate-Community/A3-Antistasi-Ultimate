params [
    ["_target", ""],
    ["_vehCount", 5],
    ["_origin", "CSAT_carrier"],
    ["_modifiers", ["specops"]],
    ["_delay", 30],
    ["_side", Invaders],
    ["_pool", "attack"]
];

private _data = [
    _side, 
    _origin, 
    _target, 
    _pool, 
    _vehCount, 
    _delay, 
    _modifiers
] call A3A_fnc_createAttackForceMixed;

_data;