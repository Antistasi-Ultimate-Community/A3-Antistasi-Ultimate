#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_requestQRF

Description:
    Generates a context menu popup allowing an admin to configure and dispatch 
    a Quick Reaction Force (QRF) to actively hunt the selected player.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The target player object to be hunted <OBJECT>

Example:
    (begin example)
    [_display, _target] spawn A3U_fnc_context_requestQRF;
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
private _h = 0.14 * safeZoneH;
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
_title ctrlSetBackgroundColor [0.6, 0.1, 0.1, 1];
_title ctrlSetStructuredText parseText format ["<t align='center' size='0.85' valign='middle'>%1</t>", format [localize "STR_A3AU_player_context_dispatch_qrf", name _target]];
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

// Faction Dropdown
private _facLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_facLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.05 * safeZoneW, 0.02 * safeZoneH];
_facLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_faction_label"];
_facLbl ctrlCommit 0;

private _facCombo = _display ctrlCreate ["RscCombo", -1, _grp];
_facCombo ctrlSetPosition [0.06 * safeZoneW, _padY, _w - (0.065 * safeZoneW), 0.02 * safeZoneH];
_facCombo ctrlCommit 0;
private _idxOcc = _facCombo lbAdd (localize "STR_A3AU_player_context_occupants"); _facCombo lbSetData [_idxOcc, "Occupants"];
private _idxInv = _facCombo lbAdd (localize "STR_A3AU_player_context_invaders");  _facCombo lbSetData [_idxInv, "Invaders"];
_facCombo lbSetCurSel 0;

_padY = _padY + 0.028 * safeZoneH;

// QRF Type Dropdown
private _typeLbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
_typeLbl ctrlSetPosition [0.005 * safeZoneW, _padY, 0.05 * safeZoneW, 0.02 * safeZoneH];
_typeLbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", localize "STR_A3AU_player_context_type_label"];
_typeLbl ctrlCommit 0;

private _typeCombo = _display ctrlCreate ["RscCombo", -1, _grp];
_typeCombo ctrlSetPosition [0.06 * safeZoneW, _padY, _w - (0.065 * safeZoneW), 0.02 * safeZoneH];
_typeCombo ctrlCommit 0;
private _idxVeh = _typeCombo lbAdd (localize "STR_A3AU_player_context_ground_transport"); _typeCombo lbSetData [_idxVeh, "LAND"];
private _idxHeli = _typeCombo lbAdd (localize "STR_A3AU_player_context_air_transport");    _typeCombo lbSetData [_idxHeli, "AIR"];
private _idxCAS = _typeCombo lbAdd (localize "STR_A3AU_player_context_attack_cas");        _typeCombo lbSetData [_idxCAS, "CAS"];
_typeCombo lbSetCurSel 0;

_padY = _padY + 0.035 * safeZoneH;

// Confirm Button
private _confirm = _display ctrlCreate ["RscStructuredText", -1, _grp];
_confirm ctrlSetPosition [0.005 * safeZoneW, _padY, _w - (0.01 * safeZoneW), 0.02 * safeZoneH];
_confirm ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", localize "STR_A3AU_player_context_launch_qrf"];
_confirm ctrlSetBackgroundColor [0, 0, 0, 0.4];
_confirm ctrlCommit 0;

_confirm setVariable ["A3U_FacCombo", _facCombo];
_confirm setVariable ["A3U_TypeCombo", _typeCombo];
_confirm setVariable ["A3U_Target", _target];
_confirm setVariable ["A3U_Grp", _grp];

_confirm ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.1, 0.1, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
_confirm ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {};
    
    private _t = _ctrl getVariable "A3U_Target";
    private _facCombo = _ctrl getVariable "A3U_FacCombo";
    private _typeCombo = _ctrl getVariable "A3U_TypeCombo";
    
    private _faction = _facCombo lbData (lbCurSel _facCombo);
    private _type = _typeCombo lbData (lbCurSel _typeCombo);
    
    [[_t, _faction, _type, clientOwner], "A3U_fnc_QRF_chasePlayer"] remoteExec ["A3A_fnc_scheduler", 2];
    
    [format [localize "STR_A3AU_player_context_dispatched_qrf", _faction, _type, name _t], "WARNING"] spawn A3U_fnc_context_popup;
    
    ctrlDelete (_ctrl getVariable "A3U_Grp");
}];