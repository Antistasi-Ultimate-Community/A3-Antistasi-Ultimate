#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_updateUiFromSelection

Description:
    Update UI elements based on selected item in sell dialog

Parameters:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _list = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
private _items = _list getVariable[QGVAR(items), []];
private _index = lbCurSel _list;

try {
    if (_index < 0) then { throw false };

    private _itemIndex = _list lnbData[_index, 0];
    private _data = _items select parseNumber _itemIndex;

    _display getVariable QGVAR(wantSelectionDataControls) apply {
        _x setVariable[QGVAR(itemData), _data];
    };

    private _description = [
        getText((_data get "config") >> (_data get "class") >> "Library" >> "libTextDesc"),
        getText((_data get "config") >> (_data get "class") >> "descriptionShort"),
        getText((_data get "config") >> (_data get "class") >> "displayName")
    ] select { _x isNotEqualTo "" };

    _description = if (_description isEqualTo []) then[{ "N/A" }, { _description select 0 }];
    if ((toLower _description) find "$str_" isEqualTo 0) then { _description = localize _description };

    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_FRAMEITEMINFO ctrlSetText getText((_data get "config") >> (_data get "class") >> "displayName");
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMDESCRIPTION ctrlSetStructuredText parseText format["<t size='0.5'>%1</t>", _description];
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMCOUNT ctrlSetText str(_data get "count");
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_PICTURESELLITEMSQUARE ctrlSetText getText((_data get "config") >> (_data get "class") >> "picture");
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnProtect);

    if ((_data get "class") in (_display getVariable QGVAR(protected))) then { throw true };

    private _price = _data get "price";
    private _amount = parseNumber ctrlText(_display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT);

    if !(_data get "sellable") then {
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMPRICE ctrlSetText "-";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTTOTALSALE ctrlSetText "-";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnPurge);
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL ctrlEnable true;
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnPurgeAll);
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlSetTooltip localize LSTRING(RscA3USPCMStoreSellDialog_BtnPurgeAll_Tooltip);
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlEnable true;

        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN ctrlSetText format[localize LSTRING(AdvSell_CantSell), localize(_data get "reason")];
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN ctrlSetTextColor [1,1,1,1];
    } else {
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN ctrlSetText localize LSTRING(AdvSell_DblClickHint);
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_STATICWAITFORBREAKDOWN ctrlSetTextColor [1,1,1,1];

        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMPRICE ctrlSetText format["%1 %2", round _price, A3A_faction_civ get "currencySymbol"];
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnSell);

        if (_amount > 0 && { _amount <= (_data get "count") }) then {
            _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTTOTALSALE ctrlSetText format["%1 %2", round(_price * _amount), A3A_faction_civ get "currencySymbol"];
            _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL ctrlEnable true;
        } else {
            _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTTOTALSALE ctrlSetText "-";
            _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL ctrlEnable false;
        };

        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnSellAll);
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlSetTooltip localize LSTRING(RscA3USPCMStoreSellDialog_BtnSellAll_Tooltip);
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlEnable true;

        if !(isNil QGVAR(allowAmountAutoUpdate)) then {
            _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT ctrlSetText str(_data get "count");
        };
    };

    GVAR(allowAmountAutoUpdate) = nil;

    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT ctrlEnable true;
} catch {
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELL ctrlEnable false;
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNSELLALL ctrlEnable false;
    _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnUnprotect);

    if (_exception) then {
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT ctrlEnable true;
    } else {
        _display getVariable QGVAR(wantSelectionDataControls) apply {
            _x setVariable[QGVAR(itemData), false];
        };

        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMCOUNT ctrlSetText "";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTITEMPRICE ctrlSetText "";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_TEXTTOTALSALE ctrlSetText "";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_FRAMEITEMINFO ctrlSetText "";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_PICTURESELLITEMSQUARE ctrlSetText "#(argb,8,8,3)color(0,0,0,0)";
        _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_BTNPROTECT ctrlEnable false;
    };
};

nil;
