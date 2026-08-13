#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_messagePlayer

Description:
    Generates a context menu popup allowing an admin to send a custom 
    UI toast notification to the selected player, complete with a selectable 
    color theme.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The target player object to receive the message <OBJECT>

Example:
    (begin example)
    [_display, _target] spawn A3U_fnc_context_messagePlayer;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target"];

if (isNull _display || isNull _target) exitWith {};

private _w = 0.18 * safeZoneW;
private _h = 0.12 * safeZoneH;
private _xPos = safeZoneX + (safeZoneW / 2) - (_w / 2);
private _yPos = safeZoneY + (safeZoneH / 2) - (_h / 2);

private _grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_grp ctrlSetPosition [_xPos, _yPos, _w, _h];
_grp ctrlCommit 0;
_display setVariable ["A3U_OpenContextPanels", (_display getVariable ["A3U_OpenContextPanels", []]) + [_grp]];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _grp];
_bg ctrlSetPosition [0, 0, _w, _h];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

// Dynamic Title
private _title = _display ctrlCreate ["RscStructuredText", -1, _grp];
_title ctrlSetPosition [0, 0, _w, 0.026 * safeZoneH];
_title ctrlSetBackgroundColor [0.1, 0.4, 0.6, 1]; // Distinct blue title for messaging
_title ctrlSetStructuredText parseText format ["<t align='center' size='0.85' valign='middle'>%1</t>", format [localize "STR_A3AU_player_context_message_title", name _target]];
_title ctrlCommit 0;

// Close Button
private _closeBtn = _display ctrlCreate ["RscStructuredText", -1, _grp];
_closeBtn ctrlSetPosition [_w - (0.015 * safeZoneW), 0.003 * safeZoneH, 0.012 * safeZoneW, 0.02 * safeZoneH];
_closeBtn ctrlSetStructuredText parseText "<t align='center' size='0.8'>X</t>";
_closeBtn ctrlSetBackgroundColor [0.8, 0.1, 0.1, 1];
_closeBtn ctrlCommit 0;
_closeBtn setVariable ["A3U_Grp", _grp];
_closeBtn ctrlAddEventHandler ["MouseButtonDown", { ctrlDelete ((_this#0) getVariable "A3U_Grp"); }];

private _padY = 0.032 * safeZoneH;

// Message Input
private _msgLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_msgLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.05 * safeZoneW, 0.02 * safeZoneH];
_msgLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_message_label"];
_msgLbl ctrlCommit 0;

private _msgEdit = _display ctrlCreate ["RscEdit", -1, _grp];
_msgEdit ctrlSetPosition [0.06 * safeZoneW, _padY, _w - (0.065 * safeZoneW), 0.02 * safeZoneH];
_msgEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_msgEdit ctrlCommit 0;

_padY = _padY + 0.028 * safeZoneH;

// Theme Dropdown
private _themeLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_themeLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.05 * safeZoneW, 0.02 * safeZoneH];
_themeLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_theme_label"];
_themeLbl ctrlCommit 0;

private _themeCombo = _display ctrlCreate ["RscCombo", -1, _grp];
_themeCombo ctrlSetPosition [0.06 * safeZoneW, _padY, _w - (0.065 * safeZoneW), 0.02 * safeZoneH];
_themeCombo ctrlCommit 0;
private _idxDef = _themeCombo lbAdd (localize "STR_A3AU_player_context_theme_default"); _themeCombo lbSetData [_idxDef, "DEFAULT"];
private _idxSuc = _themeCombo lbAdd (localize "STR_A3AU_player_context_theme_success"); _themeCombo lbSetData [_idxSuc, "SUCCESS"];
private _idxWar = _themeCombo lbAdd (localize "STR_A3AU_player_context_theme_warning"); _themeCombo lbSetData [_idxWar, "WARNING"];
private _idxErr = _themeCombo lbAdd (localize "STR_A3AU_player_context_theme_error");   _themeCombo lbSetData [_idxErr, "ERROR"];
_themeCombo lbSetCurSel 0;

_padY = _padY + 0.035 * safeZoneH;

// Confirm Button
private _confirm = _display ctrlCreate ["RscStructuredText", -1, _grp];
_confirm ctrlSetPosition [0.005 * safeZoneW, _padY, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_confirm ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", localize "STR_A3AU_player_context_send_message"];
_confirm ctrlSetBackgroundColor [0, 0, 0, 0.4];
_confirm ctrlCommit 0;

_confirm setVariable ["A3U_MsgEdit", _msgEdit];
_confirm setVariable ["A3U_ThemeCombo", _themeCombo];
_confirm setVariable ["A3U_Target", _target];
_confirm setVariable ["A3U_Grp", _grp];

_confirm ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.1, 0.4, 0.6, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {};
    
    private _t = _ctrl getVariable "A3U_Target";
    private _msgEdit = _ctrl getVariable "A3U_MsgEdit";
    private _themeCombo = _ctrl getVariable "A3U_ThemeCombo";
    
    private _msg = ctrlText _msgEdit;
    private _theme = _themeCombo lbData (lbCurSel _themeCombo);
    
    if (_msg == "") exitWith {
        [localize "STR_A3AU_player_context_message_empty", "ERROR", player] spawn A3U_fnc_context_popup;
    };
    
    // Spawn popup routed to the target player
    [_msg, _theme, _t] spawn A3U_fnc_context_popup;
    
    // Spawn success popup routed to the admin who sent it
    [format [localize "STR_A3AU_player_context_message_sent", name _t], "SUCCESS", player] spawn A3U_fnc_context_popup;
    
    ctrlDelete (_ctrl getVariable "A3U_Grp");
}];