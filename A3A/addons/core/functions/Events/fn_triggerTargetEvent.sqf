#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_triggerTargetEvent

Description:
    Wrapper function to CBA_fnc_targetEvent.

    Raises a CBA event on all machines where this object or at least one of these objects are local.

Parameters:
    0: _eventName - Type of event to publish <STRING>
    1: _params - Parameters to pass to the event handlers <ANY>
    2: _targets - Where to execute events.  <OBJECT,GROUP,ARRAY>

Optional:

Example:
    (begin example)
    ["MyEvent1", nil, group player] call A3A_fnc_triggerTargetEvent;
    ["MyEvent1", ["blow-up"], vehicle player]] call A3A_fnc_triggerTargetEvent;
    ["MyEvent1", [0, 42, 1337], [1,2,3]] call A3A_fnc_triggerTargetEvent;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(triggerTargetEvent),_this);

if !assert(params[
    ["_eventName", nil, [""]],
    "",
    ["_targets", nil, [objNull, grpNull, []]]
]) exitWith {};

if (_targets isEqualType objNull && { !assert(!isNull _targets) }) exitWith {};
if (_targets isEqualType grpNull && { !assert(!isNull _targets) }) exitWith {};

call CBA_fnc_targetEvent;

nil;
