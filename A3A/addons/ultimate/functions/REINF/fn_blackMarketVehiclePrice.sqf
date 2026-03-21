#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeX"];

// ! the one major downside to the new structure of A3U_blackMarketStock is that vehicles are organized into nested hashmaps,
// ! so we do need to do a little extra work here to merge the hashmaps before checking that the vehicle exists and getting its price
private _bMStock = createHashMap;
{ _bMStock merge _x } forEach (values A3U_blackMarketStock);

private _cost = _bMStock get _typeX;

if (isNil "_cost") exitWith {
	Error_1("Invalid vehicle price at %1.", _typeX);

	0;
};

private _multiplierSeaport = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports;
private _multiplierResource = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count resourcesX;

private _reductionFactorSeaport = 0.1; // Base reduction per seaport
private _reductionFactorResource = 0.02; // Base reduction per resource

private _diminishingFactor = 1 / (1 + (_multiplierSeaport * _reductionFactorSeaport) + (_multiplierResource * _reductionFactorResource)); // Diminishing returns

_cost = _cost * _diminishingFactor; // Apply diminishing returns to reduce cost

private _discount = ((A3U_blackMarketDiscountVehicle / 10) * _cost);
private _cost = round (_cost - _discount);

_cost;