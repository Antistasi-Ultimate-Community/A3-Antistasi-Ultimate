#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_veh", "_groupX", "_positionX", "_posOrigin", "_heli"];

private _vehType = typeOf _veh;

_veh setVehicleRadar 1;

private _reinf = if (count _this > 5) then {_this select 5} else {false};

private _xRef = 2;
private _yRef = 1;
private _landpos = [];
private _dist = if (_reinf) then {30} else {100 + random 100};

/* while {true} do
	{
 	_landpos = _positionX getPos [_dist,random 360];
 	if (!surfaceIsWater _landpos) exitWith {};
	}; */

_landpos = [_positionX, _dist, _dist, 2, 0, 5, 0] call BIS_fnc_findSafePos;
_landpos set [2,0];
{_x setBehaviour "CARELESS";} forEach units _heli;
private _wp = _heli addWaypoint [_landpos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "FULL";

_wp setWaypointCompletionRadius 3;

waitUntil {sleep 1; (not alive _veh) or (_veh distance _landpos < 550) or !(canMove _veh)};
private _midHeight = [100, 150] select (A3A_climate isEqualTo "tropical");

_veh flyInHeight _midHeight;

// Landing path setup
private _endPos = getPosASL _landPad;
private _startPos = getPosASL _veh;
private _midPos = _endPos vectorAdd [0,0,_midHeight];
private _initialVelocity = (velocity _veh);
_initialVelocity set [2, 0];
private _velocityVector = +_initialVelocity;
private _initialSpeed = vectorMagnitude _initialVelocity;
private _distance = _startPos distance _midPos;
private _landingTime = _distance / _initialSpeed * 1.35;
private _maxAngle = ((_initialSpeed * _initialSpeed / 3600) * 35) min 35;
private _startToMidVector = _midPos vectorDiff _startPos;
private _midToEndVector = _endPos vectorDiff _midPos;

private _driver = driver _veh;
private _interval = 0;
private _lastTime = time;

while {_interval < 0.7777} do {
    // Update time
    private _currentTime = time;
    private _deltaTime = _currentTime - _lastTime;
    _lastTime = _currentTime;

    // Calculate interval step
    _interval = _interval + ((_deltaTime / _landingTime) * (1 - (_interval / 2))) min 0.7777;

    // Calculate current path points
    private _lineStart = _startPos vectorAdd (_startToMidVector vectorMultiply _interval);
    private _lineEnd = _midPos vectorAdd (_midToEndVector vectorMultiply _interval);

    // Update velocity vector
    _velocityVector = (_lineEnd vectorDiff _lineStart) vectorMultiply (_initialSpeed * (1 - _interval) / vectorMagnitude (_lineEnd vectorDiff _lineStart));

    // Angle calculation
    private _angleTarget = sin (pi * _interval) * _maxAngle;
    private _vectorDir = vectorDir _veh;
    private _angleIs = asin (_vectorDir select 2);
    private _angleDiff = (_angleTarget - _angleIs) min 0.25 max -0.25;

    // Adjust vectors for pitch control
    private _backFactor = -tan _angleDiff;
    private _vectorUp = (vectorUp _veh) vectorAdd (_vectorDir vectorMultiply _backFactor);
    _vectorDir = _vectorDir vectorAdd [0, 0, sin(_angleIs + _angleDiff) - (_vectorDir select 2)];

    // Apply velocity transformation
    _veh setVelocityTransformation [
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

    // Exit condition checks
    if (!canMove _veh || !alive _driver) exitWith {};

    // Throttle loop execution
    sleep 0.01;
};
_veh flyInHeight 15;
_veh setVelocity [0,0,0];
sleep 0.5;
_driver action ["VTOLVectoring", _veh];
_driver action ["VectoringUp", _veh];
_driver action ["VectoringUp", _veh];

_veh setVelocity [0,0,0];
if (canMove _veh) then {
    [_veh, "open"] spawn A3A_fnc_HeliDoors;
};
_driver disableAI "MOVE";
_driver disableAI "PATH";
_driver action ["VectoringUp", _veh];
_driver action ["VectoringUp", _veh];
if (alive _veh && canMove _veh) then
{
	[_veh] call A3A_fnc_smokeCoverAuto;
	{
	_veh setVelocity [0,0,0];
	_veh setVectorUp [0,0,1];
	[_veh,_x,_xRef,_yRef] spawn
		{
		private ["_veh","_unit","_d","_xRef","_yRef"];
		_veh = _this select 0;
		_unit = _this select 1;
		_xRef = _this select 2;
		_yRef = _this select 3;
		waitUntil {((speed _veh < 1) and (speed _veh > -1))};
		_d = -1;
		unassignVehicle _unit;
		moveOut _unit;
		if (!(alive _veh) or (getPos _veh)#2 < 5) exitWith {};	// Avoid placing dead units underground after vehicle crashes
		_veh setVectorUp [0,0,1];
		[_unit,"gunner_standup01"] remoteExec ["switchmove"];
		_unit attachTo [_veh, [_xRef,_yRef,_d]];
		while {((getposATL _unit select 2) > 1) and (alive _veh) and (alive _unit) and (canMove _veh) and (speed _veh < 10) and (speed _veh > -10)} do
			{
			_unit attachTo [_veh, [2,1,_d]];
			_d = _d - 0.35;
			private _driver = driver _veh;
			_veh setVectorUp [0,0,1];
			_driver action ["VectoringUp", _veh];
			_veh setVelocity [0,0,0];
			sleep 0.005;
			};
		detach _unit;
		[_unit,""] remoteExec ["switchMove"];
		sleep 0.5;
		};
	sleep (2 + random 2);
	} forEach units _groupX;
};

_driver action ["VTOLVectoringCancel", _veh];
_driver enableAI "MOVE";
_driver enableAI "PATH";

waitUntil {sleep 1; (not alive _veh) or ((count assignedCargo _veh == 0) and (([_veh] call A3A_fnc_countAttachedObjects) == 0))};

sleep 3;
_veh flyInHeight 175;

if (canMove _veh) then {
    [_veh, "close"] spawn A3A_fnc_HeliDoors;
};

if !(_reinf) then {
	private _wp2 = _groupX addWaypoint [(position (leader _groupX)), 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
	_wp2 = _groupX addWaypoint [_positionX, 1];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
	_wp2 = _groupX addWaypoint [_positionX, 2];
	_wp2 setWaypointType "SAD";
} else {
	private _wp2 = _groupX addWaypoint [_positionX, 0];
	_wp2 setWaypointType "MOVE";
};

private _weapons = count weapons _veh;
private _driverturret = _veh weaponsTurret [0];
private _gunnerturret = _veh weaponsTurret [-1];
private _weaponsturret = count _driverturret + count _gunnerturret;

if (_veh in FactionGet(all,"vehiclesTransportAir") && _weapons > 2 || _weaponsturret > 2) exitWith { //assuming first 2 are laserdesignator and flares
    [_veh, _heli, _positionX] spawn A3A_fnc_attackHeli;
};

if (_veh in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith {
    [_veh, _heli, _positionX] spawn A3A_fnc_attackHeli;
};
private _wp3 = _heli addWaypoint [_posOrigin, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
{_x setBehaviour "CARELESS";} forEach units _heli;