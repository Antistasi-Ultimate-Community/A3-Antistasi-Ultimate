#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_removeEventHandler

Description:
    Wrapper for CBA_fnc_removeEventHandler to add additional logging.

Parameters:
    0: _eventName - Type of event to remove <STRING>
    1: _eventId - Unique ID of the event handler to remove <NUMBER>

Optional:

Example:
    (begin example)
    private _eventId = ["MyEvent1", { hint "Event triggered!" }] call A3A_fnc_addEventHandler;
    // ... later on ...
    ["MyEvent1", _eventId] call A3A_fnc_removeEventHandler;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(removeEventHandler),_this);

if !assert(params[
    ["_eventName", nil, [""]],
    ["_eventId", nil, [0]]
]) exitWith {};

call CBA_fnc_removeEventHandler;

nil;
