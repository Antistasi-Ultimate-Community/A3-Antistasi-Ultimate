/*
 * File: fn_resolveCoalitionType.sqf
 * Author: SvenBrandt99
 * Description:
 *    Resolves a generic AU loadout type to the unique loadout type belonging
 *    to the coalition faction selected for a group.
 * Params:
 *    _group  - Group whose coalition faction should be used
 *    _prefix - Coalition slot: "occ", "inv" or "riv"
 *    _type   - Generic AU loadout type
 * Returns:
 *    String - Resolved unique type, or the original type for BASE/fallback
 * Example Usage:
 *    [_group, "riv", "loadouts_riv_militia_Medic"] call A3A_fnc_resolveCoalitionType;
 */

params [
    ["_group", grpNull, [grpNull]],
    ["_prefix", "", [""]],
    ["_type", "", [""]]
];

if (
    isNull _group
    || {_type == ""}
    || {!(_prefix in ["occ", "inv", "riv"])}
) exitWith {
    _type
};

private _tag = _group getVariable [
    "A3A_coalitionTag",
    ""
];

if (_tag == "") then {
    _tag = [
        _group,
        _prefix,
        [_type]
    ] call A3A_fnc_selectCoalitionForGroup;
};

if (_tag == "BASE") exitWith {
    _type
};

private _pool = A3A_coalitionFactions getOrDefault [
    _prefix,
    createHashMap
];

private _faction = _pool getOrDefault [
    _tag,
    createHashMap
];

private _unitMap = _faction getOrDefault [
    "A3A_coalitionUnitMap",
    createHashMap
];

private _resolved = _unitMap getOrDefault [
    _type,
    ""
];

if (_resolved == "") exitWith {
    diag_log format [
        "[A3A Coalition] WARNING no mapping prefix='%1' tag='%2' type='%3'; using BASE type",
        _prefix,
        _tag,
        _type
    ];
    _type
};

_resolved
