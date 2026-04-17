/*
 * File: fn_loadRivals.sqf
 * Author: Socrates (based on Spoffy's code)
 * Description:
 *    Loads a rivals faction definition file.
 * Params:
 *    _file - Faction definition file path
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */

#include "..\..\script_component.hpp"

params [
	["_file","",[""]]
];

private _factionDefaultFile = "EnemyDefaults";
_factionDefaultFile = QPATHTOFOLDER(Templates\Templates\FactionDefaults) + "\" + _factionDefaultFile + ".sqf";

private _faction = [[_factionDefaultFile,_file]] call A3A_fnc_loadFaction;
private _factionPrefix = "riv";
missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction];
[_faction, _factionPrefix] call A3A_fnc_compileGroups;

private _unitClassMap = [
	"militia_Cellleader",
	"militia_Partisan",
	"militia_Minuteman",
	"militia_Mercenary",
	"militia_Enforcer",
	"militia_Medic",
	"militia_Saboteur",
	"militia_Specialistat",
	"militia_Specialistaa",
	"militia_Oppressor",
	"militia_Explosivesexpert",
	"militia_Sharpshooter",
	"militia_Commander",
	"militia_Crew",
	"militia_Pilot",
	"militia_Unarmed"
] createHashMapFromArray [
	"O_G_Soldier_SL_F",
	"O_G_Soldier_LAT2_F",
	"O_G_Soldier_F",
	"O_Soldier_F",
	"O_G_Soldier_F",
	"O_G_medic_F",
	"O_G_Soldier_GL_F",
	"O_G_Soldier_LAT_F",
	"O_Soldier_AA_F",
	"O_G_Soldier_AR_F",
	"O_soldier_exp_F",
	"O_G_Soldier_M_F",
	"O_G_officer_F",
	"O_crew_F",
	"O_Pilot_F",
	"O_G_Survivor_F"
];

private _baseUnitClass = "O_G_Soldier_F";

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
    [_faction, east, _file] call A3A_fnc_TV_verifyAssets;
#endif

_faction;
