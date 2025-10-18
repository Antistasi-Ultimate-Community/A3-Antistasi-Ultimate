
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_thingX"];

if(isNil "_thingX" || {isNull _thingX}) exitWith {};

private _playerX = player;

if !(side _playerX == teamPlayer || {side _playerX == civilian}) exitWith {
	[(localize "STR_antistasi_actions_move_assets_header_failure"), (localize "STR_antistasi_actions_move_assets_only_rebels_failure")] call SCRT_fnc_misc_deniedHint;
};
if (!(isNull attachedTo _thingX)) exitWith {
	[(localize "STR_antistasi_actions_move_assets_header_failure"), (localize "STR_antistasi_actions_move_assets_another_player_failure")] call SCRT_fnc_misc_deniedHint;
};
if (vehicle _playerX != _playerX) exitWith {
	[(localize "STR_antistasi_actions_move_assets_header_failure"), (localize "STR_antistasi_actions_move_assets_vehicle_failure")] call SCRT_fnc_misc_deniedHint;
};
if (([_playerX] call A3A_fnc_countAttachedObjects) > 0) exitWith {
	[(localize "STR_antistasi_actions_move_assets_header_failure"), (localize "STR_antistasi_actions_move_assets_attach_failure")] call SCRT_fnc_misc_deniedHint;
};

private _carryableBoxes = [
	FactionGet(reb, "lootCrate"),
	FactionGet(occ,"equipmentBox"),
	FactionGet(inv,"equipmentBox")
];

private _blackboxClasses = [
	"Land_PortableServer_01_black_F",
	"SpaceshipCapsule_01_container_F",
	"Land_MetalCase_01_medium_F"
];

if ((typeOf _thingX) in _blackboxClasses) exitWith {
	[_thingX] call SCRT_fnc_common_moveObject;
};

if((typeOf _thingX) in _carryableBoxes) exitWith {
	[_thingX] call SCRT_fnc_common_moveObject;
};

if !((crew _thingX) isEqualTo []) exitWith {
	[(localize "STR_antistasi_actions_move_assets_header_failure"), (localize "STR_antistasi_actions_move_assets_vehicle_occupied_failure")] call SCRT_fnc_misc_deniedHint;
};

if(!(_thingX isKindOf "StaticWeapon")) exitWith {
	[(localize "STR_antistasi_actions_move_assets_header_failure"), (localize "STR_antistasi_actions_move_assets_restrictions_failure")] call SCRT_fnc_misc_deniedHint;
};

_playerX allowSprint false;
if (captive _playerX) then {
	_playerX setVariable ["carryUndercoverBreak", true];
};

_thingX setVariable ["objectBeingMoved", true];

_thingX enableSimulationGlobal false;

private _spacing = 2 max (1 - (boundingBoxReal _thingX select 0 select 1));
private _height = 0.1 - (boundingBoxReal _thingX select 0 select 2);
_thingX attachTo [_playerX, [0, _spacing, _height]];

private _fnc_placeObject = {
	params [["_thingX", objNull], ["_playerX", objNull], ["_dropObjectActionIndex", -1]];

	if (isNull _thingX) exitWith {diag_log "[Antistasi] Error, trying to place invalid object"};
	if (isNull _playerX) exitWith {diag_log "[Antistasi] Error, trying to place object with invalid player"};

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

//Save static position if it is inside marker
private _sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
private _markerX = [_sites,_playerX] call BIS_fnc_nearestPosition;
private _size = [_markerX] call A3A_fnc_sizeMarker;
private _positionX = getMarkerPos _markerX;

if (_playerX distance2D _positionX < _size) then {
    if (!(_thingX in staticsToSave)) then {
        staticsToSave pushBack _thingX;
        publicVariable "staticsToSave";
    };
    _markersX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
    _pos = position _thingX;
    if (_markersX findIf {_pos inArea _x} != -1) then {
        [(localize "STR_antistasi_actions_move_assets_static_deployed_header"), (localize "STR_antistasi_actions_move_assets_static_deployed_hint")] call A3A_fnc_customHint;
    };
};