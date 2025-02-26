#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_discount"];

private _trader = if (!isNil "traderX") then {
    traderX
} else { 
    nil 
};

if (isNil "_trader") exitWith {
    Info("Trader is not spawned yet, aborting.");
};

Info_1("Setting %1 discount.", _discount);

_trader setVariable ["HALs_store_trader_sale", _discount, true];

traderDiscount = _discount;
publicVariable "traderDiscount";