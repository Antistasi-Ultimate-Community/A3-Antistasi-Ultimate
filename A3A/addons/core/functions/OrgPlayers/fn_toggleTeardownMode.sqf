#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_toggleTeardownMode

Description:
    Toggle teardown mode on or off for player.

Parameters:

Optional:
    0: _player - Player to toggle teardown mode for <OBJECT>
        Default: player
    1: _forceMode - Don't toggle but set to this value instead <BOOL>
        Default: none

Example:
    (begin example)
    [] call A3A_fnc_toggleTeardownMode; // Toggle mode
    [theBoss, true] call A3A_fnc_toggleTeardownMode; // Force mode on for boss
    (end example)

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(toggleTeardownMode),_this);

private _player = param[0, player, [objNull]];
private _forceMode = param[1, nil, [true]];

if (isNil "_forceMode") then {
    _forceMode = !(_player getVariable[QGVAR(isTeardownActive), false]);
};

_player setVariable[QGVAR(isTeardownActive), _forceMode];

[{
    private _message = [
        "STR_A3A_teardownModeDisabled_text",
        "STR_A3A_teardownModeEnabled_text"
    ] select(_this getVariable QGVAR(isTeardownActive));
    [localize "STR_commander_menu_toggle_teardown_mode_button", localize _message] call A3A_fnc_customHint;
}, _player] call CBA_fnc_execNextFrame;

nil;
