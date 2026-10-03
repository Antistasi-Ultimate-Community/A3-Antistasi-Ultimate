params [["_position", [0,0,0]], ["_amount", 6], ["_type", "SmallDestructionFire"]];

private _radius = if (_type isEqualTo "SmallDestructionFire") then {5} else {50};
private _effects = [];

for "_i" from 0 to (random [(_amount-1),_amount,(_amount+1)]) do {

    private _firePosition = [
        _position, 
        2,
        _radius,
        2
    ] call BIS_fnc_findSafePos;

    private _fire = [_firePosition, _type] call A3U_fnc_createFire;

    _effects append _fire;
};

_effects;