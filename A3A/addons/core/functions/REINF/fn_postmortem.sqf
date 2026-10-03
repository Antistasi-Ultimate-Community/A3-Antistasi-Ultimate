#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_postmortem

Description:
    Handles the despawn and cleanup of dead units

Parameters:
    0: _victim - The dead unit <OBJECT>

Optional:
    1: _killer - The unit responsible for the death <OBJECT>

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(postmortem),_this);

if !(isServer) exitWith { _this remoteExecCall[QFUNCMAIN(postmortem), 2] };

if !assert(params[
    ["_victim", nil, [objNull]]
]) exitWith {};
if (isNull _victim) exitWith {};

if (alive _victim) exitWith {
    Error_2("post-mortem on alive unit %1 called (_this=%2)", _victim, _this);
};

if (isNil { _victim getVariable QGVAR(postMortemEventSent) }) then {
    _victim setVariable[QGVAR(postMortemEventSent), true];
    [CBA_EVENT_SERVER_ENTITY_POSTMORTEM, _this] spawn FUNCMAIN(triggerLocalEvent);
};

[_victim] call FUNCMAIN(despawnQueueEntity);

nil;
