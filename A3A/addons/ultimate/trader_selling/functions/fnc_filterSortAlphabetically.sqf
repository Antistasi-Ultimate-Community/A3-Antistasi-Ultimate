#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_filterSortAlphabetically

Description:
    Filter items alphabetically

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
        getText((_y get "config") >> _x >> "displayName"),
        _y
    ]
} forEach _items;

_sorted sort true;
_sorted apply { _x select 1 };
