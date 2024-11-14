params ["_pod", "_groupX", "_positionX", "_posOrigin"/* , "_crew" */];

///TODO
///Make as many landing positions as there landing Pods
///If landing Pod doesn't fit any cargo, spawn at least 2 or 3 pods, split cargo group and spawn them near pod after landing.
///If landing Pod have less cargo then group size, fill pod, then spawn enother fill that pod, etc.
///If landing Pod has 1 seat , spawn as many pods as there are units in the group.
///If there multiple pods, launch each Pod at random delay (from 0.5 to 2 seconds)
///Launch Pod(s) straitgt to earth, no angle , no curve , don't want to deal with physx
///Don't care if landing pos. is near units(halo wars 2 trailer style(or WH40k)), big bad if landing pos is building(or maybe not, just destroy building upon landing?(what if builing undestracteble))
///After landing, reg. behaviour for the troops.
///Maybe add a check if units in the groop somehow managed to land far apart, split the group(to avoid stupid behaviour like running towards one enother), after some time check if they are near each other, if so rejoin group.

_dist = 1 + random 100;
_landpos = _positionX getPos [_dist,random 360];
{
	_x allowDamage false;

} forEach units _groupX;
private _podseats = 0;

_podseats = [typeOf _pod, true] call BIS_fnc_crewCount;

private _groupcount = count (units _groupX);
if (_podseats >= _groupcount) then {
	{
		_x assignAsCargo _pod;
		_x moveInCargo _pod;
	} forEach units _groupX;
};
private _wp2 = _groupX addWaypoint [(position (leader _groupX)), 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) spawn A3A_fnc_attackDrillAI"];
_wp2 = _groupX addWaypoint [_positionX, 1];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true","if !(local this) exitWith {}; {if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
_wp2 = _groupX addWaypoint [_positionX, 2];
_wp2 setWaypointType "SAD";

{_x setBehaviour "AWARE";} forEach units _Pod;

if (_podseats != 1) then {
	_pod allowDamage false;
	_pod lock 2;
	_pod setVehicleLock "LOCKED";

	_pod setPos [(_landpos select 0),(_landpos select 1), 3000];
	_pod setVelocity [0,0,-150];

	[_pod] call SCRT_fnc_effect_orbitalDropEffect;
	_pod setVelocity [0,0,-1];

	_bomb = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,0];
	_bomb setPosWorld (position _pod); 
	_bomb setDamage 1;

	sleep 0.2;
	_pod setPos [(getPos _pod select 0),(getPos _pod  select 1),1];

	sleep 1;

	{
		_x allowDamage true;
	} forEach units _groupX;

	_pod allowDamage true;

	sleep 0.45;
	[_pod, "open"] spawn A3A_fnc_PodsDoors;

	[_pod] call A3A_fnc_smokeCoverAuto;
};


if (_podseats >= _groupcount) then {
	private _second = false;
	{
  	if (_second) then {
    	_x action ["Eject", _pod];
    	unassignVehicle _x;
    	_second = false;
  	} else {
    	_second = true;
    	_x leaveVehicle _pod;
  	};
  	private _second = true;
	} forEach units _groupX;
};
sleep 2;
private _SafeMovePos = [];
if (_podseats < _groupcount) then {
	if (_podseats == 1) then {
		{
			_podX = typeOf _pod createVehicle position _x;
			[_podX, _pod, _dist, _x, _positionX, _posOrigin] spawn A3A_fnc_orbitalLandingSinglePod;
			sleep 2;
		} forEach units _groupX;
	} else {
		{
			_SafeMovePos = [getPos _pod, 1, 3, 3, 1, 20, 0] call BIS_fnc_findSafePos;
			_x setPos _SafeMovePos;
			sleep 0.02;
		} forEach units _groupX;	
	};
};
if (_podseats == 1) then {
	deleteVehicle driver _pod;
	deleteVehicle _pod;
};
[_podX] spawn A3A_fnc_VEHDespawner;
[_pod] spawn A3A_fnc_VEHDespawner;
