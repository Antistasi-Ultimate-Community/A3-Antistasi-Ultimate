#include "..\..\script_component.hpp"
#include "..\..\dialogues\ids.inc"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_onExtendersWarningDialogLoad

Description:
    onLoad handler for extender warning dialog

Parameters:
    0: _display - The extender warning dialog <DISPLAY>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(onExtendersWarningDialogLoad),_this);

if !assert(params[
    ["_dialog", nil, [displayNull]]
]) exitWith {};
if !assert(!isNull _dialog) exitWith {};

uiNamespace setVariable[QGVAR(extendersWarningDialog), _dialog];

_dialog setVariable[QGVAR(onCheckClicked), {
    Trace_1(QFUNCMAIN(onExtendersWarningDialogLoad_CheckConfirmChanged),_this);
    params["_control"];
    private _button = uiNamespace getVariable QGVAR(extendersWarningDialog)
        displayCtrl IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_BTNCONTINUE;
    _button ctrlEnable cbChecked _control;
}];

// Clicking labels should activate their checkboxes
_dialog displayCtrl IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_LABELCONFIRM ctrlAddEventHandler["MouseButtonClick", {
    Trace_1(QFUNCMAIN(onExtendersWarningDialogLoad_LabelConfirmClick),_this);
    private _check = uiNamespace getVariable QGVAR(extendersWarningDialog)
        displayCtrl IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_CHECKCONFIRM;
    _check cbSetChecked !(cbChecked _check);
    [_check] call (uiNamespace getVariable QGVAR(extendersWarningDialog) getVariable QGVAR(onCheckClicked));
}];

// Confirmation checkbox
_dialog displayCtrl IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_CHECKCONFIRM ctrlAddEventHandler["CheckedChanged", {
    call (uiNamespace getVariable QGVAR(extendersWarningDialog) getVariable QGVAR(onCheckClicked));
}];

// Confirm button
private _button = uiNamespace getVariable QGVAR(extendersWarningDialog)
    displayCtrl IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_BTNCONTINUE;

_button ctrlEnable false;
_button ctrlAddEventHandler["ButtonClick", {
    Trace_1(QFUNCMAIN(onExtendersWarningDialogLoad_BtnContinueClick),_this);
    GVAR(extendersWarningDismissed) = true;
    while { dialog } do { closeDialog 0 };
}];

// Populate extenders listbox
private _control = uiNamespace getVariable QGVAR(extendersWarningDialog)
    displayCtrl IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_LISTEXTENDERS;

// Extender title column
_control lnbAddColumn 0.4;
// Extender author column
_control lnbAddColumn 0.75;
// Extender version column
_control lnbAddColumn 0.85;
// Extender compatibility column
_control lnbAddColumn 0.9;

private _index = _control lnbAddRow[
    localize "STR_antistasi_extenders_warning_dialog_ListExtenders_ColumnTitle",
    localize "STR_antistasi_extenders_warning_dialog_ListExtenders_ColumnAuthor",
    localize "STR_antistasi_extenders_warning_dialog_ListExtenders_ColumnVersion",
    localize "STR_antistasi_extenders_warning_dialog_ListExtenders_ColumnCompatibility"
];

EGVAR(core,extendersLoaded) apply {
    private _extender = _x;

    _index = _control lnbAddRow[
        _extender get "name",
        _extender get "author",
        [_extender get "version", 1, 1] call CBA_fnc_formatNumber,
        [_extender get "compatDeclared", 1, 1] call CBA_fnc_formatNumber
    ];

    _control lnbSetTooltip[[_index, 0], format ["%1\nby %2\ncompat status: %3", _extender get "extender", _extender get "author", _extender get "compatReason"]];

    switch true do {
        case (_extender get "compatDeclared" isEqualTo 0): {
            _control lnbSetText[[_index, 3], "No information"];
            _control lnbSetColor[[_index, 0], [0.8, 0, 0, 1]];
        };
        case (_extender get "compatStatus" isEqualTo 0): {
            //_control lnbSetColor[[_index, 0], [0, 0.8, 0, 1]];
        };
        case (_extender get "compatStatus" isEqualTo 1): {
            _control lnbSetColor[[_index, 0], [0.8, 0, 0, 1]];
        };
        case (_extender get "compatStatus" isEqualTo 2): {
            _control lnbSetColor[[_index, 0], [0.8, 0.6, 0, 1]];
        };
    }
};

nil;
