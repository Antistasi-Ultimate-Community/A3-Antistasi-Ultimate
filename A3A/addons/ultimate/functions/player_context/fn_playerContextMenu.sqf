#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_playerContextMenu

Description:
    Generates a dynamic, unified accordion-style UI on the map display. 
    Populates specific action buttons based on the user's current permissions 
    (Admin or Commander). Features smooth downward slide animations, collapsible 
    panels, inline rank management overlays, and a unified background.

Parameters:
    0: _target - The player entity selected on the map <OBJECT>
    1: _screenPosition - The X and Y screen coordinates to anchor the menu <ARRAY> (default: [])

Example:
    (begin example)
    [_selectedPlayer, getMousePosition] call A3U_fnc_playerContextMenu;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params [
    ["_target", objNull, [objNull]],
    ["_screenPosition", [], [[]]]
];

if (isNull _target || {!isPlayer _target}) exitWith {};

disableSerialization;
private _mapDisplay = findDisplay 12; 
if (isNull _mapDisplay) exitWith {};

private _mapControl = _mapDisplay displayCtrl 51;
if (isNull _mapControl) exitWith {};

// -----------------------------------------------------------------------------
// CLEANUP PREVIOUS MENUS
// -----------------------------------------------------------------------------
private _existingMaster = _mapDisplay getVariable ["A3U_playerMenu_masterGrp", controlNull];
if (!isNull _existingMaster) then { ctrlDelete _existingMaster; };

// -----------------------------------------------------------------------------
// PERMISSION CHECKS & LOGGING HELPER
// -----------------------------------------------------------------------------
private _isCommander = (player isEqualTo theBoss);
private _isAdmin = serverCommandAvailable "#kick";

private _userRole = if (_isAdmin) then { "Admin" } else { if (_isCommander) then { "Commander" } else { "Player" } };
_mapDisplay setVariable ["A3U_ContextUserRole", _userRole];

private _fnc_logAction = {
    params ["_role", "_actionMsg"];
    private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _role, name player, _actionMsg];
    diag_log _msg;
    [_msg] remoteExecCall ["diag_log", 2];
};

private _optionsData = [];
private _adminData = [];

// --- PANEL 2: PLAYER OPTIONS ---
_optionsData pushBack ["SINGLE", localize "STR_A3AU_player_context_transfer_funds", {
    params ["_target", "_btnControl"];
    private _display = ctrlParent _btnControl;
    [_display, _target, "FUNDS_PLAYER"] spawn A3U_fnc_context_panelActions;
}];

if (_isAdmin || _isCommander) then {
    _optionsData pushBack ["SINGLE", localize "STR_A3AU_player_context_transfer_commander", {
        params ["_target", "_btnControl"];
        private _role = (ctrlParent _btnControl) getVariable ["A3U_ContextUserRole", "Player"];
        
        [_target] call A3A_fnc_theBossTransfer;
        [_target] call A3A_fnc_makePlayerBossIfEligible;
        [player, _target] remoteExec ["A3A_fnc_theBossToggleEligibility", 2];
        [format [localize "STR_A3AU_player_context_commander_transferred", name _target], "SUCCESS"] spawn A3U_fnc_context_notification;
        
        [_role, format ["Transferred Commander role to '%1'", name _target]] call {
            params ["_r", "_act"];
            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
            diag_log _msg;
            [_msg] remoteExecCall ["diag_log", 2];
        };
    }];
    
    _optionsData pushBack ["SINGLE", localize "STR_A3AU_player_context_transfer_faction_funds", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "FUNDS"] spawn A3U_fnc_context_panelActions;
    }];
};

// --- PANEL 3: ADMIN SETTINGS ---
if (_isAdmin) then {
    
    private _isMember = [_target] call A3A_fnc_isMember;
    private _memColor = if (_isMember) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
    
    _adminData pushBack ["TOGGLE", localize "STR_A3AU_player_context_toggle_membership", { 
        params ["_target", "_btnControl"];
        
        private _currentlyMember = [_target] call A3A_fnc_isMember;
        private _newState = !_currentlyMember;
        
        if (_currentlyMember) then {
            ["remove", _target] call A3A_fnc_memberAdd;
        } else {
            ["add", _target] call A3A_fnc_memberAdd;
        };
        
        private _newColor = if (_newState) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
        private _newHover = [(_newColor#0) + 0.15, (_newColor#1) + 0.15, (_newColor#2) + 0.15, 1];
        
        _btnControl setVariable ["A3U_btn_colNormal", _newColor];
        _btnControl setVariable ["A3U_btn_colHover", _newHover];
        _btnControl ctrlSetBackgroundColor _newHover; 
        
        ["Admin", format ["Toggled server membership for '%1' -> %2", name _target, if (_newState) then {"Added"} else {"Removed"}]] call {
            params ["_r", "_act"];
            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
            diag_log _msg;
            [_msg] remoteExecCall ["diag_log", 2];
        };
    }, _memColor];
    
    private _isUndercover = _target getVariable ["undercover", false];
    private _ucColor = if (_isUndercover) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
    
    _adminData pushBack ["TOGGLE", localize "STR_A3AU_player_context_force_undercover", { 
        params ["_target", "_btnControl"];
        
        private _isUndercover = _target getVariable ["undercover", false];
        private _newState = !_isUndercover;
        
        _target setVariable ["undercover", _newState, true];
        [_target, _newState] remoteExec ["setCaptive", _target];
        
        private _newColor = if (_newState) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
        private _newHover = [(_newColor#0) + 0.15, (_newColor#1) + 0.15, (_newColor#2) + 0.15, 1];
        
        _btnControl setVariable ["A3U_btn_colNormal", _newColor];
        _btnControl setVariable ["A3U_btn_colHover", _newHover];
        _btnControl ctrlSetBackgroundColor _newHover; 
        
        if (_newState) then {
            [format [localize "STR_A3AU_player_context_undercover_on_log", name _target], "WARNING"] spawn A3U_fnc_context_notification;
        } else {
            [format [localize "STR_A3AU_player_context_undercover_off_log", name _target], "WARNING"] spawn A3U_fnc_context_notification;
        };
        
        ["Admin", format ["Forced undercover state on '%1' -> %2", name _target, _newState]] call {
            params ["_r", "_act"];
            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
            diag_log _msg;
            [_msg] remoteExecCall ["diag_log", 2];
        };
    }, _ucColor];
    
    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_message_player", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "MESSAGE"] spawn A3U_fnc_context_panelActions;
    }];

    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_request_qrf", { 
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "QRF"] spawn A3U_fnc_context_panelActions;
    }];
    
    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_give_traits", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "TRAITS"] spawn A3U_fnc_context_panelActions;
    }];
    
    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_punish_btn", { 
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "PUNISH"] spawn A3U_fnc_context_panelActions;
    }];
    
    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_warn_btn", { 
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "WARN"] spawn A3U_fnc_context_panelActions;
    }];
    
    _adminData pushBack ["DOUBLE", [localize "STR_A3AU_player_context_kick", localize "STR_A3AU_player_context_ban"], [
        {
            params ["_target", "_btnControl"];
            private _display = ctrlParent _btnControl;
            [_display, _target, "KICK"] spawn A3U_fnc_context_panelActions;
        },
        {
            params ["_target", "_btnControl"];
            private _display = ctrlParent _btnControl;
            [_display, _target, "BAN"] spawn A3U_fnc_context_panelActions;
        }
    ]];
    
    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_force_lobby", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target, "LOBBY"] spawn A3U_fnc_context_panelActions;
    }];
    
    _adminData pushBack ["SINGLE", localize "STR_A3AU_player_context_promote_zeus", {
        params ["_target", "_btnControl"];
        [[_target], {
            params ["_t"];
            private _logicGroup = createGroup sideLogic;
            private _zeusModule = _logicGroup createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
            _t assignCurator _zeusModule;
            _zeusModule addCuratorAddons activatedAddons;
            _zeusModule addCuratorEditableObjects [allUnits + vehicles, true];
            [localize "STR_A3AU_player_context_zeus_granted", "SUCCESS", _target] spawn A3U_fnc_context_notification;
        }] remoteExec ["bis_fnc_call", 2];
        
        [format [localize "STR_A3AU_player_context_zeus_log", name _target], "SUCCESS"] spawn A3U_fnc_context_notification;
        
        ["Admin", format ["Promoted '%1' to temporary Zeus", name _target]] call {
            params ["_r", "_act"];
            private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
            diag_log _msg;
            [_msg] remoteExecCall ["diag_log", 2];
        };
    }];
};

// -----------------------------------------------------------------------------
// SIZING & COORDINATES
// -----------------------------------------------------------------------------
if (_screenPosition isEqualTo []) then { _screenPosition = getMousePosition; };

private _groupWidth = 0.16 * safeZoneW;
private _titleHeight = 0.026 * safeZoneH;
private _btnHeight = 0.022 * safeZoneH; 
private _padding = 0.003 * safeZoneH; 

private _p1Height = (_btnHeight * 5) + (_padding * 6); 
private _p2RowCount = count _optionsData;
private _p2Height = if (_p2RowCount > 0) then { (_btnHeight * _p2RowCount) + (_padding * (_p2RowCount + 1)) } else { 0 };
private _p3RowCount = count _adminData;
private _p3Height = if (_p3RowCount > 0) then { (_btnHeight * _p3RowCount) + (_padding * (_p3RowCount + 1)) } else { 0 };

private _groupPositionX = (_screenPosition # 0) + 0.012;
private _groupPositionY = (_screenPosition # 1) + 0.012;

_groupPositionX = _groupPositionX max (safeZoneX + (2 * pixelW));
_groupPositionY = _groupPositionY max (safeZoneY + (2 * pixelH));

private _profileBackgroundColor = [
    profileNamespace getVariable ["GUI_BCG_RGB_R", 0.376],
    profileNamespace getVariable ["GUI_BCG_RGB_G", 0.125],
    profileNamespace getVariable ["GUI_BCG_RGB_B", 0.043],
    1
];

// -----------------------------------------------------------------------------
// DYNAMIC LAYOUT ANIMATOR (ACCORDION LOGIC)
// -----------------------------------------------------------------------------
_mapDisplay setVariable ["A3U_fnc_updateMenuLayout", {
    params ["_animSpeed", "_display", "_openedIndex"];
    
    private _sections = _display getVariable ["A3U_ContextSections", []];
    private _bg = _display getVariable ["A3U_ContextBg", controlNull];
    private _master = _display getVariable ["A3U_playerMenu_masterGrp", controlNull];
    
    private _currentY = 0;
    private _groupWidth = 0.16 * safeZoneW;
    private _titleHeight = 0.026 * safeZoneH;
    
    {
        _x params ["_titleCtrl", "_contentCtrl", "_fullHeight"];
        if (!isNull _titleCtrl) then {
            
            // Slide Title
            _titleCtrl ctrlSetPosition [0, _currentY, _groupWidth, _titleHeight];
            _titleCtrl ctrlCommit _animSpeed;
            _currentY = _currentY + _titleHeight;
            
            // Slide & Expand/Collapse Content
            private _targetHeight = if (_forEachIndex == _openedIndex) then { _fullHeight } else { 0 };
            _contentCtrl ctrlSetPosition [0, _currentY, _groupWidth, _targetHeight];
            _contentCtrl ctrlCommit _animSpeed;
            _currentY = _currentY + _targetHeight;
        };
    } forEach _sections;
    
    // Resize Unified Background
    if (!isNull _bg) then {
        _bg ctrlSetPosition [0, 0, _groupWidth, _currentY];
        _bg ctrlCommit _animSpeed;
    };
    
    // Resize & Clamp Master Clip Group to Screen Bounds
    if (!isNull _master) then {
        private _masterPos = ctrlPosition _master;
        private _maxPosY = safeZoneY + safeZoneH - _currentY - (2 * pixelH);
        private _safeY = (_masterPos#1) min _maxPosY;
        
        _master ctrlSetPosition [_masterPos#0, _safeY, _groupWidth, _currentY];
        _master ctrlCommit _animSpeed;
    };
}];

// -----------------------------------------------------------------------------
// UI CONSTRUCTION
// -----------------------------------------------------------------------------
private _masterGrp = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_masterGrp ctrlSetPosition [_groupPositionX, _groupPositionY, _groupWidth, 0];
_masterGrp ctrlCommit 0;

_mapDisplay setVariable ["A3U_playerMenu_masterGrp", _masterGrp];
_mapDisplay setVariable ["A3U_OpenContextPanels", [_masterGrp]];
_mapDisplay setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _mapDisplay ctrlCreate ["RscText", -1, _masterGrp];
_bg ctrlSetPosition [0, 0, _groupWidth, 0];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;
_mapDisplay setVariable ["A3U_ContextBg", _bg];

private _sectionsArray = [];

// Helper to construct Action Buttons inside Content Panels
private _fnc_populateContent = {
    params ["_contentGrp", "_dataArray"];
    private _cY = _padding;
    private _btnWidthFull = _groupWidth - (_padding * 2);

    {
        _x params ["_type", "_texts", "_actions", ["_extra", []]];
        
        if (_type == "SINGLE" || _type == "TOGGLE") then {
            private _btn = _mapDisplay ctrlCreate ["RscStructuredText", -1, _contentGrp];
            _btn ctrlSetPosition [_padding, _cY, _btnWidthFull, _btnHeight];
            _btn ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.85'>%1</t>", _texts];
            
            private _bgColor = if (_type == "TOGGLE" && !(_extra isEqualTo [])) then { _extra } else { [0, 0, 0, 0.4] };
            _btn ctrlSetBackgroundColor _bgColor;
            _btn ctrlCommit 0;
            
            _btn setVariable ["A3U_Target", _target];
            _btn setVariable ["A3U_Action", _actions];
            _btn setVariable ["A3U_btn_colNormal", _bgColor];
            
            private _hoverColor = if (_type == "TOGGLE") then { [(_bgColor#0)+0.15, (_bgColor#1)+0.15, (_bgColor#2)+0.15, 1] } else { [0.8, 0.8, 0.8, 0.2] };
            _btn setVariable ["A3U_btn_colHover", _hoverColor];
            
            _btn ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colHover", [0,0,0,1]]); }];
            _btn ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colNormal", [0,0,0,1]]); }];
            _btn ctrlAddEventHandler ["MouseButtonDown", {
                params ["_ctrl", "_button"];
                if (_button != 0) exitWith {}; 
                private _t = _ctrl getVariable "A3U_Target";
                private _a = _ctrl getVariable "A3U_Action";
                [_t, _ctrl] call _a;
            }];
            
        } else {
            private _halfWidth = (_btnWidthFull - _padding) / 2;
            
            private _btnL = _mapDisplay ctrlCreate ["RscStructuredText", -1, _contentGrp];
            _btnL ctrlSetPosition [_padding, _cY, _halfWidth, _btnHeight];
            _btnL ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.85'>%1</t>", _texts#0];
            _btnL ctrlSetBackgroundColor [0, 0, 0, 0.4];
            _btnL ctrlCommit 0;
            
            _btnL setVariable ["A3U_Target", _target];
            _btnL setVariable ["A3U_Action", _actions#0];
            
            _btnL ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.8, 0.8, 0.2]; }];
            _btnL ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
            _btnL ctrlAddEventHandler ["MouseButtonDown", {
                params ["_ctrl", "_button"];
                if (_button != 0) exitWith {}; 
                private _t = _ctrl getVariable "A3U_Target";
                private _a = _ctrl getVariable "A3U_Action";
                [_t, _ctrl] call _a;
            }];
            
            private _btnR = _mapDisplay ctrlCreate ["RscStructuredText", -1, _contentGrp];
            _btnR ctrlSetPosition [_padding + _halfWidth + _padding, _cY, _halfWidth, _btnHeight];
            _btnR ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.85'>%1</t>", _texts#1];
            _btnR ctrlSetBackgroundColor [0, 0, 0, 0.4];
            _btnR ctrlCommit 0;
            
            _btnR setVariable ["A3U_Target", _target];
            _btnR setVariable ["A3U_Action", _actions#1];
            
            _btnR ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.8, 0.8, 0.2]; }];
            _btnR ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];
            _btnR ctrlAddEventHandler ["MouseButtonDown", {
                params ["_ctrl", "_button"];
                if (_button != 0) exitWith {}; 
                private _t = _ctrl getVariable "A3U_Target";
                private _a = _ctrl getVariable "A3U_Action";
                [_t, _ctrl] call _a;
            }];
        };
        _cY = _cY + _btnHeight + _padding;
    } forEach _dataArray;
};

// -----------------------------------------------------------------------------
// SECTION 1: PLAYER INFO
// -----------------------------------------------------------------------------
private _title1Text = format ["%1's %2", name _target, localize "STR_A3AU_player_context_player_info"];
private _title1 = _mapDisplay ctrlCreate ["RscStructuredText", -1, _masterGrp];
_title1 ctrlSetStructuredText parseText format ["<t size='0.9' align='center' valign='middle'>%1</t>", _title1Text];
_title1 ctrlSetBackgroundColor _profileBackgroundColor;
_title1 setVariable ["A3U_BaseCol", _profileBackgroundColor];
_title1 ctrlCommit 0;

private _content1 = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1, _masterGrp];
_content1 ctrlSetPosition [0, 0, _groupWidth, 0];
_content1 ctrlCommit 0;

private _uid = getPlayerUID _target;
private _funds = str (_target getVariable ["moneyX", 0]);
private _rank = [_target, "displayName"] call BIS_fnc_rankParams;
private _civFaction = missionNamespace getVariable ["A3A_faction_civ", createHashMap];
private _currencySymbol = _civFaction getOrDefault ["currencySymbol", "$"];
private _role = roleDescription _target;
if (_role == "") then { _role = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"); };
if (_role find "@" > -1) then { _role = (_role splitString "@") select 0; };
private _displayRole = if (isLocalized _role) then { localize _role } else { _role };

private _infoData = [
    [format [localize "STR_A3AU_player_context_name", name _target], name _target],
    [format [localize "STR_A3AU_player_context_uid", _uid], _uid],
    [format [localize "STR_A3AU_player_context_funds", _currencySymbol, _funds], _funds],
    [format [localize "STR_A3AU_player_context_role", _displayRole], _role],
    [format [localize "STR_A3AU_player_context_rank", _rank], _rank]
];

private _cY1 = _padding;
private _btnWidthFull = _groupWidth - (_padding * 2);

{
    _x params ["_displayStr", "_copyStr"];
    
    private _btn = _mapDisplay ctrlCreate ["RscStructuredText", -1, _content1];
    _btn ctrlSetPosition [_padding, _cY1, _btnWidthFull, _btnHeight];
    _btn ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.85'>%1</t>", _displayStr];
    _btn ctrlSetTooltip (localize "STR_A3AU_player_context_copy_clipboard");
    _btn ctrlSetBackgroundColor [0, 0, 0, 0.4];
    _btn ctrlCommit 0;
    
    _btn setVariable ["A3U_btn_colNormal", [0, 0, 0, 0.4]];
    _btn setVariable ["A3U_btn_colHover", [0.8, 0.8, 0.8, 0.2]]; 
    _btn setVariable ["A3U_CopyData", _copyStr];
    
    _btn ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colHover", [0,0,0,1]]); }];
    _btn ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colNormal", [0,0,0,1]]); }];
    _btn ctrlAddEventHandler ["MouseButtonDown", {
        params ["_btnControl", "_button"];
        if (_button != 0) exitWith {}; 
        copyToClipboard (_btnControl getVariable ["A3U_CopyData", ""]);
        [localize "STR_A3AU_player_context_copied_clipboard", "SUCCESS"] spawn A3U_fnc_context_notification;
    }];
    
    // Rank Management Overlay (Inline within Content 1)
    if ((_forEachIndex == 4) && (_isAdmin || _isCommander)) then {
        private _sqBtnW = 0.012 * safeZoneW;
        
        // Demote (-)
        private _btnDemote = _mapDisplay ctrlCreate ["RscStructuredText", -1, _content1];
        _btnDemote ctrlSetPosition [_padding, _cY1, _sqBtnW, _btnHeight];
        _btnDemote ctrlSetStructuredText parseText "<t align='center' valign='middle' size='0.85'>-</t>";
        _btnDemote ctrlSetBackgroundColor [0.12, 0.12, 0.12, 1];
        _btnDemote ctrlSetTooltip (localize "STR_A3AU_player_context_demote_tooltip");
        _btnDemote ctrlCommit 0;
        
        _btnDemote setVariable ["A3U_btn_colNormal", [0.12, 0.12, 0.12, 1]];
        _btnDemote setVariable ["A3U_btn_colHover", [0.8, 0.1, 0.1, 0.8]];
        _btnDemote setVariable ["A3U_Target", _target];
        
        _btnDemote ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colHover", [0,0,0,1]]); }];
        _btnDemote ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colNormal", [0,0,0,1]]); }];
        _btnDemote ctrlAddEventHandler ["MouseButtonDown", {
            params ["_ctrl", "_button"];
            if (_button != 0) exitWith {};
            private _t = _ctrl getVariable "A3U_Target";
            private _ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
            private _idx = _ranks find (rank _t);
            if (_idx > 0) then {
                private _newRank = _ranks select (_idx - 1);
                _t setRank _newRank;
                _t setVariable ["rankX", _newRank, true];
                [format [localize "STR_A3AU_player_context_demoted_log", name _t, _newRank], "WARNING"] spawn A3U_fnc_context_notification;
                
                private _role = (ctrlParent _ctrl) getVariable ["A3U_ContextUserRole", "Player"];
                [_role, format ["Demoted player '%1' to rank %2", name _t, _newRank]] call {
                    params ["_r", "_act"];
                    private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                    diag_log _msg;
                    [_msg] remoteExecCall ["diag_log", 2];
                };

                // Trigger auto-close
                private _display = ctrlParent _ctrl;
                private _panels = _display getVariable ["A3U_OpenContextPanels", []];
                { ctrlDelete _x } forEach _panels;
                _display setVariable ["A3U_OpenContextPanels", []];
            };
        }];
        
        // Promote (+)
        private _btnPromote = _mapDisplay ctrlCreate ["RscStructuredText", -1, _content1];
        _btnPromote ctrlSetPosition [_padding + _btnWidthFull - _sqBtnW, _cY1, _sqBtnW, _btnHeight];
        _btnPromote ctrlSetStructuredText parseText "<t align='center' valign='middle' size='0.85'>+</t>";
        _btnPromote ctrlSetBackgroundColor [0.12, 0.12, 0.12, 1];
        _btnPromote ctrlSetTooltip (localize "STR_A3AU_player_context_promote_tooltip");
        _btnPromote ctrlCommit 0;
        
        _btnPromote setVariable ["A3U_btn_colNormal", [0.12, 0.12, 0.12, 1]];
        _btnPromote setVariable ["A3U_btn_colHover", [0.18, 0.50, 0.20, 0.8]];
        _btnPromote setVariable ["A3U_Target", _target];
        
        _btnPromote ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colHover", [0,0,0,1]]); }];
        _btnPromote ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable ["A3U_btn_colNormal", [0,0,0,1]]); }];
        _btnPromote ctrlAddEventHandler ["MouseButtonDown", {
            params ["_ctrl", "_button"];
            if (_button != 0) exitWith {};
            private _t = _ctrl getVariable "A3U_Target";
            private _ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
            private _idx = _ranks find (rank _t);
            if (_idx < ((count _ranks) - 1)) then {
                private _newRank = _ranks select (_idx + 1);
                _t setRank _newRank;
                _t setVariable ["rankX", _newRank, true];
                [format [localize "STR_A3AU_player_context_promoted_log", name _t, _newRank], "SUCCESS"] spawn A3U_fnc_context_notification;
                
                private _role = (ctrlParent _ctrl) getVariable ["A3U_ContextUserRole", "Player"];
                [_role, format ["Promoted player '%1' to rank %2", name _t, _newRank]] call {
                    params ["_r", "_act"];
                    private _msg = format ["[A3AU_P.C.M] [""%1""] [""%2""] %3", _r, name player, _act];
                    diag_log _msg;
                    [_msg] remoteExecCall ["diag_log", 2];
                };

                // Trigger auto-close
                private _display = ctrlParent _ctrl;
                private _panels = _display getVariable ["A3U_OpenContextPanels", []];
                { ctrlDelete _x } forEach _panels;
                _display setVariable ["A3U_OpenContextPanels", []];
            };
        }];
    };
    _cY1 = _cY1 + _btnHeight + _padding;
} forEach _infoData;

_sectionsArray pushBack [_title1, _content1, _p1Height];

// -----------------------------------------------------------------------------
// SECTION 2: PLAYER OPTIONS
// -----------------------------------------------------------------------------
if (_p2Height > 0) then {
    private _title2 = _mapDisplay ctrlCreate ["RscStructuredText", -1, _masterGrp];
    _title2 ctrlSetStructuredText parseText format ["<t size='0.9' align='center' valign='middle'>%1</t>", localize "STR_A3AU_player_context_player_options"];
    _title2 ctrlSetBackgroundColor _profileBackgroundColor;
    _title2 setVariable ["A3U_BaseCol", _profileBackgroundColor];
    _title2 ctrlCommit 0;
    
    private _content2 = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1, _masterGrp];
    _content2 ctrlSetPosition [0, 0, _groupWidth, 0];
    _content2 ctrlCommit 0;
    
    [_content2, _optionsData] call _fnc_populateContent;
    _sectionsArray pushBack [_title2, _content2, _p2Height];
};

// -----------------------------------------------------------------------------
// SECTION 3: ADMIN SETTINGS
// -----------------------------------------------------------------------------
if (_p3Height > 0) then {
    private _adminBgColor = [0.4, 0.1, 0.1, 1];
    private _title3 = _mapDisplay ctrlCreate ["RscStructuredText", -1, _masterGrp];
    _title3 ctrlSetStructuredText parseText format ["<t size='0.9' align='center' valign='middle'>%1</t>", localize "STR_A3AU_player_context_admin_settings"];
    _title3 ctrlSetBackgroundColor _adminBgColor;
    _title3 setVariable ["A3U_BaseCol", _adminBgColor];
    _title3 ctrlCommit 0;
    
    private _content3 = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1, _masterGrp];
    _content3 ctrlSetPosition [0, 0, _groupWidth, 0];
    _content3 ctrlCommit 0;
    
    [_content3, _adminData] call _fnc_populateContent;
    _sectionsArray pushBack [_title3, _content3, _p3Height];
};

// -----------------------------------------------------------------------------
// INITIALIZE SECTIONS & HOOK ACCORDION CLICK EVENTS
// -----------------------------------------------------------------------------
_mapDisplay setVariable ["A3U_ContextSections", _sectionsArray];

{
    _x params ["_tCtrl", "", ""];
    if (!isNull _tCtrl) then {
        _tCtrl setVariable ["A3U_SecIndex", _forEachIndex];
        
        private _baseCol = _tCtrl getVariable "A3U_BaseCol";
        _tCtrl setVariable ["A3U_HoverCol", [(_baseCol#0)+0.15, (_baseCol#1)+0.15, (_baseCol#2)+0.15, 1]];
        
        _tCtrl ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable "A3U_HoverCol"); }];
        _tCtrl ctrlAddEventHandler ["MouseExit",  { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable "A3U_BaseCol"); }];
        _tCtrl ctrlAddEventHandler ["MouseButtonDown", {
            params ["_ctrl", "_btn"];
            if (_btn != 0) exitWith {};
            private _disp = ctrlParent _ctrl;
            private _idx = _ctrl getVariable "A3U_SecIndex";
            
            // Toggle Logic: Close if clicking the currently open tab, otherwise open the clicked tab
            private _currentOpen = _disp getVariable ["A3U_OpenSection", 0];
            private _newOpen = if (_currentOpen == _idx) then { -1 } else { _idx };
            _disp setVariable ["A3U_OpenSection", _newOpen];
            
            [0.25, _disp, _newOpen] call (_disp getVariable "A3U_fnc_updateMenuLayout");
        }];
    };
} forEach _sectionsArray;

// Instantly setup initial layout with Section 1 Open
_mapDisplay setVariable ["A3U_OpenSection", 0]; 
[0, _mapDisplay, 0] call (_mapDisplay getVariable "A3U_fnc_updateMenuLayout");

// -----------------------------------------------------------------------------
// UNIFIED AUTO-CLOSE SYSTEM (Clicking outside bounds)
// -----------------------------------------------------------------------------
private _ehID = _mapDisplay getVariable ["A3U_ContextMenu_EH", -1];
if (_ehID != -1) then { _mapControl ctrlRemoveEventHandler ["MouseButtonDown", _ehID]; };

_ehID = _mapControl ctrlAddEventHandler ["MouseButtonDown", {
    params ["_mapCtrl", "_button"];
    private _display = ctrlParent _mapCtrl;
    
    if (diag_tickTime - (_display getVariable ["A3U_ContextMenu_SpawnTime", 0]) < 0.1) exitWith {};

    // Get all open panels (could be the accordion, or could be a standalone popup)
    private _childPanels = _display getVariable ["A3U_OpenContextPanels", []];
    _childPanels = _childPanels select { !isNull _x }; 

    // If there is literally nothing open, destroy this event handler
    if (count _childPanels == 0) exitWith {
        _mapCtrl ctrlRemoveEventHandler ["MouseButtonDown", _thisEventHandler];
        _display setVariable ["A3U_ContextMenu_EH", -1];
    };

    private _mousePos = getMousePosition;
    private _mouseX = _mousePos # 0;
    private _mouseY = _mousePos # 1;
    private _inside = false;

    // Check if the user's mouse click fell inside ANY of the currently open menus/popups
    {
        private _cPos = ctrlPosition _x;
        if (_mouseX >= _cPos#0 && _mouseX <= (_cPos#0 + _cPos#2) && _mouseY >= _cPos#1 && _mouseY <= (_cPos#1 + _cPos#3)) then { 
            _inside = true; 
        };
    } forEach _childPanels;

    // If they clicked the bare map, delete all panels and remove the event handler
    if (!_inside) then {
        { ctrlDelete _x } forEach _childPanels;
        _display setVariable ["A3U_OpenContextPanels", []];
        _mapCtrl ctrlRemoveEventHandler ["MouseButtonDown", _thisEventHandler];
        _display setVariable ["A3U_ContextMenu_EH", -1];
    };
}];
_mapDisplay setVariable ["A3U_ContextMenu_EH", _ehID];