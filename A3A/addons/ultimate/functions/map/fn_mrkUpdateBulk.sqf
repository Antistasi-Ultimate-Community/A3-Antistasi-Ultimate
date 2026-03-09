#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_mrkUpdateBulk

Description:
    Refreshes marker visuals and hover metadata for multiple markers in a single
    remote execution / JIP entry.

Parameters:
    0: _markerNames - Marker names to refresh <ARRAY>

Optional:
    None.

Example:
    [citiesX + airportsX] call A3U_fnc_mrkUpdateBulk;

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

if !assert(params [
    ["_markerNames", nil, [[]]]
]) exitWith {};

private _uniqueMarkerNames = [];

_markerNames apply {
    if (_x isEqualType "" && {_x != ""}) then {
        _uniqueMarkerNames pushBackUnique _x;
    };
};

_uniqueMarkerNames apply {
    [_x] call A3A_fnc_mrkUpdate;
};