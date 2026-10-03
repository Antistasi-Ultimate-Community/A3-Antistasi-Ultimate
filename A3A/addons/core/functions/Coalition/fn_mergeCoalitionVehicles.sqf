/*
 * File: fn_mergeCoalitionVehicles.sqf
 * Author: SvenBrandt99
 * Description:
 *    Merges vehicle category arrays from additional coalition factions into
 *    the primary faction. This allows the existing AU vehicle spawning logic
 *    to use coalition equipment without requiring a separate vehicle pipeline.
 * Params:
 *    _prefix - Coalition slot: "occ", "inv" or "riv"
 * Returns:
 *    Boolean - true when the merge completed
 * Example Usage:
 *    ["inv"] call A3A_fnc_mergeCoalitionVehicles;
 */

params [
    ["_prefix", "", [""]]
];

if !(_prefix in ["occ", "inv", "riv"]) exitWith {
    false
};

private _mainVar = "A3A_faction_" + _prefix;

private _mainFaction = missionNamespace getVariable [
    _mainVar,
    createHashMap
];

if ((count _mainFaction) == 0) exitWith {
    diag_log format [
        "[A3A Coalition Vehicles] ERROR no main faction '%1'",
        _mainVar
    ];
    false
};

private _pool = A3A_coalitionFactions getOrDefault [
    _prefix,
    createHashMap
];

if ((count _pool) == 0) exitWith {
    true
};

private _arrayKeys = [
    "vehiclesBasic",
    "vehiclesLightUnarmed",
    "vehiclesLightArmed",
    "vehiclesTrucks",
    "vehiclesCargoTrucks",
    "vehiclesAmmoTrucks",
    "vehiclesRepairTrucks",
    "vehiclesFuelTrucks",
    "vehiclesMedical",

    "vehiclesLightAPCs",
    "vehiclesAPCs",
    "vehiclesIFVs",
    "vehiclesTanks",
    "vehiclesLightTanks",
    "vehiclesAA",
    "vehiclesArtillery",
    "vehiclesAirborne",

    "vehiclesTransportBoats",
    "vehiclesGunBoats",
    "vehiclesAmphibious",

    "vehiclesPlanesCAS",
    "vehiclesPlanesAA",
    "vehiclesPlanesTransport",
    "vehiclesHelisLight",
    "vehiclesHelisTransport",
    "vehiclesHelisLightAttack",
    "vehiclesHelisAttack",
    "vehiclesAirPatrol",

    "vehiclesMilitiaLightArmed",
    "vehiclesMilitiaCars",
    "vehiclesPolice",

    "staticMGs",
    "staticAT",
    "staticAA",
    "staticMortars",

    "uavsAttack",
    "uavsPortable"
];

{
    private _key = _x;

    private _merged = _mainFaction getOrDefault [
        _key,
        []
    ];

    if !(_merged isEqualType []) then {
        _merged = [];
    } else {
        _merged = +_merged;
    };

    {
        private _extra = _y getOrDefault [
            _key,
            []
        ];

        if (_extra isEqualType []) then {
            {
                _merged pushBackUnique _x;
            } forEach _extra;
        };
    } forEach _pool;

    _mainFaction set [
        _key,
        _merged
    ];

} forEach _arrayKeys;


// Rebuild common derived arrays.
private _lightArmedTroop =
    (_mainFaction getOrDefault ["vehiclesLightArmed", []]) select {
        ([_x, true] call BIS_fnc_crewCount)
        - ([_x, false] call BIS_fnc_crewCount)
        >= 4
    };

_mainFaction set [
    "vehiclesLightArmedTroop",
    _lightArmedTroop
];

private _vehiclesArmor =
    (_mainFaction getOrDefault ["vehiclesTanks", []])
    + (_mainFaction getOrDefault ["vehiclesAA", []])
    + (_mainFaction getOrDefault ["vehiclesArtillery", []])
    + (_mainFaction getOrDefault ["vehiclesLightAPCs", []])
    + (_mainFaction getOrDefault ["vehiclesAPCs", []])
    + (_mainFaction getOrDefault ["vehiclesLightTanks", []])
    + (_mainFaction getOrDefault ["vehiclesAirborne", []])
    + (_mainFaction getOrDefault ["vehiclesIFVs", []]);

_mainFaction set [
    "vehiclesArmor",
    _vehiclesArmor arrayIntersect _vehiclesArmor
];

missionNamespace setVariable [
    _mainVar,
    _mainFaction
];

diag_log format [
    "[A3A Coalition Vehicles] merged prefix='%1' factions=%2 lightArmed=%3 tanks=%4 planesCAS=%5 helisAttack=%6",
    _prefix,
    keys _pool,
    count (_mainFaction getOrDefault ["vehiclesLightArmed", []]),
    count (_mainFaction getOrDefault ["vehiclesTanks", []]),
    count (_mainFaction getOrDefault ["vehiclesPlanesCAS", []]),
    count (_mainFaction getOrDefault ["vehiclesHelisAttack", []])
];

true
