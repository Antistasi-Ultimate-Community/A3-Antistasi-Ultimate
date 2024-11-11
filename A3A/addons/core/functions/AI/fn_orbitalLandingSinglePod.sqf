params ["_podX", "_pod", "_dist", "_x", "_positionX", "_posOrigin"];

_podX allowDamage false;
_podX lock 2;
_podX setVehicleLock "LOCKED";

_landPos = _positionX getPos [_dist,random 360];

_podX = typeOf _pod createVehicle position _x;
_podX setPos [((_landpos select 0) + random 30),((_landpos select 1) - random 30), 3000];
_podX setVelocity [0,0,-135];
_podX lock 2;
_podX setVehicleLock "LOCKED";

_x moveInAny _podX;

[_podX] call SCRT_fnc_effect_orbitalDropEffect;
_podX setVelocity [0,0,-1];

_bomb = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,0];
_bomb setPosWorld (position _podX); 
_bomb setDamage 1;

sleep 0.05;

_podX setPos [(getPos _podX select 0),(getPos _podX  select 1),0.5];
_podX allowDamage true;

_x allowDamage true;

sleep 0.45;
[_podX, "open"] spawn A3A_fnc_PodsDoors;

sleep 1.55;

_x action ["Eject", _podX];
_x leaveVehicle _podX;
[_podX] spawn A3A_fnc_VEHDespawner;
