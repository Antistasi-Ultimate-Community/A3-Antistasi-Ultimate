#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_panelActions

Description:
    Centralized dispatcher for all Admin/Commander contextual popups. Maps 
    a requested action string to the corresponding UI layout, then feeds it 
    into the Master UI Engine (A3U_fnc_context_buildPanel) to render.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The player object affected by the action <OBJECT>
    2: _actionType - String identifier of the requested panel <STRING>

Example:
    (begin example)
    [_display, _target, "MESSAGE"] spawn A3U_fnc_context_panelActions;
    [_display, _target, "BAN"] spawn A3U_fnc_context_panelActions;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target", "_actionType"];

if (isNull _display || isNull _target) exitWith {};

switch (toUpper _actionType) do {
    
    // =========================================================================
    // TRANSFER FUNDS
    // =========================================================================
    case "FUNDS": {
        [
            _display, _target, 
            localize "STR_A3AU_player_context_amount_transfer", 
            [0.18, 0.50, 0.20, 1], // Green
            [
                ["EDIT", "Amount:", "0", "A3U_InputAmt"],
                ["BUTTON", localize "STR_A3AU_player_context_confirm_button", [0, 0, 0, 0.4], {
                    params ["_btnCtrl"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    private _amount = floor (parseNumber (ctrlText (_grp getVariable "A3U_InputAmt")));
                    
                    if (_amount > 0) then {
                        private _factionFunds = server getVariable ["resourcesFIA", 0];
                        if (_factionFunds isEqualType []) then { _factionFunds = _factionFunds # 1; };
                        
                        if (_amount <= _factionFunds) then {
                            [0, -_amount] remoteExec ["A3A_fnc_resourcesFIA", 2];
                            [_amount, _t, true] call A3A_fnc_addMoneyPlayer;
                            [format [localize "STR_A3AU_player_context_transferred_funds", _amount, name _t], "SUCCESS"] spawn A3U_fnc_context_popup;
                            ctrlDelete _grp;
                        } else {
                            [localize "STR_A3AU_player_context_error_funds", "ERROR"] spawn A3U_fnc_context_popup;
                        };
                    } else {
                        [localize "STR_A3AU_player_context_error_positive", "ERROR"] spawn A3U_fnc_context_popup;
                    };
                }]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // MESSAGE PLAYER
    // =========================================================================
    case "MESSAGE": {
        [
            _display, _target, 
            format [localize "STR_A3AU_player_context_message_title", name _target], 
            [0.1, 0.4, 0.6, 1], // Blue
            [
                ["EDIT", localize "STR_A3AU_player_context_message_label", "", "A3U_InputMsg"],
                ["COMBO", localize "STR_A3AU_player_context_theme_label", [
                    [localize "STR_A3AU_player_context_theme_default", "DEFAULT"],
                    [localize "STR_A3AU_player_context_theme_success", "SUCCESS"],
                    [localize "STR_A3AU_player_context_theme_warning", "WARNING"],
                    [localize "STR_A3AU_player_context_theme_error", "ERROR"]
                ], "A3U_InputTheme"],
                ["BUTTON", localize "STR_A3AU_player_context_send_message", [0, 0, 0, 0.4], {
                    params ["_btnCtrl"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _msg = ctrlText (_grp getVariable "A3U_InputMsg");
                    private _themeCombo = _grp getVariable "A3U_InputTheme";
                    private _theme = _themeCombo lbData (lbCurSel _themeCombo);
                    
                    if (_msg == "") exitWith {
                        [localize "STR_A3AU_player_context_message_empty", "ERROR", player] spawn A3U_fnc_context_popup;
                    };
                    
                    [_msg, _theme, _t] spawn A3U_fnc_context_popup;
                    [format [localize "STR_A3AU_player_context_message_sent", name _t], "SUCCESS", player] spawn A3U_fnc_context_popup;
                    ctrlDelete _grp;
                }]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // DISPATCH QRF
    // =========================================================================
    case "QRF": {
        [
            _display, _target, 
            format [localize "STR_A3AU_player_context_dispatch_qrf", name _target], 
            [0.6, 0.1, 0.1, 1], // Red
            [
                ["COMBO", localize "STR_A3AU_player_context_faction_label", [
                    [localize "STR_A3AU_player_context_occupants", "Occupants"],
                    [localize "STR_A3AU_player_context_invaders", "Invaders"]
                ], "A3U_InputFac"],
                ["COMBO", localize "STR_A3AU_player_context_type_label", [
                    [localize "STR_A3AU_player_context_ground_transport", "LAND"],
                    [localize "STR_A3AU_player_context_air_transport", "AIR"],
                    [localize "STR_A3AU_player_context_attack_cas", "CAS"]
                ], "A3U_InputType"],
                ["BUTTON", localize "STR_A3AU_player_context_launch_qrf", [0, 0, 0, 0.4], {
                    params ["_btnCtrl"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _facCombo = _grp getVariable "A3U_InputFac";
                    private _typeCombo = _grp getVariable "A3U_InputType";
                    private _faction = _facCombo lbData (lbCurSel _facCombo);
                    private _type = _typeCombo lbData (lbCurSel _typeCombo);
                    
                    [[_t, _faction, _type, clientOwner], "A3U_fnc_QRF_chasePlayer"] remoteExec ["A3A_fnc_scheduler", 2];
                    [format [localize "STR_A3AU_player_context_dispatched_qrf", _faction, _type, name _t], "WARNING"] spawn A3U_fnc_context_popup;
                    
                    ctrlDelete _grp;
                }]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // SET PLAYER TRAITS
    // =========================================================================
    case "TRAITS": {
        private _traits = [
            [localize "STR_A3AU_player_context_trait_medic", "medic"],
            [localize "STR_A3AU_player_context_trait_explosives", "explosiveSpecialist"],
            [localize "STR_A3AU_player_context_trait_uav", "UAVHacker"],
            [localize "STR_A3AU_player_context_trait_engineer", "engineer"]
        ];

        private _elements = [];
        {
            _x params ["_label", "_traitKey"];
            private _hasTrait = false;
            if (_traitKey == "engineer" && {missionNamespace getVariable ["ace_repair_enabled", false]}) then {
                _hasTrait = _target getVariable ["ace_isEngineer", false];
            } else {
                _hasTrait = _target getUnitTrait _traitKey;
            };
            
            _elements pushBack ["TOGGLE", _label, _hasTrait, {
                params ["_t", "_newState", "_ctrl", "_key"];
                if (_key == "engineer" && {missionNamespace getVariable ["ace_repair_enabled", false]}) then {
                    _t setVariable ["ace_isEngineer", _newState, true];
                } else {
                    _t setUnitTrait [_key, _newState, true];
                };
                private _theme = if (_newState) then { "SUCCESS" } else { "WARNING" };
                [format [localize "STR_A3AU_player_context_trait_set_log", name _t, _key, _newState], _theme] spawn A3U_fnc_context_popup;
            }, _traitKey];
        } forEach _traits;

        [_display, _target, localize "STR_A3AU_player_context_manage_traits", [0.18, 0.50, 0.20, 1], _elements] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // PUNISH PLAYER
    // =========================================================================
    case "PUNISH": {
        [
            _display, _target, 
            localize "STR_A3AU_player_context_punish_player", 
            [0.6, 0.1, 0.1, 1], // Red
            [
                ["EDIT", localize "STR_A3AU_player_context_time_sec", "120", "A3U_InputTime"],
                ["EDIT", localize "STR_A3AU_player_context_reason_label", localize "STR_A3AU_player_context_admin_action", "A3U_InputRsn"],
                ["BUTTON", localize "STR_A3AU_player_context_confirm_punishment", [0, 0, 0, 0.4], {
                    params ["_btnCtrl"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _time = floor (parseNumber (ctrlText (_grp getVariable "A3U_InputTime")));
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    
                    if (_time < 0) then { _time = 0; };
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_admin_action"; };
                    
                    [_t, _time, 1.0, objNull, _rsn] remoteExecCall ["A3A_fnc_punishment", 2, false];
                    [format [localize "STR_A3AU_player_context_punished_log", name _t, _time, 100, _rsn], "WARNING"] spawn A3U_fnc_context_popup;
                    
                    ctrlDelete _grp;
                }]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // WARN PLAYER
    // =========================================================================
    case "WARN": {
        [
            _display, _target, 
            localize "STR_A3AU_player_context_warn_title", 
            [0.8, 0.5, 0.1, 1], // Orange
            [
                ["COMBO", localize "STR_A3AU_player_context_severity_label", [
                    [localize "STR_A3AU_player_context_sev_light", "10"],
                    [localize "STR_A3AU_player_context_sev_medium", "25"],
                    [localize "STR_A3AU_player_context_sev_severe", "50"],
                    [localize "STR_A3AU_player_context_sev_extreme", "75"]
                ], "A3U_InputSev"],
                ["EDIT", localize "STR_A3AU_player_context_reason_label", localize "STR_A3AU_player_context_admin_action", "A3U_InputRsn"],
                ["BUTTON", localize "STR_A3AU_player_context_confirm_warning", [0, 0, 0, 0.4], {
                    params ["_btnCtrl"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _iS = _grp getVariable "A3U_InputSev";
                    private _offRaw = parseNumber (_iS lbData (lbCurSel _iS));
                    
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_admin_action"; };
                    
                    [_t, 0, (_offRaw / 100), objNull, _rsn] remoteExecCall ["A3A_fnc_punishment", 2, false];
                    
                    [format [localize "STR_A3AU_player_context_warned_log", name _t, _offRaw, _rsn], "WARNING", _t] spawn A3U_fnc_context_popup;
                    [format [localize "STR_A3AU_player_context_warned_log", name _t, _offRaw, _rsn], "WARNING"] spawn A3U_fnc_context_popup;
                    
                    ctrlDelete _grp;
                }]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // KICK / BAN PLAYER
    // =========================================================================
    case "KICK";
    case "BAN": {
        [
            _display, _target, 
            format [localize "STR_A3AU_player_context_reason_for", _actionType], 
            [0.6, 0.1, 0.1, 1], // Red
            [
                ["EDIT", localize "STR_A3AU_player_context_reason_label", "", "A3U_InputRsn"],
                ["BUTTON", format [localize "STR_A3AU_player_context_confirm_action", _actionType], [0, 0, 0, 0.4], {
                    params ["_btnCtrl", "_type"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_no_reason"; };
                    
                    if (_type == "KICK") then {
                        [format [localize "STR_A3AU_player_context_kicking_log", name _t, _rsn], "WARNING"] spawn A3U_fnc_context_popup;
                        serverCommand format ["#kick %1", name _t];
                    } else {
                        [format [localize "STR_A3AU_player_context_banning_log", name _t, _rsn], "WARNING"] spawn A3U_fnc_context_popup;
                        serverCommand format ["#exec ban %1", name _t];
                    };
                    
                    ctrlDelete _grp;
                }, _actionType]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // FORCE TO LOBBY
    // =========================================================================
    case "LOBBY": {
        [
            _display, _target, 
            localize "STR_A3AU_player_context_reason_lobby", 
            [0.6, 0.4, 0.1, 1], // Orange/Brown
            [
                ["EDIT", localize "STR_A3AU_player_context_reason_label", localize "STR_A3AU_player_context_forced_lobby", "A3U_InputRsn"],
                ["BUTTON", localize "STR_A3AU_player_context_confirm_return", [0, 0, 0, 0.4], {
                    params ["_btnCtrl"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_forced_lobby"; };
                    
                    [_rsn, "ERROR", _t] spawn A3U_fnc_context_popup;
                    
                    [_t] spawn {
                        sleep 2;
                        ["LOSER", false, true] remoteExec ["BIS_fnc_endMission", (_this#0)];
                    };
                    
                    ctrlDelete _grp;
                }]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };
};