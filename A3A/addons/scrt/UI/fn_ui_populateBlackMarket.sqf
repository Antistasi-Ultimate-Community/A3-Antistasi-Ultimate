#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
	["_category", "", [""]]
];

private _fnc_extractMarketClasses = {
	params ["_type"];
    private _stock = A3U_blackMarketStock getOrDefault [_type, createHashMap];
	private _cond = A3U_blackMarketConds getOrDefault [_type, {true}];

	private _isAvailable = call _cond;
    if (!_isAvailable) exitWith {createHashMap};

	_stock;
};

private _buyableVehiclesHM = switch (_category) do 
{
    case "ARTILLERY";
	case "APC";
	case "AA";
	case "UAV";
	case "TANK";
	case "HELI";
	case "PLANE";
	case "ARMEDCAR";
	case "UNARMEDCAR";
	case "BOAT": {
		[_category] call _fnc_extractMarketClasses;
	};
	case "STATICS": 
	{
		private _allStock = createHashMap;
		{ _allStock merge (_x call _fnc_extractMarketClasses) } forEach ["STATICMORTAR", "STATICAA", "STATICAT"];
		_allStock;
	};
	case "ALL": 
	{
		private _allStock = createHashMap;
		{ _allStock merge (_x call _fnc_extractMarketClasses) } forEach (keys A3U_blackMarketStock);
		_allStock;
	};
	default 
	{
		createHashMap;
	};
};

_buyableVehiclesHM;
