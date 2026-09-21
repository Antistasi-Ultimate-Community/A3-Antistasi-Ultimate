#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_sellItem

Description:
    Sell item

Parameters:
    0: _class - class <STRING>
    1: _amount - amount <NUMBER>
    2: _price - price <NUMBER>
    3: _itemIndex - item index <NUMBER>
    4: _items - items <ARRAY>
    5: _container - container <OBJECT>

Returns:
    Whether item was sold completely <BOOL>

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_class", nil, [""]],
    ["_amount", nil, [0]],
    ["_price", nil, [0,false]],
    ["_itemIndex", nil, [0]],
    ["_items", nil, []],
    ["_container", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _container) exitWith {};

private _item = _items select _itemIndex;
private _class = _item get "class";
private _type = _item get "type";
private _count = _item get "count";
private _payout = if (_price isEqualTo false) then [{ false }, { _price * _amount }];

Trace_5(QFUNC(sellItem),_class,_type,_price,_amount,_payout);

switch _type do {
    case "backpack": { _container addBackpackCargoGlobal[_class, -_amount] };
    case "item": { _container addItemCargoGlobal[_class, -_amount] };
    case "magazine": { _container addMagazineCargoGlobal[_class, -_amount] };
    case "weapon": { _container addWeaponCargoGlobal[_class, -_amount] };
    default { throw "This is where I give up." };
};

if (_payout isNotEqualTo false) then {
    if GVAR(playKaching) then {
        traderX say3D QEGVAR(assets,Sell);
    };

    if !is3DENPreview then {
        [_payout] call A3A_fnc_resourcesPlayer;
    };
};

if (_amount >= _count) then {
    _items set[_itemIndex, nil];
    GVAR(sellContainerItems) deleteAt _class;
    true;
} else {
    _items select _itemIndex set["count", _count - _amount];
    GVAR(sellContainerItems) get _class set["count", _count - _amount];
    false;
};
