#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_store_fnc_getItemPrice

Description:
    Get price of item from HALs store addon

Parameters:
    0: _class - class name of item <STRING>

Optional:

Example:
    (begin example)
    ["16Rnd_9x21_Mag"] call A3USPCM_store_fnc_getItemPrice;
    (end example)

Returns:
    Result array [isSellable, priceOrReason] <ARRAY> 

Author:
    goreSplatter
---------------------------------------------------------------------------- */
params[
    ["_class", "", [""]]
];

try {
    if (!GVAR(sellForbidden) && { _class in A3U_forbiddenItems }) then {
        private _flag = [configFile >> "A3U" >> "forbiddenItems" >> _class >> "unlimited", "NUMBER", 0] call CBA_fnc_getConfigEntry;
        if (_flag isNotEqualTo 0) then {
            throw LSTRING(AdvSell_Reason_ItemForbidden);
        };
    };

    private _count = if is3DENPreview then {
        0;
    } else {
        private _index = _class call jn_fnc_arsenal_itemType;
        private _arsenal = jna_datalist select _index;
        [_arsenal, _class] call jn_fnc_arsenal_itemCount;
    };

    if (_count < 0) then {
        throw LSTRING(AdvSell_Reason_ItemUnlocked);
    };

    private _price = false;

    ("true" configClasses(configFile >> "CfgHALsAddons" >> "cfgHALsStore" >> "categories")) findIf {
        if !isClass(_x >> _class) then {
            false;
        } else {
            _price = getNumber(_x >> _class >> "price");
            true;
        };
    };

    if (_price isEqualTo false) then {
        throw LSTRING(AdvSell_Reason_ItemUnconfigured);
    };

    [true, _price];
} catch {
    [false, _exception];
};
