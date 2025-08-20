/*
    Author: [Hazey]
    Description:
        Run's detection for if enemy units are too close to callers. Firemission Danger Close!

    Arguments:
        <Array> Target position where artillery is meant to strike around.
        <Number> Radius in which we should check for friendly AI.
        <Side> Side of the caller of firemission.

    Return Value:
        <Bool> Is too close (True) else returns (False)

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_targetPos, 150, _side] call A3A_fnc_artilleryDangerClose;

    License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define ALL_MARKERS (airportsX + milbases + outposts + factories + resourcesX + seaports)

params ["_targetPos", "_radius", "_side"];

if (((groups _side) + (groups civilian)) findIf {
    (alive leader _x) &&
    ((leader _x distance2D _targetPos) < _radius)
} isNotEqualTo -1) exitWith {
    true;
};

if ((ALL_MARKERS findIf {
    (sidesX getVariable[_x, sideUnknown] isEqualTo _side) &&
    (_targetPos inArea _x)
}) isNotEqualTo -1) exitWith {
    true;
};

false;
