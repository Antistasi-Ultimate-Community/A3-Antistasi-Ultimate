#include "..\defines.inc"

params ["_thingX"];

private _playerX = player;

_playerX allowSprint false;

_thingX setVariable ["objectBeingMoved", true];
_thingX enableSimulationGlobal false;

if (captive _playerX) then {
	_playerX setVariable ["carryUndercoverBreak", true];
};
[_thingX] remoteExec ["SCRT_fnc_common_removeActionMove", 0, _thingX];

private _spacing = 2 max (1 - (boundingBoxReal _thingX select 0 select 1));
private _height = 0.1 - (boundingBoxReal _thingX select 0 select 2);
_thingX attachTo [_playerX, [0, _spacing, _height]];

private _fnc_placeObject = {
	params [["_thingX", objNull], ["_playerX", objNull], ["_dropObjectActionIndex", -1]];

	if (isNull _thingX) exitWith {Error("Error, trying to place invalid object")};
	if (isNull _playerX) exitWith {Error("Error, trying to place object with invalid player")};

	if (!(_thingX getVariable ["objectBeingMoved", false])) exitWith {};

	if (_playerX == attachedTo _thingX) then {
		_playerX setVelocity [0,0,0];
		_thingX setVelocity [0,0,0];
		detach _thingX;
	};

	if (_dropObjectActionIndex != -1) then {
		_playerX removeAction _dropObjectActionIndex;
	};

	// Without this, non-unit objects often hang in mid-air
	[_thingX, surfaceNormal position _thingX] remoteExec ["setVectorUp", _thingX];

	_thingX setVariable ["objectBeingMoved", false];
};

private _actionX = _playerX addAction [(localize "STR_antistasi_actions_drop_here"), {
	(_this select 3) params ["_thingX", "_fnc_placeObject"];

	[_thingX, player, (_this select 2)] call _fnc_placeObject;
}, [_thingX, _fnc_placeObject],0,false,true,"",""];


waitUntil {
	sleep 1; 
	(_playerX != attachedTo _thingX) 
	or {(vehicle _playerX != _playerX) 
	or {(!isPlayer _playerX) 
	or {(isNull _playerX) 
	or {!(alive _playerX)
	or {(_playerX getVariable ["incapacitated",false])}}}}}
};

_playerX allowSprint true;
_thingX enableSimulationGlobal true;

[_thingX, _playerX, _actionX] call _fnc_placeObject;

[_thingX] remoteExec ["SCRT_fnc_common_addActionMove", 0, _thingX];