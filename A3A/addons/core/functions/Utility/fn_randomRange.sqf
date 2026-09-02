#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_randomRange

Description:
    Generate a random WHOLE number between two values

Parameters:
    0: _min - Minimum range <NUMBER>
    1: _max - Maximum range <NUMBER>

Optional:

Example:
    (begin example)
    [5,10] call A3A_fnc_randomRange;
    (end example)

Returns:
    <NUMBER> - Random whole number between _min and _max (including both extremes)

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_min", nil, [0]],
    ["_max", nil, [0]]
]) exitWith { 0 };

if (_max isEqualTo _min) exitWith { _min };
if !assert(_min < _max) exitWith { _min };
_min + round(random(_max - _min));
