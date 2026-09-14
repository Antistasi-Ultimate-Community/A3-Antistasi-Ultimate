#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_garrison_fnc_getGarrisonInfo

Description:
    Return units in garrison

Parameters:
    0: _entry - Garrison entry <HASHMAP>

Optional:

Example:

Returns:
    Return description <ARRAY>

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[["_entry",nil,[createHashMap]]];

private _marker = _entry get "marker";
if (sidesX getVariable[_marker, sideUnknown] isNotEqualTo teamPlayer) exitWith {[]};

private _garrison = garrison getVariable[_marker, []];
TRACE_2(QFUNC(getGarrisonInfo),_marker,_garrison);

[
    createHashMapFromArray[["count", count _garrison]],
    createHashMapFromArray[["count", [_marker] call A3A_fnc_getGarrisonLimit]]
]

+

(GVAR(lbColumns) select { _x select 2 isNotEqualTo "" } apply {
    _x params["","_name","_unit"];

    createHashMapFromArray[
        ["name", _name],
        ["dataColumn", true],
        ["count", { _x isEqualTo (A3A_faction_reb get _unit) } count _garrison]
    ]
});
