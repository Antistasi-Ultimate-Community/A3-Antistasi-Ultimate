#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_zoneCountUnits

Description:
    Count units grouped by faction side in a zone defined by a marker/position.

Parameters:
    0: _position - ARRAY<PositionATL,radius> or marker name <ARRAY,STRING>

Optional:
    1: _useTraditionalCount - Whether to use average marker size only (true) or
        anti-flag yoinking marker area plus additional radius (false) (default: true) <BOOL>
    2: _npcCallback - Callback to execute for each NPC (group != teamPlayer) in the zone, receives the unit as parameter <CODE>

Example:
    (begin example)
    private _counts = [_marker] call A3A_fnc_zoneCountUnits;
    private _counts = [[getPosATL theBoss, 100], false] call A3A_fnc_zoneCountUnits;
    private _counts = [_marker, false, {
        params[["_unit", objNull, [objNull]]];
        // Do something with the unit
        hint format["non-friendly %1 is in the zone", name _unit];
    }] call A3A_fnc_zoneCountUnits;

    private _numRebel = _counts get teamPlayer;
    (end example)

Returns:
    Count hashmap (key=side,value=count); sides are always available as keys, even if count is zero <HASHMAP>

Author:
    UnseenKill
---------------------------------------------------------------------------- */
params[
    ["_inPos", [], [[], ""]],
    ["_useTraditionalCount", true, [true]],
    ["_npcCallback", {}, [{}]]
];

if (_inPos isEqualType "") then {
    if (markerType _inPos isEqualTo "") then {
        Error_1("No such marker: '%1'",_inPos);
        _inPos = [];
    } else {
        if (_useTraditionalCount) then {
            _inPos = [getMarkerPos _inPos, 50 max(((markerSize _inPos select 0) + (markerSize _inPos select 1)) / 2)];
        } else {
            throw "implement me";
        };
    };
};

if !assert(_inPos isNotEqualTo []) exitWith {};

if !(_inPos params[
    ["_position", [], [[]], [2,3]],
    ["_radius", 0, [0]]
]) exitWith {};

private _units = if (_useTraditionalCount) then {
    allUnits inAreaArray [_position, _radius, _radius];
} else {
    throw "implement me"
};

private _sidesCount = createHashMapFromArray[
    [teamPlayer, 0],
    [Occupants, 0],
    [Invaders, 0],
    [civilian, 0]
];

_units select {
    // No air units, no dead or unconscious
    !(vehicle _x isKindOf "Air") && { _x call A3A_fnc_canFight }
} apply {
    private _value = linearConversion[_radius / 2, _radius, _position distance2d _x, 1, 0, true];
    _sidesCount set[side _x, (_sidesCount get side _x) + _value];

    if (side _x in [Occupants, Invaders]) then {
        [_x] call _npcCallback;
    };
};

#if __A3A_DEBUG__
if !assert(count keys _sidesCount == 4) then {
    Error_3("ZoneCountUnits at %1 found %2 sides (%3), expected 4", _position, count _sidesCount, keys _sidesCount);
    _sidesCount = createHashMapFromArray[
        [teamPlayer, _sidesCount getOrDefault[teamPlayer, 0]],
        [Occupants, _sidesCount getOrDefault[Occupants, 0]],
        [Invaders, _sidesCount getOrDefault[Invaders, 0]],
        [civilian, _sidesCount getOrDefault[civilian, 0]]
    ];
};
#endif

_sidesCount;
