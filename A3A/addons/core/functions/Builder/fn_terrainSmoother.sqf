/// original author https://steamcommunity.com/profiles/76561199005611926
/// slightly modified by wersal

params ["_object"];
private _center = getPos _object;
private _targetHeight = getTerrainHeightASL _center;
private _radius = 22;
private _smoothingRadius = 34;
private _gridSize = getTerrainInfo #2;

// Optimization: pre-calculate center coordinates
private _centerX = _center select 0;
private _centerY = _center select 1;

// General function for terrain height processing
private _fnc_processTerrain = {
    params ["_positions"];
    private _chunkSize = 10000;
    
    for "_i" from 0 to (count _positions) step _chunkSize do {
        private _chunk = _positions select [_i, _chunkSize];
        if (count _chunk > 0) then {
            setTerrainHeight [_chunk, true];
        };
    };
};

// Main zone (22m radius)
private _radiusSqr = _radius * _radius;
private _mainZonePoints = [];
for "_dx" from -_radius to _radius step _gridSize do {
    for "_dy" from -_radius to _radius step _gridSize do {
        if ((_dx*_dx + _dy*_dy) <= _radiusSqr) then {
            _mainZonePoints pushBack [
                _centerX + _dx,
                _centerY + _dy,
                _targetHeight
            ];
        };
    };
};
[_mainZonePoints] call _fnc_processTerrain;

// Smoothing zone (34m radius)
private _smoothingRadiusSqr = _smoothingRadius * _smoothingRadius;
private _smoothingPoints = [];
private _smoothingFactorBase = _smoothingRadius - _radius;

for "_dx" from -_smoothingRadius to _smoothingRadius step _gridSize do {
    for "_dy" from -_smoothingRadius to _smoothingRadius step _gridSize do {
        private _distSqr = _dx*_dx + _dy*_dy;
        if (_distSqr > _radiusSqr && _distSqr <= _smoothingRadiusSqr) then {
            private _xPos = _centerX + _dx;
            private _yPos = _centerY + _dy;
            private _currentHeight = getTerrainHeightASL [_xPos, _yPos];
            private _distance = sqrt(_distSqr);
            
            // Optimization: pre-calculate coefficients
            private _smoothingFactor = (_distance - _radius) / _smoothingFactorBase;
            private _heightDiff = _targetHeight - _currentHeight;
            
            _smoothingPoints pushBack [
                _xPos,
                _yPos,
                _currentHeight + _heightDiff * (1 - _smoothingFactor)
            ];
        };
    };
};
[_smoothingPoints] call _fnc_processTerrain;