#include "..\..\script_component.hpp"
/*
    Author:
        Maxx, Silence
    
    Description:
        Adds the action to lockpick a vehicle locally
    
    Params:
        _vehicle <OBJECT>
    
    Dependencies:
        vehicleLockpickTime
    
    Scope:
        Client
    
    Environment:
        Unscheduled
    
    Usage:
        [_vehicle] call A3U_fnc_lockpick;
    
    Return:
        N/A
*/

params ["_vehicle"];

if isNull(_vehicle) exitWith {};

private _pickRoll = vehicleLockpickTime / 2 + random vehicleLockpickTime;

_vehicle setVariable [QGVAR(lockpickAction),
    _vehicle addAction [
        localize "STR_A3AU_action_lockpick_title",
        {
            params ["_target", "_caller", "_actionId", "_arguments"];

            _arguments params ["_duration"];

            if !([_target, _caller] call A3U_fnc_lockpickOnStart) exitWith {};
            if !([_caller] call A3A_fnc_canFight) exitWith {};

            //predefine lockpick break on original duration (saves lockpicks on shortened durations)
            private _lockpickBreakTime = -1;
            if (_target getVariable [QGVAR(lockpickWillBreak), false]) then {
                _lockpickBreakTime = random _duration;
            };

            private _vehicleName = getText (configOf _target >> "displayName");
            private _progressDuration = _duration;
            private _zones = call A3U_fnc_lockpickZones;
            private _closestZone = sidesX getVariable [([_zones, _caller] call BIS_fnc_nearestPosition), sideUnknown];
            private _toolkits = items _caller arrayIntersect allToolkits;
            private _toolkitHint = "";

            //speed-up conditions
            if (_toolkits isNotEqualTo []) then {
                _progressDuration = _duration / 2;
                _toolkitHint = " " + format [localize "STR_A3AU_action_lockpick_using_toolkit", getText (configFile >> "CfgWeapons" >> (_toolkits select 0) >> "displayName")];
            };
            if (_closestZone isEqualTo teamPlayer) then {
                _progressDuration = _duration / 12;
            };

            [
                (format [localize "STR_A3AU_action_lockpick_start", _vehicleName]) + _toolkitHint,
                _progressDuration,
                {
                    params ["_args"];
                    _args params ["_target", "_caller", "_lockpickBreakTime", "_speedrunHint"];

                    //Stop the progress bar if the lockpick breaks after certain time
                    private _elapsedTime = _this param [2, 0];
                    if (_lockpickBreakTime >= 0 && {_elapsedTime >= _lockpickBreakTime}) exitWith {
                        [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_tool_break"] call A3A_fnc_customHint;
                        [_target, QGVAR(LockpickToolBreak)] remoteExecCall ["say3D", 0, true];
                        [_caller, _target getVariable QGVAR(lockpickUsed)] call A3U_fnc_useMagazineItem;
                        _target setVariable [QGVAR(lockpickUsed), nil];
                        _target setVariable [QGVAR(lockpickWillBreak), nil];
                        false
                    };

                    //Check that the hacker is still kickin'
                    _caller isEqualTo player
                    && {alive _caller}
                    && {[_caller] call A3A_fnc_canFight}
                    && {!isNull _target}
                    && {[_caller, _target] call A3U_fnc_canInteract}
                    && {[_target] call A3U_fnc_isLocked}
                    && {_target getVariable [QGVAR(lockpickAction), false] isNotEqualTo false}
                },
                {
                    params ["_args"];
                    _args params ["_target"];

                    [_target] call A3U_fnc_lockpickOnSuccess;
                },
                {
                    params ["_args", "_success", "_elapsedTime", "_totalTime", "_failureCode"];
                    _args params ["_target", "_caller"];

                    // Internal condition failures do not abort the lockpick or remove its action.
                    if (_failureCode isEqualTo 1) then {
                        [_target, _caller] call A3U_fnc_lockpickOnFail;
                    };
                },
                [_target, _caller, _lockpickBreakTime, _speedrunHint]
            ] call CBA_fnc_progressBar;
        },
        [_pickRoll],
        2026,
        false,
        true,
        "",
        QUOTE([ARR_3(_this,_target,true)] call A3U_fnc_canLockpick),
        5,
        false
    ]
];

nil;
