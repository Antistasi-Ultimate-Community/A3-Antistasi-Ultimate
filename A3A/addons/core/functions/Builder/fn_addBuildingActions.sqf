/*
Description:
    Client-side function to add actions for building and cancelling construction

Environment: Client, unscheduled
Arguments:
    1. <object> Plank object to add actions for
    2. <number> Hold time for build action (object type dependent) 
*/

params ["_plankObject", "_holdTime"];

_plankObject addAction [
    localize "STR_A3A_reinf_build_actionTitle",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        _arguments params ["_holdTime"];

        if !(isNull objectParent _caller) exitWith {};
        if !(_caller call A3A_fnc_isEngineer) exitWith {};
        if !([_caller] call A3A_fnc_canFight) exitWith {};
        if !(_caller distance _target < 10) exitWith {};

        [
            localize "STR_A3A_reinf_build_actionProgress",
            _holdTime,
            {
                params ["_args"];
                _args params ["_target", "_caller"];

                _caller isEqualTo player
                && {alive _caller}
                && {!isNull _target}
                && {[_caller] call A3A_fnc_canFight}
                && {isNull objectParent _caller}
                && {_caller distance _target < 10}
            },
            {
                params ["_args"];
                _args params ["_target", "_caller"];

                [_target, true] remoteExecCall ["A3A_fnc_buildingComplete", 2];
            },
            {},
            [_target, _caller]
        ] call CBA_fnc_progressBar;
    },
    [_holdTime],
    1.5,
    true,
    true,
    "",
    "isNull objectParent player && {player call A3A_fnc_isEngineer && {(player distance _target < 8)}}",
    8,
    false
];

_plankObject addAction [
    localize "STR_magRepack_cancel",
    {
        params ["_target"];
        [_target, false] remoteExecCall ["A3A_fnc_buildingComplete", 2];
    },
    nil,
    1.5,
    true,
    true,
    "",
    "player call A3A_fnc_isEngineer",
    8
];
