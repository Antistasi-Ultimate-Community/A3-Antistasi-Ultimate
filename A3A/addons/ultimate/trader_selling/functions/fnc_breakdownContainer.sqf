#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_breakdownContainer

Description:
    Breakdown weapons, backpack contents from container

Parameters:
    0: _container - Inventory container <OBJECT>

Optional:
    1: _callback - Callback to execute after breakdown <CODE>

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[
    ["_container",objNull,[objNull]],
    ["_callback",{},[{}]]
];

if !assert(!isNull _container) exitWith {};

private _items = [_container] call FUNCMAIN(utilContainerContentFlattened);

clearBackpackCargoGlobal _container;
clearItemCargoGlobal _container;
clearMagazineCargoGlobal _container;
clearWeaponCargoGlobal _container;

_items apply {
    private _item = _x;
    private _info = _y;
    private _count = _info get "count";

    switch (_info get "type") do {
        case "magazine": {
            _container addMagazineCargoGlobal[_item, _count];
        };
        case "weapon": {
            _container addWeaponCargoGlobal[_item, _count];
        };
        case "backpack": {
            _container addBackpackCargoGlobal[_item, _count];
        };
        case "item": {
            _container addItemCargoGlobal[_item, _count];
        };
        default {
            ERROR_2("Unknown type for %1: %2",_item,_info get "type");
        };
    };
};

[_container, _items] call _callback;

nil;
