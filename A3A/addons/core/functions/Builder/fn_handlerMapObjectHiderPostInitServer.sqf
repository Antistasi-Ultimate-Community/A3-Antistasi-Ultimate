#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_handlerMapObjectHiderPostInitServer

Description:
    CBA extended post-init handler for map object hider base buildable objects (server side).

Parameters:
    0: _object - Map objects hider <OBJECT>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill
---------------------------------------------------------------------------- */
params[
    ["_object", objNull, [objNull]]
];

if !assert(!isNull _object) exitWith {};

// Object created in base builder preview; do nothing
if !(isNil "A3A_building_EHDB") exitWith {};

private _config = configOf _object >> "Properties";
private _shape = getText(_config >> "shape");
private _width = getNumber(_config >> "width");
private _height = getNumber(_config >> "height");

_object hideObjectGlobal true;
_object enableSimulationGlobal false;

allCurators apply {
    _x addCuratorEditableObjects[[_object], false];
};

private _pos = getPosATL _object;
private _radius = _width max _height;
private _marker = createMarkerLocal[hashValue _object, _pos];

_marker setMarkerShapeLocal _shape;
_marker setMarkerSizeLocal [_width, _height];
_marker setMarkerDirLocal getDir _object;

nearestTerrainObjects[_pos, [], 2 * _radius, false] apply {
    if (_x inArea _marker) then {
        _x hideObjectGlobal true;
        _x enableSimulationGlobal false;
    };
};

if true then {
    deleteMarkerLocal _marker;
} else {
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerAlphaLocal 0.5;
    _marker setMarkerBrushLocal "FDiagonal";
};

nil;
