#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onTeardownModeChanged

Description:
    CBA_EVENT_CLIENT_TEARDOWN_MODE_CHANGED event handler.

Parameters:
    0: _player - Object representing the player <OBJECT>
    1: _isInTeardownMode - Boolean indicating if teardown mode is active <BOOL>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onTeardownModeChanged),_this);

if !assert(params[
    ["_player", nil, [objNull]],
    ["_isInTeardownMode", nil, [true]]
]) exitWith {};

GVAR(builderObjectsHidden) apply {
    _x hideObject !_isInTeardownMode;
};

nil;
