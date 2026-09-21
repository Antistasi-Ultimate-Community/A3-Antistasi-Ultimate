#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_onSellDialogOpen

Description:
    Initialize better selling dialog

Parameters:
    0: _display - Display of dialog <DISPLAY>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
disableSerialization;

Trace_1(QFUNC(onSellDialogOpen),_this);

if !assert(params[
    ["_display", nil, [displayNull]]
]) exitWith {};
if !assert(!isNull _display) exitWith {};

uiNamespace setVariable[QGVAR(menuDisplay), _display];
_display setVariable[QGVAR(protected), createHashMap];

private["_control"];

// Automatic item selection property

private _wantSelectionDataControls = "getNumber(_x >> 'wantSelectionData') > 0" configClasses(configFile >> QGVAR(sellDialog) >> "Controls") apply {
    _display displayCtrl getNumber(_x >> "idc");
};

_display setVariable[QGVAR(wantSelectionDataControls), _wantSelectionDataControls];

Trace_1(QFUNC(onSellDialogOpen),_wantSelectionDataControls);

// Close button

_display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNCLOSE ctrlAddEventHandler["ButtonClick", {
    closeDialog 0;
}];

// Amount input

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT;
_control ctrlEnable false;
_control ctrlAddEventHandler["KeyUp", { [] call FUNC(updateUiFromSelection) }];

// Sell button

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL;
_control ctrlEnable false;
_control ctrlAddEventHandler["ButtonClick", { call FUNC(onSellItemClick) }];

// Sell all button

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL;
_control ctrlEnable false;
_control ctrlAddEventHandler["ButtonClick", { call FUNC(onSellAllClick) }];

// Protect button

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT;
_control ctrlEnable false;
_control ctrlAddEventHandler["ButtonClick", { call FUNC(onProtectItemClick) }];

// Filter list

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_DROPFILTERSELECT;
"true" configClasses (configFile >> QGVAR(sellDialog) >> "Filters") apply {
    private _class = configName _x;
    private _label = getText(configFile >> QGVAR(sellDialog) >> "Filters" >> _class >> "displayName");
    private _index = _control lbAdd _label;
    _control lbSetData[_index, _class];
};

_control ctrlEnable false;
_control lbSetCurSel 0;
_control ctrlAddEventHandler["LBSelChanged", {
    params[["_control",controlNull,[controlNull]], ["_index",0,[0]]];
    [] call FUNC(updateSellableItemsList);
}];

// Container items list

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
_control ctrlEnable false;
_control ctrlSetFontHeight 0.04;
_control lnbAddColumn 0.23;
_control lnbAddColumn 0.27;
_control lnbAddColumn 0.87;

_control ctrlAddEventHandler["LBDblClick", {
    call FUNC(updateItemCount);
}];

_control ctrlAddEventHandler["LBSelChanged", {
    params[["_control",controlNull,[controlNull]], ["_index",0,[0]]];
    [] call FUNC(updateUiFromSelection);
}];

// Show unsellable items checkbox

_control = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_CHECKSHOWUNSELLABLE;
_control ctrlEnable false;
_control ctrlAddEventHandler["CheckedChanged", {
    [] call FUNC(updateSellableItemsList);
}];

// Init sellable items list
private _storeItems = createHashMap;

"true" configClasses(configFile >> "CfgHALsAddons" >> "cfgHALsStore" >> "categories") apply {
    "true" configClasses _x apply {
        if isNumber(_x >> "price") then {
            _storeItems set[configName _x, getNumber(_x >> "price")];
        };
    };
};

_display setVariable[QGVAR(storeItems), _storeItems];

// Wait for breakdown

[_display] spawn {
    params[["_display",displayNull,[displayNull]]];

    waitUntil { isNull _display || { GVAR(sellContainerReady) } };
    Trace_1("sellContainerReady",GVAR(sellContainerReady));

    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN ctrlSetText localize LSTRING(AdvSell_DblClickHint);
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN ctrlSetTextColor [1,1,1,1];

    [true] call FUNC(updateSellableItemsList);
};

nil;
