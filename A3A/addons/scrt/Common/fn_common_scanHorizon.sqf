params ["_man", ["_sightHeight", 0], ["_force", true, [true]]];

if (!_force && { insideBuilding _man == 1 }) exitWith {};

while { (alive _man) && { !isNull objectParent _man } } do {
    {
        private _relPos = _man getRelPos [700, _x];

        if (_sightHeight > 0) then {
            _relPos set [2, _sightHeight];
        };

        _man lookAt _relPos;
        sleep random [2.5, 5, 10];
    } forEach [0, 90, 180, 270];

    sleep 1;
};
