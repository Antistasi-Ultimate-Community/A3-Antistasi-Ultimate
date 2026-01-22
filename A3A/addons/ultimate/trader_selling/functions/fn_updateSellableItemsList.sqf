#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_updateSellableItemsList

Description:
    Populate sellable items list taking into regard filters, sort

Parameters:

Optional:
    0: _quitIfListEmpty - Immediately exit if list is empty <BOOL> (Default: false)

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
params[["_quitIfListEmpty", false, [false]]];

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _toggleUiElements = {
    params[["_enable", false, [false]]];

    {
        _display displayCtrl _x ctrlEnable _enable;
    } forEach [
        IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT,
        IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL,
        IDC_RSCA3USPCMSTORESELLDIALOG_DROPFILTERSELECT,
        IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT,
        IDC_RSCA3USPCMSTORESELLDIALOG_CHECKSHOWUNSELLABLE
    ];
};

private _filter = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_DROPFILTERSELECT lbData lbCurSel(_display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_DROPFILTERSELECT);
private _callback = getText(configFile >> QGVAR(sellDialog) >> "Filters" >> _filter >> "function");
private _items = [GVAR(sellContainerItems)] call compile _callback;

if !(cbChecked(_display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_CHECKSHOWUNSELLABLE)) then {
    _items = _items select { _x get "sellable" };
};

if (_quitIfListEmpty && { _items isEqualTo [] }) exitWith {
    [
        localize LSTRING(AdvSell_DisplayNameShort),
        localize LSTRING(AdvSell_NothingToSell)
    ] call A3A_fnc_customHint;
    playSound "A3AP_UiFailure";
    closeDialog 0;
};

private _list = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
_list setVariable[QGVAR(items), _items];

lbClear _list;

if (_items isEqualTo []) exitWith {
    _list lnbSetCurSelRow -1;
    [false] call _toggleUiElements;
    [] call FUNC(updateUiFromSelection);
};

[true] call _toggleUiElements;

{
    private _index = _list lnbAddRow["", "", getText((_x get "config") >> (_x get "class") >> "displayName")];

    _list lnbSetText[[_index, 1], str(_x get "count")];
    _list lnbSetPicture[[_index, 0], getText((_x get "config") >> (_x get "class") >> "picture")];
    _list lnbSetData[[_index, 0], str _foreachIndex];

    if ((_x get "class") in (_display getVariable QGVAR(protected))) then {
        _list lnbSetPicture[[_index, COLUMN_PROTECT_ICON], QPATHTOEF(assets,ui\lock-icon.paa)];
    };

    if ((_x get "price") isNotEqualTo false) then {
        _list lnbSetData[[_index, DATA_IDX_SELLABLE], "true"];
    } else {
        _list lnbSetData[[_index, DATA_IDX_SELLABLE], "false"];
        _list lnbSetColor[[_index, 1], [0.4, 0.4, 0.4, 1]];
        _list lnbSetColor[[_index, 2], [0.4, 0.4, 0.4, 1]];
    };
} forEach _items;

_list lnbSetCurSelRow 0;

[] call FUNC(updateUiFromSelection);

nil;
