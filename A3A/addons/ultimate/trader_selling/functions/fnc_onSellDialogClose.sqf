#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_onSellDialogClose

Description:
    Handler for when the sell dialog is closed

Parameters:

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onSellDialogClose),_this);

uiNamespace setVariable[QGVAR(menuDisplay), nil];

if !(isNil QGVAR(sellContainer)) then {
    [GVAR(sellContainer), false] remoteExecCall["lockInventory", -2, GVAR(sellContainer)];
};

nil;
