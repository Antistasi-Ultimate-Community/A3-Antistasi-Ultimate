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
params[["_items",nil,[createHashMap]]];

if !assert(!isNil "_items") exitWith {[]};

private _sorted = [];

{
    private _price = if (_y get "sellable") then [{ _y get "price" }, { 0 }];
    _sorted pushBack[
        (20000 - _price),
        getText((_y get "config") >> _x >> "displayName"),
        _y
    ]
} forEach _items;

_sorted sort true;
_sorted apply { _x select 2 };
