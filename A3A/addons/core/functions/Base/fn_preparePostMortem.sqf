#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_preparePostMortem

Description:
    Add event handler to entity to make sure postmortem code is called when it dies.

Parameters:
    0: _entity - The entity to add the postmortem event handler to <OBJECT>

Optional:

Example:
    (begin example)
    [player] call A3A_fnc_preparePostMortem;
    (end example)

Returns:
    Nothing

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(preparePostMortem),_this);

if !assert(params[
    ["_entity", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _entity) exitWith {};

if !(local _entity) exitWith {
    [_entity] remoteExecCall[QFUNCMAIN(preparePostMortem), _entity];
};

if (isNil { _entity getVariable QGVAR(postMortemPrepped) }) then {
    _entity setVariable[QGVAR(postMortemPrepped), true];
    _entity addEventHandler["Killed", FUNCMAIN(postmortem)];
};

nil;
