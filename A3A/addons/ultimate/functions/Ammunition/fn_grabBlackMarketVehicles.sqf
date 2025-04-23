/*
    Author:
    Westalgie

    Description:
    Handles grabbing black market vehicles from config. Puts result into the A3U_blackMarketStock global space.

    Params:
	N/A

    Usage:
    [] call A3U_fnc_grabBlackMarketVehicles;
*/
private _blackMarketStock = [];

private _baseCfg = (configFile >> "A3U" >> "traderAddons");
private _cfg = _baseCfg call BIS_fnc_getCfgSubClasses; 

{
    private _addons = getArray (_baseCfg >> _x >> "addons");
    if (_addons isEqualTo []) then {continue};

	if (([_addons] call A3U_fnc_hasAddon) isEqualTo false) then {
		[format ["Skipped %1 from adding to black market list. Addons requirements not met.", _x], _fnc_scriptName] call A3U_fnc_log;
		continue;
	};
	
	private _vehicle = getText (_baseCfg >> _x >> "vehicles");
	if (isNil "_vehicle" || {_vehicle isEqualTo ""}) then {continue};

	private _vehicleCfg = (_baseCfg >> "traderVehicles" >> _vehicle);
	private _vehicles = _vehicleCfg call BIS_fnc_getCfgSubClasses;

	{
		if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
			[format["%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x], _fnc_scriptName] call A3U_fnc_log;
			continue;
		};

		private _price = getNumber (_vehicleCfg >> _x >> "price");
		private _type = getText (_vehicleCfg >> _x >> "type");
		private _condition = compile getText (_vehicleCfg >> _x >> "condition");
		_blackMarketStock pushBack [_x, _price, _type, _condition];

		[format ["Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition], _fnc_scriptName] call A3U_fnc_log;
	} forEach _vehicles;

} forEach _cfg;

// Special cases
if (_blackMarketStock isEqualTo [] || {vanillaArmsDealer isEqualTo true}) then {
	private _vehicleCfg = (_baseCfg >> "traderVehicles" >> "vehicles_vanilla");
	private _vehicles = _vehicleCfg call BIS_fnc_getCfgSubClasses;

	{
		if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
			[format["%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x], _fnc_scriptName] call A3U_fnc_log;
			continue;
		};

		private _price = getNumber (_vehicleCfg >> _x >> "price");
		private _type = getText (_vehicleCfg >> _x >> "type");
		private _condition = compile getText (_vehicleCfg >> _x >> "condition");
		_blackMarketStock pushBack [_x, _price, _type, _condition];

		[format ["Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition], _fnc_scriptName] call A3U_fnc_log;
	} forEach _vehicles;
};

A3U_blackMarketStock = _blackMarketStock;

if (isServer) then {
	publicVariable "A3U_blackMarketStock"; // May not be the greatest thing but making it work between scopes is annoying
};

A3U_blackMarketStock;