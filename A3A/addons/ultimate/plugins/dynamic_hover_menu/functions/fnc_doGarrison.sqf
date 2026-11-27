#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_doGarrison

Description:
    Callback to execute garrison command

Parameters:
    0: _marker - the marker to garrison <STRING>
    1: _player - player executing the callback <OBJECT>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(doGarrison),_this);

if !assert(params[
    ["_marker", nil, [""]],
    ["_player", nil, [objNull]]
]) exitWith {};

if !assert(MARKER_EXISTS(_marker)) exitWith {};
if !assert(!isNull _player) exitWith {};

[{
    ["add", _this] spawn A3A_fnc_garrisonDialog;
    ["off"] call SCRT_fnc_ui_toggleMenuBlur;
}, _marker] call CBA_fnc_execNextFrame;

nil;
