#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_triggerGlobalEvent

Description:
    Wrapper function to CBA_fnc_globalEvent.

    Raises event on all machines including the local one.

Parameters:
    0: _eventName - Type of event to publish <STRING>
    1: _params - Parameters to pass to the event handlers <ANY>

Optional:

Example:
    (begin example)
    ["MyEvent1"] call A3A_fnc_triggerGlobalEvent;
    ["MyEvent1", "Hello, world"] call A3A_fnc_triggerGlobalEvent;
    ["MyEvent1", [0, 42, 1337]] call A3A_fnc_triggerGlobalEvent;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(triggerGlobalEvent),_this);

if !assert(params[
    ["_eventName", nil, [""]]
]) exitWith {};

call CBA_fnc_globalEvent;

nil;
