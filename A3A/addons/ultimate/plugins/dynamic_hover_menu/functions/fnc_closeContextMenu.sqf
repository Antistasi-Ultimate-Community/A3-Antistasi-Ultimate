#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_closeContextMenu

Description:
    Closes the context menu on the map.

Parameters:

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(closeContextMenu),_this);

private _display = uiNamespace getVariable[QEGVAR(ultimate,mapDisplay), displayNull];

if !assert(!isNull _display) exitWith {};

private _menuGroup = _display getVariable ["A3U_mrkMenu_grp", controlNull];
private _garrisonGroup = _display getVariable ["A3U_mrkMenu_garrGrp", controlNull];

if (!isNull _menuGroup) then { ctrlDelete _menuGroup };
if (!isNull _garrisonGroup) then { ctrlDelete _garrisonGroup };

_display setVariable ["A3U_mrkMenu_grp", controlNull];
_display setVariable ["A3U_mrkMenu_garrGrp", controlNull];
_display setVariable ["A3U_mrkMenu_marker", ""];

nil;
