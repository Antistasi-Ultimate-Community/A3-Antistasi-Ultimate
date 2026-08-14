#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_buildPanel

Description:
    Master UI Engine. Generates a standardized, dynamically scaling context 
    popup panel based on an array of requested UI elements. 

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

private _xPos = safeZoneX + (safeZoneW / 2) - (_w / 2);
private _yPos = safeZoneY + (safeZoneH / 2) - (_totalH / 2);

private _grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_grp ctrlSetPosition [_xPos, _yPos, _w, _totalH];
_grp ctrlCommit 0;

_display setVariable ["A3U_OpenContextPanels", (_display getVariable ["A3U_OpenContextPanels", []]) + [_grp]];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _grp];
_bg ctrlSetPosition [0, 0, _w, _totalH];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", -1, _grp];
_title ctrlSetPosition [0, 0, _w, _titleH];
_title ctrlSetBackgroundColor _titleColor;
_title ctrlSetStructuredText parseText format ["<t align='center' size='0.9' valign='middle'>%1</t>", _titleStr];
_title ctrlCommit 0;

private _closeBtn = _display ctrlCreate ["RscStructuredText", -1, _grp];
_closeBtn ctrlSetPosition [_w - (0.015 * safeZoneW), 0.003 * safeZoneH, 0.012 * safeZoneW, 0.02 * safeZoneH];
_closeBtn ctrlSetStructuredText parseText "<t align='center' size='0.8'>X</t>";
_closeBtn ctrlSetBackgroundColor [0.8, 0.1, 0.1, 1];
_closeBtn ctrlCommit 0;
_closeBtn setVariable ["A3U_Grp", _grp];
_closeBtn ctrlAddEventHandler ["MouseButtonDown", { ctrlDelete ((_this#0) getVariable "A3U_Grp"); }];

private _cY = _titleH + _padY;

{
    _x params ["_type", "_arg1", "_arg2", "_arg3", ["_extra", []]];
    
    switch (_type) do {
        case "EDIT": {
            // If label is empty, make input full width
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
                _x params ["_dispStr", "_dataStr"];
                private _idx = _combo lbAdd _dispStr;
                _combo lbSetData [_idx, _dataStr];
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