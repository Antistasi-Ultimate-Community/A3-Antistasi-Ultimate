/*
 * File: fn_loadCoalitionFaction.sqf
 * Author: SvenBrandt99
 * Description:
 *    Loads one additional faction template into a coalition without replacing
 *    the primary faction for that side. Unit loadouts are registered under
 *    unique generated type names so identities and equipment remain tied to
 *    the faction that was selected for the group.
 * Params:
 *    _side   - Physical Arma side used for base unit classes and verification
 *    _prefix - Coalition slot: "occ", "inv" or "riv"
 *    _tag    - Template/config name used as the coalition faction identifier
 *    _file   - Faction template SQF path
 * Returns:
 *    Boolean - true when the faction was loaded successfully
 * Example Usage:
 *    [Occupants, "occ", "3CB_BAF", "\x\A3A\addons\core\Templates\Templates\...\Faction.sqf"] call A3A_fnc_loadCoalitionFaction;
 */

params [
    ["_side", sideUnknown, [west]],
    ["_prefix", "", [""]],
    ["_tag", "", [""]],
    ["_file", "", [""]]
];

if !(_prefix in ["occ", "inv", "riv"]) exitWith {
    diag_log format [
        "[A3A Coalition] ERROR loadCoalitionFaction invalid prefix='%1' tag='%2'",
        _prefix,
        _tag
    ];
    false
};

if (_tag == "" || {_file == ""}) exitWith {
    diag_log format [
        "[A3A Coalition] ERROR loadCoalitionFaction invalid entry prefix='%1' tag='%2' file='%3'",
        _prefix,
        _tag,
        _file
    ];
    false
};

if (isNil "A3A_coalitionFactions") then {
    call A3A_fnc_initCoalition;
};

private _defaultFile =
    "\x\A3A\addons\core\Templates\Templates\FactionDefaults\EnemyDefaults.sqf";

private _faction = [
    [
        _defaultFile,
        _file
    ]
] call A3A_fnc_loadFaction;

if !(_faction isEqualType createHashMap) exitWith {
    diag_log format [
        "[A3A Coalition] ERROR faction did not parse as HashMap tag='%1' file='%2'",
        _tag,
        _file
    ];
    false
};

private _coalitionPrefix = format [
    "%1_%2",
    _prefix,
    _tag
];

// Compile the extra faction's groups under a unique namespace.
// We intentionally do NOT replace A3A_faction_occ/inv/riv.
[
    _faction,
    _coalitionPrefix
] call A3A_fnc_compileGroups;


// -------------------------------------------------------------------------
// Unit base-class lookup
// -------------------------------------------------------------------------

private _baseUnitClass = "";
private _unitClassMap = createHashMap;

if (_prefix == "riv") then {
    /*
        Mirrors A3AU fn_loadRivals.
        Rivals use their own logical loadout names and OPFOR guerilla
        base classes rather than SCRT_fnc_unit_getUnitMap.
    */
    _unitClassMap = [
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

    _baseUnitClass = "O_G_Soldier_F";
} else {
    _unitClassMap = _side call SCRT_fnc_unit_getUnitMap;

    _baseUnitClass = switch (_side) do {
        case west: { "a3a_unit_west" };
        case east: { "a3a_unit_east" };
        default { "a3a_unit_east" };
    };
};


// -------------------------------------------------------------------------
// Register unique unit aliases + primary->coalition mapping
// -------------------------------------------------------------------------

private _allDefinitions = _faction getOrDefault [
    "loadouts",
    createHashMap
];

private _unitMap = createHashMap;

{
    private _loadoutName = _x;
    private _definition = _y;

    private _unitClass = _unitClassMap getOrDefault [
        _loadoutName,
        _baseUnitClass
    ];

    private _genericType = format [
        "loadouts_%1_%2",
        _prefix,
        _loadoutName
    ];

    private _uniqueType = format [
        "loadouts_%1_%2_%3",
        _prefix,
        _tag,
        _loadoutName
    ];

    [
        _uniqueType,
        _definition + [_unitClass]
    ] call A3A_fnc_registerUnitType;

    _unitMap set [
        _genericType,
        _uniqueType
    ];

    A3A_coalitionTypeFactionMap set [
        _uniqueType,
        _faction
    ];

} forEach _allDefinitions;

_faction set [
    "A3A_coalitionUnitMap",
    _unitMap
];

_faction set [
    "A3A_coalitionPrefix",
    _prefix
];

_faction set [
    "A3A_coalitionTag",
    _tag
];


// -------------------------------------------------------------------------
// Derived vehicle arrays used by A3AU
// -------------------------------------------------------------------------

private _lightArmed = _faction getOrDefault [
    "vehiclesLightArmed",
    []
];

if (_lightArmed isEqualType []) then {
    private _lightArmedTroop = _lightArmed select {
        ([_x, true] call BIS_fnc_crewCount)
        - ([_x, false] call BIS_fnc_crewCount)
        >= 4
    };

    _faction set [
        "vehiclesLightArmedTroop",
        _lightArmedTroop
    ];
};

private _vehArmor =
    (_faction getOrDefault ["vehiclesTanks", []])
    + (_faction getOrDefault ["vehiclesAA", []])
    + (_faction getOrDefault ["vehiclesArtillery", []])
    + (_faction getOrDefault ["vehiclesLightAPCs", []])
    + (_faction getOrDefault ["vehiclesAPCs", []])
    + (_faction getOrDefault ["vehiclesLightTanks", []])
    + (_faction getOrDefault ["vehiclesAirborne", []])
    + (_faction getOrDefault ["vehiclesIFVs", []]);

_faction set [
    "vehiclesArmor",
    _vehArmor arrayIntersect _vehArmor
];

#if __A3_DEBUG__
    [_faction, _file] call A3A_fnc_TV_verifyLoadoutsData;
    [_faction, _side, _file] call A3A_fnc_TV_verifyAssets;
#endif


// -------------------------------------------------------------------------
// Add to runtime pool
// -------------------------------------------------------------------------

private _pool = A3A_coalitionFactions getOrDefault [
    _prefix,
    createHashMap
];

_pool set [
    _tag,
    _faction
];

A3A_coalitionFactions set [
    _prefix,
    _pool
];

diag_log format [
    "[A3A Coalition] LOADED tag='%1' prefix='%2' name='%3' units=%4 coalitionPool=%5",
    _tag,
    _prefix,
    _faction getOrDefault ["name", _tag],
    count _unitMap,
    keys _pool
];

true
