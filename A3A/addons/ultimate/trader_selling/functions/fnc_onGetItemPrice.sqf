#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_onGetItemPrice

Description:
    Result event handler function for
    CBA_EVENT_CLIENT_TRADER_SELLING_GETITEMPRICE event.

    Get price of item from HALs store addon.

Parameters:
    0: _class - Class name of item to appraise <STRING>
    1: _config - Item configuration <CONFIG>
    2: _type - Type of item (item, weapon, magazine, backpack) <STRING>

Optional:

Returns:
    <ANY> Price as <NUMBER> or nil if no price.

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onGetItemPrice),_this);

if !assert(params[
    ["_class", nil, [""]],
    ["_config", nil, [configNull]],
    ["_type", nil, [""]]
]) exitWith {};
if !assert(!isNull _config) exitWith {};

private["_price"];

("true" configClasses(configFile >> "CfgHALsAddons" >> "cfgHALsStore" >> "categories")) findIf {
    isClass(_x >> _class) && {
        _price = getNumber(_x >> _class >> "price");
        true;
    };
};

RETNIL(_price);
