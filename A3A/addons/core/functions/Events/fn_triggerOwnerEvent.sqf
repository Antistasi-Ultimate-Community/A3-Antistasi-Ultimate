#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_triggerOwnerEvent

Description:
    Wrapper function to CBA_fnc_ownerEvent.

    Raises a CBA event on the target client ID’s machine.

Parameters:
    0: _eventName - Type of event to publish <STRING>
    1: _params - Parameters to pass to the event handlers <ANY>
    2: _targetOwner - Where to execute events <NUMBER>

Optional:

Example:
    (begin example)
    // Server
    ["MyEvent1", nil, 2] call A3A_fnc_triggerOwnerEvent;
    // All but the server
    ["MyEvent1", "Hello, world", -2] call A3A_fnc_triggerOwnerEvent;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(triggerOwnerEvent),_this);

if !assert(params[
    ["_eventName", nil, [""]],
    "",
    ["_targetOwner", nil, [0]]
]) exitWith {};

call CBA_fnc_ownerEvent;

nil;
