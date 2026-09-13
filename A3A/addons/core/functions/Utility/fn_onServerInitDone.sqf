#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onServerInitDone

Description:
    Run a callback once server initialization is done.

Parameters:
    0: _callback - The code to execute <CODE>

Optional:
    1: _params - Parameters to pass to the callback <ANY>

Example:
    (begin example)
    [{ hint "Server init done." }] call A3A_fnc_onServerInitDone;
    (end example)

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onServerInitDone),_this);

// This event fires early; no need to forward to clients
if !assert(isServer) exitWith {};
if !assert(params[
    ["_callback", nil, [{}]]
]) exitWith {};

private _params = param[1, []];

[CBA_EVENT_SERVER_INIT_DONE, _callback, RETNIL(_params)] call FUNCMAIN(addEventHandler);

nil;
