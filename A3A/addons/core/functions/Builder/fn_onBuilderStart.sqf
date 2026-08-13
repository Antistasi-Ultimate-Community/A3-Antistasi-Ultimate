#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onBuilderStart

Description:
    CBA_EVENT_CLIENT_BUILDER_START event handler.

Parameters:
    0: _position - Center of builder bubble <ARRAY>
    1: _radius - Radius of builder bubble <NUMBER>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onBuilderStart),_this);

if !assert(params[
    ["_position", nil, [[]], 3],
    ["_radius", nil, [0]]
]) exitWith {};

GVAR(builderBubbleCenter) = _position;
GVAR(builderBubbleRadius) = _radius;
GVAR(builderObjectsHidden) = GVAR(builderObjectsHidden) - [objNull];
GVAR(builderObjectsHidden) apply {
    _x hideObject false;
};

nil;
