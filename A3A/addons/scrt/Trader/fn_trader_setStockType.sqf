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

private _modsetsSet = createHashMap;

// DLC to modset mapping (used for all sections)
private _dlcModsets = [
    ["ws", "ws", []],
    ["mark", "marksmen", []],
    ["orange", "lawsofwar", []],
    ["tank", "tanks", []],
    ["expansion", "apex", []],
    ["enoch", "contact", []],
    ["jets", "jets", []],
    ["aow", "artofwar", []],
    ["kart", "kart", []],
    ["gm", "globmob", []],
    ["csla", "csla", []],
    ["rf", "rf", []],
    ["vn", "vn", [["nickelsteel", "vnx_b_air_ac119_02_01"]]],
    ["spe", "ww2cdlc", [["spex", "SPEX_M2_60"]]],
    ["ef", "ef", []]
];

// Build a mapping from modset to DLC
private _modsetToDLC = createHashMap;
{
    _x params ["_dlc", "_modset", ["_additional", []]];
    _modsetToDLC set [_modset, _dlc];
    { _modsetToDLC set [_x#0, _dlc] } forEach _additional;
} forEach _dlcModsets;

// Process old config format with DLC check
private _oldCfg = (configFile >> "A3U" >> "traderMods") call BIS_fnc_getCfgSubClasses;
if (_oldCfg isNotEqualTo []) then {
    {
        private _addons = getArray (configFile >> "A3U" >> "traderMods" >> _x >> "addons");
        private _prefix = getText (configFile >> "A3U" >> "traderMods" >> _x >> "prefix");

        // Check if this modset is associated with a DLC
        if (_modsetToDLC getOrDefault [_prefix, ""] != "") then {
            private _dlc = _modsetToDLC get _prefix;
            if !(_dlc in A3A_enabledDLC) then {
                [format ["Skipped DLC-based modset %1 (DLC %2 not enabled)", _prefix, _dlc]] call A3U_fnc_log;
                continue;
            };
        };

        if ([_addons] call A3U_fnc_hasAddon) then {
            _modsetsSet set [_prefix, true];
            [format ["Added %1 to _modsets list (old version). It is now deprecated and should be updated ASAP.", _prefix]] call A3U_fnc_log;
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
    if (_modsetToDLC getOrDefault [_prefix, ""] != "") then {
        private _dlc = _modsetToDLC get _prefix;
        if !(_dlc in A3A_enabledDLC) then {
            [format ["Skipped DLC-based modset %1 (DLC %2 not enabled)", _prefix, _dlc]] call A3U_fnc_log;
            continue;
        };
    };

    if ([_addons] call A3U_fnc_hasAddon) then {
        _modsetsSet set [_prefix, true];
        [format ["Added %1 to _modsets list.", _prefix]] call A3U_fnc_log;
    };
} forEach _cfg;

// Process DLC modsets with enabled check
{
    _x params ["_dlc", "_modset", ["_additional", []]];
    if (_dlc in A3A_enabledDLC) then {
        _modsetsSet set [_modset, true];
        
        {
            _x params ["_addModset", "_checkClass"];
            if (isClass (configFile >> "cfgVehicles" >> _checkClass)) then {
                _modsetsSet set [_addModset, true];
            };
        } forEach _additional;
    };
} forEach _dlcModsets;

// Convert set to array
private _modsets = keys _modsetsSet;

// Handle vanilla modset
private _vanillaModset = ["vanilla"];
if (_modsets isEqualTo [] || {vanillaArmsDealer isEqualTo true}) then {
    _modsets append _vanillaModset;
};

if ("coldWar" in A3A_factionEquipFlags) then { // 3cbf cold war //why do it this way?
    _modsets pushBack "3cbfcw";
};

[_traderX, _modsets] call HALs_store_fnc_addTrader;

[] call SCRT_fnc_trader_removeUnlockedItemsFromStock;