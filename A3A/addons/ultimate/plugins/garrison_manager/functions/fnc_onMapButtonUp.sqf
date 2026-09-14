#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_onMapButtonUp

Description:
    Callback for mouse-click events on embedded map

Parameters:
    0: _control - control under mouse cursor
    1: _button - mouse button
    2: _posX - x-coordinate of mouse cursor
    3: _posY - y-coordinate of mouse cursor
    4: _shift - shift key pressed
    5: _ctrl - ctrl key pressed
    6: _alt - alt key pressed

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[
    ["_control", controlNull, [controlNull]],
    ["_button", 0, [0]],
    ["_posX", 0, [0]],
    ["_posY", 0, [0]],
    ["_shift", false, [false]],
    ["_ctrl", false, [false]],
    ["_alt", false, [false]]
];

if !assert(!isNull _control) exitWith {};
if (_button != 0) exitWith {}; // discard right-clicks
if (!_ctrl || _shift) exitWith {};

private _position = _control ctrlMapScreenToWorld[_posX, _posY];
TRACE_1(QFUNC(onMapButtonUp),_position);

private _marker = [allMapMarkers, _position] call BIS_fnc_nearestPosition;
private _distance = _position distance2D markerPos _marker;
TRACE_2(QFUNC(onMapButtonUp),_marker,_distance);

if (_distance > 250) exitWith {};
if !((_alt && GVAR(allowTakeOverAnything)) || (_marker in citiesX)) exitWith {};

[_marker] spawn FUNC(changeLocationOwner);

nil;
