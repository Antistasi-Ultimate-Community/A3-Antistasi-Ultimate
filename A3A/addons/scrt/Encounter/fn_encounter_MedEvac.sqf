#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("medical Event Init.");

private _vehicles = [];
private _groups = [];

private _player = selectRandom (call SCRT_fnc_misc_getRebelPlayers);

if (isNil "_player") exitWith {
    Error("No players found, aborting.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
};

private _originPosition = position _player;

/* private _frontLine = (outposts + milbases + airportsX + resourcesX + factories + citiesX) select {([_x] call A3A_fnc_isFrontlineNoFIA && {sidesX getVariable [_x,sideUnknown] != teamPlayer})};

if !(_frontLine isEqualTo []) exitWith {
    Error("Position is near frontline, need to select appropriate event.");
    isEventInProgress = false;
    publicVariableServer "isEventInProgress";
}; */

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _spawnPosition = [_originPosition, 900, distanceSPWN, 0, 0] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

private _cityPositions = citiesX apply {getMarkerPos _x};
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
    Error("No suitable road found for medevac, rerolling.");
    [VEH_MEDEVAC] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

private _selectedRoad = _road select 0;
private _roadcon = roadsConnectedto _selectedRoad;

private _dirveh = if (count _roadcon > 0) then {
    [_selectedRoad, _roadcon select 0] call BIS_fnc_dirTo
} else {
    random 360
};

private _roadPosition = getPos _selectedRoad;

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

private _MedicalVehicleClass = selectRandom ((_faction get "vehiclesMedical") + (_faction get "vehiclesHelisTransport")); // Get a random medical vehicle class

if (_MedicalVehicleClass == "") exitWith {
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
_crashedVehicle setHit ["HitLTrack", 1];
_crashedVehicle setHit ["HitRTrack", 1];
// Дополнительные повреждения
_crashedVehicle setHit ["HitEngine", 0.5 + random 0.5];
// Универсальные повреждения
_crashedVehicle setHit ["HitFuel", 0.3 + random 0.7];
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
	_crew removeItems "FirstAidKit";
	_crew setDamage 0.9;
};
_groups pushBack _groupCrew;

{
	_x doMove _roadPosition;
	removeAllWeapons _x;
} forEach (units _groupCrew);

private _groupCrewInjured = createGroup civilian;

{
	[_x] join _groupCrewInjured;
} forEach (units _groupCrew);
_groups pushBack _groupCrewInjured;

private _roadMedical = objNull;
private _radiusX = 5;
while {true} do {
    _roadMedical = _roadPosition nearRoads _radiusX;
    if (count _roadMedical > 0 && {_roadMedical findIf {(position _x) distance2D _originPosition > 500 && (position _x) distance2D _roadPosition > 500} != -1}) exitWith {}; //should find position 500 away from player and 300 meters away from damaged vehicle
    _radiusX = _radiusX + 5;
};
private _roadconMedical = roadsConnectedto ((_roadMedical select {(position _x) distance2D _originPosition > 500 && (position _x) distance2D _roadPosition > 500}) select 0); //guaranteed due to top condition on road search
private _dirvehMedical = if (count _roadconMedical > 0) then {[_roadMedical select 0, _roadconMedical select 0] call BIS_fnc_dirTo} else {random 360};
private _roadPositionMedical = getPos (_roadMedical select 0);

private _MedicalVehicleData = [_roadPositionMedical, _dirvehMedical, _MedicalVehicleClass, _side] call A3A_fnc_spawnVehicle;
private _MedicalVehicle = _MedicalVehicleData select 0;
_vehicles pushBack _MedicalVehicle;
private _groupMedical = _MedicalVehicleData select 2;
private _groupMedevac = createGroup civilian;
{
	removeAllWeapons _x;
	[_x] join _groupMedevac;
} forEach (units _groupMedical);
_groups pushBack _groupMedevac;

[_MedicalVehicle, _side] call A3A_fnc_AIVEHinit;
_MedicalVehicle setDir _dirvehMedical; // Random direction for the medical vehicle
// Command the medical vehicle to move towards the crashed vehicle
private _wp = _groupMedevac addWaypoint [_roadPosition, 15];
_wp setWaypointCombatMode "SAFE";
if (_MedicalVehicle isKindOf "Air") then {
	_wp setWaypointType "GETOUT";
};

private _timeOut = time + 1200;

waitUntil { 
    sleep 2; 
    time > _timeOut || 
    {!alive _crashedVehicle || 
    {
        (call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (position _crashedVehicle) < 1400} == -1
    } || 
    {
        (_MedicalVehicle distance2D _crashedVehicle) < 100
    }}
};

private _positionCrashedVehicle = getPos _crashedVehicle;
private _flaer = "F_40mm_Red" createVehicle _positionCrashedVehicle;
private _smokeGrenade = "SmokeShellRed" createVehicle _positionCrashedVehicle;

_flaer setPos [(_positionCrashedVehicle select 0) - 4, (_positionCrashedVehicle select 1) + 4, 0];
_smokeGrenade setPos [(_positionCrashedVehicle select 0) - 5, (_positionCrashedVehicle select 1) + 5, 0];

sleep 20;

/* _crashedVehicle action ["repair", _repairVehicle];
_crashedVehicle action ["refuel", _repairVehicle]; ///maybe just set the fuel back to half */
//_crashedVehicle setDamage 0;

{
	_x assignAsCargo _MedicalVehicle;
	[_x] join _groupMedevac;
} forEach (units _groupCrewInjured);

_groupMedevac addVehicle _MedicalVehicle;

{
	[_x] orderGetIn true;
} forEach (units _groupMedevac);

private _wp = _groupMedevac addWaypoint [position _MedicalVehicle, -1];
_wp setWaypointType "GETIN";

sleep 20;
private _wp = _groupMedevac addWaypoint [(getMarkerPos _marker), 40];
_wp setWaypointCombatMode "SAFE";
_wp setWaypointType "GETOUT";
/* private _wp2 = _groupCrew addWaypoint [(getMarkerPos _marker), 40];
_wp2 setWaypointCombatMode "SAFE"; */

waitUntil { 
    sleep 5; 
    time > _timeOut || 
    {!alive _crashedVehicle || 
    {
		(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (position _crashedVehicle) < 1400} == -1
	}|| 
    {
        (_MedicalVehicle distance2D (getMarkerPos _marker)) < 100
    }}
};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Post Ambush Vehicle Event clean up complete.");