#include "..\script_component.hpp"
#include "..\RscDefine.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_onProtectItemClick

Description:
    Handle item protection click event

Parameters:
    0: _control - Button <CONTROL>

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onProtectItemClick),_this);

params[
    ["_control", controlNull, [controlNull]]
];

private _display = uiNamespace getVariable[QGVAR(menuDisplay), displayNull];
if !assert(!isNull _display) exitWith {};

private _list = _display displayCtrl IDC_RSCA3USPCMSTORESELLDIALOG_LISTCONTAINERCONTENT;
private _items = _list getVariable[QGVAR(items), []];
private _index = lnbCurSelRow _list;

TRACE_1(QFUNC(onProtectItemClick),_index);

if (_index < 0) exitWith {};

private _itemIndex = parseNumber(_list lnbData[_index, 0]);
private _data = _items select _itemIndex;

TRACE_1(QFUNC(onProtectItemClick),_data);

if ((_data get "class") in (_display getVariable QGVAR(protected))) then {
    _display getVariable QGVAR(protected) deleteAt(_data get "class");
    _list lnbSetPicture[[_index, COLUMN_PROTECT_ICON], ""];
} else {
    _display getVariable QGVAR(protected) set[_data get "class", true];
    _list lnbSetPicture[[_index, COLUMN_PROTECT_ICON], QPATHTOEF(assets,ui\lock-icon.paa)];
};

GVAR(allowAmountAutoUpdate) = false;
[] call FUNC(updateUiFromSelection);

nil;
