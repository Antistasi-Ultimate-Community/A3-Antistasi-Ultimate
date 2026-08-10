#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_playerContextMenu

Description:
    Generates a custom, dynamic context menu on the map display when a player 
    is clicked. Displays the selected player's name, UID, funds, role, 
    and rank. Clicking any of the buttons will copy that specific data to the 
    user's clipboard and close the menu.

Parameters:
    0: _target - The target player object that was clicked on the map <OBJECT>
    1: _screenPosition - Screen coordinates to anchor the menu <ARRAY> (default: [])

Example:
    (begin example)
    [cursorTarget, getMousePosition] call A3U_fnc_playerContextMenu;
    (end example)

Returns:
    Nothing <NONE>

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
// CLEANUP PREVIOUS MENU
// -----------------------------------------------------------------------------
private _existingMenuGroup = _mapDisplay getVariable ["A3U_playerMenu_grp", controlNull];
if (!isNull _existingMenuGroup) then {
    ctrlDelete _existingMenuGroup;
    _mapDisplay setVariable ["A3U_playerMenu_grp", controlNull];
};

// -----------------------------------------------------------------------------
// POSITION RESOLUTION & ON-SCREEN BOUNDARIES
// -----------------------------------------------------------------------------
if (_screenPosition isEqualTo []) then { _screenPosition = getMousePosition; };

private _groupWidth = 0.16 * safeZoneW;
private _titleHeight = 0.026 * safeZoneH;
private _btnHeight = 0.022 * safeZoneH;
private _padding = 0.003 * safeZoneH;
private _groupHeight = _titleHeight + (_btnHeight * 5) + (_padding * 6); 

private _groupPositionX = (_screenPosition # 0) + 0.012;
private _groupPositionY = (_screenPosition # 1) + 0.012;

private _maximumPositionX = safeZoneX + safeZoneW - _groupWidth - (2 * pixelW);
private _maximumPositionY = safeZoneY + safeZoneH - _groupHeight - (2 * pixelH);

_groupPositionX = (_groupPositionX max (safeZoneX + (2 * pixelW))) min _maximumPositionX;
_groupPositionY = (_groupPositionY max (safeZoneY + (2 * pixelH))) min _maximumPositionY;

// -----------------------------------------------------------------------------
// CREATE CONTROLS GROUP
// -----------------------------------------------------------------------------
private _menuGroup = _mapDisplay ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_menuGroup ctrlSetPosition [_groupPositionX, _groupPositionY, _groupWidth, _groupHeight];
_menuGroup ctrlCommit 0;

_mapDisplay setVariable ["A3U_playerMenu_grp", _menuGroup];

private _bg = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup];
_bg ctrlSetPosition [0, 0, _groupWidth, _groupHeight];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

// -----------------------------------------------------------------------------
// DYNAMIC HEADER COLOR (Matches native marker menus)
// -----------------------------------------------------------------------------
private _profileBackgroundColor = [
    profileNamespace getVariable ["GUI_BCG_RGB_R", 0.376],
    profileNamespace getVariable ["GUI_BCG_RGB_G", 0.125],
    profileNamespace getVariable ["GUI_BCG_RGB_B", 0.043],
    1
];

private _titleBg = _mapDisplay ctrlCreate ["RscText", -1, _menuGroup];
_titleBg ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
_titleBg ctrlSetBackgroundColor _profileBackgroundColor; 
_titleBg ctrlCommit 0;

private _title = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup];
_title ctrlSetPosition [0, 0, _groupWidth, _titleHeight];
_title ctrlSetStructuredText parseText "<t size='1' align='center' valign='middle'>Player Info</t>";
_title ctrlCommit 0;

// -----------------------------------------------------------------------------
// DATA PREPARATION
// -----------------------------------------------------------------------------
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

private _buttonsData = [
    [format ["Name: %1", _name], _name],
    [format ["UID: %1", _uid], _uid],
    [format ["Funds: %1%2", _currencySymbol, _funds], _funds],
    [format ["Role: %1", _displayRole], _role],
    [format ["Rank: %1", _rank], _rank]
];

// -----------------------------------------------------------------------------
// BUTTON GENERATION
// -----------------------------------------------------------------------------
private _currentY = _titleHeight + _padding;
private _btnWidth = _groupWidth - (_padding * 2);

{
    _x params ["_displayStr", "_copyStr"];
    
    private _btn = _mapDisplay ctrlCreate ["RscStructuredText", -1, _menuGroup];
    _btn ctrlSetPosition [_padding, _currentY, _btnWidth, _btnHeight];
    
    private _centeredText = format ["<t align='center' valign='middle' size='0.85'>%1</t>", _displayStr];
    _btn ctrlSetStructuredText parseText _centeredText;
    
    _btn ctrlSetTooltip "Copy to clipboard";
    _btn ctrlSetBackgroundColor [0, 0, 0, 0.4];
    _btn ctrlCommit 0;
    
    _btn setVariable ["A3U_btn_colNormal", [0, 0, 0, 0.4]];
    _btn setVariable ["A3U_btn_colHover", [0.8, 0.8, 0.8, 0.2]]; 
    _btn setVariable ["A3U_CopyData", _copyStr];
    
    _btn ctrlAddEventHandler ["MouseEnter", { 
        params ["_ctrl"]; 
        _ctrl ctrlSetBackgroundColor (_ctrl getVariable ["A3U_btn_colHover", [0,0,0,1]]); 
    }];
    _btn ctrlAddEventHandler ["MouseExit", { 
        params ["_ctrl"]; 
        _ctrl ctrlSetBackgroundColor (_ctrl getVariable ["A3U_btn_colNormal", [0,0,0,1]]); 
    }];
    
    _btn ctrlAddEventHandler ["MouseButtonDown", {
        params ["_btnControl", "_button"];
        
        if (_button != 0) exitWith {}; 
        
        private _data = _btnControl getVariable ["A3U_CopyData", ""];
        copyToClipboard _data;
        
        private _display = ctrlParent _btnControl;
        
        // ---------------------------------------------------------------------
        // FADING TOAST NOTIFICATION
        // ---------------------------------------------------------------------
        [_display] spawn {
            params ["_display"];
            
            private _toastW = 0.15 * safeZoneW;
            private _toastH = 0.03 * safeZoneH;
            private _toastX = safeZoneX + (safeZoneW / 2) - (_toastW / 2);
            private _toastY = safeZoneY + safeZoneH - 0.12 * safeZoneH;
            
            private _toastGrp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
            _toastGrp ctrlSetPosition [_toastX, _toastY, _toastW, _toastH];
            _toastGrp ctrlCommit 0;
            
            private _toastBg = _display ctrlCreate ["RscText", -1, _toastGrp];
            _toastBg ctrlSetPosition [0, 0, _toastW, _toastH];
            _toastBg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
            _toastBg ctrlCommit 0;
            
            private _toastLine = _display ctrlCreate ["RscText", -1, _toastGrp];
            _toastLine ctrlSetPosition [0, 0, _toastW, 0.002 * safeZoneH];
            _toastLine ctrlSetBackgroundColor [0.18, 0.50, 0.20, 1];
            _toastLine ctrlCommit 0;
            
            private _toastText = _display ctrlCreate ["RscStructuredText", -1, _toastGrp];
            _toastText ctrlSetPosition [0, 0.002 * safeZoneH, _toastW, _toastH - (0.002 * safeZoneH)];
            _toastText ctrlSetStructuredText parseText "<t align='center' valign='middle' size='0.9'>Copied to clipboard</t>";
            _toastText ctrlCommit 0;
            
            sleep 1.5;
            if (isNull _toastGrp) exitWith {};
            
            _toastGrp ctrlSetFade 1;
            _toastGrp ctrlCommit 0.5;
            
            sleep 0.5;
            if (!isNull _toastGrp) then { ctrlDelete _toastGrp; };
        };
        // ---------------------------------------------------------------------
        
        private _grp = _display getVariable ["A3U_playerMenu_grp", controlNull];
        if (!isNull _grp) then { ctrlDelete _grp; };
        _display setVariable ["A3U_playerMenu_grp", controlNull];
    }];
    
    _currentY = _currentY + _btnHeight + _padding;
    
} forEach _buttonsData;