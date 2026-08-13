#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_fundsToPlayer

Description:
    Generates a context menu popup allowing an admin or commander to transfer 
    a specified amount of funds from the faction's central pool directly to 
    the selected player.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The player object to receive the faction funds <OBJECT>

Example:
    (begin example)
    [_display, _target] spawn A3U_fnc_context_fundsToPlayer;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target"];
            
private _inputW = 0.16 * safeZoneW;
private _inputH = 0.08 * safeZoneH;
private _inputX = safeZoneX + (safeZoneW / 2) - (_inputW / 2);
private _inputY = safeZoneY + (safeZoneH / 2) - (_inputH / 2);

private _inputGrp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_inputGrp ctrlSetPosition [_inputX, _inputY, _inputW, _inputH];
_inputGrp ctrlCommit 0;

// NOTE: Fixed a minor bug here where it was trying to push `_grp` instead of `_inputGrp`!
_display setVariable ["A3U_OpenContextPanels", (_display getVariable ["A3U_OpenContextPanels", []]) + [_inputGrp]];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _inputGrp];
_bg ctrlSetPosition [0, 0, _inputW, _inputH];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", -1, _inputGrp];
_title ctrlSetPosition [0, 0, _inputW, 0.026 * safeZoneH];
_title ctrlSetBackgroundColor [0.18, 0.50, 0.20, 1];
_title ctrlSetStructuredText parseText "<t align='center' size='0.9' valign='middle'>Amount to Transfer</t>";
_title ctrlCommit 0;

private _edit = _display ctrlCreate ["RscEdit", -1, _inputGrp];
_edit ctrlSetPosition [0.005 * safeZoneW, 0.032 * safeZoneH, _inputW - (0.01 * safeZoneW), 0.02 * safeZoneH];
_edit ctrlSetText "0";
_edit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_edit ctrlCommit 0;

private _confirm = _display ctrlCreate ["RscStructuredText", -1, _inputGrp];
_confirm ctrlSetPosition [0.005 * safeZoneW, 0.055 * safeZoneH, _inputW - (0.01 * safeZoneW), 0.02 * safeZoneH];
_confirm ctrlSetStructuredText parseText "<t align='center' size='0.85'>Confirm</t>";
_confirm ctrlSetBackgroundColor [0, 0, 0, 0.4];
_confirm ctrlCommit 0;

_confirm setVariable ["A3U_InputCtrl", _edit];
_confirm setVariable ["A3U_Target", _target];
_confirm setVariable ["A3U_Grp", _inputGrp];

_confirm ctrlAddEventHandler ["MouseEnter", { (_this#0) ctrlSetBackgroundColor [0.8, 0.8, 0.8, 0.2]; }];
_confirm ctrlAddEventHandler ["MouseExit", { (_this#0) ctrlSetBackgroundColor [0, 0, 0, 0.4]; }];

_confirm ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];
    if (_button != 0) exitWith {};
    
    private _target = _ctrl getVariable "A3U_Target";
    private _edit = _ctrl getVariable "A3U_InputCtrl";
    private _grp = _ctrl getVariable "A3U_Grp";
    
    private _amount = floor (parseNumber (ctrlText _edit));
    
    if (_amount > 0) then {
        private _factionFunds = server getVariable ["resourcesFIA", 0];
        if (_factionFunds isEqualType []) then { _factionFunds = _factionFunds # 1; };
        
        if (_amount <= _factionFunds) then {
            [0, -_amount] remoteExec ["A3A_fnc_resourcesFIA", 2];
            [_amount, _target, true] call A3A_fnc_addMoneyPlayer;
            systemChat format ["Transferred $%1 to %2.", _amount, name _target];
        } else {
            systemChat "Error: Faction does not have enough funds.";
        };
    } else {
        systemChat "Error: Amount must be a positive number.";
    };
    
    ctrlDelete _grp;
}];