#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_onContextMenuEntryClick

Description:
    Event handler for map context menu button click

Parameters:
    0: _control - button to receive event <CONTROL>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onContextMenuEntryClick),_this);

if !assert(params[
    ["_control", nil, [controlNull]]
]) exitWith {};

private _entry = _control getVariable QEGVAR(ultimate,contextMenuEntry);
private _params = _control getVariable QEGVAR(ultimate,contextMenuParams);

if (!assert(!(isNil "_entry")) || !assert(!(isNil "_params"))) exitWith {};
if !(_entry get "active") exitWith {};

private _arguments = +_params;
_arguments append(_entry get "parameters");

Trace_3(QFUNC(onContextMenuEntryClick),_entry,_params,_arguments);

[_entry get "statement", _arguments] call CBA_fnc_execNextFrame;

if (_entry get "closeContextMenu") then {
    [] call FUNC(closeContextMenu);
};

if (_entry get "closeMap") then {
    [] call FUNC(closeMap);
};

nil;
