#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3U_fnc_canInteract

Description:
    Generic handler for vanilla (hold-)actions

Parameters:
    0: _unit - the unit attempting the interaction <OBJECT>
    1: _target - the target of the interaction <OBJECT>

Optional:
    2: _exceptions - an array of interaction conditions to ignore <ARRAY>

Example:
    (begin example)
    // Normal interaction validation
    [player, cursorTarget] call A3A_fnc_canInteract;
    // Can interact with dead targets, too
    [player, cursorTarget, ["isNotDeadTarget"]] call A3A_fnc_canInteract;
    (end example)

Returns:
    Whether the interaction is allowed <BOOL>

Scope:
    Client

Author:
    UnseenKill
---------------------------------------------------------------------------- */
if !assert(params[
    ["_unit", nil, [objNull]],
    ["_target", nil, [objNull]]
]) exitWith { false };

if !assert(!isNull _unit) exitWith { false };
if !assert(!isNull _target) exitWith { false };

private _exceptions = param[2, [], [[]]] apply { toLowerANSI _x };

keys GVAR(interactionConditions) findIf {
    (_x in _exceptions) || { !([_unit, _target] call (GVAR(interactionConditions) get _x)) }
} == -1;
