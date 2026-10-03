/*
    A3A_fnc_compatibilityLoadFaction.

    This keeps normal A3AU loading intact, then loads configured EXTRA
    coalition factions for WEST/OCC and EAST/INV under unique unit aliases.
    
    Coalition integration:
      The primary faction is loaded through the normal AU path. After the
      primary faction has been registered, configured coalition templates for
      Occupants or Invaders are loaded into separate runtime pools.
 */
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_file", "_side"];

Info_2(
    "Compatibility loading template: '%1' as side %2",
    _file,
    _side
);

private _defaultName = "EnemyDefaults";
private _factionPrefix = "";

if (_side isEqualTo Occupants) then {
    _factionPrefix = "occ";
} else {
    if (_side isEqualTo Invaders) then {
        _factionPrefix = "inv";
    } else {
        if (_side isEqualTo independent) then {
            _factionPrefix = "reb";
            _defaultName = "RebelDefaults";
        } else {
            if (_side isEqualTo civilian) then {
                _factionPrefix = "civ";
                _defaultName = "CivilianDefaults";
            };
        };
    };
};

if (_factionPrefix == "") exitWith {
    diag_log format [
        "[A3A Coalition] ERROR compatibilityLoadFaction unmapped side=%1 occupants=%2 invaders=%3",
        _side,
        Occupants,
        Invaders
    ];
    createHashMap
};

private _factionDefaultFile = format [
    "\x\A3A\addons\core\Templates\Templates\FactionDefaults\%1.sqf",
    _defaultName
];

diag_log format [
    "[A3A Coalition] compatibilityLoadFaction side=%1 prefix=%2 default='%3' faction='%4'",
    _side,
    _factionPrefix,
    _factionDefaultFile,
    _file
];

private _faction = [
    [
        _factionDefaultFile,
        _file
    ]
] call A3A_fnc_loadFaction;

missionNamespace setVariable ["A3A_faction_" + _factionPrefix, _faction];
[_faction, _factionPrefix] call A3A_fnc_compileGroups;

private _unitClassMap = _side call SCRT_fnc_unit_getUnitMap;
private _baseUnitClass = switch (_side) do {
    case west:        { "a3a_unit_west" };
    case east:        { "a3a_unit_east" };
    case independent: { "a3a_unit_reb" };
    case civilian:    { "a3a_unit_civ" };
};

private _loadoutsPrefix = format ["loadouts_%1_", _factionPrefix];
private _allDefinitions = _faction get "loadouts";

#if __A3_DEBUG__
    [_faction, _file] call A3A_fnc_TV_verifyLoadoutsData;
#endif

{
    private _loadoutName = _x;
    private _definition = _y;
    private _unitClass = _unitClassMap getOrDefault [_loadoutName, _baseUnitClass];

    [
        _loadoutsPrefix + _loadoutName,
        _definition + [_unitClass]
    ] call A3A_fnc_registerUnitType;
} forEach _allDefinitions;

#if __A3_DEBUG__
    [_faction, _side, _file] call A3A_fnc_TV_verifyAssets;
#endif

if (_side in [Occupants, Invaders]) then {
    private _lightArmedTroop = (_faction get "vehiclesLightArmed") select {
        ([_x, true] call BIS_fnc_crewCount) - ([_x, false] call BIS_fnc_crewCount) >= 4
    };
    _faction set ["vehiclesLightArmedTroop", _lightArmedTroop];

    private _vehArmor =
        (_faction getOrDefault ["vehiclesTanks", [], true])
        + (_faction getOrDefault ["vehiclesAA", [], true])
        + (_faction getOrDefault ["vehiclesArtillery", [], true])
        + (_faction getOrDefault ["vehiclesLightAPCs", [], true])
        + (_faction getOrDefault ["vehiclesAPCs", [], true])
        + (_faction getOrDefault ["vehiclesLightTanks", [], true])
        + (_faction getOrDefault ["vehiclesAirborne", [], true])
        + (_faction getOrDefault ["vehiclesIFVs", [], true]);

    _faction set ["vehiclesArmor", _vehArmor];
};

// Load the optional extra normal AU factions after the base faction is ready.
// Only do it for enemy sides.
if (_factionPrefix in ["occ", "inv"]) then {
    if (isNil "A3A_coalitionConfig") then {
        call A3A_fnc_initCoalition;
    };
    [_factionPrefix] call A3A_fnc_loadCoalitionForSide;
};

_faction
