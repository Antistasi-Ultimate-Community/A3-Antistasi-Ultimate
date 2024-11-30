#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_veh", "_groupX", "_positionX", "_posOrigin", "_heli"];

private _vehType = typeOf _veh;

if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack") + FactionGet(all,"vehiclesPlanesTransport")) then {
    _veh setVehicleRadar 1;
};

private _reinf = if (count _this > 5) then {_this select 5} else {false};

private _xRef = 2;
private _yRef = 1;
private _landpos = [];
private _dist = if (_reinf) then {30} else {100 + random 100};

/* if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) then {}else{
	{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _heli;
}; */

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

_veh flyInHeight 12;

waitUntil {sleep 1; (not alive _veh) or ((speed _veh < 2) and (speed _veh > -1)) or !(canMove _veh)};

_veh setVelocity [0,0,0];
if (canMove _veh) then {
    [_veh, "open"] spawn A3A_fnc_HeliDoors;
};
if (alive _veh && canMove _veh) then
{   
	private _platformData = productVersion;
    private _platform = _platformData select 6;
    if (_platform == "Linux") then {  ////Professor Sugon says on deez nuts for all Linux users
        {
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
				if (!(alive _veh) or (getPos _veh)#2 < 5) exitWith {};			// Avoid placing dead units underground after vehicle crashes
				_veh setVectorUp [0,0,1];
				[_unit,"gunner_standup01"] remoteExec ["switchmove"];
				_unit attachTo [_veh, [_xRef,_yRef,_d]];
				while {((getposATL _unit select 2) > 1) and (alive _veh) and (alive _unit) and (speed _veh < 10) and (speed _veh > -10)} do
					{
					_unit attachTo [_veh, [2,1,_d]];
					_d = _d - 0.35;
					sleep 0.005;
					};
				detach _unit;
				[_unit,""] remoteExec ["switchMove"];
				sleep 0.5;
			};
			sleep (2 + random 2);
		} forEach units _groupX;
    } else {
		[_veh] call A3A_fnc_smokeCoverAuto;
		[_veh] spawn AR_Rappel_All_Cargo;
	};
};

waitUntil {sleep 0.5; (not alive _veh) or ((count assignedCargo _veh == 0) and (([_veh] call A3A_fnc_countAttachedObjects) == 0))};

sleep 3;
_veh flyInHeight 175;

if (canMove _veh) then {
    [_veh, "close"] spawn A3A_fnc_HeliDoors;
};

if !(_reinf) then
	{
	private _wp2 = _groupX addWaypoint [(position (leader _groupX)), 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
	_wp2 = _groupX addWaypoint [_positionX, 1];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
	_wp2 = _groupX addWaypoint [_positionX, 2];
	_wp2 setWaypointType "SAD";
	}
else
	{
	private _wp2 = _groupX addWaypoint [_positionX, 0];
	_wp2 setWaypointType "MOVE";
};

private _weapons = count weapons _veh;
private _driverturret = _veh weaponsTurret [0];
private _gunnerturret = _veh weaponsTurret [-1];
private _weaponsturret = count _driverturret + count _gunnerturret;

if (_veh in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith {
    [_veh, _heli, _positionX] spawn A3A_fnc_attackHeli;
};

private _wp3 = _heli addWaypoint [_posOrigin, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "NORMAL";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
{_x setBehaviour "CARELESS";} forEach units _heli;