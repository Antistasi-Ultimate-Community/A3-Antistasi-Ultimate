#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_filterGroupedByType

Description:
    Filter items by type and group them

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

private _sorted = [];
private _sortOrder = createHashMapFromArray[
    ["item", 2],
    ["weapon", 0],
    ["magazine", 1],
    ["backpack", 3],
    ["unknown", 4]
];

{
    _sorted pushBack[
        _sortOrder getOrDefault[_y get "type", 500],
        getText((_y get "config") >> _x >> "displayName"),
        _y
    ]
} forEach _items;

_sorted sort true;
_sorted apply { _x select -1 };
