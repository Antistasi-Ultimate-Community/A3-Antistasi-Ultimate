#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_isTeardownEnabled

Description:
    Returns what the name implies.

Parameters:

Optional:
    0: _player - Player to check. Default is the local player. <OBJECT>

Example:
    (begin example)
    // Checks if teardown mode is enabled for the local player.
    [] call A3A_fnc_isTeardownEnabled;

    // Checks if teardown mode is enabled for a specific player.
    [somePlayer] call A3A_fnc_isTeardownEnabled;
    (end example)

Returns:
    <BOOL> True if teardown mode is enabled for the player, false otherwise.

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
//Trace_1(QFUNCMAIN(isTeardownEnabled),_this);

private _player = param[0, player, [objNull]];

if (isNull _player) exitWith {false};
_player getVariable [QGVAR(isTeardownActive), false];
