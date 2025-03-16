/// original author https://steamcommunity.com/profiles/76561199005611926

/// slightly modified by wersal

params ["_object"];

//private _object = _object; 
private _center = getPos _object;   
private _targetHeight = getTerrainHeightASL _center;   
private _radius = 22;   
private _smoothingRadius = 34; 
private _gridSize = getTerrainInfo #2;  
private _maxElevationChange = 0.1; 

{  
	[_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_center, ["ROCKS","ROCK","Tree", "Bush","SMALL TREE"], 35, false, true];

//["Tree", "Bush", "BUILDING","RUIN","POWERWIND","POWERWAVE","POWERSOLAR","POWER LINES","MAIN ROAD","LIGHTHOUSE","HOUSE","HOSPITAL","HIDE","FUELSTATION","FOUNTAIN","FORTRESS","FENCE","CROSS","CHURCH","CHAPEL","BUSSTOP","BUNKER","QUAY","ROAD","SMALL TREE","STACK","TOURISM","TRACK","TRAIL","TRANSMITTER","VIEW-TOWER","WALL","WATERTOWER"], 20, false, true];

 
private _setHeightArray = []; 
private _count = 0; 
 
for "_dx" from -_radius to _radius step _gridSize do { 
    for "_dy" from -_radius to _radius step _gridSize do { 
        if ((_dx * _dx + _dy * _dy) <= (_radius * _radius)) then { 
            private _xPos = (_center select 0) + _dx; 
            private _yPos = (_center select 1) + _dy; 
            _setHeightArray pushBack [_xPos, _yPos, _targetHeight];  
            _count = _count + 1; 
 
            if (_count > 10000) then { 
                setTerrainHeight [_setHeightArray, true];   
                _setHeightArray = []; 
                _count = 0; 
            }; 
        }; 
    }; 
}; 
 
if (count _setHeightArray > 0) then { 
    setTerrainHeight [_setHeightArray, true];  
}; 
 
_setHeightArray = []; 
_count = 0; 
 
for "_dx" from -_smoothingRadius to _smoothingRadius step _gridSize do { 
    for "_dy" from -_smoothingRadius to _smoothingRadius step _gridSize do { 
        private _distance = sqrt ((_dx * _dx + _dy * _dy)); 
        if (_distance > _radius && _distance <= _smoothingRadius) then { 
            private _xPos = (_center select 0) + _dx; 
            private _yPos = (_center select 1) + _dy; 
            private _currentHeight = getTerrainHeightASL [_xPos, _yPos]; 
            private _smoothingFactor = (_distance - _radius) / (_smoothingRadius - _radius); 
            private _adjustedHeight = _currentHeight + (_targetHeight - _currentHeight) * (1 - _smoothingFactor); 
 
            _setHeightArray pushBack [_xPos, _yPos, _adjustedHeight];  
            _count = _count + 1; 
 
            if (_count > 10000) then { 
                setTerrainHeight [_setHeightArray, true];   
                _setHeightArray = []; 
                _count = 0; 
            }; 
        }; 
    }; 
}; 
 
if (count _setHeightArray > 0) then { 
    setTerrainHeight [_setHeightArray, true];  
}; 
 
_setHeightArray = []; 
_count = 0; 
 
for "_dx" from -_radius to _radius step _gridSize do { 
    for "_dy" from -_radius to _radius step _gridSize do { 
        if ((_dx * _dx + _dy * _dy) <= (_radius * _radius)) then { 
            private _xPos = (_center select 0) + _dx; 
            private _yPos = (_center select 1) + _dy; 
            _setHeightArray pushBack [_xPos, _yPos, _targetHeight];  
            _count = _count + 1; 
 
            if (_count > 10000) then { 
                setTerrainHeight [_setHeightArray, true];   
                _setHeightArray = []; 
                _count = 0; 
            }; 
        }; 
    }; 
}; 
 
if (count _setHeightArray > 0) then { 
    setTerrainHeight [_setHeightArray, true];  
};