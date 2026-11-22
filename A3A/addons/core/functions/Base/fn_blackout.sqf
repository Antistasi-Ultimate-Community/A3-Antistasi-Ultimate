params ["_markerX", "_onoff", ["_overrideRadius", nil]];

private _positionX = getMarkerPos _markerX;
private _damage = 0;
if (not _onoff) then {_damage = 0.95;};

private _radiusX = nil;
private _size = nil;

if (!isNil "_overrideRadius") then { 
    _radiusX =_overrideRadius;
    _size = _overrideRadius;
} else { 
    _radiusX = markerSize _markerX;
    _size = _radiusX select 0;
};

for "_i" from 0 to ((count A3A_lampTypes) -1) do {
    private _lamps = _positionX nearObjects [A3A_lampTypes select _i,_size];
    {
        sleep 0.3; 
        _x setDamage _damage
    } forEach _lamps;
};
