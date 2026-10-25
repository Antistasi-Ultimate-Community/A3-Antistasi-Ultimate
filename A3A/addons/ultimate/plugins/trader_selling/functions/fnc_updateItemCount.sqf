#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_updateItemCount

Description:
    Update amount edit control with item count

Parameters:
    0: _control - Control of listbox <CONTROL>
    1: _index - Index of selected item <NUMBER>

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(updateItemCount),_this);

if !assert(params[
    ["_control", nil, [controlNull]],
    ["_index", nil, [0]]
]) exitWith {};
if !assert(!isNull _control) exitWith {};

if (_index < 0) exitWith {};

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _itemIndex = _control lnbData[_index, 0];
private _items = _control getVariable[QGVAR(items), []];
private _data = _items select parseNumber _itemIndex;

if (_data get "price" isEqualTo false) exitWith {};

private _edit = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_EDITAMOUNT;
_edit ctrlSetText str(_data get "count");
[] call FUNC(updateUiFromSelection);

GVAR(allowAmountAutoUpdate) = true;

nil;
