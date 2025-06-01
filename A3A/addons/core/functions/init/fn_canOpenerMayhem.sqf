private _canOpenerClass = "Land_CanOpener_F";
// 1. Собираем объекты с разными радиусами
private _allObjects = [];
private _processed = createHashMap; // Для отслеживания уже обработанных объектов

{
    private _markerPos = getMarkerPos _x;
    
    // a. Камни (500м)
    private _rockObjects = nearestTerrainObjects [
        _markerPos,
        ["ROCK", "ROCKS", "HIDE"],
        300, // Радиус 500 метров
        false,
        false
    ];
    
    // b. Деревья (200м)
    private _treeObjects = nearestTerrainObjects [
        _markerPos,
        ["TREE", "SMALL TREE","FOREST BORDER", "FOREST SQUARE", "FOREST TRIANGLE", "FOREST"],
        50, // Радиус 200 метров
        false,
        false
    ];
    
    // c. Заборы (2000м)
    private _fenceObjects = nearestTerrainObjects [
        _markerPos,
        ["FENCE", "WALL"],
        2000, // Радиус 2 км
        false,
        false
    ];
    
    // d. Остальные объекты (1000м)
    private _defaultObjects = nearestTerrainObjects [
        _markerPos,
        [
            "BUILDING", "BUNKER", "BUSSTOP", "CHAPEL", "CHURCH", "CROSS",
            "FORTRESS", "FOUNTAIN", "FUELSTATION", "HOSPITAL", "HOUSE",
            "LIGHTHOUSE", "POWERSOLAR", "POWERWAVE", "POWERWIND",
            "QUAY", "RUIN", "SHIPWRECK", "STACK", "TOURISM", "TRANSMITTER",
            "VIEW-TOWER", "WATERTOWER"
        ],
        1000, // Радиус 1 км
        false,
        false
    ];
    
    // e. Статические объекты (1000м)
    private _staticObjects = nearestObjects [
        _markerPos,
        ["Static"],
        1000 // Радиус 1 км
    ];
    
    // Объединяем все объекты для этого маркера
    private _markerObjects = _rockObjects + _treeObjects + _fenceObjects + _defaultObjects + _staticObjects;
    
    // Добавляем только уникальные объекты
    {
        if (!isNull _x) then {
            private _netId = netId _x;
            if !(_processed getOrDefault [_netId, false]) then {
                _allObjects pushBack _x;
                _processed set [_netId, true];
            };
        };
    } forEach _markerObjects;
    
} forEach markersX; // Перебираем все маркеры

// f. Простые объекты по всей карте (будем фильтровать по зоне позже)
private _simpleObjects = allSimpleObjects [];
{
    if (!isNull _x) then {
        private _netId = netId _x;
        if !(_processed getOrDefault [_netId, false]) then {
            _allObjects pushBack _x;
            _processed set [_netId, true];
        };
    };
} forEach _simpleObjects;
// 2. Фильтруем мины
private _allMines = allMines;
_allObjects = _allObjects select { !(_x in _allMines) };
// 3. Фильтрация по классам и моделям
private _excludedClasses = [
    "Bush", "Thorn", "Plant", "Fiberplant", "Flower", "Grass",
    "Mine", "ATMine", "APERS", "APERSTripMine",
    "Road", "Powerline", "Wire",
    "invisibleroadway_square_cluteron_f",
    "mil_wiredfence_gate_f",
    "mil_wiredfenced_f",
    "pavement_narrow_f",
    "Land_HelipadEmpty_F"
];

private _excludedModels = [
    "invisibleroadway_square_cluteron_f.p3d",
    "mil_wiredfence_gate_f.p3d",
    "mil_wiredfenced_f.p3d",
    "pavement_narrow_f.p3d",
    "invisibleroadway_square_f.p3d",
    "helipadempty_f.p3d",
    "sharpstones_erosion.p3d", 
    "garbage_square5_f.p3d",
    "bush", "grass", "fiberplant", "plant", "flower", "thorn", "mine"
] apply { toLower _x };

private _filteredObjects = _allObjects select {
    private _obj = _x;
    private _class = toLower typeOf _obj;
    private _exclude = false;
    
    // Проверка по классам
    {
        if (_class find (toLower _x) >= 0) exitWith { _exclude = true };
    } forEach _excludedClasses;
    
    // Проверка по моделям
    if (!_exclude) then {
        private _modelInfo = getModelInfo _obj;
        if (count _modelInfo >= 2) then {
            private _modelName = toLower (_modelInfo select 0);
            private _modelPath = toLower (_modelInfo select 1);
            {
                if (_modelName find _x >= 0 || _modelPath find _x >= 0) exitWith {
                    _exclude = true;
                };
            } forEach _excludedModels;
        };
    };
    
    // Дополнительные условия
    !_exclude && 
    !isNull _obj && 
    !(surfaceIsWater getPos _obj) &&
    !(_obj isKindOf "Animal")
};

// 4. Спавн консервных ножей
{
    private _object = _x;
    private _pos = getPosATL _object;
    
    // Определяем позицию под объектом
    private _start = AGLToASL _pos;
    private _end = [_pos select 0, _pos select 1, (_pos select 2) - 10];
    private _intersections = lineIntersectsSurfaces [
        _start, _end, 
        _object, 
        objNull, 
        true, 
        1, 
        "GEOM", 
        "FIRE"
    ];
    
    if (_intersections isNotEqualTo []) then {
        private _groundPos = ASLToAGL ((_intersections select 0) select 0);
        private _spawnPos = [_groundPos select 0, _groundPos select 1, (_groundPos select 2) + 0.02];
        
        private _canOpener = createVehicle [_canOpenerClass, _spawnPos, [], 0, "CAN_COLLIDE"];
        _canOpener setPosATL _spawnPos;
        _canOpener setDir (random 360);
        _canOpener setVectorUp surfaceNormal _spawnPos;
        _canOpener setVariable ["originalPos", _spawnPos];
        _canOpener setVariable ["spawnTime", time];
        sleep 0.01;
        
        // Запускаем проверку через 2 секунды
        [_canOpener, _spawnPos] spawn {
            params ["_canOpener", "_originalPos"];
            sleep 3;
            
            if (!isNull _canOpener) then {
                private _currentPos = getPosATL _canOpener;
                if (_currentPos distance _originalPos > 2) then {
                    deleteVehicle _canOpener;
                };
            };
        };
    };
} forEach _filteredObjects;