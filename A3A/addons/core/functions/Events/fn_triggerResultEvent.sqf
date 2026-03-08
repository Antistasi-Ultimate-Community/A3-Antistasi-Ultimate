#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_triggerResultEvent

Description:
    Raises a local CBA event until the first subscriber function returns a non-nil
    value. The return value of the subscriber function is then returned by this
    function. If no subscriber function returns a non-nil value, this function
    returns nil.

Parameters:
    0: _eventName - Type of event to publish <STRING>
    1: _params - Parameters to pass to the event handlers <ANY>

Optional:

Example:
    (begin example)
    ["MyEvent1", {
        if (condition1) exitWith { "Result from handler 1" };
        nil;
    }] call FUNCMAIN(addEventHandler);

    ["MyEvent1", {
        if (condition2) exitWith {};
        "Result from handler 2";
    }] call FUNCMAIN(addEventHandler);

    private _result = ["MyEvent1", ["param1", "param2"]] call FUNCMAIN(triggerResultEvent);
    // _result is now either "Result from handler 1", "Result from handler 2" or nil
    (end example)

Returns:
    <ANY> First subscriber non-nil value or nil.

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(triggerResultEvent),_this);

if !assert(params[
    ["_eventName", nil, [""]]
]) exitWith {};

private["_result"];
private _params = param[1, []];

+(cba_events_eventNamespace getVariable[_eventName, []]) findIf {
    _result = _params call _x;
    !isNil "_result"
};

RETNIL(_result);
