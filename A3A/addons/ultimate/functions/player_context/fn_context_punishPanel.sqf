#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_punishPanel

Description:
    Generates a context menu popup allowing an admin to issue a time-based 
    penalty, set the offence percentage, and provide a reason for disciplining 
    the selected player.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The player object to be punished <OBJECT>

Example:
    (begin example)
    [_display, _target] spawn A3U_fnc_context_punishPanel;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target"];

private _w = 0.16 * safeZoneW;
private _h = 0.16 * safeZoneH;
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

private _title = _display ctrlCreate ["RscStructuredText", -1, _grp];
_title ctrlSetPosition [0, 0, _w, 0.026 * safeZoneH];
_title ctrlSetBackgroundColor [0.6, 0.1, 0.1, 1];
_title ctrlSetStructuredText parseText format ["<t align='center' size='0.9' valign='middle'>%1</t>", localize "STR_A3AU_player_context_punish_player"];
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
private _stepY = 0.024 * safeZoneH;

// Time Input (s)
private _timeLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_timeLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.06 * safeZoneW, 0.02 * safeZoneH];
_timeLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_time_sec"];
_timeLbl ctrlCommit 0;

private _timeEdit = _display ctrlCreate ["RscEdit", -1, _grp];
_timeEdit ctrlSetPosition [0.065 * safeZoneW, _padY, _w - (0.07 * safeZoneW), 0.02 * safeZoneH];
_timeEdit ctrlSetText "120";
_timeEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_timeEdit ctrlCommit 0;

_padY = _padY + _stepY;

// Offence Input (%)
private _offLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_offLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.06 * safeZoneW, 0.02 * safeZoneH];
_offLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_offence_pct"];
_offLbl ctrlCommit 0;

private _offEdit = _display ctrlCreate ["RscEdit", -1, _grp];
_offEdit ctrlSetPosition [0.065 * safeZoneW, _padY, _w - (0.07 * safeZoneW), 0.02 * safeZoneH];
_offEdit ctrlSetText "100";
_offEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_offEdit ctrlCommit 0;

_padY = _padY + _stepY;

// Reason Input
private _rsnLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_rsnLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.06 * safeZoneW, 0.02 * safeZoneH];
_rsnLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_reason_label"];
_rsnLbl ctrlCommit 0;

private _rsnEdit = _display ctrlCreate ["RscEdit", -1, _grp];
_rsnEdit ctrlSetPosition [0.065 * safeZoneW, _padY, _w - (0.07 * safeZoneW), 0.02 * safeZoneH];
_rsnEdit ctrlSetText (localize "STR_A3AU_player_context_admin_action");
_rsnEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_rsnEdit ctrlCommit 0;

_padY = _padY + _stepY + 0.005 * safeZoneH;

// Confirm Button
private _confirm = _display ctrlCreate ["RscStructuredText", -1, _grp];
_confirm ctrlSetPosition [0.005 * safeZoneW, _padY, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_confirm ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", localize "STR_A3AU_player_context_confirm_punishment"];
_confirm ctrlSetBackgroundColor [0, 0, 0, 0.4];
_confirm ctrlCommit 0;

_confirm setVariable ["A3U_InputTime", _timeEdit];
_confirm setVariable ["A3U_InputOff", _offEdit];
_confirm setVariable ["A3U_InputRsn", _rsnEdit];
_confirm setVariable ["A3U_Target", _target];
_confirm setVariable ["A3U_Grp", _grp];

_confirm ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.1, 0.1, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {};
    
    private _t = _ctrl getVariable "A3U_Target";
    private _iT = _ctrl getVariable "A3U_InputTime";
    private _iO = _ctrl getVariable "A3U_InputOff";
    private _iR = _ctrl getVariable "A3U_InputRsn";
    
    private _time = floor (parseNumber (ctrlText _iT));
    private _offRaw = parseNumber (ctrlText _iO);
    private _off = _offRaw / 100; // Converts 100% input to 1.0 logic value
    private _rsn = ctrlText _iR;
    
    if (_time < 0) then { _time = 0; };
    if (_off < 0) then { _off = 0; };
    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_admin_action"; };
    
    // Execute server-side punishment
    [_t, _time, _off, objNull, _rsn] remoteExecCall ["A3A_fnc_punishment", 2, false];
    
    [format [localize "STR_A3AU_player_context_punished_log", name _t, _time, _offRaw, _rsn], "WARNING"] spawn A3U_fnc_context_popup;
    
    ctrlDelete (_ctrl getVariable "A3U_Grp");
}];