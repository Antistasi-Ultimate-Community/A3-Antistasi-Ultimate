#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onBuilderAbort

Description:
    CBA_EVENT_CLIENT_BUILDER_ABORT event handler.

Parameters:

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onBuilderAbort),_this);

GVAR(builderObjectsHidden) apply {
    _x hideObject true;
};

GVAR(builderBubbleCenter) = nil;
GVAR(builderBubbleRadius) = nil;

nil;
