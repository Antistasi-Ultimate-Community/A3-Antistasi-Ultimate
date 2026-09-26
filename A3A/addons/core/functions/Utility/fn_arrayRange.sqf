#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_arrayRange

Description:
    Create array of numbers in a range.

Parameters:
    0: _min - minimum value <NUMBER>
    1: _max - maximum value <NUMBER>

Optional:
    2: _fncValue - function to call for each number in the range <CODE> (optional)

Example:
    (begin example)
    [0, 10] call A3A_fnc_arrayRange; // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    [0, 10, { _this * _this }] call A3A_fnc_arrayRange; // [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
    (end example)

Returns:
    <ARRAY> - array of numbers in the range

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
params[
    ["_min", nil, [0]],
    ["_max", nil, [0]],
    ["_fncValue", { _this }, [{}]]
];

if !assert(!isNil "_min") exitWith {[]};
if !assert(!isNil "_max") exitWith {[]};
if (_min >= _max) exitWith {[]};

private _n = _min;
private _result = [];
while { _n <= _max } do {
    _result pushBack (_n call _fncValue);
    INC(_n);
};

_result;
