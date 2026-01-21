#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_addEventHandler

Description:
    Wrapper for CBA_fnc_addEventHandler to add additional logging.

Parameters:
    0: _eventName - Type of event to handle <STRING>
    1: _eventFunc - Function to call when event is raised <CODE>

Optional:
    2: _arguments - Additional arguments to pass to the event function <ANY>

Example:
    (begin example)
    ["MyEvent1", { hint "Event triggered!" }] call A3A_fnc_addEventHandler;
    ["MyEvent2", { params["_arg1","_arg2"]; hint format["Args: %1, %2", _arg1, _arg2]; }, [42, "Hello"]] call A3A_fnc_addEventHandler;
    (end example)

Returns:
    <NUMBER> Unique ID of the event handler (can be used with A3A_fnc_removeEventHandler).

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(addEventHandler),_this);

if !assert(params[
    ["_eventName", nil, [""]],
    ["_eventFunc", nil, [{}]]
]) exitWith {};

private _arguments = param[2, nil];

if (isNil "_arguments") then {
    [_eventName, _eventFunc] call CBA_fnc_addEventHandler;
} else {
    [_eventName, _eventFunc, _arguments] call CBA_fnc_addEventHandlerArgs;
};
