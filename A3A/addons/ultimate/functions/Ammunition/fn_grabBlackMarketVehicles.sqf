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

private _blackMarketStock = createHashMap;
private _blackMarketConds = createHashMap;
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

private _fnc_addVehicleToStock = {
    params ["_cfgPath", "_vehicle"];
    
    if !(isClass (configFile >> "CfgVehicles" >> _vehicle)) exitWith { Error_1("%1 does not exist in CfgVehicles. Skipped adding due to CTD issues if it is previewed.", _vehicle) };

    private _vehCfg = _cfgPath >> _vehicle;
    private _price = getNumber (_vehCfg >> "price");
    private _type = getText (_vehCfg >> "type");
    private _bmStock = _blackMarketStock getOrDefault [_type, createHashMap];
    if (isNil {_blackMarketConds get _type}) then {
        _blackMarketConds set [_type, compile getText (_vehCfg >> "condition")];
    };
    _bmStock set [_vehicle, _price];
    Verbose_4("Adding %1 with price: %2, type: %3", _vehicle, _price, _type);
    _blackMarketStock set [_type, _bmStock];
};

// Add a category's vehicles to stock, or to the ignore list if the DLC is disabled.
private _fnc_processCategory = {
    params ["_catCfg", "_isEnabled", "_isBlocking"];
    if !(isClass _catCfg) exitWith {};
    private _vehicles = _catCfg call BIS_fnc_getCfgSubClasses;
    if (_isEnabled) then {
        { [_catCfg, _x] call _fnc_addVehicleToStock; } forEach _vehicles;
        if (_isBlocking) then { _hasBlockingVehicles = true; };
    } else {
        _ignoreList append _vehicles;
    };
};

private _hasBlockingVehicles = false;
private _enabledDLCs = [missionNamespace, "A3A_enabledDLC", []] call BIS_fnc_getServerVariable;

{
    _x params ["_dlc", "_category", ["_additional", []]];
    private _isEnabled  = _dlc in _enabledDLCs;
    private _isBlocking = _blockingDLCs getOrDefault [_dlc, false];

    [_baseCfg >> "traderVehicles" >> _category, _isEnabled, _isBlocking] call _fnc_processCategory;

    {
        _x params ["_addCategory", "_checkClass"];
        private _classEnabled = _isEnabled && isClass (configFile >> "CfgVehicles" >> _checkClass);
        [_baseCfg >> "traderVehicles" >> _addCategory, _classEnabled, _isBlocking] call _fnc_processCategory;
    } forEach _additional;
} forEach _categories;

_ignoreList = _ignoreList arrayIntersect _ignoreList;

private _hasCustomModVehicles = false;

{
    private _addons = getArray (_baseCfg >> _x >> "addons");
    if (_addons isEqualTo []) then { continue };
    if !([_addons] call A3U_fnc_hasAddon) then {
        Verbose_1("Skipped %1 from adding to black market list. Addons requirements not met.", _x);
        continue;
    };

    private _vehicle = getText (_baseCfg >> _x >> "vehicles");
    if (_vehicle isEqualTo "") then { continue };

    private _vehicleCfg = _baseCfg >> "traderVehicles" >> _vehicle;
    if !(isClass _vehicleCfg) then { continue };

    {
        if (_x in _ignoreList) then {
            Verbose_1("Skipped %1 because it belongs to a disabled DLC.", _x);
            continue;
        };
        [_vehicleCfg, _x] call _fnc_addVehicleToStock;
        _hasCustomModVehicles = true;
    } forEach (_vehicleCfg call BIS_fnc_getCfgSubClasses);
} forEach (_baseCfg call BIS_fnc_getCfgSubClasses);

// Only add vanilla vehicles if no blocking/custom-mod vehicles are present, or if explicitly enabled
if ((!_hasBlockingVehicles && !_hasCustomModVehicles) || {vanillaArmsDealer isEqualTo true}) then {
    private _vehicleCfg = _baseCfg >> "traderVehicles" >> "vehicles_vanilla";
    { [_vehicleCfg, _x] call _fnc_addVehicleToStock } forEach (_vehicleCfg call BIS_fnc_getCfgSubClasses);
};

A3U_blackMarketStock = _blackMarketStock;
A3U_blackMarketConds = _blackMarketConds;

if (isServer) then {
	publicVariable "A3U_blackMarketStock"; // May not be the greatest thing but making it work between scopes is annoying
	publicVariable "A3U_blackMarketConds";
};

A3U_blackMarketStock;