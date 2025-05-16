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
#define ACTION_KEY(ACTION) (actionKeysNames[QEGVAR(core,ACTION), 1, "Keyboard"])
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("onLoad"):
    {
        _params params[["_display", displayNull, [displayNull]]];

        private _altText = (_display displayCtrl IDC_PLACERHINT_ALT_TEXT);
        private _eText = (_display displayCtrl IDC_PLACERHINT_E_TEXT);
        private _rText = (_display displayCtrl IDC_PLACERHINT_R_TEXT);
        private _shiftText = (_display displayCtrl IDC_PLACERHINT_SHIFT_TEXT);
        private _spaceText = (_display displayCtrl IDC_PLACERHINT_SPACE_TEXT);
        _altText ctrlSetText format ["%1 %2", ACTION_KEY(buildingPlacerSnapToSurface), localize "str_3den_display3den_entitymenu_movesurface_text"];
        _eText ctrlSetText format["%1: Rotate counter-clockwise", ACTION_KEY(buildingPlacerRotateCCW)];
        _rText ctrlSetText format["%1: Rotate clockwise", ACTION_KEY(buildingPlacerRotateCW)];
        _shiftText ctrlSetText format["%1: Unsafe placement mode", ACTION_KEY(buildingPlacerUnsafeMode)];
        _spaceText ctrlSetText format["%1: Place object", ACTION_KEY(buildingPlacerPlace)];

        uiNamespace setVariable ["A3A_placerHint_display", _display];
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
            _textCtrl ctrlSetText format ["%1: Cancel %2", ACTION_KEY(buildingPlacerDelete), _keyData];
        };
        if (_keyType == "rebuild") exitWith {
            (_display displayCtrl IDC_PLACERHINT_T) ctrlShow true;
            _textCtrl ctrlSetText format ["%1: Rebuild for %2 %3", ACTION_KEY(buildingPlacerRepair), _keyData, A3A_faction_civ get "currencySymbol"];
        };
        _textCtrl ctrlSetText "";
    };
    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("setupplacerhints mode does not exist: %1", _mode);
    };
};