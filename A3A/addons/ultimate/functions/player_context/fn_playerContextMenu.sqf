#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_playerContextMenu

Description:
    Generates a dynamic, multi-column interactive UI on the map display. 
    Populates specific action buttons based on the user's current permissions 
    (Admin or Commander) and implements a unified auto-close listener to 
    manage cleanup of child panels.

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
private _existingMenuGroup1 = _mapDisplay getVariable ["A3U_playerMenu_grp", controlNull];
if (!isNull _existingMenuGroup1) then { ctrlDelete _existingMenuGroup1; };

private _existingMenuGroup2 = _mapDisplay getVariable ["A3U_playerMenu_grp2", controlNull];
if (!isNull _existingMenuGroup2) then { ctrlDelete _existingMenuGroup2; };

private _existingMenuGroup3 = _mapDisplay getVariable ["A3U_playerMenu_grp3", controlNull];
if (!isNull _existingMenuGroup3) then { ctrlDelete _existingMenuGroup3; };

// -----------------------------------------------------------------------------
// PERMISSION CHECKS & DATA ARRAYS
// -----------------------------------------------------------------------------
private _isCommander = (player isEqualTo theBoss);
private _isAdmin = serverCommandAvailable "#kick";

private _optionsData = [];
private _adminData = [];

// --- PANEL 2: PLAYER OPTIONS ---
_optionsData pushBack ["SINGLE", "Transfer Funds", {
    params ["_target"];
    ["moneyX", _target] call A3A_fnc_donateMoney;
}];

if (_isAdmin || _isCommander) then {
    _optionsData pushBack ["SINGLE", "Transfer Commander", {
        params ["_target"];
        [_target] call A3A_fnc_theBossTransfer;
        systemChat format ["Commander transferred to %1.", name _target];
    }];
    
    _optionsData pushBack ["SINGLE", "Transfer faction funds to player", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target] spawn A3U_fnc_context_fundsToPlayer;
    }];
    
    _optionsData pushBack ["DOUBLE", ["Promote", "Demote"], [
        {
            params ["_target"];
            private _ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
            private _idx = _ranks find (rank _target);
            if (_idx < ((count _ranks) - 1)) then {
                private _newRank = _ranks select (_idx + 1);
                _target setRank _newRank;
                _target setVariable ["rankX", _newRank, true];
                systemChat format ["%1 promoted to %2.", name _target, _newRank];
            };
        },
        {
            params ["_target"];
            private _ranks = ["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"];
            private _idx = _ranks find (rank _target);
            if (_idx > 0) then {
                private _newRank = _ranks select (_idx - 1);
                _target setRank _newRank;
                _target setVariable ["rankX", _newRank, true];
                systemChat format ["%1 demoted to %2.", name _target, _newRank];
            };
        }
    ]];
};

// --- PANEL 3: ADMIN SETTINGS ---
if (_isAdmin) then {
    _adminData pushBack ["SINGLE", "Toggle server membership", { 
        params ["_target"];
        if ([_target] call A3A_fnc_isMember) then {
            ["remove", _target] call A3A_fnc_memberAdd;
        } else {
            ["add", _target] call A3A_fnc_memberAdd;
        };
    }];
    
    private _isUndercover = _target getVariable ["undercover", false];
    private _ucColor = if (_isUndercover) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
    
    _adminData pushBack ["TOGGLE", "Force Toggle Undercover", { 
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
            systemChat format ["Forced Undercover ON for %1.", name _target];
            "An Admin has forced your Undercover status ON." remoteExec ["systemChat", _target];
        } else {
            systemChat format ["Forced Undercover OFF for %1.", name _target];
            "An Admin has forced your Undercover status OFF." remoteExec ["systemChat", _target];
        };
    }, _ucColor];
    
    _adminData pushBack ["SINGLE", "Request QRF to chase player", { 
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target] spawn A3U_fnc_context_requestQRF;
    }];
    
    _adminData pushBack ["SINGLE", "Give or remove traits", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target] spawn A3U_fnc_context_setPlayerTraits;
    }];
    
    _adminData pushBack ["SINGLE", "Punish player", { 
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target] spawn A3U_fnc_context_punishPanel;
    }];
    
    _adminData pushBack ["DOUBLE", ["Kick", "Ban"], [
        {
            params ["_target", "_btnControl"];
            private _display = ctrlParent _btnControl;
            [_display, _target, "KICK"] spawn A3U_fnc_context_kickPlayer;
        },
        {
            params ["_target", "_btnControl"];
            private _display = ctrlParent _btnControl;
            [_display, _target, "BAN"] spawn A3U_fnc_context_banPlayer;
        }
    ]];
    
    _adminData pushBack ["SINGLE", "Force player to lobby", {
        params ["_target", "_btnControl"];
        private _display = ctrlParent _btnControl;
        [_display, _target] spawn A3U_fnc_context_forceToLobby;
    }];
    
    _adminData pushBack ["SINGLE", "Promote to zeus", {
        params ["_target"];
        [[_target], {
            params ["_t"];
            private _logicGroup = createGroup sideLogic;
            private _zeusModule = _logicGroup createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
            _t assignCurator _zeusModule;
            _zeusModule addCuratorAddons activatedAddons;
            _zeusModule addCuratorEditableObjects [allUnits + vehicles, true];
            "You have been granted Zeus powers. Press 'Y'." remoteExec ["systemChat", _t];
        }] remoteExec ["bis_fnc_call", 2];
        systemChat format ["Promoted %1 to Zeus.", name _target];
    }];
};

// -----------------------------------------------------------------------------
// SIZING, COLUMNS & TWO-PANEL CLAMPING
// -----------------------------------------------------------------------------
if (_screenPosition isEqualTo []) then { _screenPosition = getMousePosition; };

private _groupWidth = 0.16 * safeZoneW;
private _titleHeight = 0.026 * safeZoneH;
private _btnHeight = 0.022 * safeZoneH; 
private _padding = 0.003 * safeZoneH; 

private _p1Height = _titleHeight + (_btnHeight * 5) + (_padding * 6); 

private _p2RowCount = count _optionsData;
private _p2Height = if (_p2RowCount > 0) then { _titleHeight + (_btnHeight * _p2RowCount) + (_padding * (_p2RowCount + 1)) } else { 0 };

private _p3RowCount = count _adminData;
private _p3Height = if (_p3RowCount > 0) then { _titleHeight + (_btnHeight * _p3RowCount) + (_padding * (_p3RowCount + 1)) } else { 0 };

private _col1Height = _p1Height + (if (_p2Height > 0) then { _padding + _p2Height } else { 0 });
private _col2Height = _p3Height;

private _totalHeight = _col1Height max _col2Height;
private _totalWidth = if (_col2Height > 0) then { (_groupWidth * 2) + _padding } else { _groupWidth };

private _maximumPositionX = safeZoneX + safeZoneW - _totalWidth - (2 * pixelW);
private _maximumPositionY = safeZoneY + safeZoneH - _totalHeight - (2 * pixelH);

private _groupPositionX = (_screenPosition # 0) + 0.012;
private _groupPositionY = (_screenPosition # 1) + 0.012;

_groupPositionX = (_groupPositionX max (safeZoneX + (2 * pixelW))) min _maximumPositionX;
_groupPositionY = (_groupPositionY max (safeZoneY + (2 * pixelH))) min _maximumPositionY;

// -----------------------------------------------------------------------------
// HELPER: RENDER PANELS
// -----------------------------------------------------------------------------
private _fnc_renderPanel = {
    params ["_panelData", "_posX", "_posY", "_pHeight", "_titleText", "_grpVarName", "_titleColor"];
    
    private _menuGroup = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
    _menuGroup ctrlSetPosition [_posX, _posY, _groupWidth, _pHeight];
    _menuGroup ctrlCommit 0;
    _mapDisplay setVariable [_grpVarName, _menuGroup];

    private _bg = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup];
    _bg ctrlSetPosition [0, 0, _groupWidth, _pHeight];
    _bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
    _bg ctrlCommit 0;

    private _titleBg = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup];
    _titleBg ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
    _titleBg ctrlSetBackgroundColor _titleColor; 
    _titleBg ctrlCommit 0;

    private _titleControl = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup];
    _titleControl ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
    _titleControl ctrlSetStructuredText parseText format ["<t size='1' align='center' valign='middle'>%1</t>", _titleText];
    _titleControl ctrlCommit 0;

    private _currentY = _titleHeight + _padding;
    private _btnWidthFull = _groupWidth - (_padding * 2);

    {
        _x params ["_type", "_texts", "_actions", ["_extra", []]];
        
        if (_type == "SINGLE" || _type == "TOGGLE") then {
            private _btn = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup];
            _btn ctrlSetPosition [_padding, _currentY, _btnWidthFull, _btnHeight];
            _btn ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.85'>%1</t>", _texts];
            
            private _bgColor = if (_type == "TOGGLE" && !(_extra isEqualTo [])) then { _extra } else { [0, 0, 0, 0.4] };
            _btn ctrlSetBackgroundColor _bgColor;
            _btn ctrlCommit 0;
            
            _btn setVariable ["A3U_Target", _target];
            _btn setVariable ["A3U_Action", _actions];
            _btn setVariable ["A3U_btn_colNormal", _bgColor];
            _btn setVariable ["A3U_BtnType", _type];
            
            private _hoverColor = if (_type == "TOGGLE") then {
                [(_bgColor#0) + 0.15, (_bgColor#1) + 0.15, (_bgColor#2) + 0.15, 1]
            } else {
                [0.8, 0.8, 0.8, 0.2]
            };
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
            
            private _btnL = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup];
            _btnL ctrlSetPosition [_padding, _currentY, _halfWidth, _btnHeight];
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
            
            private _btnR = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup];
            _btnR ctrlSetPosition [_padding + _halfWidth + _padding, _currentY, _halfWidth, _btnHeight];
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
        _currentY = _currentY + _btnHeight + _padding;
    } forEach _panelData;
};

// -----------------------------------------------------------------------------
// RENDER COLUMN 1 (Player Info & Options)
// -----------------------------------------------------------------------------
private _profileBackgroundColor = [
    profileNamespace getVariable ["GUI_BCG_RGB_R", 0.376],
    profileNamespace getVariable ["GUI_BCG_RGB_G", 0.125],
    profileNamespace getVariable ["GUI_BCG_RGB_B", 0.043],
    1
];

private _menuGroup1 = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_menuGroup1 ctrlSetPosition [_groupPositionX, _groupPositionY, _groupWidth, _p1Height];
_menuGroup1 ctrlCommit 0;
_mapDisplay setVariable ["A3U_playerMenu_grp", _menuGroup1];

private _bg1 = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup1];
_bg1 ctrlSetPosition [0, 0, _groupWidth, _p1Height];
_bg1 ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg1 ctrlCommit 0;

private _titleBg1 = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup1];
_titleBg1 ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
_titleBg1 ctrlSetBackgroundColor _profileBackgroundColor; 
_titleBg1 ctrlCommit 0;

private _title1 = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup1];
_title1 ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
_title1 ctrlSetStructuredText parseText "<t size='1' align='center' valign='middle'>Player Info</t>";
_title1 ctrlCommit 0;

private _name = name _target;
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
    [format ["Name: %1", _name], _name],
    [format ["UID: %1", _uid], _uid],
    [format ["Funds: %1%2", _currencySymbol, _funds], _funds],
    [format ["Role: %1", _displayRole], _role],
    [format ["Rank: %1", _rank], _rank]
];

private _currentY1 = _titleHeight + _padding;
private _btnWidthFull = _groupWidth - (_padding * 2);

{
    _x params ["_displayStr", "_copyStr"];
    
    private _btn = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup1];
    _btn ctrlSetPosition [_padding, _currentY1, _btnWidthFull, _btnHeight];
    _btn ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.85'>%1</t>", _displayStr];
    _btn ctrlSetTooltip "Copy to clipboard";
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
        
        private _display = ctrlParent _btnControl;
        [_display] spawn {
            params ["_display"];
            private _toastGrp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
            _toastGrp ctrlSetPosition [safeZoneX + (safeZoneW / 2) - (0.075 * safeZoneW), safeZoneY + safeZoneH - 0.12 * safeZoneH, 0.15 * safeZoneW, 0.03 * safeZoneH];
            _toastGrp ctrlCommit 0;
            
            private _bg = _display ctrlCreate ["RscText", -1, _toastGrp];
            _bg ctrlSetPosition [0, 0, 0.15 * safeZoneW, 0.03 * safeZoneH];
            _bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
            _bg ctrlCommit 0;
            
            private _line = _display ctrlCreate ["RscText", -1, _toastGrp];
            _line ctrlSetPosition [0, 0, 0.15 * safeZoneW, 0.002 * safeZoneH];
            _line ctrlSetBackgroundColor [0.18, 0.50, 0.20, 1];
            _line ctrlCommit 0;
            
            private _txt = _display ctrlCreate ["RscStructuredText", -1, _toastGrp];
            _txt ctrlSetPosition [0, 0.002 * safeZoneH, 0.15 * safeZoneW, 0.028 * safeZoneH];
            _txt ctrlSetStructuredText parseText "<t align='center' valign='middle' size='0.9'>Copied to clipboard</t>";
            _txt ctrlCommit 0;
            
            sleep 1.5;
            if (isNull _toastGrp) exitWith {};
            _toastGrp ctrlSetFade 1; _toastGrp ctrlCommit 0.5;
            sleep 0.5;
            if (!isNull _toastGrp) then { ctrlDelete _toastGrp; };
        };
    }];
    _currentY1 = _currentY1 + _btnHeight + _padding;
} forEach _infoData;

if (_p2Height > 0) then {
    private _p2PosY = _groupPositionY + _p1Height + _padding;
    [_optionsData, _groupPositionX, _p2PosY, _p2Height, "Player Options", "A3U_playerMenu_grp2", _profileBackgroundColor] call _fnc_renderPanel;
};

// -----------------------------------------------------------------------------
// RENDER COLUMN 2 (Admin Settings)
// -----------------------------------------------------------------------------
if (_p3Height > 0) then {
    private _col2PosX = _groupPositionX + _groupWidth + _padding;
    [_adminData, _col2PosX, _groupPositionY, _p3Height, "Admin Settings", "A3U_playerMenu_grp3", [0.4, 0.1, 0.1, 1]] call _fnc_renderPanel;
};

// -----------------------------------------------------------------------------
// UNIFIED AUTO-CLOSE SYSTEM
// -----------------------------------------------------------------------------
private _ehID = _mapDisplay getVariable ["A3U_ContextMenu_EH", -1];
if (_ehID != -1) then { _mapControl ctrlRemoveEventHandler ["MouseButtonDown", _ehID]; };

private _panels = [];
if (!isNull (_mapDisplay getVariable ["A3U_playerMenu_grp", controlNull])) then { _panels pushBack (_mapDisplay getVariable "A3U_playerMenu_grp"); };
if (!isNull (_mapDisplay getVariable ["A3U_playerMenu_grp2", controlNull])) then { _panels pushBack (_mapDisplay getVariable "A3U_playerMenu_grp2"); };
if (!isNull (_mapDisplay getVariable ["A3U_playerMenu_grp3", controlNull])) then { _panels pushBack (_mapDisplay getVariable "A3U_playerMenu_grp3"); };

_mapDisplay setVariable ["A3U_OpenContextPanels", _panels];
_mapDisplay setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

_ehID = _mapControl ctrlAddEventHandler ["MouseButtonDown", {
    params ["_mapCtrl", "_button"];
    private _display = ctrlParent _mapCtrl;
    
    if (diag_tickTime - (_display getVariable ["A3U_ContextMenu_SpawnTime", 0]) < 0.1) exitWith {};

    private _panels = _display getVariable ["A3U_OpenContextPanels", []];
    _panels = _panels select { !isNull _x }; 
    
    if (count _panels == 0) exitWith {
        _mapCtrl ctrlRemoveEventHandler ["MouseButtonDown", _thisEventHandler];
        _display setVariable ["A3U_ContextMenu_EH", -1];
    };

    private _mousePos = getMousePosition;
    private _mouseX = _mousePos # 0;
    private _mouseY = _mousePos # 1;
    
    private _insideAny = false;
    {
        private _pos = ctrlPosition _x;
        if (_mouseX >= _pos#0 && _mouseX <= (_pos#0 + _pos#2) && _mouseY >= _pos#1 && _mouseY <= (_pos#1 + _pos#3)) then { 
            _insideAny = true; 
        };
    } forEach _panels;

    if (!_insideAny) then {
        { ctrlDelete _x } forEach _panels;
        _display setVariable ["A3U_OpenContextPanels", []];
        _mapCtrl ctrlRemoveEventHandler ["MouseButtonDown", _thisEventHandler];
        _display setVariable ["A3U_ContextMenu_EH", -1];
    };
}];
_mapDisplay setVariable ["A3U_ContextMenu_EH", _ehID];