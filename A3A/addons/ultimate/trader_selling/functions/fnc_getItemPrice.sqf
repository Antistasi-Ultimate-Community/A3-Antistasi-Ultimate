#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_getItemPrice

Description:
    Get price of item by iterating through appraisal functions.

    Maybe see `A3A_fnc_traderSellingAppraiseItem` for more context.

Parameters:
    0: _class - Class name of item <STRING>
    1: _config - Item configuration <CONFIG>
    2: _type - Type of item (item, weapon, magazine, backpack) <STRING>

Optional:

Example:
    (begin example)
    ["16Rnd_9x21_Mag", configFile >> "CfgMagazines" >> "16Rnd_9x21_Mag", "magazine"] call A3A_ultimate_trader_selling_fnc_getItemPrice;
    (end example)

Returns:
    Result array [isSellable, priceOrReason] <ARRAY> 

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_class", nil, [""]],
    ["_config", nil, [configNull]],
    ["_type", nil, [""]]
]) exitWith { [false, LSTRING(AdvSell_Reason_InvalidParameters)] };
if !assert(!isNull _config) exitWith { [false, LSTRING(AdvSell_Reason_InvalidParameters)] };

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

    private _price = [CBA_EVENT_CLIENT_TRADER_SELLING_GETITEMPRICE, [_class, _config, _type]] call FUNCMAIN(triggerResultEvent);

    if (isNil "_price") then {
        throw LSTRING(AdvSell_Reason_ItemUnconfigured);
    };

    [true, GVAR(sellPriceMultiplier) * _price];
} catch {
    [false, _exception];
};
