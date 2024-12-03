#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeX"];

private _costs = server getVariable _typeX;

private _defaultPrice = 1000;

_costs = if (isNil "_costs") then {
	Error_1("Invalid vehicle price :%1.", _typeX);

	0
} else {
	private _multiplierSeaport = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports;
	private _multiplierResource = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count resourcesX;

	private _reductionFactorSeaport = 0.1; // Base reduction per seaport
	private _reductionFactorResource = 0.02; // Base reduction per resource

	private _diminishingFactor = 1 / (1 + (_multiplierSeaport * _reductionFactorSeaport) + (_multiplierResource * _reductionFactorResource)); // Diminishing returns

	round (_costs * _diminishingFactor) // Apply diminishing returns to reduce cost
};


/*
	This will fix the price if the vehicle is present in the black market since it's now being added to "vehiclesReb". 
	This causes the wrong function (this) being called for price instead of A3U_fnc_blackMarketVehiclePrice, as "vehiclesReb" was designed for HQ vehicles (afaik)

	Known issue: This may break the price for anything in HQ and black market, but at that point, why is it in the black market?
	There may be the potential for a money exploit: If a player buys something for 500 in the HQ store, but it's also in the BM for 10000, upon selling this may give 5000 back.
	I added an extra check to prevent this, but should be taken into account if ever maintained in the future
*/
private _blackMarketPrice = [_typeX] call A3U_fnc_blackMarketVehiclePrice;

if (isNil "_blackMarketPrice") then {_blackMarketPrice = 0};

if (_costs isEqualTo 0 && {_blackMarketPrice isNotEqualTo 0}) then { // checking cost first should stop a potential money dupe glitch
	_costs = _blackMarketPrice;
};

if (_costs <= 0) then { // if the cost is less than 0
	[format ["%1 was an invalid price. Defaulting to %2", _costs, _defaultPrice], _fnc_scriptName] call A3U_fnc_log;
	_costs = _defaultPrice; // reset the cost to the default price
};

_costs
