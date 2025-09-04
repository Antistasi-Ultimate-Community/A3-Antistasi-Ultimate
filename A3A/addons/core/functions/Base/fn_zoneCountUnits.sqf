#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_zoneCountUnits

Description:
    Count units grouped by faction side in a zone defined by a marker/position.

Parameters:
    0: _position - ARRAY<PositionATL,radius> or marker name <ARRAY,STRING>

Optional:
    1: _diameterExtendedCaptureArea - Whether to use average marker size only (traditional, 0) or
        anti-flag yoinking marker additional diameter (default: 0) <NUMBER>
    2: _npcCallback - Callback to execute for each NPC (group != teamPlayer) in the zone, receives the unit as parameter <CODE>

Example:
    (begin example)
    // Traditional unit count
    private _counts = [_marker] call A3A_fnc_zoneCountUnits;

    // Extended unit count with custom position
    private _counts = [[getPosATL theBoss, 150], 150] call A3A_fnc_zoneCountUnits;

    // Traditional unit count with callback
    private _counts = [_marker, 0, {
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
    ["_diameterExtendedCaptureArea", 0, [0]],
    ["_npcCallback", {}, [{}]]
];

Debug_3("_inPos=%1; _diameterExtendedCaptureArea=%2; _npcCallback=%3", _inPos, _diameterExtendedCaptureArea, _npcCallback);

private _useExtendedCount = (_diameterExtendedCaptureArea > 0);
private _positionAndRadius = if (_inPos isEqualType []) then {
    _inPos;
} else {
    if (markerType _inPos isEqualTo "") then {
        Error_1("No such marker: '%1'",_inPos);
        [];
    } else {
        if (_useExtendedCount) then {
            [getMarkerPos _inPos, _diameterExtendedCaptureArea / 2];
        } else {
            [getMarkerPos _inPos, 50 max(((markerSize _inPos select 0) + (markerSize _inPos select 1)) / 2)];
        };
    };
};

private _sidesCount = createHashMapFromArray[
    [teamPlayer, 0],
    [Occupants, 0],
    [Invaders, 0],
    [civilian, 0]
];

if !assert(_positionAndRadius isNotEqualTo []) exitWith { _sidesCount };

if !(_positionAndRadius params[
    ["_position", [], [[]], [2,3]],
    ["_radius", 0, [0]]
]) exitWith { _sidesCount };

private _units = allUnits inAreaArray[_position, _radius, _radius];

if (_useExtendedCount && { _inPos isEqualType "" }) then {
    markerSize _inPos params["_width", "_height"];

    // Only look for units within marker area if that area is actually larger than the radius
    if (_width >= _radius || { _height >= _radius }) then {
        // "appendUnique" all units in the area of the marker
        _units insert[-1, allUnits inAreaArray[
            markerPos _inPos,
            _width,
            _height,
            markerDir _inPos,
            markerShape _inPos isEqualTo "RECTANGLE"
        ], true];
    };
};

private _npcUnits = _units select {
    // No air units, no dead or unconscious
    !(vehicle _x isKindOf "Air") && { _x call A3A_fnc_canFight }
} select {
    private _value = linearConversion[_radius / 2, _radius, _position distance2d _x, 1, 0, true];
    _sidesCount set[side _x, (_sidesCount get side _x) + _value];

    Verbose_4("unit=%1; side=%2; value=%3; sidesCount=%4", _x, side _x, _value, _sidesCount);

    side _x in [Occupants, Invaders];
};

if (_npcUnits isNotEqualTo []) then {
    [{
        params["_units", "_callback"];
        _units apply {
            [_x] call _callback;
        };
    }, [_npcUnits, _npcCallback]] call CBA_fnc_execNextFrame;
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

Debug_1("return=%1",_sidesCount);

_sidesCount;
