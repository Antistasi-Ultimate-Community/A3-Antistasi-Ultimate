#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_garrison_manager_fnc_onMenuClose

Description:
    Called when garrison editor is closed

Parameters:
    0: _display - the display being closed <DISPLAY>
    1: _exitCode - the exit code of the display <NUMBER>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onMenuClose),_this);

if !assert(params[
    ["_display", nil, [displayNull]],
    ["_exitCode", nil, [0]]
]) exitWith {};

_display getVariable QGVAR(eventHandlers) apply {
    [_x, _y] call CBA_fnc_removeEventHandler;
};

uiNamespace setVariable[QGVAR(menuDisplay), nil];

nil;
