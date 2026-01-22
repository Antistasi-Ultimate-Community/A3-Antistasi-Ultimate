#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_trader_selling_fnc_startAdvancedSelling

Description:
    User interaction callback handler for starting advanced selling

Parameters:
    0: _container - Inventory container <OBJECT>

Optional:

Example:

Returns:
    <BOOL>

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(startAdvancedSelling),_this);

if !(canSuspend) exitWith { _this spawn FUNC(startAdvancedSelling) };

if !assert(params[
    ["_container", nil, [objNull]]
]) exitWith {};

if !assert(!isNull _container) exitWith {};

private _guiCaption = localize LSTRING(AdvSell_DisplayNameShort);
private _guiText = localize LSTRING(AdvSell_ConfirmBreakdown);

if !([_guiText, _guiCaption, true, true] call BIS_fnc_guiMessage) exitWith {};

GVAR(sellContainer) = _container;
GVAR(sellContainerReady) = false;

if !([GVAR(sellContainer)] call FUNCMAIN(makeObjectLocal)) exitWith {};
[GVAR(sellContainer), true] remoteExecCall["lockInventory", -2, GVAR(sellContainer)];

[GVAR(sellContainer), {
    if !assert(params[["_container",objNull,[objNull]], ["_items",nil,[createHashMap]]]) exitWith {};
    if !assert(!isNull _container) exitWith {};
    if !assert(!isNil "_items") exitWith {};

    {
        [_x] call FUNC(getItemPrice) params["_isSellable", "_priceOrReason"];

        _y set["class", _x];
        _y set["config", switch (_y get "type") do {
            case "item": { [configFile >> "CfgWeapons", configFile >> "CfgGlasses"] select isClass(configFile >> "CfgGlasses" >> _x) };
            case "weapon": { configFile >> "CfgWeapons" };
            case "magazine": { configFile >> "CfgMagazines" };
            case "backpack": { configFile >> "CfgVehicles" };
            default { 
                Error_2("unknown type for %1: %2",_x,_y get "type");
                configNull;
            };
        }];

        _y set["sellable", _isSellable];

        if _isSellable then {
            _y set["price", _priceOrReason];
        } else {
            _y set["price", false];
            _y set["reason", _priceOrReason];
        };
    } forEach _items;

    GVAR(sellContainerItems) = _items;
    GVAR(sellContainerObject) = _container;
    GVAR(sellContainerReady) = true;
}] spawn FUNC(breakdownContainer);

createDialog QGVAR(sellDialog);

nil;
