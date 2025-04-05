/*  Helicopter flies a combat landing approach, lands and unloads cargo group before returning to base

Scope: Server or HC
Environment: Scheduled, spawned

Parameters:
    <OBJECT> The helicopter to control
    <GROUP> Crew group for helicopter
    <GROUP> Cargo group for helicopter
    <POSATL> Destination position for troops to attack after landing
    <POSATL> Position for heli to return to after offloading
    <POSATL> Landing position for heli
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_helicopter", "_crewGroup", "_cargoGroup", "_posDestination", "_originPos", "_landPos"];

private _vehType = typeOf _helicopter;

if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack") + FactionGet(all,"vehiclesPlanesTransport")) then {
    _helicopter setVehicleRadar 1;
};

// avoid weird situations where they receive RTB instructions before they finish unloading
_crewGroup setVariable ["A3A_AIScriptHandle", _thisScript];
_cargoGroup setVariable ["A3A_AIScriptHandle", _thisScript];

private _landPad = createVehicle ["Land_HelipadEmpty_F", _landPos, [], 0, "NONE"];
_helicopter setVariable ["LandingPad", _landPad, true];             // cleared up (eventually) by heli deletion handler

//Create the waypoints for the crewGroup
private _vehWP0 = _crewGroup addWaypoint [_landPos, 0];
_vehWP0 setWaypointType "MOVE";
_vehWP0 setWaypointSpeed "FULL";
_vehWP0 setWaypointCompletionRadius 150;
_vehWP0 setWaypointBehaviour "CARELESS";

private _midHeight = [100, 150] select (A3A_climate isEqualTo "tropical");
_helicopter flyInHeight _midHeight;

waitUntil {sleep 1; (_helicopter distance2D _landPos) < 800};

while {_helicopter distance2D _landPos > 675} do {
    [_helicopter, "CMFlareLauncher"] call BIS_fnc_fire;
    [_helicopter, "CMFlareLauncher_Triples"] call BIS_fnc_fire;
    [_helicopter, "CMFlareLauncher_Singles"] call BIS_fnc_fire;
    sleep 0.3;
};

waitUntil {sleep 1; (_helicopter distance2D _landPos) < 600};

_helicopter flyInHeight 0;                  // helps to keep it near the ground after landing
_helicopter land "LAND";

// Landing path setup
private _endPos = getPosASL _landPad;
private _startPos = getPosASL _helicopter;
private _midPos = _endPos vectorAdd [0,0,_midHeight];

private _initialVelocity = (velocity _helicopter);
_initialVelocity set [2, 0];
private _velocityVector = +_initialVelocity;
_initialVelocity = vectorMagnitude _initialVelocity;
private _initialSpeed = speed _helicopter/3.6;
//We got the initial velocity of the heli

private _distance = _startPos distance _midPos;
private _landingTime = _distance/_initialVelocity * 1.35;

private _maxAngle = ((_initialVelocity * _initialVelocity/3600) * 35) min 35;

//Starting land approach with bezier curve
private _startToMidVector = _midPos vectorDiff _startPos;
private _midToEndVector = _endPos vectorDiff _midPos;

private _vectorDir = vectorDir _helicopter;
private _vectorUp = vectorUp _helicopter;

private _interval = 0;
private _time = 0;
private _angleStep = 0.25;
private _angleTarget = 0;
private _angleIs = 0;
private _angleDiff = 0;
private _heightDiff = 0;

/* _helicopter action ["LandGear", _helicopter]; */

private _driver = driver _helicopter;
while {_interval < 0.9999} do ////
{
    //Update data
    _vectorDir = vectorDir _helicopter;
    _vectorUp = vectorUp _helicopter;

    //Calculating the current angle and what the helicopter should turn too
    _angleTarget = sin (_interval * 180) * _maxAngle;
    _angleIs = (asin (_vectorDir select 2));
    _angleDiff = _angleTarget - _angleIs;
    if(_angleDiff > _angleStep) then {_angleDiff = _angleStep;};
    if(_angleDiff < -_angleStep) then {_angleDiff = -_angleStep;};

    //Calculating the height and back value needed
    _backFactor = -tan (_angleDiff);
    _vectorUp = _vectorUp vectorAdd (_vectorDir vectorMultiply _backFactor);

    _heightDiff = (sin (_angleIs + _angleDiff)) - (_vectorDir select 2);
    _vectorDir = _vectorDir vectorAdd [0, 0, _heightDiff];

    private _lineStart = _startPos vectorAdd (_startToMidVector vectorMultiply _interval);
    private _lineEnd = _midPos vectorAdd (_midToEndVector vectorMultiply _interval);

    _helicopter action ["LandGear", _helicopter]; ///forces vehicle to use landing gear
    
    _helicopter setVelocityTransformation
    [
        _lineStart,
        _lineEnd,
        _velocityVector,
        _velocityVector,
        _vectorDir,
        _vectorDir,
        _vectorUp,
        _vectorUp,
        _interval
    ];

    _time = time;
    sleep 0.001;
    _interval = _interval + (((time - _time)/_landingTime) * (1 - (_interval / 2)));
    _velocityVector = _lineEnd vectorDiff _lineStart;
    _velocityVector = (vectorNormalized _velocityVector) vectorMultiply (_initialSpeed * (1 - _interval));

    if(!canMove _helicopter || !alive _driver) exitWith {};
    _dam = damage _helicopter;
    if ((getPos _helicopter select 2) < 0.25 ) exitwith{_helicopter setdamage 0; sleep 1; _helicopter setdamage _dam;};
};
sleep 0.1;
_helicopter engineOn true; ///keep the engine running
if(canMove _helicopter || alive _driver) then {
    [_helicopter, "open"] spawn A3A_fnc_HeliDoors;
};

_cargoGroup leaveVehicle _helicopter;

private _second = false;
{
  if (_second) then {
    _x action ["Eject", _helicopter];
    unassignVehicle _x;
    _second = false;
  } else {
    _second = true;
    _x leaveVehicle _helicopter;
  };
  private _second = true;
} forEach units _cargoGroup;

private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 10];
_cargoWP1 setWaypointType "MOVE";
_cargoWP1 setWaypointBehaviour "AWARE";
_cargoWP1 setWaypointSpeed "FULL";
private _cargoWP2 = _cargoGroup addWaypoint [_posDestination, 50];
_cargoWP2 setWaypointType "SAD";
_cargoWP2 setWaypointBehaviour "COMBAT";
_cargoGroup spawn A3A_fnc_attackDrillAI;


if(!canMove _helicopter || !alive _driver) exitWith { deleteVehicle _landPad };

// Dirty hack to stop the heli lurching around near the ground
private _dismountTime = count units _cargoGroup - 3;
[_helicopter, time + _dismountTime, _midHeight, _landPad] spawn {
    params ["_heli", "_endTime", "_flyHeight", "_landPad"];
    while { time < _endTime } do {
        _heli setVelocity [0,0,-0.65];
        sleep 1;
    };
    if (!isEngineOn _heli) then { _heli engineOn true;};
    _heli flyInHeight _flyHeight;
    deleteVehicle _landPad;
};
[_helicopter] call A3A_fnc_smokeCoverAuto;          // Already done by GetOut handler in AIVehInit?

_helicopter engineOn true;  ///still keeping the engine running

sleep _dismountTime;

_helicopter engineOn true;  ///we must keep the engine running
if(canMove _helicopter || alive _driver) then {
    [_helicopter, "close"] spawn A3A_fnc_HeliDoors;
};

private _weapons = count weapons _helicopter;
private _driverturret = _helicopter weaponsTurret [0];
private _gunnerturret = _helicopter weaponsTurret [-1];
private _weaponsturret = count _driverturret + count _gunnerturret;

if (_vehType in FactionGet(all,"vehiclesTransportAir") && _weapons > 2 || _weaponsturret > 2) exitWith { //assuming first 2 are laserdesignator and flares
    _helicopter action ["LandGearUp", _helicopter];
    [_helicopter, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
};

if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith {
    _helicopter action ["LandGearUp", _helicopter];
    [_helicopter, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
};
// Heli RTB
private _vehWP1 = _crewGroup addWaypoint [_originPos, 0];
_vehWP1 setWaypointType "MOVE";
_vehWP1 setWaypointStatements ["true", "if (local this and alive this) then { deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList }"];

_vehWP1 setWaypointBehaviour "CARELESS";

_crewGroup setCurrentWaypoint _vehWP1;
waitUntil {sleep 1; (_helicopter distance2D _landPos) > 165};
for '_i' from 1 to (5 + (round random 2)) do
{
    [_helicopter, "CMFlareLauncher"] call BIS_fnc_fire;
    [_helicopter, "CMFlareLauncher_Triples"] call BIS_fnc_fire;
    [_helicopter, "CMFlareLauncher_Singles"] call BIS_fnc_fire;
    sleep 1;
};
_helicopter action ["LandGearUp", _helicopter];
