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

// Determine executor permission context
private _isAdmin = serverCommandAvailable "#kick";
private _isCommander = (player isEqualTo theBoss);
private _userRole = if (_isAdmin) then { "Admin" } else { if (_isCommander) then { "Commander" } else { "Player" } };

private _fnc_log = {
    params ["_role", "_actionMsg"];
    private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _role, name player, _actionMsg];
    diag_log _msg;
    [_msg] remoteExecCall ["diag_log", 2];
};

switch (toUpper _actionType) do {
    // =========================================================================
    // TRANSFER PERSONAL FUNDS TO PLAYER
    // =========================================================================
    case "FUNDS_PLAYER": {
        [
            _display, _target, 
            localize "STR_A3AU_player_context_transfer_funds", 
            [0.18, 0.50, 0.20, 1], // Green
            [
                ["EDIT", "Amount:", "0", "A3U_InputAmt"],
                ["BUTTON", localize "STR_A3AU_player_context_confirm_button", [0, 0, 0, 0.4], {
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _amount = floor (parseNumber (ctrlText (_grp getVariable "A3U_InputAmt")));
                    
                    if (_amount > 0) then {
                        [_t, _amount] call A3A_fnc_donateMoney;
                        [_role, format ["Transferred personal funds (%1) to '%2'", _amount, name _t]] call {
                            params ["_r", "_act"];
                            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                            diag_log _msg;
                            [_msg] remoteExecCall ["diag_log", 2];
                        };
                        ctrlDelete _grp;
                    } else {
                        [localize "STR_A3AU_player_context_error_positive", "ERROR"] spawn A3U_fnc_context_notification;
                    };
                }, _userRole]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };

    // =========================================================================
    // TRANSFER FACTION FUNDS TO PLAYER
    // =========================================================================
    case "FUNDS": {
        [
            _display, _target, 
            localize "STR_A3AU_player_context_amount_transfer", 
            [0.18, 0.50, 0.20, 1], // Green
            [
                ["EDIT", "Amount:", "0", "A3U_InputAmt"],
                ["BUTTON", localize "STR_A3AU_player_context_confirm_button", [0, 0, 0, 0.4], {
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    private _amount = floor (parseNumber (ctrlText (_grp getVariable "A3U_InputAmt")));
                    
                    if (_amount > 0) then {
                        private _factionFunds = server getVariable ["resourcesFIA", 0];
                        if (_factionFunds isEqualType []) then { _factionFunds = _factionFunds # 1; };
                        
                        if (_amount <= _factionFunds) then {
                            [0, -_amount] remoteExec ["A3A_fnc_resourcesFIA", 2];
                            [_amount, _t, true] call A3A_fnc_addMoneyPlayer;
                            [format [localize "STR_A3AU_player_context_transferred_funds", _amount, name _t], "SUCCESS"] spawn A3U_fnc_context_notification;
                            
                            [_role, format ["Transferred faction funds (%1) to '%2'", _amount, name _t]] call {
                                params ["_r", "_act"];
                                private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                                diag_log _msg;
                                [_msg] remoteExecCall ["diag_log", 2];
                            };
                            
                            ctrlDelete _grp;
                        } else {
                            [localize "STR_A3AU_player_context_error_funds", "ERROR"] spawn A3U_fnc_context_notification;
                        };
                    } else {
                        [localize "STR_A3AU_player_context_error_positive", "ERROR"] spawn A3U_fnc_context_notification;
                    };
                }, _userRole]
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
                    ["Grey", "GREY", [0.5, 0.5, 0.5, 1]],
                    ["Green", "GREEN", [0.18, 0.50, 0.20, 1]],
                    ["Red", "RED", [0.8, 0.1, 0.1, 1]],
                    ["Orange", "ORANGE", [0.8, 0.5, 0.1, 1]],
                    ["Blue", "BLUE", [0.1, 0.4, 0.6, 1]],
                    ["Yellow", "YELLOW", [1, 1, 0, 1]],
                    ["Purple", "PURPLE", [0.5, 0.1, 0.6, 1]],
                    ["Cyan", "CYAN", [0.1, 0.7, 0.7, 1]],
                    ["Pink", "PINK", [0.9, 0.4, 0.6, 1]],
                    ["Brown", "BROWN", [0.5, 0.3, 0.1, 1]],
                    ["White", "WHITE", [0.9, 0.9, 0.9, 1]],
                    ["Black", "BLACK", [0.3, 0.3, 0.3, 1]] 
                ], "A3U_InputTheme"],
                ["BUTTON", localize "STR_A3AU_player_context_send_message", [0, 0, 0, 0.4], {
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _msg = ctrlText (_grp getVariable "A3U_InputMsg");
                    private _themeCombo = _grp getVariable "A3U_InputTheme";
                    private _theme = _themeCombo lbData (lbCurSel _themeCombo);
                    
                    if (_msg == "") exitWith {
                        [localize "STR_A3AU_player_context_message_empty", "ERROR", player] spawn A3U_fnc_context_notification;
                    };
                    
                    [_msg, _theme, _t] spawn A3U_fnc_context_notification;
                    [format [localize "STR_A3AU_player_context_message_sent", name _t], "SUCCESS", player] spawn A3U_fnc_context_notification;
                    
                    [_role, format ["Sent notification to '%1' (Theme: %2): ""%3""", name _t, _theme, _msg]] call {
                        params ["_r", "_act"];
                        private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                        diag_log _msg;
                        [_msg] remoteExecCall ["diag_log", 2];
                    };
                    
                    ctrlDelete _grp;
                }, _userRole]
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
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _facCombo = _grp getVariable "A3U_InputFac";
                    private _typeCombo = _grp getVariable "A3U_InputType";
                    private _faction = _facCombo lbData (lbCurSel _facCombo);
                    private _type = _typeCombo lbData (lbCurSel _typeCombo);
                    
                    [[_t, _faction, _type, clientOwner], "A3U_fnc_QRF_chasePlayer"] remoteExec ["A3A_fnc_scheduler", 2];
                    [format [localize "STR_A3AU_player_context_dispatched_qrf", _faction, _type, name _t], "WARNING"] spawn A3U_fnc_context_notification;
                    
                    [_role, format ["Dispatched QRF targeting '%1' (Faction: %2, Type: %3)", name _t, _faction, _type]] call {
                        params ["_r", "_act"];
                        private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                        diag_log _msg;
                        [_msg] remoteExecCall ["diag_log", 2];
                    };
                    
                    ctrlDelete _grp;
                }, _userRole]
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
                private _aceEng = _target getVariable ["ace_isEngineer", 0];
                if (_aceEng isEqualType true) then { _hasTrait = _aceEng; } else { _hasTrait = _aceEng > 0; };
            } else {
                _hasTrait = _target getUnitTrait _traitKey;
            };
            
            _elements pushBack ["TOGGLE", _label, _hasTrait, {
                params ["_t", "_newState", "_ctrl", "_key"];
                
                if (_key == "engineer" && {missionNamespace getVariable ["ace_repair_enabled", false]}) then {
                    private _aceVal = if (_newState) then { 1 } else { 0 };
                    _t setVariable ["ace_isEngineer", _aceVal, true];
                } else {
                    [_t, [_key, _newState, true]] remoteExecCall ["setUnitTrait", _t];
                };
                
                private _theme = if (_newState) then { "SUCCESS" } else { "WARNING" };
                [format [localize "STR_A3AU_player_context_trait_set_log", name _t, _key, _newState], _theme] spawn A3U_fnc_context_notification;
                
                ["Admin", format ["Set trait '%1' on player '%2' -> %3", _key, name _t, _newState]] call {
                    params ["_r", "_act"];
                    private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                    diag_log _msg;
                    [_msg] remoteExecCall ["diag_log", 2];
                };
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
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _time = floor (parseNumber (ctrlText (_grp getVariable "A3U_InputTime")));
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    
                    if (_time < 0) then { _time = 0; };
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_admin_action"; };
                    
                    [_t, _time, 1.0, objNull, _rsn, true] remoteExecCall ["A3A_fnc_punishment", 2, false];
                    [format [localize "STR_A3AU_player_context_punished_log", name _t, _time, 100, _rsn], "WARNING"] spawn A3U_fnc_context_notification;
                    
                    [_role, format ["Punished player '%1' (Time: %2s, Offence: 100%%, Reason: ""%3"")", name _t, _time, _rsn]] call {
                        params ["_r", "_act"];
                        private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                        diag_log _msg;
                        [_msg] remoteExecCall ["diag_log", 2];
                    };
                    
                    ctrlDelete _grp;
                }, _userRole]
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
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _iS = _grp getVariable "A3U_InputSev";
                    private _offRaw = parseNumber (_iS lbData (lbCurSel _iS));
                    
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_admin_action"; };
                    
                    [_t, 0, (_offRaw / 100), objNull, _rsn, true] remoteExecCall ["A3A_fnc_punishment", 2, false];
                    
                    [format [localize "STR_A3AU_player_context_warned_log", name _t, _offRaw, _rsn], "WARNING", _t] spawn A3U_fnc_context_notification;
                    [format [localize "STR_A3AU_player_context_warned_log", name _t, _offRaw, _rsn], "WARNING"] spawn A3U_fnc_context_notification;
                    
                    [_role, format ["Warned player '%1' (Offence: +%2%%, Reason: ""%3"")", name _t, _offRaw, _rsn]] call {
                        params ["_r", "_act"];
                        private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                        diag_log _msg;
                        [_msg] remoteExecCall ["diag_log", 2];
                    };
                    
                    ctrlDelete _grp;
                }, _userRole]
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
                    params ["_btnCtrl", "_extra"];
                    _extra params ["_type", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_no_reason"; };
                    
                    if (_type == "KICK") then {
                        [format [localize "STR_A3AU_player_context_kicking_log", name _t, _rsn], "WARNING"] spawn A3U_fnc_context_notification;
                        serverCommand format ["#kick %1", name _t];
                        [_role, format ["Kicked player '%1' (Reason: ""%2"")", name _t, _rsn]] call {
                            params ["_r", "_act"];
                            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                            diag_log _msg;
                            [_msg] remoteExecCall ["diag_log", 2];
                        };
                    } else {
                        [format [localize "STR_A3AU_player_context_banning_log", name _t, _rsn], "WARNING"] spawn A3U_fnc_context_notification;
                        serverCommand format ["#exec ban %1", name _t];
                        [_role, format ["Banned player '%1' (Reason: ""%2"")", name _t, _rsn]] call {
                            params ["_r", "_act"];
                            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                            diag_log _msg;
                            [_msg] remoteExecCall ["diag_log", 2];
                        };
                    };
                    
                    ctrlDelete _grp;
                }, [_actionType, _userRole]]
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
                    params ["_btnCtrl", "_role"];
                    private _t = _btnCtrl getVariable "A3U_Target";
                    private _grp = _btnCtrl getVariable "A3U_Grp";
                    
                    private _rsn = ctrlText (_grp getVariable "A3U_InputRsn");
                    if (_rsn == "") then { _rsn = localize "STR_A3AU_player_context_forced_lobby"; };
                    
                    [_rsn, "ERROR", _t] spawn A3U_fnc_context_notification;
                    
                    [_role, format ["Forced player '%1' to lobby (Reason: ""%2"")", name _t, _rsn]] call {
                        params ["_r", "_act"];
                        private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                        diag_log _msg;
                        [_msg] remoteExecCall ["diag_log", 2];
                    };
                    
                    [_t] spawn {
                        sleep 2;
                        ["LOSER", false, true] remoteExec ["BIS_fnc_endMission", (_this#0)];
                    };
                    
                    ctrlDelete _grp;
                }, _userRole]
            ]
        ] spawn A3U_fnc_context_buildPanel;
    };
};