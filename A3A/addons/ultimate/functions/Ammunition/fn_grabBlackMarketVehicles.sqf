/*
    Author:
    Westalgie/wersal

    Description:
    Handles grabbing black market vehicles from config. Puts result into the A3U_blackMarketStock global space.

    Params:
	N/A

    Usage:
    [] call A3U_fnc_grabBlackMarketVehicles;
*/
private _blackMarketStock = [];
private _ignoreList = [];
private _baseCfg = (configFile >> "A3U" >> "traderAddons");

private _categories = [
    ["jets", "vehicles_jets"],
    ["kart", "vehicles_kart"],
    ["mark", "vehicles_marksmen"],
    ["tank", "vehicles_tanks"],
    ["orange", "vehicles_lawsofwar"],
    ["expansion", "vehicles_apex"],
    ["enoch", "vehicles_contact"],
    ["heli", "vehicles_helicopters"],
    ["vn", "vehicles_sog", [["vehicles_nickelsteel", "vnx_b_air_ac119_02_01"]]],
    ["spe", "vehicles_spe", [["vehicles_spex", "SPEX_M2_60"]]],
    ["ws", "vehicles_ws"],
    ["csla", "vehicles_csla"],
    ["rf", "vehicles_rf"],
    ["gm", "vehicles_gm"],
    ["ef", "vehicles_ef"]
];

// Processing all categories in a single loop
{
    _x params ["_dlc", "_category", ["_additional", []]];
    private _isEnabled = _dlc in A3A_enabledDLC;
    private _vehicleCfg = (_baseCfg >> "traderVehicles" >> _category);
    
    // Processing main category
    if (isClass _vehicleCfg) then {
        private _vehicles = _vehicleCfg call BIS_fnc_getCfgSubClasses;
        
        if (_isEnabled) then {
            // For enabled DLCs: add to blackMarketStock
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
        } else {
            // For disabled DLCs: add to ignoreList
            _ignoreList append _vehicles;
        };
    };
    
    // Processing additional categories
    {
        _x params ["_addCategory", "_checkClass"];
        private _classExists = isClass (configFile >> "cfgVehicles" >> _checkClass);
        private _addCfg = (_baseCfg >> "traderVehicles" >> _addCategory);
        
        if (isClass _addCfg) then {
            private _addVehicles = _addCfg call BIS_fnc_getCfgSubClasses;
            
            if (_isEnabled && _classExists) then {
                // For enabled DLCs: add to blackMarketStock
                {
                    if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
                        [format["%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x], _fnc_scriptName] call A3U_fnc_log;
                        continue;
                    };
                    private _price = getNumber (_addCfg >> _x >> "price");
                    private _type = getText (_addCfg >> _x >> "type");
                    private _condition = compile getText (_addCfg >> _x >> "condition");
                    _blackMarketStock pushBack [_x, _price, _type, _condition];
                    [format ["Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition], _fnc_scriptName] call A3U_fnc_log;
                } forEach _addVehicles;
            } else {
                // For disabled DLCs: add to ignoreList
                _ignoreList append _addVehicles;
            };
        };
    } forEach _additional;
} forEach _categories;

// Remove duplicates from ignore list
_ignoreList = _ignoreList arrayIntersect _ignoreList;

// Processing general configurations with ignore list check
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
    if !(isClass _vehicleCfg) then {continue};
    
    private _vehicles = _vehicleCfg call BIS_fnc_getCfgSubClasses;

    {
        // Check if vehicle is in ignore list
        if (_x in _ignoreList) then {
            [format["Skipped %1 because it belongs to a disabled DLC", _x], _fnc_scriptName] call A3U_fnc_log;
            continue;
        };
        
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