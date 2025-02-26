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
	The below should prevent any instances of vehicles being in the normal HQ store at a cheap price,
	whilst also being in the arms dealer at a high price (effectively creating a duplication bug).
*/
private _costsBM = [_typeX] call A3U_fnc_blackMarketVehiclePrice;

if (isNil "_costsBM") then {_costsBM = 0};

if (_costs isNotEqualTo 0 && {_costsBM isNotEqualTo 0}) then {
	_costs = _costs min _costsBM;
};

if (_costs isEqualTo 0 && {_costsBM isNotEqualTo 0}) then {
	_costs = _costsBM;
};

if (_costs <= 0) then { // if the cost is less than 0
	[format ["%1 was an invalid price. Defaulting to %2", _costs, _defaultPrice], _fnc_scriptName] call A3U_fnc_log;
	_costs = _defaultPrice; // reset the cost to the default price
};

_costs