/*
    Coalition Coalition override of A3A_fnc_spawnGroup
     A single compatible faction is selected per group. Generic AU loadout
     types are resolved to the selected faction before units are created.
     Rebels and civilians continue to use the normal AU behaviour.
    Behaviour:
    - WEST and EAST can use coalition factions.
    - One faction is selected PER GROUP.
    - The original/main A3AU faction is also part of the random pool.
    - GUER/CIV/Rivals are left completely untouched.
    - If the selected coalition faction cannot provide the entire group,
      the normal A3AU faction is used instead.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    "_positionX",
    "_sideX",
    "_typesX"
];

private _groupX = createGroup _sideX;


// ========================================================================
// Coalition selection
// ========================================================================

private _prefix = "";

{
    if (_x isEqualType "") then {
        if ((_x find "loadouts_riv_") == 0) exitWith { _prefix = "riv"; };
        if ((_x find "loadouts_occ_") == 0) exitWith { _prefix = "occ"; };
        if ((_x find "loadouts_inv_") == 0) exitWith { _prefix = "inv"; };
    };
} forEach _typesX;

if (_prefix == "") then {
    if (_sideX isEqualTo Occupants) then {
        _prefix = "occ";
    } else {
        if (_sideX isEqualTo Invaders) then {
            _prefix = "inv";
        };
    };
};

private _selectedTag = "";
private _resolvedTypes = +_typesX;


/*
    IMPORTANT:
    Only WEST/Occupier and EAST/Invader use coalition logic.

    GUER, CIV and any other sides continue with normal A3AU behaviour.
*/
if (
    _prefix != ""
    && {!isNil "A3A_coalitionFactions"}
) then {

    private _sidePool = A3A_coalitionFactions getOrDefault [
        _prefix,
        createHashMap
    ];

    private _coalitionTags = keys _sidePool;


    // --------------------------------------------------------------------
    // Determine which coalition factions can actually spawn this group.
    // --------------------------------------------------------------------

    private _compatibleTags = [];

    {
        private _tag = _x;

        private _coalitionFaction = _sidePool getOrDefault [
            _tag,
            createHashMap
        ];

        private _unitMap = _coalitionFaction getOrDefault [
            "A3A_coalitionUnitMap",
            createHashMap
        ];

        private _compatible = true;


        {
            private _requestedType = _x;

            /*
                Only generated A3AU loadout names have to be translated.

                Things such as direct CfgVehicles classes should remain
                unchanged and therefore do not affect compatibility.
            */
            if (
                _requestedType isEqualType ""
                && {
                    (_requestedType find "loadouts_") == 0
                }
            ) then {

                private _coalitionType = _unitMap getOrDefault [
                    _requestedType,
                    ""
                ];

                if (_coalitionType == "") then {
                    _compatible = false;
                };

            };

        } forEach _typesX;


        if (_compatible) then {
            _compatibleTags pushBack _tag;
        };

    } forEach _coalitionTags;


    /*
        BASE means:
            Use the normal faction selected in Antistasi.

        Example WEST:
            BASE = AMF
            BAF  = coalition faction

        Example EAST:
            BASE = ION
            AFRF = coalition faction

        This gives every group a random faction, while retaining the
        normal faction selected through Antistasi's setup menu.
    */
    private _selectionPool = ["BASE"];

    {
        _selectionPool pushBack _x;
    } forEach _compatibleTags;


    _selectedTag = selectRandom _selectionPool;


    // --------------------------------------------------------------------
    // Resolve entire group if a coalition faction was selected.
    // --------------------------------------------------------------------

    if (_selectedTag != "BASE") then {

        private _selectedFaction = _sidePool getOrDefault [
            _selectedTag,
            createHashMap
        ];

        private _unitMap = _selectedFaction getOrDefault [
            "A3A_coalitionUnitMap",
            createHashMap
        ];

        _resolvedTypes = [];


        {
            private _requestedType = _x;
            private _resolvedType = _requestedType;


            if (
                _requestedType isEqualType ""
                && {
                    (_requestedType find "loadouts_") == 0
                }
            ) then {

                _resolvedType = _unitMap getOrDefault [
                    _requestedType,
                    _requestedType
                ];

            };


            _resolvedTypes pushBack _resolvedType;

        } forEach _typesX;

    };


    // Store coalition role + selected faction on the group.
    _groupX setVariable [
        "A3A_coalitionPrefix",
        _prefix,
        false
    ];

    _groupX setVariable [
        "A3A_coalitionTag",
        _selectedTag,
        false
    ];


    diag_log format [
        "[A3A Coalition] spawnGroup side=%1 prefix=%2 selected='%3' compatible=%4 original=%5 resolved=%6",
        _sideX,
        _prefix,
        _selectedTag,
        _compatibleTags,
        _typesX,
        _resolvedTypes
    ];

};


// ========================================================================
// Original A3AU spawnGroup behaviour
// ========================================================================

private _ranks = [
    "LIEUTENANT",
    "SERGEANT",
    "CORPORAL"
];

private _countX = count _resolvedTypes;


if (_countX < 4) then {

    _ranks = _ranks - [
        "LIEUTENANT",
        "SERGEANT"
    ];

} else {

    if (_countX < 8) then {
        _ranks = _ranks - [
            "LIEUTENANT"
        ];
    };

};


private _countRanks = count _ranks - 1;

Debug_2(
    "Side: %1 spawning group composition: %2",
    _sideX,
    _resolvedTypes
);


// ========================================================================
// Spawn units
// ========================================================================

for "_i" from 0 to (_countX - 1) do {

    private _resolvedType =
        _resolvedTypes select _i;

    /*
        Keep original type separately.

        This matters for leader detection because the main A3AU faction
        knows the generic type, not our coalition-prefixed alias.
    */
    private _originalType =
        _typesX select _i;


    private _unit = [
        _groupX,
        _resolvedType,
        _positionX,
        [],
        0,
        "NONE"
    ] call A3A_fnc_createUnit;


    if (!isNull _unit) then {

        _unit allowDamage false;


        // ---------------------------------------------------------------
        // Rank
        // ---------------------------------------------------------------

        if (_i <= _countRanks) then {
            _unit setRank (
                _ranks select _i
            );
        };


        // ---------------------------------------------------------------
        // Leader
        // ---------------------------------------------------------------

        private _leaderFaction = switch (_prefix) do {
            case "occ": {
                missionNamespace getVariable [
                    "A3A_faction_occ",
                    createHashMap
                ]
            };

            case "inv": {
                missionNamespace getVariable [
                    "A3A_faction_inv",
                    createHashMap
                ]
            };

            case "riv": {
                missionNamespace getVariable [
                    "A3A_faction_riv",
                    createHashMap
                ]
            };

            default {
                Faction(_sideX)
            };
        };

        if (
            _originalType in (
                _leaderFaction getOrDefault [
                    "SquadLeaders",
                    []
                ]
            )
        ) then {
            _groupX selectLeader _unit;
        };


        // Useful for debugging in Zeus/debug console.
        _unit setVariable [
            "A3A_coalitionTag",
            _selectedTag,
            true
        ];

        _unit setVariable [
            "A3A_originalUnitType",
            _originalType,
            true
        ];

    } else {

        diag_log format [
            "[A3A Coalition] ERROR createUnit failed side=%1 faction='%2' original='%3' resolved='%4'",
            _sideX,
            _selectedTag,
            _originalType,
            _resolvedType
        ];

    };


    sleep 0.25;
};


// Re-enable damage after the entire squad exists.
{
    _x allowDamage true;
} forEach units _groupX;


_groupX