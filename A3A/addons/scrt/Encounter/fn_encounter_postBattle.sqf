#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Post Battle Event Init");

private _vehicles = [];
private _groups = [];
private _others = [];
private _spawnedPositions = [];
private _craterPositions = [];

// Randomly select winning side
private _winningSide = selectRandom [Occupants, Invaders];
private _losingSide = if (_winningSide == Occupants) then {Invaders} else {Occupants};
private _winFaction = Faction(_winningSide);
private _loseFaction = Faction(_losingSide);

// Get random player position
private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);
if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};
private _originPosition = position _player;

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _frontLine = (outposts + milbases + airportsX + resourcesX + factories + citiesX) select { 
    [_x] call A3A_fnc_isFrontlineNoFIA && 
    {sidesX getVariable [_x,sideUnknown] != teamPlayer}
};

private _frontlineSitesNearPlayer = ((outposts + milbases + airportsX + resourcesX + factories + citiesX) select {
    (_x in _frontLine) && 
    ((getMarkerPos _x) distance2D _player < distanceSPWN*2.5) && 
    {sidesX getVariable [_x,sideUnknown] != teamPlayer}
}) call BIS_fnc_arrayShuffle;

if (_frontlineSitesNearPlayer isEqualTo []) exitWith {
    Info("No outposts in proximity, aborting post battle Event.");
    [VEH_POSTBATTLE] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _spawnPosition = [_originPosition, 900, distanceSPWN, 0, 0] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

private _cityPositions = citiesX apply {getMarkerPos _x};
// Добавляем позиции военных объектов
private _militaryPositions = (outposts + milbases + airportsX) apply {getMarkerPos _x};

while {true} do {
    _road = _spawnPosition nearRoads _radiusX;
    
    if (count _road > 0 && {_road findIf {
        private _roadPos = position _x;
        // Основное условие с добавленной проверкой на военные базы
        (_roadPos distance2D _originPosition > 500) &&
        ({_roadPos distance2D _x < 700} count _cityPositions == 0) &&
        ({_roadPos distance2D _x < 700} count _militaryPositions == 0)
    } != -1}) exitWith {};
    
    _radiusX = _radiusX + 5;
    if (_radiusX > 150) exitWith {_road = [];};
};

if (count _road == 0) exitWith {
    Error("No suitable road found");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _selectedRoad = _road select 0;
private _roadcon = roadsConnectedto _selectedRoad;

private _dirveh = if (count _roadcon > 0) then {
    [_selectedRoad, _roadcon select 0] call BIS_fnc_dirTo
} else {
    random 360
};

private _roadPosition = getPos _selectedRoad;

for "_i" from 0 to (random [3,4,5]) do {
    private _firePosition = 
    [
        _roadPosition, 
        2,
        60,
        2
    ] call BIS_fnc_findSafePos;

    [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0];

    private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
    [_fireEffectEmitter, "BigDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

    private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
    [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

    _others append [_fireEffectEmitter, _lightEffectEmitter];
};

for "_i" from 0 to (random [10,12,14]) do {
    _firePosition2 = [
        _roadPosition, 
        1,
        60,
        1
    ] call BIS_fnc_findSafePos;

    [_firePosition2, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0];

    private _fireEffectEmitter = "#particlesource" createVehicle _firePosition2;
    [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

    private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition2; 
    [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
    [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

    _others append [_fireEffectEmitter, _lightEffectEmitter];    
};

private _surenderGroup = createGroup civilian;

private _fnc_findPos = {
    params ["_center", "_min", "_max", ["_side", nil]];
    private _pos = [];
    private _majorAxis = _max;        // Длинная ось вдоль дороги
    private _minorAxis = _max * 0.3;  // Короткая ось поперек дороги
    private _attempts = 0;

    while {_attempts < 50} do {
        // Генерация точки в эллипсе
        private _angle = random 360;
        private _radius = sqrt(random 1) * _majorAxis;
        private _x = _radius * cos(_angle);
        private _y = _radius * sin(_angle) * (_minorAxis / _majorAxis);

        // Поворот координат согласно направлению дороги
        private _rotX = _x * cos(_dirveh) - _y * sin(_dirveh);
        private _rotY = _x * sin(_dirveh) + _y * cos(_dirveh);

        // Смещение к центру
        _pos = [_center#0 + _rotX, _center#1 + _rotY, 0];

        // Проверка минимального расстояния от центра
        if (_pos distance2D _center < _min) then {_attempts = _attempts + 1; continue;};

        // Определение стороны относительно дороги
        if (!isNil "_side") then {
            // Вычисляем смещение относительно направления дороги
            private _lateralOffset = _rotY;  // Y-компонента после поворота
            
            if (
                (_side == "win" && _lateralOffset < 0) || 
                (_side == "lose" && _lateralOffset >= 0)
            ) then {_attempts = _attempts + 1; continue;};
        };

        // Проверка коллизий
        if (
            (_spawnedPositions findIf {_x distance2D _pos < 15} != -1) ||
            (count (nearestObjects [_pos, ["All"], 7]) > 0)
        ) then {_attempts = _attempts + 1; continue;};

        _spawnedPositions pushBack _pos;
        break;
    };

    if (_pos isEqualTo []) then {_pos = _center};
    _pos
};
// Calculate vehicle counts
private _vehicleCountWin = 1 + floor(random 2);
private _vehicleCountLose = _vehicleCountWin + (selectRandom [-1,0,1]);
_vehicleCountLose = (_vehicleCountLose max 1) min 3;

private _isFIA = (random 10 > tierWar);

// Функция создания техники с кратером
private _fnc_createVehicleWithEffects = {
    params ["_pos", "_dir", "_class", "_side", "_isLoser", "_faction"];
    
    // Создаем кратер с 40% вероятностью
    private _crater = objNull;
    if (random 1 < 0.4 && {_craterPositions findIf {_x distance2D _pos < 10} == -1}) then {
        _crater = createVehicle ["CraterLong", _pos, [], 0, "CAN_COLLIDE"];
        _crater setDir _dir;
        _crater setVectorUp surfaceNormal _pos;
        _craterPositions pushBack _pos;
        _others pushBack _crater;
    };
    
    // Корректируем позицию для техники
    private _vehiclePos = if (!isNull _crater) then {
        _crater getPos [random [0,1.5,3], random 360]
    } else {
        _pos
    };
    
    // Создаем технику
    private _vehicle = createVehicle [_class, [_vehiclePos select 0, _vehiclePos select 1, 1.5], [], 0, "CAN_COLLIDE"];
    _vehicle setDir _dir;
    
    // Общие повреждения
    _vehicle setDamage random [0.5, 0.7, 0.9];
    _vehicle setFuel 0;
    
    // В блоке создания техники после setFuel:
    if (random 1 <= 0.7) then {
        // Для колёсной техники
		private _wheels = [
		    "wheel_1_1_steering", "wheel_2_1_steering",
		    "wheel_1_2_steering", "wheel_2_2_steering",
		    "wheel_1_3_steering", "wheel_2_3_steering"
		];

		// Выбираем 1-4 случайных колеса
		for "_i" from 1 to (1 + floor random 3) do {
		    private _wheel = selectRandom _wheels;
		    _vehicle setHit [_wheel, 1];
		    _wheels = _wheels - [_wheel];
		};

		// Для гусеничной техники
		// Повреждаем случайную гусеницу
		if (random 1 <= 0.7) then {
		    _vehicle setHit ["HitLTrack", 1];
		} else {
		    _vehicle setHit ["HitRTrack", 1];
		};

		// Дополнительные повреждения
		if (random 1 <= 0.3) then {
		    _vehicle setHit ["HitEngine", 0.5 + random 0.5];
		};

		// Универсальные повреждения
		if (random 1 <= 0.4) then {
		    _vehicle setHit ["HitFuel", 0.3 + random 0.7];
		};
    };
    
    // Проверка на тяжелую технику через массивы фракций
    private _isHeavy = _class in (
        (_faction get "vehiclesAPCs") + 
        (_faction get "vehiclesIFVs") + 
        (_faction get "vehiclesLightTanks") + 
        (_faction get "vehiclesMilitiaAPCs")
    );
    
    // Переворачивание для не-тяжелой техники
    if (!_isHeavy && {random 1 > 0.3}) then {
        _vehicle setVectorUp [random 0.3, random 0.3, 1];
        _vehicle setPosATL (getPosATL _vehicle vectorAdd [0,0,0.5]);
    };
    
    // Инициализация и эффекты
    [_vehicle, _side] call A3A_fnc_AIVEHinit;
    if (random 1 <= 0.3) then {
        [_vehiclePos, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0];
    };
    
    _vehicle;
};

// Функция создания экипажа
private _fnc_createCrew = {
    params ["_vehicle", "_class", "_side", "_faction", "_isLoser"];
    
    private _crewGroup = createGroup _side;
    private _crewType = if (_class in (
        (_faction get "vehiclesAPCs") + 
        (_faction get "vehiclesIFVs") + 
        (_faction get "vehiclesLightTanks") + 
        (_faction get "vehiclesMilitiaAPCs")
    )) then {
        _faction get "unitCrew"
    } else {
        [(_faction get "unitRifle")] call SCRT_fnc_unit_getTiered
    };

    private _spawnPos = getPos _vehicle getPos [random 5, random 360];
    private _unit = [_crewGroup, _crewType, _spawnPos, [], 5, "NONE"] call A3A_fnc_createUnit;
    
    if (random 1 > 0.5) then {
        _unit setDamage random [0.3, 0.5, 0.7];
        private _anim = selectRandom [
            "Acts_CivilInjuredGeneral_1",
            "Acts_CivilShocked_1",
            "Acts_CivilShocked_2",
            "Acts_SittingWounded_loop"
        ];
        [_unit, _anim] remoteExec ["switchMove", 0];
        _unit disableAI "PATH";
        _unit stop true;
        _unit removeItems "FirstAidKit";
        [_unit] spawn {
            params ["_unit"];
            while {alive _unit} do {
                    sleep random [5, 10, 20];
                    if (alive _unit && random 1 < 0.4) then {
                        private _tracks = A3A_Civilian_Amb_Tracks get "Fear";
                        if (count _tracks > 0) then {
                            private _panicNoise = selectRandom _tracks;
                            [_unit, _panicNoise # 0] remoteExec ["say3D"];
                        };
                    };
                };
            };
    } else {
        _unit setDamage 1;
        _unit setPosATL [_spawnPos#0 + random 3, _spawnPos#1 + random 3, 0];
    };
    [_unit] call A3A_fnc_NATOinit;
    [_unit] joinSilent _surenderGroup;
    _groups pushBack _crewGroup;
};

// Спавн техники победившей стороны
for "_i" from 1 to _vehicleCountWin do {
    private _spawnPos = [_roadPosition, 10, 60, "win"] call _fnc_findPos;
    private _vehicleClass = if (_isFIA) then {
        selectRandom ((_winFaction get "vehiclesMilitiaLightArmed") + (_winFaction get "vehiclesMilitiaAPCs"))
    } else {
        selectRandom ((_winFaction get "vehiclesAPCs") + 
                    (_winFaction get "vehiclesIFVs") +
                    (_winFaction get "vehiclesLightTanks") + 
                    (_winFaction get "vehiclesLightArmed"))
    };

    // Направление к центру дороги с отклонением
    private _baseDir = _spawnPos getDir _roadPosition;
    private _vehicleDir = _baseDir + (random [ -15, 0, 15 ]);
    
    private _vehicle = [
        _spawnPos,
        _vehicleDir,
        _vehicleClass,
        _winningSide,
        false,
        _winFaction
    ] call _fnc_createVehicleWithEffects;

    for "_j" from 1 to (2 + floor(random 3)) do {
        [_vehicle, _vehicleClass, _winningSide, _winFaction, false] call _fnc_createCrew;
    };
    _vehicles pushBack _vehicle;
};

// Спавн техники проигравшей стороны
for "_i" from 1 to _vehicleCountLose do {
    private _spawnPos = [_roadPosition, 5, 60, "lose"] call _fnc_findPos;
    private _vehicleClass = if (_isFIA) then {
        selectRandom ((_loseFaction get "vehiclesMilitiaLightArmed") + (_loseFaction get "vehiclesMilitiaAPCs"))
    } else {
        selectRandom ((_loseFaction get "vehiclesAPCs") + 
                    (_loseFaction get "vehiclesIFVs") + 
                    (_loseFaction get "vehiclesLightArmed") +
                    (_loseFaction get "vehiclesLightTanks"))
    };

    // Направление к центру дороги с отклонением
    private _baseDir = _spawnPos getDir _roadPosition;
    private _vehicleDir = _baseDir + (random [ -15, 0, 15 ]);
    
    private _vehicle = [
        _spawnPos,
        _vehicleDir,
        _vehicleClass,
        _losingSide,
        true,
        _loseFaction
    ] call _fnc_createVehicleWithEffects;

    for "_j" from 1 to (2 + floor(random 3)) do {
        [_vehicle, _vehicleClass, _losingSide, _loseFaction, true] call _fnc_createCrew;
    };

    _vehicles pushBack _vehicle;
};

// Survivor behavior script
private _spawnSurvivor = {
    params ["_group","_faction","_pos"];
    private _unitType = [(_faction get "unitRifle")] call SCRT_fnc_unit_getTiered;
    private _unit = [_group, _unitType, _pos, [], 5, "NONE"] call A3A_fnc_createUnit;
    _unit setDamage random [0.4, 0.6, 0.8];
    [_unit] call A3A_fnc_NATOinit;
    _unit removeItems "FirstAidKit";

    if (random 1 < 0.4) then {
        private _anim = selectRandom [
            "Acts_CivilInjuredGeneral_1",
            "Acts_CivilShocked_1",
            "Acts_CivilShocked_2",
            "Acts_SittingWounded_loop"
        ];
        [_unit, _anim] remoteExec ["switchMove", 0];
        _unit disableAI "PATH";
        _unit stop true;
        [_unit] joinSilent _surenderGroup;
        
        private _tracks = A3A_Civilian_Amb_Tracks get "Fear";
        if (count _tracks > 0) then {
            private _panicNoise = selectRandom _tracks;
            [_unit, _panicNoise # 0] remoteExec ["say3D"];
        };
        
        [_unit] spawn {
            params ["_unit"];
            while {alive _unit} do {
                sleep random [5, 10, 20];
                if (alive _unit && random 1 < 0.4) then {
                    private _tracks = A3A_Civilian_Amb_Tracks get "Fear";
                    if (count _tracks > 0) then {
                        private _panicNoise = selectRandom _tracks;
                        [_unit, _panicNoise # 0] remoteExec ["say3D"];
                    };
                };
            };
        };
    } else {
        _unit setDamage 0.8;
        [_unit] spawn {
            params ["_unit"];
            while {alive _unit} do {
                private _movePos = _roadPosition getPos [random 50, random 360];
                _unit doMove _movePos;
                sleep 120 + random 180;
            };
        };
    };
};

// Spawn survivors across entire oval
private _survivorGroup = createGroup _winningSide;
for "_i" from 1 to (2 + floor(random 4)) do {
    private _spawnPos = [_roadPosition, 10, 45] call _fnc_findPos;
    [_survivorGroup, _winFaction, _spawnPos] call _spawnSurvivor;
};
_groups pushBack _survivorGroup;

// Cleanup
private _timeOut = time + 1200;
waitUntil { 
    sleep 5; 
    time > _timeOut || 
    {(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D _roadPosition < 1400} == -1}
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
{deleteVehicle _x} forEach _others;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Post Battle Event cleanup complete");