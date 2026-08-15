#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_buildPanel

Description:
    Master UI Engine. Generates a standardized, dynamically scaling context 
    popup panel based on an array of requested UI elements. Includes drag-and-drop 
    functionality on the title bar with persistent position memory via profileNamespace,
    and automatic cleanup of previous popups.

Parameters:
    0: _display - The parent map display <DISPLAY>
    1: _target - The target player object <OBJECT>
    2: _titleStr - Text for the header <STRING>
    3: _titleColor - Background color for the header <ARRAY>
    4: _elements - Array defining the rows to build <ARRAY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target", "_titleStr", "_titleColor", "_elements"];

private _w = 0.18 * safeZoneW;
private _titleH = 0.026 * safeZoneH;
private _rowH = 0.022 * safeZoneH; 
private _padY = 0.005 * safeZoneH;

// Dynamically calculate total height needed based on the number of elements
private _totalH = _titleH + _padY;
{ _totalH = _totalH + _rowH + _padY; } forEach _elements;
_totalH = _totalH + _padY;

// -----------------------------------------------------------------------------
// LOAD SAVED POSITION OR DEFAULT TO CENTER
// -----------------------------------------------------------------------------
private _savedPos = profileNamespace getVariable ["A3U_ContextPopup_Pos", []];
private _xPos = safeZoneX + (safeZoneW / 2) - (_w / 2);
private _yPos = safeZoneY + (safeZoneH / 2) - (_totalH / 2);

if !(_savedPos isEqualTo []) then {
    _xPos = _savedPos # 0;
    _yPos = _savedPos # 1;
    
    // Clamp to screen bounds in case they changed resolution
    _xPos = (_xPos max safeZoneX) min (safeZoneX + safeZoneW - _w);
    _yPos = (_yPos max safeZoneY) min (safeZoneY + safeZoneH - _totalH);
};

// -----------------------------------------------------------------------------
// CLEANUP & BUILD BASE PANEL
// -----------------------------------------------------------------------------
// Auto-close any previously opened popup from this engine
private _existingPopup = _display getVariable ["A3U_ActiveContextPopup", controlNull];
if (!isNull _existingPopup) then { ctrlDelete _existingPopup; };

private _grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_grp ctrlSetPosition [_xPos, _yPos, _w, _totalH];
_grp ctrlCommit 0;

// Register this as the currently active popup
_display setVariable ["A3U_ActiveContextPopup", _grp];

// Append to the global tracker for the map-click auto-close listener
private _panels = _display getVariable ["A3U_OpenContextPanels", []];
_panels = _panels select { !isNull _x }; // Clean dead references
_panels pushBack _grp;
_display setVariable ["A3U_OpenContextPanels", _panels];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _grp];
_bg ctrlSetPosition [0, 0, _w, _totalH];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

// -----------------------------------------------------------------------------
// TITLE BAR (DRAGGABLE) & CLOSE BUTTON
// -----------------------------------------------------------------------------
private _title = _display ctrlCreate ["RscStructuredText", -1, _grp];
_title ctrlSetPosition [0, 0, _w, _titleH];
_title ctrlSetBackgroundColor _titleColor;
_title ctrlSetStructuredText parseText format ["<t align='center' size='0.9' valign='middle'>%1</t>", _titleStr];
_title ctrlSetTooltip "Drag to move";
_title ctrlCommit 0;

private _closeBtn = _display ctrlCreate ["RscStructuredText", -1, _grp];
_closeBtn ctrlSetPosition [_w - (0.015 * safeZoneW), 0.003 * safeZoneH, 0.012 * safeZoneW, 0.02 * safeZoneH];
_closeBtn ctrlSetStructuredText parseText "<t align='center' size='0.8'>X</t>";
_closeBtn ctrlSetBackgroundColor [0.8, 0.1, 0.1, 1];
_closeBtn ctrlCommit 0;

_closeBtn setVariable ["A3U_Grp", _grp];
_closeBtn ctrlAddEventHandler ["MouseButtonDown", { ctrlDelete ((_this#0) getVariable "A3U_Grp"); }];

_title setVariable ["A3U_Grp", _grp];
_title setVariable ["A3U_CloseBtn", _closeBtn];

_title ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {}; // Only left clicks drag
    
    // FIX Z-ORDER ISSUE: Instantly push the close button back to the absolute front!
    private _closeBtn = _ctrl getVariable "A3U_CloseBtn";
    _closeBtn ctrlCommit 0;
    
    private _grp = _ctrl getVariable "A3U_Grp";
    private _grpPos = ctrlPosition _grp;
    
    // Use absolute screen coordinates for the initial offset calculation
    private _startMouse = getMousePosition;
    private _offsetX = (_startMouse # 0) - (_grpPos # 0);
    private _offsetY = (_startMouse # 1) - (_grpPos # 1);
    
    uiNamespace setVariable ["A3U_ContextPopup_Dragging", true];
    
    [_grp, _offsetX, _offsetY] spawn {
        params ["_grp", "_offsetX", "_offsetY"];
        disableSerialization;
        
        while {uiNamespace getVariable ["A3U_ContextPopup_Dragging", false] && !isNull _grp} do {
            private _mousePos = getMousePosition;
            private _newX = (_mousePos # 0) - _offsetX;
            private _newY = (_mousePos # 1) - _offsetY;
            
            private _w = (ctrlPosition _grp) # 2;
            private _h = (ctrlPosition _grp) # 3;
            
            // Constrain to screen so they can't throw it off the monitor
            _newX = (_newX max safeZoneX) min (safeZoneX + safeZoneW - _w);
            _newY = (_newY max safeZoneY) min (safeZoneY + safeZoneH - _h);
            
            _grp ctrlSetPosition [_newX, _newY, _w, _h];
            _grp ctrlCommit 0;
            sleep 0.01; // Smooth UI framerate
        };
        
        // When dragging stops, save the position
        if (!isNull _grp) then {
            private _finalPos = ctrlPosition _grp;
            profileNamespace setVariable ["A3U_ContextPopup_Pos", [_finalPos # 0, _finalPos # 1]];
            saveProfileNamespace;
        };
    };
}];

_title ctrlAddEventHandler ["MouseButtonUp", {
    params ["_ctrl", "_button"];
    if (_button == 0) then {
        uiNamespace setVariable ["A3U_ContextPopup_Dragging", false];
    };
}];

// Fallback: Global map listener in case they whip their mouse off the panel too fast
if (_display getVariable ["A3U_DragEH_Added", -1] == -1) then {
    private _eh = _display displayAddEventHandler ["MouseButtonUp", {
        params ["_display", "_button"];
        if (_button == 0) then {
            uiNamespace setVariable ["A3U_ContextPopup_Dragging", false];
        };
    }];
    _display setVariable ["A3U_DragEH_Added", _eh];
};

// -----------------------------------------------------------------------------
// POPULATE ROWS
// -----------------------------------------------------------------------------
private _cY = _titleH + _padY;

{
    _x params ["_type", "_arg1", "_arg2", "_arg3", ["_extra", []]];
    
    switch (_type) do {
        case "EDIT": {
            if (_arg1 != "") then {
                private _lbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
                _lbl ctrlSetPosition [0.005 * safeZoneW, _cY, 0.06 * safeZoneW, _rowH];
                _lbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", _arg1];
                _lbl ctrlCommit 0;

                private _edit = _display ctrlCreate ["RscEdit", -1, _grp];
                _edit ctrlSetPosition [0.065 * safeZoneW, _cY, _w - (0.07 * safeZoneW), _rowH];
                _edit ctrlSetText _arg2;
                _edit ctrlSetBackgroundColor [0, 0, 0, 0.5];
                _edit ctrlCommit 0;
                _grp setVariable [_arg3, _edit];
            } else {
                private _edit = _display ctrlCreate ["RscEdit", -1, _grp];
                _edit ctrlSetPosition [0.005 * safeZoneW, _cY, _w - (0.01 * safeZoneW), _rowH];
                _edit ctrlSetText _arg2;
                _edit ctrlSetBackgroundColor [0, 0, 0, 0.5];
                _edit ctrlCommit 0;
                _grp setVariable [_arg3, _edit];
            };
        };
        
        case "COMBO": {
            private _lbl = _display ctrlCreate ["RscStructuredText", -1, _grp];
            _lbl ctrlSetPosition [0.005 * safeZoneW, _cY, 0.06 * safeZoneW, _rowH];
            _lbl ctrlSetStructuredText parseText format ["<t size='0.8' valign='middle'>%1</t>", _arg1];
            _lbl ctrlCommit 0;

            private _combo = _display ctrlCreate ["RscCombo", -1, _grp];
            _combo ctrlSetPosition [0.065 * safeZoneW, _cY, _w - (0.07 * safeZoneW), _rowH];
            _combo ctrlCommit 0;

            {
                // Accept optional 3rd param for coloring the dropdown text
                _x params ["_dispStr", "_dataStr", ["_itemColor", []]];
                private _idx = _combo lbAdd _dispStr;
                _combo lbSetData [_idx, _dataStr];
                
                // If a color was passed, tint the text of this specific row
                if !(_itemColor isEqualTo []) then {
                    _combo lbSetColor [_idx, _itemColor];
                };
            } forEach _arg2;
            _combo lbSetCurSel 0;

            _grp setVariable [_arg3, _combo];
        };
        
        case "TOGGLE": {
            private _btn = _display ctrlCreate ["RscStructuredText", -1, _grp];
            _btn ctrlSetPosition [0.005 * safeZoneW, _cY, _w - (0.01 * safeZoneW), _rowH];
            _btn ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", _arg1];
            
            private _col = if (_arg2) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
            _btn ctrlSetBackgroundColor _col;
            _btn ctrlCommit 0;

            _btn setVariable ["A3U_Target", _target];
            _btn setVariable ["A3U_State", _arg2];
            _btn setVariable ["A3U_Code", _arg3];
            _btn setVariable ["A3U_Extra", _extra];
            
            _btn ctrlAddEventHandler ["MouseButtonDown", {
                params ["_ctrl", "_btnID"];
                if (_btnID != 0) exitWith {};
                
                private _t = _ctrl getVariable "A3U_Target";
                private _state = _ctrl getVariable "A3U_State";
                private _newState = !_state;
                private _extraData = _ctrl getVariable "A3U_Extra";
                
                _ctrl setVariable ["A3U_State", _newState];
                private _col = if (_newState) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] };
                _ctrl ctrlSetBackgroundColor _col;
                
                private _code = _ctrl getVariable "A3U_Code";
                [_t, _newState, _ctrl, _extraData] call _code;
            }];
        };
        
        case "BUTTON": {
            private _btn = _display ctrlCreate ["RscStructuredText", -1, _grp];
            _btn ctrlSetPosition [0.005 * safeZoneW, _cY, _w - (0.01 * safeZoneW), _rowH];
            _btn ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", _arg1];
            _btn ctrlSetBackgroundColor _arg2;
            _btn ctrlCommit 0;

            _btn setVariable ["A3U_BaseCol", _arg2];
            _btn setVariable ["A3U_HoverCol", [(_arg2#0)+0.2, (_arg2#1)+0.2, (_arg2#2)+0.2, (_arg2#3)]];
            _btn setVariable ["A3U_Target", _target];
            _btn setVariable ["A3U_Grp", _grp];
            _btn setVariable ["A3U_Code", _arg3];
            _btn setVariable ["A3U_Extra", _extra];

            _btn ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable "A3U_HoverCol"); }];
            _btn ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor ((_this#0) getVariable "A3U_BaseCol"); }];
            _btn ctrlAddEventHandler ["MouseButtonDown", {
                params ["_ctrl", "_btnID"];
                if (_btnID != 0) exitWith {};
                private _code = _ctrl getVariable "A3U_Code";
                private _extraData = _ctrl getVariable "A3U_Extra";
                [_ctrl, _extraData] call _code;
            }];
        };
    };
    
    _cY = _cY + _rowH + _padY;
} forEach _elements;