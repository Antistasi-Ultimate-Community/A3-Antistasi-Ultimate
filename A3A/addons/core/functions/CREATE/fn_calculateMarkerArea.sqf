#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !assert(params[
    ["_marker", nil, [""]]
]) exitWith { 0 };
if (!MARKER_EXISTS(_marker)) exitWith { 0 };

markerSize _marker params["_w", "_h"];

if ("ELLIPSE" isEqualTo markerShape _marker) exitWith {
    pi * _w * _h;
};

4 * _w * _h;
