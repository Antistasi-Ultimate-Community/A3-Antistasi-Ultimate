/*
 * File: fn_selectCoalitionForGroup.sqf
 * Author: SvenBrandt99
 * Description:
 *    Selects one compatible faction for an entire spawned group. A faction is
 *    considered compatible when all requested generated loadout types can be
 *    resolved for that faction. BASE is always kept as a valid option.
 * Params:
 *    _group  - Group receiving the coalition selection
 *    _prefix - Coalition slot: "occ", "inv" or "riv"
 *    _types  - Requested logical unit types for the group
 * Returns:
 *    String - "BASE" or the selected coalition faction tag
 * Example Usage:
 *    [_group, "occ", _types] call A3A_fnc_selectCoalitionForGroup;
 */

params [
    ["_group", grpNull, [grpNull]],
    ["_prefix", "", [""]],
    ["_types", [], [[]]]
];

if (isNull _group) exitWith { "BASE" };
if !(_prefix in ["occ", "inv", "riv"]) exitWith { "BASE" };

_group setVariable [
    "A3A_coalitionPrefix",
    _prefix,
    false
];

private _existing = _group getVariable [
    "A3A_coalitionTag",
    ""
];

if (_existing != "") exitWith {
    _existing
};

if (isNil "A3A_coalitionFactions") exitWith {
    _group setVariable ["A3A_coalitionTag", "BASE", false];
    "BASE"
};

private _pool = A3A_coalitionFactions getOrDefault [
    _prefix,
    createHashMap
];

private _compatibleTags = [];

{
    private _tag = _x;
    private _faction = _pool getOrDefault [
        _tag,
        createHashMap
    ];

    private _unitMap = _faction getOrDefault [
        "A3A_coalitionUnitMap",
        createHashMap
    ];

    private _compatible = true;

    {
        private _type = _x;

        if (
            _type isEqualType ""
            && {(_type find "loadouts_") == 0}
            && {(_unitMap getOrDefault [_type, ""]) == ""}
        ) then {
            _compatible = false;
        };
    } forEach _types;

    if (_compatible) then {
        _compatibleTags pushBack _tag;
    };

} forEach keys _pool;

private _selection = ["BASE"];
_selection append _compatibleTags;

private _tag = selectRandom _selection;

_group setVariable [
    "A3A_coalitionTag",
    _tag,
    false
];

diag_log format [
    "[A3A Coalition] selectGroup prefix='%1' tag='%2' compatible=%3 types=%4",
    _prefix,
    _tag,
    _compatibleTags,
    _types
];

_tag
