#include "Constants.inc"
#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info("Post Ambush Convoy Event Init.");

private _vehicles = [];
private _groups = [];
private _others = [];

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
    [VEH_POSTAMBUSHCONVOY] remoteExecCall ["SCRT_fnc_encounter_selectAndExecuteEvent", 2];
};

Info_2("%1 will be used as center of the event at %2 position.", name _player, str _originPosition);

private _spawnPosition = [_originPosition, 900, distanceSPWN, 0, 0] call BIS_fnc_findSafePos;
private _road = objNull;
private _radiusX = 5;

while {true} do {
    _road = _spawnPosition nearRoads _radiusX;
    if (count _road > 1 && {_road findIf {(position _x) distance2D _originPosition > 500} != -1}) exitWith {};
    _radiusX = _radiusX + 5;
};

private _mainRoad = (_road select {(position _x) distance2D _originPosition > 500}) select 0;
private _roadcon = roadsConnectedto _mainRoad;
private _dirveh = if (count _roadcon > 0) then {
    [_mainRoad, _roadcon select 0] call BIS_fnc_dirTo; // Direction from main segment to first connected road
} else {
    random 360; // Fallback direction if no connected roads
};

private _roadSegments = [_mainRoad];
private _connectedRoads = _roadcon;

while {count _roadSegments < 3 && count _connectedRoads > 0} do {
    private _nextSegment = _connectedRoads select 0;
    if (!(_nextSegment in _roadSegments)) then {
        _roadSegments pushBack _nextSegment;
        _connectedRoads = roadsConnectedto _nextSegment;
    };
};

private _marker = [(markersX select {sidesX getVariable [_x, sideUnknown] != teamPlayer}), _originPosition] call BIS_fnc_nearestPosition;
private _side = sidesX getVariable [_marker, Occupants];
private _faction = Faction(_side);

private _crater = createVehicle ["CraterLong", getPos _mainRoad, [], 0, "CAN_COLLIDE"];
_crater setDir _dirveh + 180;
_crater setVectorUp surfaceNormal getPos _crater;
_others pushBack _crater;

private _smokeEffect = "test_EmptyObjectForSmoke" createVehicle (getPos _crater); 
_smokeEffect attachTo [_crater,[0,0,-1]];
_others pushBack _smokeEffect;

private _convoyLength = 3;
private _convoySpacing = 15;

{
    private _roadSegment = _x;
    private _roadPosition = getPos _roadSegment;
    private _currentIndex = _forEachIndex;
    private _roadDir = _dirveh; // Initial direction from main segment

    if (_currentIndex > 0) then {
        // Offset along initial direction
        _roadPosition = _roadPosition getPos [_convoySpacing * _currentIndex, _roadDir];
        
        // Position correction and direction update
        private _nearestRoad = [_roadPosition, 50, []] call BIS_fnc_nearestRoad;
        if (!isNull _nearestRoad) then {
            _roadPosition = getPos _nearestRoad;
            private _newRoadcon = roadsConnectedto _nearestRoad;
            if (count _newRoadcon > 0) then {
                // Update direction from new segment
                _roadDir = [_nearestRoad, _newRoadcon select 0] call BIS_fnc_dirTo;
            };
        };
        
        // Lateral offset relative to updated direction
        private _latOffset = random [-3.5, 0, 3.5];
        _roadPosition = _roadPosition getPos [_latOffset, _roadDir + 90];
    };

    private _isFia = if (random 10 > tierWar) then {true} else {false};
    private _vehicleClass = "";

    // Vehicle class selection
    if (_currentIndex == 1) then {
        private _specialVehicles = [];
        if (_isFia) then {
            _specialVehicles = (_faction get "vehiclesMilitiaTrucks") + (_faction get "vehiclesFuelTrucks") + (_faction get "vehiclesAmmoTrucks") + (_faction get "vehiclesMedical");
        } else {
            _specialVehicles = (_faction get "vehiclesAA") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesFuelTrucks") + (_faction get "vehiclesAmmoTrucks") + (_faction get "vehiclesRepairTrucks");
        };
        
        if (count _specialVehicles > 0) then {
            _vehicleClass = selectRandom _specialVehicles;
        } else {
            _vehicleClass = if (_isFia) then {
                selectRandom ((_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaAPCs"))
            } else {
                selectRandom ((_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs"))
            };
        };
    } else {
        _vehicleClass = if (_isFia) then {
            selectRandom ((_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaAPCs"))
        } else {
            selectRandom ((_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightTanks") + (_faction get "vehiclesLightArmed"))
        };
    };

    if (_vehicleClass == "") then { continue };

    // Create vehicle with current direction
    private _vehicle = createVehicle [
        _vehicleClass, 
        _roadPosition vectorAdd [0, 0, 1.5], 
        [], 
        0, 
        "CAN_COLLIDE"
    ];
    _vehicle setDir _roadDir + 180; // Vehicle oriented to current direction
    // Additional parameters (damage, crew, etc.)
    private _dir = getDir _vehicle;
    if (_currentIndex != 0) then {
        if (_currentIndex == 1) then {
            private _randomDirOffset = random [0, -25, 25];
            _vehicle setDir (_dir + _randomDirOffset);
            _vehicle setPos (_vehicle modelToWorld [random [-2.5,0,2.5], 0, 0]); // Physical displacement
        } else {
            private _randomDirOffset = random [-45, 45, 0];
            _vehicle setDir (_dir + _randomDirOffset);
            _vehicle setPos (_vehicle modelToWorld [random [-4.5,0,4.5], 0, 0]); // Physical displacement
        };
    };
    _vehicle setDamage random [0.3, 0.5, 0.7];
    
    if (_currentIndex == 0) then {
        // Wheeled vehicles damage
        private _wheels = [
            "wheel_1_1_steering", "wheel_2_1_steering",
            "wheel_1_2_steering", "wheel_2_2_steering",
            "wheel_1_3_steering", "wheel_2_3_steering"
        ];

        // Select 1-4 random wheels
        for "_i" from 1 to (1 + floor random 3) do {
            private _wheel = selectRandom _wheels;
            _vehicle setHit [_wheel, 1];
            _wheels = _wheels - [_wheel];
        };

        // Tracked vehicles damage
        // Damage random track
        if (random 1 <= 0.7) then {
            _vehicle setHit ["HitLTrack", 1];
        } else {
            _vehicle setHit ["HitRTrack", 1];
        };

        // Additional damage
        if (random 1 <= 0.3) then {
            _vehicle setHit ["HitEngine", 0.5 + random 0.5];
        };

        // Universal damage
        if (random 1 <= 0.4) then {
            _vehicle setHit ["HitFuel", 0.3 + random 0.7];
        };
    } else {
        // Post-creation damage
        if (random 1 <= 0.7) then {
            // Wheeled vehicles damage
            private _wheels = [
                "wheel_1_1_steering", "wheel_2_1_steering",
                "wheel_1_2_steering", "wheel_2_2_steering",
                "wheel_1_3_steering", "wheel_2_3_steering"
            ];

            // Select 1-4 random wheels
            for "_i" from 1 to (1 + floor random 3) do {
                private _wheel = selectRandom _wheels;
                _vehicle setHit [_wheel, 1];
                _wheels = _wheels - [_wheel];
            };

            // Tracked vehicles damage
            // Damage random track
            if (random 1 <= 0.7) then {
                _vehicle setHit ["HitLTrack", 1];
            } else {
                _vehicle setHit ["HitRTrack", 1];
            };

            // Additional damage
            if (random 1 <= 0.3) then {
                _vehicle setHit ["HitEngine", 0.5 + random 0.5];
            };

            // Universal damage
            if (random 1 <= 0.4) then {
                _vehicle setHit ["HitFuel", 0.3 + random 0.7];
            };
        };
    };
    
    _vehicle setFuel 0;
    [_vehicle, _side] call A3A_fnc_AIVEHinit;
    _vehicles pushBack _vehicle;
    
    private _crewClass = if (
        _vehicleClass in (
            (_faction get "vehiclesAPCs") + 
            (_faction get "vehiclesIFVs") + 
            (_faction get "vehiclesLightTanks") + 
            (_faction get "vehiclesMilitiaAPCs") +
            (_faction get "vehiclesAA")
        )
    ) then {
        _faction get "unitCrew"
    } else {
        [(_faction get "unitRifle")] call SCRT_fnc_unit_getTiered
    };
    
    private _groupCrew = createGroup _side;
    private _crewCount = switch (true) do {
        case (_vehicleClass in ((_faction get "vehiclesAPCs") + (_faction get "vehiclesIFVs") + (_faction get "vehiclesLightTanks") + (_faction get "vehiclesMilitiaAPCs") + (_faction get "vehiclesAA"))): { 3 };
        case (_currentIndex == 1 && {_vehicleClass in ((_faction get "vehiclesFuelTrucks") + (_faction get "vehiclesAmmoTrucks"))}): { 2 };
        default { [2,3,4] select _currentIndex };
    };
    
    for "_j" from 1 to _crewCount do {
        private _crew = [_groupCrew, _crewClass, _roadPosition, [], 0, "NONE"] call A3A_fnc_createUnit;
        [_crew] call A3A_fnc_NATOinit;
        
        if ((random 100) > (20 + 15 * _currentIndex)) then {
            sleep 0.5;
            _crew setDamage 1;
            private _dir = [_crew, _vehicle] call BIS_fnc_dirTo;
            _crew setDir (_dir - 180);
        } else {
            _crew removeItems "FirstAidKit";
            _crew setDamage (0.8 - 0.2 * _currentIndex);
        };
    };
    _groups pushBack _groupCrew;

    if (_currentIndex == 0) then {
        // Create fire effects for lead vehicle
        for "_k" from 0 to (random [3,5,6]) do {
            private _firePosition = [
                _roadPosition, 
                2,
                25,
                2
            ] call BIS_fnc_findSafePos;

            [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0, _vehicle];

            private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
            [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

            private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
            [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
            [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
            [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

            _others append [_fireEffectEmitter, _lightEffectEmitter];
        };
    } else {
        // Random chance for secondary vehicle effects
        if (random 1 <= 0.5) then {
            for "_k" from 0 to (random [3,5,6]) do {
                private _firePosition = [
                    _roadPosition, 
                    2,
                    25,
                    2
                ] call BIS_fnc_findSafePos;

                [_firePosition, 5000] remoteExec ["SCRT_fnc_effect_createBurningDebrisEffect", 0, _vehicle];

                private _fireEffectEmitter = "#particlesource" createVehicle _firePosition;
                [_fireEffectEmitter, "SmallDestructionFire"] remoteExec ["setParticleClass", 0, _fireEffectEmitter];

                private _lightEffectEmitter = "#lightpoint" createVehicle _firePosition; 
                [_lightEffectEmitter, 0.3] remoteExec ["setLightBrightness", 0, _lightEffectEmitter];
                [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightAmbient", 0, _lightEffectEmitter];
                [_lightEffectEmitter, [0.70, 0.3, 0.3]] remoteExec ["setLightColor", 0, _lightEffectEmitter];

                _others append [_fireEffectEmitter, _lightEffectEmitter];
            };
        }
    };
} forEach _roadSegments;

private _timeOut = time + 1200;
waitUntil { 
    sleep 5; 
    time > _timeOut || 
    { {alive _x} count _vehicles == 0 || 
    {(call SCRT_fnc_misc_getRebelPlayers) findIf {_x distance2D (getPos _crater) < 1400} == -1}
}};

{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;
{deleteVehicle _x} forEach _others;

isEventInProgress = false;
publicVariableServer "isEventInProgress";

Info("Post Ambush Convoy Event clean up complete.");