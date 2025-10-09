#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_terrainManipulatorPostInitClient

Description:
    CBA extended post-init handler for terrain object hider base buildable objects (client side).

Parameters:
    0: _object - Terrain objects hider <OBJECT>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill
---------------------------------------------------------------------------- */
Verbose_1("_this=%1",_this);

params[
    ["_object", objNull, [objNull]]
];

if !assert(!isNull _object) exitWith {};
if !(local _object) exitWith {};

// Object not created in base builder preview
if (isNil "A3A_building_EHDB") exitWith {};

// Object created in base builder; show outline to local owner only
[{
    params[["_object", objNull, [objNull]]];

    if (_object getVariable[QGVAR(isTempObject), false]) exitWith {};

    private _config = configOf _object >> QGVAR(Properties);
    private _shape = getText(_config >> "previewShape");
    private _balls = switch (_shape) do {
        case "ellipse": {
            private _radiusX = getNumber(_config >> "previewWidth");
            private _radiusY = getNumber(_config >> "previewHeight");
            private _points = [];

            for "_angle" from 0 to 360 step 20 do {
                _points pushBack[_radiusX * cos (_angle), _radiusY * sin (_angle), 0];
            };

            _points;
        };

        case "rectangle": {
            private _width = getNumber(_config >> "previewWidth");
            private _height = getNumber(_config >> "previewHeight");
            [
                [-_width / 2, -_height / 2, 0],
                [0, -_height / 2, 0],
                [_width / 2, -_height / 2, 0],
                [_width / 2, 0, 0],
                [_width / 2, _height / 2, 0],
                [0, _height / 2, 0],
                [-_width / 2, _height / 2, 0],
                [-_width / 2, 0, 0]
            ];
        };

        default {
            Error_2("Unknown shape %1 for map object hider %2",_shape,typeOf _object);
            [];
        };
    };

    if !assert(_balls isNotEqualTo []) exitWith {};

    _balls apply {
        private _offset = _x;
        private _ball = "Sign_Sphere10cm_F" createVehicleLocal[0,0,0];
        _ball attachTo[_object, _offset vectorAdd[0,0,1]];
        A3A_boundingCircle pushBack _ball; // push back to bounding circle spheres; they are deleted once builder is closed
    };
}, _this, 0.5] call CBA_fnc_waitAndExecute;

nil;
