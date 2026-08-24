//	Author: Socrates/Silence/wersal
// 
//	Description:
//	Sets trader stock based on current mods loaded.
//  09/08/2023: Now has the ability to detect multiple mods and load them all into the trader.
//  03/06/2023: Now has the ability to not load non enabled dlc.
//
//	Returns:
//	Nothing.
//
// 	How to use: 
// 	[_traderX] call SCRT_fnc_trader_setStockType;
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_traderX"];

private _modsets = [];

// DLC to modset mapping (used for all sections)
private _modsetToDLC = createHashMapFromArray [
    ["ws", "ws"],
    ["marksmen", "mark"],
    ["lawsofwar", "orange"],
    ["tanks", "tank"],
    ["apex", "expansion"],
    ["contact", "enoch"],
    ["jets", "jets"],
    ["artofwar", "aow"],
    ["kart", "kart"],
    ["globmob", "gm"],
    ["csla", "csla"],
    ["rf", "rf"],
    ["vn", "vn"],
    ["ww2cdlc", "spe"],
    ["ef", "ef"]
];

// Special modsets that require class checks
private _specialModsets = [
    ["nickelsteel", "vn", "vnx_b_air_ac119_02_01"],
    ["spex", "spe", "SPEX_M2_60"]
];

// Define which DLC/CDLC are considered modsets (block vanilla)
private _modsetDLCs = createHashMapFromArray [
    ["ws", true],
    ["globmob", true],
    ["csla", true],
    ["rf", true],
    ["vn", true],
    ["ww2cdlc", true],
    ["ef", true]
];

// Process old config format with DLC check
private _oldCfg = (configFile >> "A3U" >> "traderMods") call BIS_fnc_getCfgSubClasses;
if (_oldCfg isNotEqualTo []) then {
    {
        private _addons = getArray (configFile >> "A3U" >> "traderMods" >> _x >> "addons");
        private _prefix = getText (configFile >> "A3U" >> "traderMods" >> _x >> "prefix");

        // Check if this modset is associated with a DLC
        private _dlc = _modsetToDLC get _prefix;
        if (!isNil "_dlc" && {!(_dlc in A3A_enabledDLC)}) then {
            Verbose_2("Skipped DLC-based modset %1 (DLC %2 not enabled)", _prefix, _dlc);
            continue;
        };

        if ([_addons] call A3U_fnc_hasAddon) then {
            _modsets pushBackUnique _prefix;
            Error_1("Added %1 to _modsets list (old version). It is now deprecated and should be updated ASAP.", _prefix);
        };
    } forEach _oldCfg;
};

// Process new config format with DLC check
private _baseCfg = (configFile >> "A3U" >> "traderAddons");
private _cfg = _baseCfg call BIS_fnc_getCfgSubClasses;
private _ignoreClasses = ["traderWeapons", "traderVehicles"];

{
    if (_x in _ignoreClasses) then {continue};
    private _addons = getArray (_baseCfg >> _x >> "addons");
    if (_addons isEqualTo []) then {continue};
    private _weapons = getText (_baseCfg >> _x >> "weapons");
    if (_weapons isEqualTo "") then {continue};
    private _prefix = getText (_baseCfg >> "traderWeapons" >> _weapons >> "prefix");
    if (isNil "_prefix" || {_prefix isEqualTo ""}) then {continue};

    // Check if this modset is associated with a DLC
    private _dlc = _modsetToDLC get _prefix;
    if (!isNil "_dlc" && {!(_dlc in A3A_enabledDLC)}) then {
        Verbose_2("Skipped DLC-based modset %1 (DLC %2 not enabled)", _prefix, _dlc);
        continue;
    };

    if ([_addons] call A3U_fnc_hasAddon) then {
        _modsets pushBackUnique _prefix;
        Verbose_1("Added %1 to _modsets list.", _prefix);
    };
} forEach _cfg;

// Process regular DLC modsets with enabled check
{
    private _modset = _x;
    private _dlc = _y;
    
    if (_dlc in A3A_enabledDLC) then {
        _modsets pushBackUnique _modset;
    };
} forEach _modsetToDLC;

// Process special modsets with class checks
{
    _x params ["_modset", "_dlc", "_checkClass"];
    
    if (_dlc in A3A_enabledDLC && {isClass (configFile >> "cfgVehicles" >> _checkClass)}) then {
        _modsets pushBackUnique _modset;
    };
} forEach _specialModsets;

// Check if we have any blocking modsets (CDLC or custom mods)
private _hasBlockingModsets = false;
{
    private _currentModset = _x;
    // Blocking modsets are: CDLC modsets OR any custom mods (not in _modsetToDLC and not in _specialModsets)
    private _isSpecialModset = false;
    {
        if (_x#0 == _currentModset) exitWith { _isSpecialModset = true; };
    } forEach _specialModsets;
    
    if (_modsetDLCs getOrDefault [_currentModset, false] || 
        (isNil {_modsetToDLC get _currentModset} && !_isSpecialModset)) then {
        _hasBlockingModsets = true;
    };
} forEach _modsets;

// Handle vanilla modset - only add if no blocking modsets OR vanillaArmsDealer is true
if (!_hasBlockingModsets || {vanillaArmsDealer isEqualTo true}) then {
    _modsets pushBackUnique "vanilla";
};

// Always add A3A Ultimate modset
_modsets pushBackUnique "a3u";

if ("coldWar" in A3A_factionEquipFlags) then { // 3cbf cold war //why do it this way?
    _modsets pushBack "3cbfcw";
};

[_traderX, _modsets] call HALs_store_fnc_addTrader;

[] call SCRT_fnc_trader_removeUnlockedItemsFromStock;