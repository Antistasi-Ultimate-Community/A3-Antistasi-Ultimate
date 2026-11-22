/*
    Author: [Hazey]
    Description:
    Add Ambient room light to civilian house

    Arguments:
      <Object> Building to add light to.

    Return Value:
      <Object> Light Source

    Scope: Any
    Environment: Any
    Public: Yes

    Example: 
    _light = [_building] call A3A_FNC_createRoomLight;

    License: MIT License
*/
#include "..\..\script_component.hpp"

params ["_building"];

private _lowCiv = Faction(civilian) getOrDefault ["attributeLowCiv", false];

if (_lowCiv) exitWith {};

private _colours = [[255,217,66],[255,162,41],[221,219,206]];
private _colour = _colours select (random((count _colours)-1));
private _brightness = random 10 / 100;

// Create light source
private _light = "#lightpoint" createVehicle getPosATL _building;

[_light, _brightness] remoteExec ["setLightBrightness"];
[_light, _colour] remoteExec ["setLightColor"];
[_light, [_building, [1,1,1]]] remoteExec ["lightAttachObject"];


_light
