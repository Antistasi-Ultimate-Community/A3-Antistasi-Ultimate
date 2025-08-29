#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_addInteractionCondition

Description:
    Adds a new interaction condition to the list

Parameters:
    0: _name - the name of the condition <STRING>
    1: _condition - the condition function <CODE>

Optional:

Example:
    (begin example)
    ["isNotDeadPlayer", {
        params["_player"];
        !(_player isEqualTo objNull) && { alive _player }
    }] call A3A_fnc_addInteractionCondition;
    (end example)

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_name", nil, [""]],
    ["_condition", nil, [{}]]
]) exitWith {};

GVAR(interactionConditions) set[toLowerANSI _name, _condition];

nil;
