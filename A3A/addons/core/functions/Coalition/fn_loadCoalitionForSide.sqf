/*
 * File: fn_loadCoalitionForSide.sqf
 * Author: SvenBrandt99
 * Description:
 *    Loads every configured additional faction for one coalition slot and
 *    merges the vehicle pools after all templates have been loaded.
 * Params:
 *    _selector - Coalition slot ("occ", "inv", "riv") or the current
 *                Occupants/Invaders side
 * Returns:
 *    Boolean - true when processing completed
 * Example Usage:
 *    ["occ"] call A3A_fnc_loadCoalitionForSide;
 */

params ["_selector"];

if (isNil "A3A_coalitionConfig") then {
    call A3A_fnc_initCoalition;
};

private _prefix = "";

if (_selector isEqualType "") then {
    if (_selector in ["occ", "inv", "riv"]) then {
        _prefix = _selector;
    };
} else {
    if (_selector isEqualTo Occupants) then {
        _prefix = "occ";
    };

    if (_selector isEqualTo Invaders) then {
        _prefix = "inv";
    };
};

if (_prefix == "") exitWith {
    diag_log format [
        "[A3A Coalition] WARNING loadCoalitionForSide unsupported selector=%1",
        _selector
    ];
    false
};

private _netConfig = missionNamespace getVariable [
    "A3A_coalitionConfigNet",
    [[], [], []]
];

if !(_netConfig isEqualType []) then {
    diag_log format [
        "[A3A Coalition] WARNING invalid network config type: %1",
        _netConfig
    ];
    _netConfig = [[], [], []];
};

// Backward compatibility with existing [OCC, INV] data.
private _occ = _netConfig param [0, []];
private _inv = _netConfig param [1, []];
private _riv = _netConfig param [2, []];

A3A_coalitionConfig set ["occ", _occ];
A3A_coalitionConfig set ["inv", _inv];
A3A_coalitionConfig set ["riv", _riv];

// Reset this slot when a campaign is restarted without restarting Arma.
A3A_coalitionFactions set [
    _prefix,
    createHashMap
];

private _entries = A3A_coalitionConfig getOrDefault [
    _prefix,
    []
];

diag_log format [
    "[A3A Coalition] selected extras for %1 = %2",
    _prefix,
    _entries
];

private _loadSide = switch (_prefix) do {
    case "occ": { Occupants };
    case "inv": { Invaders };
    // A3AU's Rival loader verifies/registers against EAST/OPFOR classes.
    case "riv": { east };
    default { sideUnknown };
};

{
    if (_x isEqualType [] && {count _x >= 2}) then {
        _x params [
            "_tag",
            "_file"
        ];

        [
            _loadSide,
            _prefix,
            _tag,
            _file
        ] call A3A_fnc_loadCoalitionFaction;
    } else {
        diag_log format [
            "[A3A Coalition] WARNING malformed %1 coalition entry: %2",
            _prefix,
            _x
        ];
    };
} forEach _entries;

// Merge vehicle categories only after all extras are loaded.
if (_entries isNotEqualTo []) then {
    [_prefix] call A3A_fnc_mergeCoalitionVehicles;
};

true
