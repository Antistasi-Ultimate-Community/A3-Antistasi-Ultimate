#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_utilContainerContentFlattened

Description:
    Breakdown container weapons, backpack contents etc. into a flat list

Parameters:
    0: _container - Inventory container <OBJECT>

Optional:

Example:
    (begin example)
    [backpackContainer player] call A3A_ultimate_trader_selling_fnc_utilContainerContentFlattened;
    (end example)

Returns:
    Hashmap of items in container

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
params[
    ["_container", objNull, [objNull]]
];

private _toCollection = {
    params["_container"];

    private _wic = weaponsItemsCargo _container;
    private _mc = magazineCargo _container;
    private _bc = backpackCargo _container;
    private _ic = itemCargo _container;

    #define ADD_LOOKUP(TYPE,INDEX) if (_x select(INDEX) isNotEqualTo "") then { _typeLookup set[_x select(INDEX), QUOTE(TYPE)]; };
    #define ADD_LOOKUP_MAG(INDEX) if (_x select(INDEX) isNotEqualTo []) then { _typeLookup set[_x select(INDEX) select 0, QUOTE(magazine)]; };
    _wic apply { 
        _typeLookup set[_x select 0, "weapon"];
        ADD_LOOKUP(item,1); // Muzzle
        ADD_LOOKUP(item,2); // Flashlight/IR Laser
        ADD_LOOKUP(item,3); // Optic
        ADD_LOOKUP_MAG(4); // Primary magazine
        ADD_LOOKUP_MAG(5); // Secondary magazine
        ADD_LOOKUP(item,6); // Bipod
    };
    #undef ADD_LOOKUP

    _mc apply { _typeLookup set[_x, "magazine"]; };
    _bc apply { _typeLookup set[_x, "backpack"]; };
    _ic apply { _typeLookup set[_x, "item"]; };

    _wic + _mc + _bc + _ic;
};

private _items = createHashMap;
private _typeLookup = createHashMap;
private _collection = [_container] call _toCollection;

everyBackpack _container apply {
    _collection pushBack([_x] call _toCollection);
};

flatten _collection select {
    (_x isEqualType "") && {_x isNotEqualTo ""};
} apply {
    private _item = _items getOrDefault[_x, createHashMapFromArray[
        ["count", 0],
        ["type", _typeLookup getOrDefault[_x, "unknown"]]
    ]];

    _item set["count", (_item get "count") + 1];
    _items set[_x, _item];
};

_items;
