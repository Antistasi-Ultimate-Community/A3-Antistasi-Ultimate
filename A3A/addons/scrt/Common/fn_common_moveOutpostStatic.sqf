#include "..\defines.inc"

params ["_target", "_caller", "_actionId", "_arguments"];

_target setVariable ["objectBeingMoved", true];

private _spacing = 2 max (1 - (boundingBoxReal _target select 0 select 1));
private _height = 0.1 - (boundingBoxReal _target select 0 select 2);
_target attachTo [_caller, [0, _spacing, _height]];

private _fnc_placeObject = {
	params [["_target", objNull], ["_caller", objNull], ["_dropObjectActionIndex", -1]];

	if (isNull _target) exitWith {Error("Error, trying to place invalid object")};
	if (isNull _caller) exitWith {Error("Error, trying to place object with invalid player")};

	if (!(_target getVariable ["objectBeingMoved", false])) exitWith {};

	if (_caller == attachedTo _target) then {
		_caller setVelocity [0,0,0];
		_target setVelocity [0,0,0];
		detach _target;
	};

	if (_dropObjectActionIndex != -1) then {
		_caller removeAction _dropObjectActionIndex;
	};

	// Without this, non-unit objects often hang in mid-air
	[_target, surfaceNormal position _target] remoteExec ["setVectorUp", _target];

	_target setVariable ["objectBeingMoved", false];

    [_target,"Move_Outpost_Static"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian], _target];
};

private _actionX = _caller addAction [(localize "STR_antistasi_actions_drop_here"), {
	(_this select 3) params ["_target", "_fnc_placeObject"];

	[_target, player, (_this select 2)] call _fnc_placeObject;
}, [_target, _fnc_placeObject],0,false,true,"",""];

private _markerX = [(atpostsFIA + aapostsFIA + hmgpostsFIA), _caller] call BIS_fnc_nearestPosition;
private _markerSize = [_markerX] call A3A_fnc_sizeMarker;
private _markerPosition = getMarkerPos _markerX;

[_target, "remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_target];

waitUntil {sleep 1; (_caller != attachedTo _target) or (vehicle _caller != _caller) or (_caller distance2D _markerPosition > (_markerSize + 4)) or !([_caller] call A3A_fnc_canFight) or (!isPlayer _caller)};

[_target, _caller, _actionX] call _fnc_placeObject;

if  (_caller distance2D _markerPosition > (_markerSize + 4)) exitWith {
    [(localize "STR_antistasi_actions_move_assets_static_position_header"), (localize "STR_antistasi_actions_move_assets_static_position_far_away_hint")] call SCRT_fnc_misc_deniedHint;
};

sleep 1.5;

private _direction =  getDir _target;
private _position = getPosATL _target;
staticPositions setVariable [_markerX, [_position, _direction], true];

[(localize "STR_antistasi_actions_move_assets_static_position_header"), (localize "STR_antistasi_actions_move_assets_static_position_saved_hint")] call A3A_fnc_customHint;