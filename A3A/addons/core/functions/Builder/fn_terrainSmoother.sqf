/// original author https://steamcommunity.com/profiles/76561199005611926
/// slightly modified by wersal

#include "..\..\script_component.hpp"

params [
    ["_object", objNull, [objNull]],
    ["_radius", 0, [0]],
    ["_smoothingRadius", 0, [0]]
];

private _center = getPos _object;
private _targetHeight = getTerrainHeightASL _center;
private _gridSize = getTerrainInfo #2;

// Optimization: pre-calculate center coordinates
private _centerX = _center select 0;
private _centerY = _center select 1;

#if __A3_DEBUG__
    // --- DEBUG: collect before heights ---
    private _debugBefore = [];
    for "_dx" from -_smoothingRadius to _smoothingRadius step _gridSize do {
        for "_dy" from -_smoothingRadius to _smoothingRadius step _gridSize do {
            private _x = _centerX + _dx;
            private _y = _centerY + _dy;
            private _h = getTerrainHeightASL [_x, _y];
            _debugBefore pushBack [_x, _y, _h];
        };
    };
    Debug("=== TERRAIN BEFORE ===");
    {
        Debug_1("BEFORE %1", _x);
    } forEach _debugBefore;
    Debug("=== END TERRAIN BEFORE ===");
#endif

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

// Main zone (flatten zone)
private _radiusSqr = _radius * _radius;
private _mainZonePoints = [];
for "_i" from 0 to 1 do {
    _mainZonePoints = [];
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
};

// Smoothing zone (smoothing the edges)
private _smoothingRadiusSqr = _smoothingRadius * _smoothingRadius;
private _smoothingPoints = [];
private _smoothingFactorBase = _smoothingRadius - _radius;
for "_i" from 0 to 1 do {
    _smoothingPoints = [];
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
};

#if __A3_DEBUG__
    // --- DEBUG: collect after heights ---
    private _debugAfter = [];
    for "_dx" from -_smoothingRadius to _smoothingRadius step _gridSize do {
        for "_dy" from -_smoothingRadius to _smoothingRadius step _gridSize do {
            private _x = _centerX + _dx;
            private _y = _centerY + _dy;
            private _h = getTerrainHeightASL [_x, _y];
            _debugAfter pushBack [_x, _y, _h];
        };
    };
    Debug("=== TERRAIN AFTER ===");
    {
        Debug_1("AFTER %1", _x);
    } forEach _debugAfter;
    Debug("=== END TERRAIN AFTER ===");

    // === VISUALIZATION OF MODIFIED POINTS AND RADIUS ===
    private _visGroup = createGroup sideLogic; // group for created objects (to be able to delete them later)

    // 1. Spheres at all main zone points (green) 1m above
    {
        private _sphere = "Sign_Sphere10cm_F" createVehicle [0,0,0];
        _sphere setPosASL [_x#0, _x#1, (_x#2) + 1];
        _sphere setObjectTextureGlobal [0, "#(rgb,1,1,1)color(0,1,0,1)"]; // green
        (group _sphere) deleteGroupWhenEmpty true;
    } forEach _mainZonePoints;

    // 2. Spheres at all smoothing zone points (yellow) 1m above
    {
        private _sphere = "Sign_Sphere10cm_F" createVehicle [0,0,0];
        _sphere setPosASL [_x#0, _x#1, (_x#2) + 1];
        _sphere setObjectTextureGlobal [0, "#(rgb,1,1,1)color(1,1,0,1)"]; // yellow
        (group _sphere) deleteGroupWhenEmpty true;
    } forEach _smoothingPoints;

    /* // 3. Circumference of radius _smoothingRadius (red spheres)
    private _numPoints = 36; // number of points on circumference
    for "_i" from 0 to _numPoints do {
        private _angle = 360 / _numPoints * _i;
        private _dx = _smoothingRadius * cos _angle;
        private _dy = _smoothingRadius * sin _angle;
        private _x = _centerX + _dx;
        private _y = _centerY + _dy;
        private _z = getTerrainHeightASL [_x, _y]; // terrain height (new height can be used)
        private _sphere = "Sign_Sphere10cm_F" createVehicle [0,0,0];
        _sphere setPosASL [_x, _y, _z + 0.5]; // slightly above ground
        _sphere setObjectTextureGlobal [0, "#(rgb,1,1,1)color(1,0,0,1)"]; // red
        (group _sphere) deleteGroupWhenEmpty true;
    }; */
#endif
