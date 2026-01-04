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
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _blackMarketStock = [];
private _ignoreList = [];
private _baseCfg = (configFile >> "A3U" >> "traderAddons");

// Define blocking DLCs (CDLC) - these should block vanilla vehicles
private _blockingDLCs = createHashMapFromArray [
    ["ws", true],
    ["gm", true],
    ["csla", true],
    ["rf", true],
    ["vn", true],
    ["spe", true],
    ["ef", true]
];

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

// Track if we have any blocking vehicles (from CDLC or custom mods)
private _hasBlockingVehicles = false;

// Processing all categories in a single loop
{
    _x params ["_dlc", "_category", ["_additional", []]];
    private _isEnabled = _dlc in ([missionNamespace, "A3A_enabledDLC", []] call BIS_fnc_getServerVariable);
    private _vehicleCfg = (_baseCfg >> "traderVehicles" >> _category);
    
    // Processing main category
    if (isClass _vehicleCfg) then {
        private _vehicles = _vehicleCfg call BIS_fnc_getCfgSubClasses;
        
        if (_isEnabled) then {
            // For enabled DLCs: add to blackMarketStock
            {
                if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
                    Error_1("%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x);
                    continue;
                };
                private _price = getNumber (_vehicleCfg >> _x >> "price");
                private _type = getText (_vehicleCfg >> _x >> "type");
                private _condition = compile getText (_vehicleCfg >> _x >> "condition");
                _blackMarketStock pushBack [_x, _price, _type, _condition];
                Verbose_4("Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition);
                
                // Mark as blocking if this is a CDLC
                if (_blockingDLCs getOrDefault [_dlc, false]) then {
                    _hasBlockingVehicles = true;
                };
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
                        Error_1("%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x);
                        continue;
                    };
                    private _price = getNumber (_addCfg >> _x >> "price");
                    private _type = getText (_addCfg >> _x >> "type");
                    private _condition = compile getText (_addCfg >> _x >> "condition");
                    _blackMarketStock pushBack [_x, _price, _type, _condition];
                    Verbose_4("Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition);
                    
                    // Mark as blocking if this is a CDLC
                    if (_blockingDLCs getOrDefault [_dlc, false]) then {
                        _hasBlockingVehicles = true;
                    };
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

// Track if we have any custom mod vehicles (not from DLC)
private _hasCustomModVehicles = false;

// Processing general configurations with ignore list check
private _cfg = _baseCfg call BIS_fnc_getCfgSubClasses; 
{
    private _addons = getArray (_baseCfg >> _x >> "addons");
    if (_addons isEqualTo []) then {continue};

    if (([_addons] call A3U_fnc_hasAddon) isEqualTo false) then {
        Verbose_1("Skipped %1 from adding to black market list. Addons requirements not met.", _x);
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
            Verbose_1("Skipped %1 because it belongs to a disabled DLC.", _x);
            continue;
        };
        
        if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
            Error_1("%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x);
            continue;
        };

        private _price = getNumber (_vehicleCfg >> _x >> "price");
        private _type = getText (_vehicleCfg >> _x >> "type");
        private _condition = compile getText (_vehicleCfg >> _x >> "condition");
        _blackMarketStock pushBack [_x, _price, _type, _condition];
        _hasCustomModVehicles = true; // Mark that we have custom mod vehicles

        Verbose_4("Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition);
    } forEach _vehicles;
} forEach _cfg;

// Special cases - only add vanilla if no blocking vehicles OR vanillaArmsDealer is true
if ((!_hasBlockingVehicles && !_hasCustomModVehicles) || {vanillaArmsDealer isEqualTo true}) then {
    private _vehicleCfg = (_baseCfg >> "traderVehicles" >> "vehicles_vanilla");
    private _vehicles = _vehicleCfg call BIS_fnc_getCfgSubClasses;

    {
        if !(isClass (configFile >> "CfgVehicles" >> _x)) then {
            Error_1("%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _x);
            continue;
        };
        
        private _price = getNumber (_vehicleCfg >> _x >> "price");
        private _type = getText (_vehicleCfg >> _x >> "type");
        private _condition = compile getText (_vehicleCfg >> _x >> "condition");
        _blackMarketStock pushBack [_x, _price, _type, _condition];

        Verbose_4("Adding %1 with price: %2, type: %3, condition: %4", _x, _price, _type, _condition);
    } forEach _vehicles;
};

A3U_blackMarketStock = _blackMarketStock;

if (isServer) then {
	publicVariable "A3U_blackMarketStock"; // May not be the greatest thing but making it work between scopes is annoying
};

A3U_blackMarketStock;