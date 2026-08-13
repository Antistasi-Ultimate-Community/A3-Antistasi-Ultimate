#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_setPlayerTraits

Description:
    Generates a context menu popup allowing an admin to dynamically grant 
    or revoke specific unit traits (such as Medic, Explosives Specialist, 
    UAV Hacker, and Engineer) for the selected player.

Parameters:
    0: _display - The parent display to attach the controls group to <DISPLAY>
    1: _target - The player object whose traits will be modified <OBJECT>

Example:
    (begin example)
    [_display, _target] spawn A3U_fnc_context_setPlayerTraits;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params ["_display", "_target"];
private _tW = 0.16 * safeZoneW;
private _tH = 0.15 * safeZoneH;
private _tX = safeZoneX + (safeZoneW / 2) - (_tW / 2);
private _tY = safeZoneY + (safeZoneH / 2) - (_tH / 2);

private _tGrp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_tGrp ctrlSetPosition [_tX, _tY, _tW, _tH];
_tGrp ctrlCommit 0;

// Register this popup to the Unified Auto-Close listener
_display setVariable ["A3U_OpenContextPanels", (_display getVariable ["A3U_OpenContextPanels", []]) + [_tGrp]];
_display setVariable ["A3U_ContextMenu_SpawnTime", diag_tickTime];

private _bg = _display ctrlCreate ["RscText", -1, _tGrp];
_bg ctrlSetPosition [0, 0, _tW, _tH];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

private _title = _display ctrlCreate ["RscStructuredText", -1, _tGrp];
_title ctrlSetPosition [0, 0, _tW, 0.026 * safeZoneH];
_title ctrlSetBackgroundColor [0.18, 0.50, 0.20, 1];
_title ctrlSetStructuredText parseText "<t align='center' size='0.9' valign='middle'>Manage Traits</t>";
_title ctrlCommit 0;

private _closeBtn = _display ctrlCreate ["RscStructuredText", -1, _tGrp];
_closeBtn ctrlSetPosition [_tW - (0.015 * safeZoneW), 0.003 * safeZoneH, 0.012 * safeZoneW, 0.02 * safeZoneH];
_closeBtn ctrlSetStructuredText parseText "<t align='center' size='0.8'>X</t>";
_closeBtn ctrlSetBackgroundColor [0.6, 0.1, 0.1, 1];
_closeBtn ctrlCommit 0;
_closeBtn setVariable ["A3U_Grp", _tGrp];
_closeBtn ctrlAddEventHandler ["MouseButtonDown", { ctrlDelete ((_this#0) getVariable "A3U_Grp"); }];

private _traits = [
    ["Medic", "medic"],
    ["Explosives Spec.", "explosiveSpecialist"],
    ["UAV Hacker", "UAVHacker"],
    ["Engineer", "engineer"]
];

private _cY = 0.03 * safeZoneH;
{
    _x params ["_label", "_traitKey"];
    
    private _hasTrait = false;
    if (_traitKey == "engineer" && {missionNamespace getVariable ["ace_repair_enabled", false]}) then {
        _hasTrait = _target getVariable ["ace_isEngineer", false];
    } else {
        _hasTrait = _target getUnitTrait _traitKey;
    };
    
    private _btn = _display ctrlCreate ["RscStructuredText", -1, _tGrp];
    _btn ctrlSetPosition [0.005 * safeZoneW, _cY, _tW - (0.01 * safeZoneW), 0.022 * safeZoneH];
    _btn ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", _label];
    _btn ctrlSetBackgroundColor (if (_hasTrait) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] });
    _btn ctrlCommit 0;
    
    _btn setVariable ["A3U_Target", _target];
    _btn setVariable ["A3U_TraitKey", _traitKey];
    _btn setVariable ["A3U_HasTrait", _hasTrait];
    
    _btn ctrlAddEventHandler ["MouseButtonDown", {
        params ["_ctrl", "_button"];
        if (_button != 0) exitWith {};
        
        private _t = _ctrl getVariable "A3U_Target";
        private _key = _ctrl getVariable "A3U_TraitKey";
        private _currentStatus = _ctrl getVariable "A3U_HasTrait";
        private _newStatus = !_currentStatus;
        
        if (_key == "engineer" && {missionNamespace getVariable ["ace_repair_enabled", false]}) then {
            _t setVariable ["ace_isEngineer", _newStatus, true];
        } else {
            _t setUnitTrait [_key, _newStatus, true];
        };
        
        _ctrl setVariable ["A3U_HasTrait", _newStatus];
        _ctrl ctrlSetBackgroundColor (if (_newStatus) then { [0.18, 0.50, 0.20, 1] } else { [0.6, 0.1, 0.1, 1] });
        systemChat format ["%1 trait '%2' set to %3", name _t, _key, _newStatus];
    }];
    _cY = _cY + 0.025 * safeZoneH;
} forEach _traits;