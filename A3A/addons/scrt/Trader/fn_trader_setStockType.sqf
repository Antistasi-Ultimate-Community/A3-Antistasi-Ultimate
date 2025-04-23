//	Author: Socrates/Silence
// 
//	Description:
//	Sets trader stock based on current mods loaded.
//  09/08/2023: Now has the ability to detect multiple mods and load them all into the trader.
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

private _oldCfg = (configFile >> "A3U" >> "traderMods") call BIS_fnc_getCfgSubClasses;

if (_oldCfg isNotEqualTo []) then {
    {
        private _addons = getArray (configFile >> "A3U" >> "traderMods" >> _x >> "addons");
        private _prefix = getText (configFile >> "A3U" >> "traderMods" >> _x >> "prefix");

        if ([_addons] call A3U_fnc_hasAddon) then {
            _modsets pushBack _prefix;
            [format ["Added %1 to _modsets list (old version). It is now deprecated and should be updated ASAP.", _prefix]] call A3U_fnc_log;
        };
    } forEach _oldCfg;
};

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

    if ([_addons] call A3U_fnc_hasAddon) then {
        _modsets pushBack _prefix;
        [format ["Added %1 to _modsets list.", _prefix]] call A3U_fnc_log;
    };
} forEach _cfg;

private _vanillaModsets = ["vanilla", "apex", "artofwar", "contact", "jets", "kart", "lawsofwar", "marksmen", "tanks"];

// Special cases
if (_modsets isEqualTo [] || {vanillaArmsDealer isEqualTo true}) then {_modsets append _vanillaModsets}; // If it still hasn't got anything by this point, we can safely assume no supported mods are loaded.

if ("coldWar" in A3A_factionEquipFlags) then { // 3cbf cold war
    _modsets pushBack "3cbfcw";
};

[_traderX, _modsets] call HALs_store_fnc_addTrader;

[] call SCRT_fnc_trader_removeUnlockedItemsFromStock;