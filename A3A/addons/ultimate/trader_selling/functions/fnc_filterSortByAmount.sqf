#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_filterSortByAmount

Description:
    Sort sellable items by amount

Parameters:
    0: _items - Item hash map <HASHMAP>

Example:

Returns:
    Items array <ARRAY>

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[["_items",nil,[createHashMap]]];

if !assert(!isNil "_items") exitWith {[]};

private _sorted = [];

{
    _sorted pushBack[
        (20000 - (_y get "count")),
        getText((_y get "config") >> _x >> "displayName"),
        _y
    ]
} forEach _items;

_sorted sort true;
_sorted apply { _x select 2 };
