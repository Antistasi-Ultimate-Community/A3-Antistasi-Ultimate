#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_getVehiclePrice

Description:
    Get the buying or selling price of a vehicle optionally with discounts.

Parameters:
    0: _vehicle - the vehicle object or class name <OBJECT/STRING>

Optional:
    1: _returnSellingPrice - whether to return the selling price instead of the buying price <BOOL> (default: false)
    2: _discountPrice - whether to apply discounts <BOOL> (default: false)

Example:
    (begin example)
    // Get buying price of object or class name
    [cursorTarget] call A3A_fnc_getVehiclePrice;
    ["B_MRAP_01_F"] call A3A_fnc_getVehiclePrice;

    // Get selling price of object
    [cursorTarget, true] call A3A_fnc_getVehiclePrice;

    // Get buying price of object with discount
    [cursorTarget, false, true] call A3A_fnc_getVehiclePrice;
    (end example)

Returns:
    <NUMBER> price of vehicle or `nil` if not found

Environment:
    Client/Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !assert(params[
    ["_vehicle", nil, ["", objNull]]
]) exitWith {};

private _returnSellingPrice = param[1, false, [true]];
private _discountPrice = param[2, false, [true]];

private _className = _vehicle;

if (_vehicle isEqualType objNull) then {
    _className = typeOf _vehicle;
};

private _price = server getVariable _className;

if (isNil "_price") exitWith {};

if (_discountPrice) then {
	private _multiplierSeaport = {sidesX getVariable[_x, sideUnknown] == teamPlayer} count seaports;
	private _multiplierResource = {sidesX getVariable[_x, sideUnknown] == teamPlayer} count resourcesX;

	private _reductionFactorSeaport = GVAR(vehicleSellingReductionFactorSeaport);
	private _reductionFactorResource = GVAR(vehicleSellingReductionFactorResource);

	private _diminishingFactor = 1 / (1 + (_multiplierSeaport * _reductionFactorSeaport) + (_multiplierResource * _reductionFactorResource)); // Diminishing returns

	_price = round(_price * _diminishingFactor); // Apply diminishing returns to reduce cost
};

if (_returnSellingPrice) then {
    _price = _price * GVAR(vehicleSellingPriceFactor);
};

_price;