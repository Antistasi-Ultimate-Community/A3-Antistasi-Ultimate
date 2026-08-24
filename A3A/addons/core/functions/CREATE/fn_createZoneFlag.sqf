/*
	Author:
		jwoodruff40
	
	Description:
		Create flag for marker
	
	Params:
		_markerX <STRING> <Default: NONE>
	
	Dependencies:
		N/A
	
	Scope:
		N/A
	
	Environment:
		Server, unscheduled
	
	Usage:
		[_markerX] call A3A_fnc_createZoneFlag;
	
	Return:
		_return <ARRAY>
			0: _flagX <OBJECT>
			1: _spawn <STRING>
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

if (isNil "_markerX" || {!(_markerX isEqualType "")}) exitWith { Error_1("Invalid marker: %1 for flag creation.", _markerX) };

private _sideX = sidesX getVariable [_markerX,sideUnknown];
if (_sideX isEqualTo sideUnknown) exitWith { Error_2("Invalid side: %1 for marker %2 flag creation.", _sideX, _markerX) };

private _positionX = getMarkerPos (_markerX);
private _faction = Faction(_sideX);
private _typeVehX = _faction get "flag";
private ["_flagX", "_return"];

private _spawnParameter = [_markerX, "flag"] call A3A_fnc_findSpawnPosition;
if (_spawnParameter isEqualType []) then {
	_flagX = createVehicle [_typeVehX, (_spawnParameter select 0), [], 0, "NONE"];
	_flagX setDir (_spawnParameter select 1); // this probably doesn't matter, but eh why not?
	_return = [_flagX, _spawnParameter select 2];
} else {
	Debug_1("Could not find flag placement marker for marker %1; falling back to marker center.", _markerX);
	_flagX = createVehicle [_typeVehX, _positionX, [],0, "NONE"];
	_return = [_flagX, nil];
};

_flagX allowDamage false;
if (flagTexture _flagX != (_faction get "flagTexture")) then { [_flagX, (_faction get "flagTexture")] remoteExec ["setFlagTexture", _flagX] };
[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];

_return;
