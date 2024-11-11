#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_typeX"];

private _cost = A3U_blackMarketStock select { _x select 0 == _typeX } select 0 select 1;

if (isNil "_cost") exitWith {
	Error_1("Invalid vehicle price at %1.", _typeX);

	_cost = 0;

	_cost;
};

if (_cost isEqualType "") exitWith {
	Error_1("Invalid vehicle price at %1.", _typeX);
	0
};

_cost = if (isNil "_cost") then {
	Error_1("Invalid vehicle price at %1.", _typeX);

	0
} else {
	private _multiplierSeaport = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports;
	private _multiplierResource = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count resourcesX;

	private _reductionFactorSeaport = 0.1; // Base reduction per seaport
	private _reductionFactorResource = 0.02; // Base reduction per resource

	private _diminishingFactor = 1 / (1 + (_multiplierSeaport * _reductionFactorSeaport) + (_multiplierResource * _reductionFactorResource)); // Diminishing returns

	round (_cost * _diminishingFactor) // Apply diminishing returns to reduce cost
};

_cost