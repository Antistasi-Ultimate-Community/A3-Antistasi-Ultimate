#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Repair Event Init.");

private _vehicles = [];
private _groups = [];

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

private _frontLine = (outposts + milbases + airportsX + resourcesX + factories + citiesX) select {([_x] call A3A_fnc_isFrontlineNoFIA && {sidesX getVariable [_x,sideUnknown] != teamPlayer})};

if !(_frontLine isEqualTo []) exitWith {
    Error("Position is near frontline, need to select appropriate event.");
    [VEH_REPAIR] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _spawnPosition = [_originPosition, 900, distanceSPWN, 0, 0] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

while {true} do {
    _road = _spawnPosition nearRoads _radiusX;
    if (count _road > 0 && {_road findIf {(position _x) distance2D _originPosition > 500} != -1}) exitWith {};
    _radiusX = _radiusX + 5;
};

private _roadcon = roadsConnectedto ((_road select {(position _x) distance2D _originPosition > 500}) select 0); //guaranteed due to top condition on road search
private _dirveh = if (count _roadcon > 0) then {[_road select 0, _roadcon select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPosition = getPos (_road select 0);

private _marker = [(markersX select {sidesX getVariable [_x, sideUnknown] != teamPlayer}), _originPosition] call BIS_fnc_nearestPosition;
private _side = sidesX getVariable [_marker, Occupants];
private _faction = Faction(_side);

private _isFia = if (random 10 > tierWar) then {true} else {false};
private _vehicleClass = if (_isFia) then {
    selectRandom ((_faction get "vehiclesMilitiaLightArmed") +  (_faction get "vehiclesMilitiaAPCs"));
} else {
    selectRandom ((_faction get "vehiclesAPCs") +  (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightTanks") + (_faction get "vehiclesLightArmed"));
};

if (_vehicleClass == "") exitWith {
    Error("No vehicle class, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _repairVehicleClass = selectRandom ((_faction get "vehiclesRepairTrucks")); // Get a random repair vehicle class

if (_repairVehicleClass == "") exitWith {
    Error("No vehicle class, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

sleep 0.2;

private _crashedVehicle = createVehicle [_vehicleClass, [_roadPosition select 0, _roadPosition select 1, 1], [], 0, "CAN_COLLIDE"];
_crashedVehicle setDir _dirveh;
_crashedVehicle setDamage 0.7;
// Для колёсной техники
private _wheels = [
    "wheel_1_1_steering", "wheel_2_1_steering",
    "wheel_1_2_steering", "wheel_2_2_steering",
    "wheel_1_3_steering", "wheel_2_3_steering"
];
// Выбираем 1-4 случайных колеса
for "_i" from 1 to (1 + floor random 3) do {
    private _wheel = selectRandom _wheels;
    _crashedVehicle setHit [_wheel, 1];
    _wheels = _wheels - [_wheel];
};
// Для гусеничной техники
// Повреждаем случайную гусеницу
if (random 1 <= 0.7) then {
    _crashedVehicle setHit ["HitLTrack", 1];
} else {
    _crashedVehicle setHit ["HitRTrack", 1];
};
// Дополнительные повреждения
if (random 1 < 0.3) then {
    _crashedVehicle setHit ["HitEngine", 0.5 + random 0.5];
};
// Универсальные повреждения
if (random 1 < 0.4) then {
    _crashedVehicle setHit ["HitFuel", 0.3 + random 0.7];
};
_crashedVehicle setFuel 0;
[_crashedVehicle, _side] call A3A_fnc_AIVEHinit;
_crashedVehicle setPos (_crashedVehicle modelToWorld [random [1,2,4.5], 0, 0]); // Физическое смещение
_vehicles pushBack _crashedVehicle;

private _groupCrew = createGroup _side;

private _crewClass = if (_vehicleClass in (
    (_faction get "vehiclesAPCs") +  
    (_faction get "vehiclesIFVs") + 
    (_faction get "vehiclesLightTanks") + 
    (_faction get "vehiclesMilitiaAPCs")
)) then {
    _faction get "unitCrew"
} else {
    [(_faction get "unitRifle")] call SCRT_fnc_unit_getTiered
};

// Получаем количество мест в технике
private _seatCount = [_vehicleClass, false] call BIS_fnc_crewCount;

// Создаем экипаж в зависимости от количества мест (максимум 3)
for "_i" from 1 to _seatCount do {
    private _crew = [_groupCrew, _crewClass, _roadPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_crew] call A3A_fnc_NATOinit;
};
_groups pushBack _groupCrew;

private _driver = (units _groupCrew) select 0;

// Определяем позицию перед _crashedVehicle
private _position = getPos _crashedVehicle;
private _direction = getDir _crashedVehicle;

// Устанавливаем позицию водителя
_driver setPos [_position select 0, (_position select 1) - 2.5, 0]; // Установите высоту на 0 или нужную вам
//[_driver, "REPAIR_VEH_KNEEL"] remoteExec ["switchMove", 0]; ///HubFixingVehicleProne_idle1
// Поворачиваем водителя в сторону техники
_driver setDir (_direction + 90);

private _roadRepair = objNull;
private _radiusX = 5;
while {true} do {
    _roadRepair = _roadPosition nearRoads _radiusX;
    if (count _roadRepair > 0 && {_roadRepair findIf {(position _x) distance2D _originPosition > 500 && (position _x) distance2D _roadPosition > 500} != -1}) exitWith {}; //should find position 500 away from player and 300 meters away from damaged vehicle
    _radiusX = _radiusX + 5;
};
private _roadconRepair = roadsConnectedto ((_roadRepair select {(position _x) distance2D _originPosition > 500 && (position _x) distance2D _roadPosition > 500}) select 0); //guaranteed due to top condition on road search
private _dirvehRepair = if (count _roadconRepair > 0) then {[_roadRepair select 0, _roadconRepair select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPositionRepair = getPos (_roadRepair select 0);

private _repairVehicleData = [_roadPositionRepair, _dirvehRepair, _repairVehicleClass, _side] call A3A_fnc_spawnVehicle;
private _repairVehicle = _repairVehicleData select 0;
_vehicles pushBack _repairVehicle;
private _groupRepair = _repairVehicleData select 2;
_groups pushBack _groupRepair;
[_repairVehicle, _side] call A3A_fnc_AIVEHinit;
_repairVehicle setDir _dirvehRepair; // Random direction for the repair vehicle
// Command the repair vehicle to move towards the crashed vehicle
private _wp = _groupRepair addWaypoint [_roadPosition, 4];
_wp setWaypointCombatMode "SAFE";
private _timeOut = time + 1200;

waitUntil { 
    sleep 3; 
    time > _timeOut || 
    {!alive _crashedVehicle || 
    {
        (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (position _crashedVehicle) < 1400} == -1
    } || 
    {
        (_repairVehicle distance2D _crashedVehicle) < 20
    }}
};

sleep 15;

/* _crashedVehicle action ["repair", _repairVehicle];
_crashedVehicle action ["refuel", _repairVehicle]; ///maybe just set the fuel back to half */
_crashedVehicle setDamage 0;
_crashedVehicle setFuel 0.4;

sleep 2;
_groupCrew addVehicle _crashedVehicle;
private _count = 0;
{
	if (_count > 0) then {
		[_x] orderGetIn true;
	} else {
		_x assignAsDriver _crashedVehicle;
		[_x] orderGetIn true;
		_count = _count + 1;
	};
} forEach (units _groupCrew);

sleep 10;
private _wp = _groupRepair addWaypoint [(getMarkerPos _marker), 40];
_wp setWaypointCombatMode "SAFE";
private _wp2 = _groupCrew addWaypoint [(getMarkerPos _marker), 40];
_wp2 setWaypointCombatMode "SAFE";

waitUntil { 
    sleep 5; 
    time > _timeOut || 
    {!alive _crashedVehicle || 
    {
		(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (position _crashedVehicle) < 1400} == -1
	}|| 
    {
        (_repairVehicle distance2D (getMarkerPos _marker)) < 100
    }}
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Post Ambush Vehicle Event clean up complete.");