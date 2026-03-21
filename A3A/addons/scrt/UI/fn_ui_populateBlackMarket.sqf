#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
	["_category", "", [""]]
];

private _fnc_extractMarketClasses = {
	params ["_type"];
    private _stock = A3U_blackMarketStock getOrDefault [_type, createHashMap];

	private _isAvailable = call (_stock getOrDefault ["condition", {true}]);
    if (!_isAvailable) exitWith {createHashMap};

	_stock;
};

private _buyableVehiclesHM = switch (_category) do 
{
    case "artillery": 
	{
        "ARTILLERY" call _fnc_extractMarketClasses;
    };
	case "apc": 
	{
		"APC" call _fnc_extractMarketClasses;
	};
	case "AA": 
	{
		"AA" call _fnc_extractMarketClasses;
	};
	case "uav": 
	{
		"UAV" call _fnc_extractMarketClasses;
	};
	case "tank": 
	{
		"TANK" call _fnc_extractMarketClasses;
	};
	case "statics": 
	{
		private _allStock = createHashMap;
		{ _allStock merge (_x call _fnc_extractMarketClasses) } forEach ["STATICMORTAR", "STATICAA", "STATICAT"];
		_allStock;
	};
	case "heli": 
	{
		"HELI" call _fnc_extractMarketClasses;
	};
	case "plane": 
	{
		"PLANE" call _fnc_extractMarketClasses;
	};
	case "armedcar": 
	{
		"ARMEDCAR" call _fnc_extractMarketClasses;
	};
	case "unarmedcar": 
	{
		"UNARMEDCAR" call _fnc_extractMarketClasses;
	};
	case "boat": 
	{
		"BOAT" call _fnc_extractMarketClasses;
	};
	case "all": 
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
