/*
Author: [Killerswin2]
    creates the controls for the dialog. Picture and Button are created. Data Saved to buttons. 
Arguments:
1. <string> string for initilizer
Return Value:
NONE
Scope: Client
Environment: scheduled
Public: 
no
Example:
["onLoad"] spawn A3A_fnc_teamLeaderRTSPlacerDialog
*/


#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#define BOTTOM safeZoneH + safeZoneY
FIX_LINE_NUMBERS()


params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("onLoad"):
    {
        _params params ["_displayOrControl", ["_config", configNull]];

        private _altText = (_displayOrControl displayCtrl IDC_PLACERHINT_ALT_TEXT);
        private _eText = (_displayOrControl displayCtrl IDC_PLACERHINT_E_TEXT);
        private _rText = (_displayOrControl displayCtrl IDC_PLACERHINT_R_TEXT);
        private _shiftText = (_displayOrControl displayCtrl IDC_PLACERHINT_SHIFT_TEXT);
        private _spaceText = (_displayOrControl displayCtrl IDC_PLACERHINT_SPACE_TEXT);
        _altText ctrlSetText format ["%1 %2", "Alt: ", localize "str_3den_display3den_entitymenu_movesurface_text"];
        _eText ctrlSetText "E: Rotate counter-clockwise";
        _rText ctrlSetText "R: Rotate clockwise ";
        _shiftText ctrlSetText "SHIFT: Unsafe placement mode";
        _spaceText ctrlSetText "SPACE: Place object";
        uiNamespace setVariable ["A3A_placerHint_display", _displayOrControl];
    };
    case ("setContextKey"):
    {
        private _display = uiNamespace getVariable "A3A_placerHint_display";
        if (isNil "_display") exitWith {};          // maybe possible with timings?

        _params params ["_keyType", "_keyData"];

        (_display displayCtrl IDC_PLACERHINT_C) ctrlShow false;
        (_display displayCtrl IDC_PLACERHINT_T) ctrlShow false;
        private _textCtrl = (_display displayCtrl IDC_PLACERHINT_C_TEXT);

        if (_keyType == "cancel") exitWith {
            (_display displayCtrl IDC_PLACERHINT_C) ctrlShow true;
            _textCtrl ctrlSetText format ["C: Cancel %1", _keyData];
        };
        if (_keyType == "rebuild") exitWith {
            (_display displayCtrl IDC_PLACERHINT_T) ctrlShow true;
            _textCtrl ctrlSetText format ["T: Rebuild for %1 %2", _keyData, A3A_faction_civ get "currencySymbol"];
        };
        _textCtrl ctrlSetText "";
    };
    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("setupplacerhints mode does not exist: %1", _mode);
    };
};