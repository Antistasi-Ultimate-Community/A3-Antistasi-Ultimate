/*

 * File: fn_compatabilityLoadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file, and transforms it into the old global variable system for sides.
 * Params:
 *    _file - Faction definition file path
 *    _side - Side to load them in as
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_file", "_side"];

Info_2("Compatibility loading template: '%1' as side %2", _file, _side);

private _factionDefaultFile = ["EnemyDefaults","EnemyDefaults","RebelDefaults","CivilianDefaults"] #([west, east, independent, civilian] find _side);
_factionDefaultFile = QPATHTOFOLDER(Templates\Templates\FactionDefaults) + "\" + _factionDefaultFile + ".sqf";

private _faction = [[_factionDefaultFile,_file]] call A3A_fnc_loadFaction;
private _factionPrefix = ["occ", "inv", "reb", "civ"] #([west, east, independent, civilian] find _side);
missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction];
[_faction, _factionPrefix] call A3A_fnc_compileGroups;

private _unitClassMap = _side call SCRT_fnc_unit_getUnitMap;
private _baseUnitClass = switch (_side) do {
    case west: { "a3a_unit_west" };
    case east: { "a3a_unit_east" };
    case independent: { "a3a_unit_reb" };
    case civilian: { "a3a_unit_civ" };
};

//validate loadouts
private _loadoutsPrefix = format ["loadouts_%1_", _factionPrefix];
private _allDefinitions = _faction get "loadouts";

#if __A3_DEBUG__
    [_faction, _file] call A3A_fnc_TV_verifyLoadoutsData;
#endif

//Register loadouts globally.
{
    private _loadoutName = _x;
    private _unitClass = _unitClassMap getOrDefault [_loadoutName, _baseUnitClass];
    [_loadoutsPrefix + _loadoutName, _y + [_unitClass]] call A3A_fnc_registerUnitType;
} forEach _allDefinitions;

#if __A3_DEBUG__
    [_faction, _side, _file] call A3A_fnc_TV_verifyAssets;
#endif

if (_side in [Occupants, Invaders]) then {
    // Compile light armed that also have 4+ passenger seats
    private _lightArmedTroop = (_faction get "vehiclesLightArmed") select {
        ([_x, true] call BIS_fnc_crewCount) - ([_x, false] call BIS_fnc_crewCount) >= 4
    };
    _faction set ["vehiclesLightArmedTroop", _lightArmedTroop];
};

_faction;
