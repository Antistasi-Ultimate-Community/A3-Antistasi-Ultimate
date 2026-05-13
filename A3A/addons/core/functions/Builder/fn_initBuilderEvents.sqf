#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_initBuilderEvents

Description:
    Initialize CBA event handlers for builder-related events.

Parameters:

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(initBuilderEvents),_this);

// Buildable objects that aren't visible during normal gameplay; will show
// themselves during builder mode or teardown mode.
GVAR(builderObjectsHidden) = [];

[CBA_EVENT_CLIENT_BUILDER_ABORT, FUNCMAIN(onBuilderAbort)] call FUNCMAIN(addEventHandler);
[CBA_EVENT_CLIENT_BUILDER_START, FUNCMAIN(onBuilderStart)] call FUNCMAIN(addEventHandler);
[CBA_EVENT_CLIENT_TEARDOWN_MODE_CHANGED, FUNCMAIN(onTeardownModeChanged)] call FUNCMAIN(addEventHandler);

nil;
