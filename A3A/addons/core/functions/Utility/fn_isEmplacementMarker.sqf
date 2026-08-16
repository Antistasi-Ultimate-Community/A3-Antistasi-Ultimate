#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isEmplacementMarker

Description:
    Check if a given marker is an AA, AT, HMG, etc. marker.

Parameters:
    0: _marker - Marker name <STRING>

Optional:

Example:
    (begin example)
    ["Synd_HQ"] call A3A_fnc_isEmplacementMarker; // returns false
    ["FIAHmgpost715.606"] call A3A_fnc_isEmplacementMarker; // returns true
    (end example)

Returns:
    <BOOL> True if the marker is an emplacement marker, false otherwise.

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_marker", nil, [""]]
]) exitWith { false };

if (markerType _marker isEqualTo "") exitWith {
    Warning_1("No such marker %1",str _marker);
    false;
};

[
    hmgpostsFIA,
    roadblocksFIA,
    watchpostsFIA,
    aapostsFIA,
    atpostsFIA
] findIf { _marker in _x } != -1;
