#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_filterSortByPrice

Description:
    Sort sellable items by price

Parameters:
    0: _items - Item hash map <HASHMAP>

Example:

Returns:
    Items array <ARRAY>

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_items", nil, [createHashMap]]
]) exitWith {[]};

private _sorted = _items apply {
    private _price = if (_y get "sellable") then [{ _y get "price" }, { 0 }];
    [
        -_price,
        getText((_y get "config") >> _x >> "displayName"),
        _y
    ]
};

_sorted sort true;
_sorted apply { _x select -1 };
