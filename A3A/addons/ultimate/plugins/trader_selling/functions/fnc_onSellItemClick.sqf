#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_onSellItemClick

Description:
    Sell button click event handler

Parameters:
    0: _control - Button <CONTROL>

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onSellItemClick),_this);

if !assert(params[
    ["_control", nil, [controlNull]]
]) exitWith {};
if !assert(!isNull _control) exitWith {};

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _list = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
private _items = _list getVariable[QGVAR(items), []];
private _index = lnbCurSelRow _list;

Trace_1(QFUNC(onSellItemClick),_index);

try {
    if (_index < 0) then { throw false };

    private _itemIndex = parseNumber(_list lnbData[_index, 0]);
    private _data = _items select _itemIndex;
    private _amount = parseNumber ctrlText(_display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT);
    private _price = _data get "price";

    if !(_data get "sellable") then {
        Trace_2(QFUNC(onSellItemClick),"purge",_data);
        _amount = _data get "count";
    };

    private _class = _data get "class";
    private _count = _data get "count";

    if (_amount <= 0 || { _amount > _count }) then { throw false };

    Trace_4(QFUNC(onSellItemClick),_class,_price,_amount,_count);

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
    Warning("something went wrong");
    GVAR(allowAmountAutoUpdate) = nil;
};

nil;
