#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onClientInitDone

Description:
    Run a callback once client initialization is done.

Parameters:
    0: _callback - The code to execute <CODE>

Optional:
    1: _params - Parameters to pass to the callback <ANY>

Example:
    (begin example)
    [{ hint "Client init done." }] call A3A_fnc_onClientInitDone;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onClientInitDone),_this);

if !assert(params[
    ["_callback", nil, [{}]]
]) exitWith {};

private _params = param[1, []];

if (hasInterface) exitWith {
    [CBA_EVENT_CLIENT_INIT_DONE, _callback, RETNIL(_params)] call FUNCMAIN(addEventHandler);
};

[CBA_EVENT_CLIENT_INIT_DONE, _callback, RETNIL(_params)] remoteExecCall[QFUNCMAIN(addEventHandler), -2];

nil;
