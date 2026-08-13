#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_kickPlayer

Description:
    Generates a context menu popup that prompts the admin to input a reason 
    before executing a server command to kick the selected player from the session.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The player object to be kicked <OBJECT>
    2: _actionType - The text used to populate the UI labels and confirm button <STRING>

Example:
    (begin example)
    [_display, _target, "KICK"] spawn A3U_fnc_context_kickPlayer;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target", "_actionType"];
private _w = 0.16 * safeZoneW; private _h = 0.08 * safeZoneH;
private _grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_grp ctrlSetPosition [safeZoneX + (safeZoneW/2) - (_w/2), safeZoneY + (safeZoneH/2) - (_h/2), _w, _h]; _grp ctrlCommit 0;
_display setVariable ["A3U_OpenContextPanels", (_display getVariable ["A3U_OpenContextPanels", []]) + [_grp]];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _grp];
_bg ctrlSetPosition [0, 0, _w, _h]; _bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95]; _bg ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", -1, _grp];
_title ctrlSetPosition [0, 0, _w, 0.026 * safeZoneH]; _title ctrlSetBackgroundColor [0.6, 0.1, 0.1, 1];
_title ctrlSetStructuredText parseText format ["<t align='center' size='0.9' valign='middle'>Reason for %1</t>", _actionType]; _title ctrlCommit 0;

private _edit = _display ctrlCreate ["RscEdit", -1, _grp];
_edit ctrlSetPosition [0.005 * safeZoneW, 0.032 * safeZoneH, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_edit ctrlSetBackgroundColor [0, 0, 0, 0.5]; _edit ctrlCommit 0;

private _confirm = _display ctrlCreate ["RscStructuredText", -1, _grp];
_confirm ctrlSetPosition [0.005 * safeZoneW, 0.055 * safeZoneH, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_confirm ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>CONFIRM %1</t>", _actionType];
_confirm ctrlSetBackgroundColor [0, 0, 0, 0.4]; _confirm ctrlCommit 0;

_confirm setVariable ["A3U_InputCtrl", _edit]; _confirm setVariable ["A3U_Target", _target]; _confirm setVariable ["A3U_Grp", _grp]; _confirm setVariable ["A3U_Type", _actionType];
_confirm ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.1, 0.1, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {};
    private _t = _ctrl getVariable "A3U_Target"; private _edit = _ctrl getVariable "A3U_InputCtrl"; private _type = _ctrl getVariable "A3U_Type";
    
    private _reason = ctrlText _edit;
    if (_reason == "") then { _reason = "No reason specified."; };
    
    if (_type == "KICK") then {
        systemChat format ["Kicking %1: %2", name _t, _reason];
        serverCommand format ["#kick %1", name _t];
    };
    
    ctrlDelete (_ctrl getVariable "A3U_Grp");
}];