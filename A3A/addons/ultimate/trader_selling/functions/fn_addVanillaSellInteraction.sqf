#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_addVanillaSellInteraction

Description:
    Adds a vanilla sell interaction to the class.

Parameters:
    0: _object - The object to add the interaction to <OBJECT>

Optional:

Example:
    (begin example)
    [_object] call A3A_ultimate_trader_selling_fnc_addVanillaSellInteraction;
    (end example)

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(addVanillaSellInteraction),_this);

if EGVAR(main,AceHaveAddon) exitWith {};

if !assert(params[
    ["_object",objNull,[objNull]]
]) exitWith {};

if !assert(!isNull _object) exitWith {};

_object addAction[
    localize LSTRING(AdvSell_InteractionSell_DisplayName),
    QUOTE(call FUNC(startAdvancedSelling)), nil, 20, false, true, "",
    QUOTE([ARR_2(_originalTarget,_this)] call FUNC(canStartAdvancedSelling)), 8
];

nil;
