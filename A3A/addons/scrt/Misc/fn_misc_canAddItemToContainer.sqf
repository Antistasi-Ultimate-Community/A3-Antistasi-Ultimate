#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: SCRT_fnc_misc_canAddItemToContainer

Description:
    Substitute for buggy `canAdd*` functions of BIS.

Parameters:
    0: _container - The container to check <OBJECT>
    1: _item - Item, weapon or magazine class name <STRING>

Optional:
    2: _count - Optional item count (default=1) <NUMBER>

Example:
    (begin example)
    [backpackContainer player, "arifle_MX_Hamr_pointer_F"] call SCRT_fnc_misc_canAddItemToContainer;
    [vestContainer player, "HandGrenade", 4] call SCRT_fnc_misc_canAddItemToContainer;
    (end example)

Returns:
    Whether the amount of items fit in the container <BOOL>

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[
    ["_container",objNull,[objNull]],
    ["_item","",[""]],
    ["_count",1,[0]]
];

if !assert(!isNull _container) exitWith { false };

private _load = loadAbs _container;
private _maximum = maxLoad _container;

// Can happen with `load` (see description in https://community.bistudio.com/wiki/load)
// so assume, it happens with `loadAbs` too
if (_load >= _maximum) exitWith { false };

// Sanity; you can always not add anything or take something out
if (_count <= 0) exitWith { true };

private _mass = switch true do {
    case isNumber(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "mass"): {
        // It's an item
        getNumber(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "mass");
    };

    case isClass(configFile >> "CfgMagazines" >> _item): {
        // It's a magazine
        getNumber(configFile >> "CfgMagazines" >> _item >> "mass");
    };

    case isClass(configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo"): {
        // It's a weapon
        private _baseMass = getNumber(configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass");
        private _linkedItemsMass = 0;

        // Calculate attachments weights
        "true" configClasses(configFile >> "CfgWeapons" >> _item >> "LinkedItems") apply {
            private _linkedItem = getText(_x >> "item");
            private _linkedItemMass = getNumber(configFile >> "CfgWeapons" >> _linkedItem >> "ItemInfo" >> "mass");

            _linkedItemsMass = _linkedItemsMass + _linkedItemMass;
        };

        _baseMass + _linkedItemsMass;
    };
    default {
        // It's a croak out
        -1
    };
};

(_mass >= 0) && { (_load + _mass * _count) <= _maximum };
