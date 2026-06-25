#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_onSellAllClick

Description:
    Handle sell all button click event

Parameters:
    0: _control - Button <CONTROL>

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onSellAllClick),_this);

if !assert(params[
    ["_control", nil, [controlNull]]
]) exitWith {};
if !assert(!isNull _control) exitWith {};

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _data = _control getVariable[QGVAR(itemData), false];

Trace_1(QFUNC(onSellAllClick),_data);

if (_data isEqualType false) exitWith {};

private _confirm = _control getVariable[QGVAR(confirm), 0];

if (_confirm < diag_tickTime) exitWith {
    (allControls _display - [_control]) apply { _x ctrlEnable false };

    _control setVariable[QGVAR(confirm), diag_tickTime + 5];
    _control ctrlSetText localize LSTRING(RscA3USPCMStoreSellDialog_BtnAgain);
    _control ctrlSetTooltip localize([
        LSTRING(RscA3USPCMStoreSellDialog_BtnPurgeAll_Tooltip_Confirm),
        LSTRING(RscA3USPCMStoreSellDialog_BtnSellAll_Tooltip_Confirm)
    ] select (_data get "sellable"));

    [_display, _control] spawn {
        params["_display", "_control"];

        waitUntil {
            (isNull _display) ||
            { _control getVariable[QGVAR(confirm), 0] < diag_tickTime }
        };

        if (isNull _display) exitWith {};
        if (_control getVariable[QGVAR(confirm), 0] isEqualTo 0) exitWith {};

        allControls _display apply { _x ctrlEnable true };

        [] call FUNC(updateUiFromSelection);
    };

};

Trace_1(QFUNC(onSellAllClick),_data);
allControls _display apply { _x ctrlEnable false };
_control setVariable[QGVAR(confirm), 0];

private _selling = _data get "sellable";
private _list = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;

[_selling,_list,_display] spawn {
    params["_selling","_list","_display"];

    private _items = _list getVariable[QGVAR(items), []];
    private _index = -1;
    private _i = 0;

    while { _i < (lnbSize _list select 0) } do {
        private _itemIndex = parseNumber(_list lnbData[_i, 0]);
        private _data = _items select _itemIndex;

        if (_data get "sellable" isEqualTo _selling) then {
            _index = _i;
            break;
        };

        INC(_i);
    };

    if (_index < 0) exitWith {};

    _list lnbSetCurSelRow _index;

    try {
        private _protected = _display getVariable QGVAR(protected); // private protected. lol.

        while { true } do {
            allControls _display apply { _x ctrlEnable false };
            uiSleep GVAR(sellDelay);

            if isNull(uiNamespace getVariable[QGVAR(menuDisplay), displayNull]) then { throw false };

            if (_index >= (lnbSize _list select 0)) then { break };

            private _itemIndex = parseNumber(_list lnbData[_index, 0]);
            private _data = _items select _itemIndex;

            private _class = _data get "class";
            private _amount = _data get "count";
            private _price = _data get "price";

            if ((_data get "sellable" isNotEqualTo _selling) || { _class in _protected }) then {
                _index = _index + 1;
                continue;
            };

            if !([_class, _amount, _price, _itemIndex, _items, GVAR(sellContainerObject)] call FUNC(sellItem)) then {
                Warning("something went wrong; aborting loop");
                break;
            } else {
                _list lnbDeleteRow _index;
                _list lnbSetCurSelRow _index;
                [{ call FUNC(updateItemCount) }, [_list, _index]] call CBA_fnc_execNextFrame;
            };
        };

        allControls _display apply { _x ctrlEnable true };
        GVAR(allowAmountAutoUpdate) = nil;
        [] call FUNC(updateUiFromSelection);
    } catch {
        Trace_1(QFUNC(onSellAllClick),"aborted");
    };
};

nil;
