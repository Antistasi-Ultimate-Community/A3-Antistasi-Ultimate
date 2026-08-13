#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_forceToLobby

Description:
    Generates a context menu popup that prompts the admin to input a reason 
    before forcibly returning the selected player to the multiplayer lobby.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The player object to be returned to the lobby <OBJECT>

Example:
    (begin example)
    [_display, _target] spawn A3U_fnc_context_forceToLobby;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target"];
private _w = 0.16 * safeZoneW; private _h = 0.08 * safeZoneH;
private _grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_grp ctrlSetPosition [safeZoneX + (safeZoneW/2) - (_w/2), safeZoneY + (safeZoneH/2) - (_h/2), _w, _h]; _grp ctrlCommit 0;
_display setVariable ["A3U_OpenContextPanels", (_display getVariable ["A3U_OpenContextPanels", []]) + [_grp]];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _grp];
_bg ctrlSetPosition [0, 0, _w, _h]; _bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95]; _bg ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", -1, _grp];
_title ctrlSetPosition [0, 0, _w, 0.026 * safeZoneH]; _title ctrlSetBackgroundColor [0.6, 0.4, 0.1, 1];
_title ctrlSetStructuredText parseText "<t align='center' size='0.9' valign='middle'>Reason for Lobby Drop</t>"; _title ctrlCommit 0;

private _edit = _display ctrlCreate ["RscEdit", -1, _grp];
_edit ctrlSetPosition [0.005 * safeZoneW, 0.032 * safeZoneH, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_edit ctrlSetBackgroundColor [0, 0, 0, 0.5]; _edit ctrlCommit 0;

private _confirm = _display ctrlCreate ["RscStructuredText", -1, _grp];
_confirm ctrlSetPosition [0.005 * safeZoneW, 0.055 * safeZoneH, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_confirm ctrlSetStructuredText parseText "<t align='center' size='0.85'>CONFIRM RETURN</t>";
_confirm ctrlSetBackgroundColor [0, 0, 0, 0.4]; _confirm ctrlCommit 0;

_confirm setVariable ["A3U_InputCtrl", _edit]; _confirm setVariable ["A3U_Target", _target]; _confirm setVariable ["A3U_Grp", _grp];
_confirm ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.5, 0.1, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {};
    private _t = _ctrl getVariable "A3U_Target"; private _edit = _ctrl getVariable "A3U_InputCtrl";
    
    private _reason = ctrlText _edit;
    if (_reason == "") then { _reason = "Forced back to lobby by Admin."; };
    
    _reason remoteExec ["systemChat", _t];
    ["LOSER", false, true] remoteExec ["BIS_fnc_endMission", _t];
    
    ctrlDelete (_ctrl getVariable "A3U_Grp");
}];