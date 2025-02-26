params ["_groupZombies", "_zombieType", "_pos"];

private _zombie = [_groupZombies, _zombieType, [0,0,0], [], 0, "NONE"] call A3A_fnc_createUnit;
_zombie hideObjectGlobal true;
_zombie setPosATL _pos;

uiSleep 1;

_zombie setVariable ["A3U_isZombie", true];

[_zombie, "WBK_Middle_GetUpUnconscious"] remoteExec ["switchMove", 0];
_zombie hideObjectGlobal false;