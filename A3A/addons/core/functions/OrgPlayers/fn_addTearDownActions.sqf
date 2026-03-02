#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_addTeardownActions

Description:
    Add player actions for teardown mode to player.

Parameters:

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if (!hasInterface) exitWith {};
if !assert(!isNull player) exitWith {};

// Build mode user actions
player addAction[
    localize "STR_A3A_base_teardownMode_ON",
    { (_this select 1) setVariable[QGVAR(isTeardownActive), true] },
    [],
    1.6,
    false,
    false,
    "",
    QUOTE(!(_this getVariable[ARR_2(QQGVAR(isTeardownActive),false)]) && {isNull objectParent _this} && {[player] call FUNCMAIN(isEngineer)} && {_this inArea QQUOTE(Synd_HQ)})
];

player addAction[
    localize "STR_A3A_base_teardownMode_OFF",
    { (_this select 1) setVariable[QGVAR(isTeardownActive), false] },
    [],
    1.6,
    false,
    false,
    "",
    QUOTE((_this getVariable[ARR_2(QQGVAR(isTeardownActive),false)]) && {isNull objectParent _this} && {_this inArea QQUOTE(Synd_HQ)})
];

nil;
