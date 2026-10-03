/*
 * File: fn_initCoalition.sqf
 * Author: SvenBrandt99
 * Description:
 *    Initializes the runtime containers used by faction coalitions.
 *    Coalition data is separated into Occupant, Invader and Rival pools.
 * Params:
 *    None
 * Returns:
 *    Nothing
 * Example Usage:
 *    call A3A_fnc_initCoalition;
 */

A3A_coalitionConfig = createHashMapFromArray [
    ["occ", []],
    ["inv", []],
    ["riv", []]
];

A3A_coalitionFactions = createHashMapFromArray [
    ["occ", createHashMap],
    ["inv", createHashMap],
    ["riv", createHashMap]
];

// unique generated unit type -> faction HashMap
// Used as a redundant identity fallback for units created outside spawnGroup.
A3A_coalitionTypeFactionMap = createHashMap;

diag_log "[A3A Coalition] runtime configuration initialized (occ/inv/riv)";
