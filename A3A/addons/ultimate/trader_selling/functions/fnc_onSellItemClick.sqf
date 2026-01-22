#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_onSellItemClick

Description:
    Sell button click event handler

Parameters:
    0: _control - Button <CONTROL>

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onSellItemClick),_this);

params[
    ["_control",controlNull,[controlNull]]
];

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _list = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
private _items = _list getVariable[QGVAR(items), []];
private _index = lnbCurSelRow _list;

TRACE_1(QFUNC(onSellItemClick),_index);

try {
    if (_index < 0) then { throw false };

    private _itemIndex = parseNumber(_list lnbData[_index, 0]);
    private _data = _items select _itemIndex;
    private _amount = parseNumber ctrlText(_display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT);
    private _price = _data get "price";

    if (_data get "sellable") then {
        _price = _price * HALs_store_sellFactor;
    } else {
        TRACE_2(QFUNC(onSellItemClick),"purge",_data);
        _amount = _data get "count";
    };

    private _class = _data get "class";
    private _count = _data get "count";

    if (_amount <= 0 || { _amount > _count }) then { throw false };

    TRACE_4(QFUNC(onSellItemClick),_class,_price,_amount,_count);

    if !([_class, _amount, _price, _itemIndex, _items, GVAR(sellContainerObject)] call FUNC(sellItem)) then {
        _list lnbSetText[[_index, 1], str((_items select _itemIndex) get "count")];
    } else {
        _list lnbDeleteRow _index;
        _list lnbSetCurSelRow _index;
        [{ call FUNC(updateItemCount) }, [_list, _index]] call CBA_fnc_execNextFrame;
    };

    [] call FUNC(updateUiFromSelection);
    GVAR(allowAmountAutoUpdate) = true;
} catch {
    WARNING("something went wrong");
    GVAR(allowAmountAutoUpdate) = nil;
};

nil;
