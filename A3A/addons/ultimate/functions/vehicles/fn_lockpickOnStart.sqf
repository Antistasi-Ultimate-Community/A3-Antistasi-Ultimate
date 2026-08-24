#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3U_fnc_lockpickOnStart

Description:
    Hold action handler when lockpicking starts

Parameters:
    0: _vehicle - the vehicle being lockpicked <OBJECT>
    1: _unit - the unit that is lockpicking <OBJECT>

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill
---------------------------------------------------------------------------- */
if !assert(params[
    ["_vehicle", nil, [objNull]],
    ["_unit", nil, [objNull]]
]) exitWith {};

if !assert(!isNull _vehicle) exitWith {};
if !assert(!isNull _unit) exitWith {};

if !GVAR(allowLockpickKits) then {
    if !([_unit] call A3A_fnc_isEngineer) then {
        [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_not_engineer"] call A3A_fnc_customHint;
    };
} else {
    if !([_unit, _vehicle] call A3U_fnc_canLockpick) then {
        [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_not_engineer_no_lockpicks"] call A3A_fnc_customHint;
    } else {
        if !([_unit] call A3A_fnc_isEngineer) then {
            _vehicle setVariable[QGVAR(lockpickWillBreak), random 100 < GVAR(lockpickKitBreakChance)];
            _vehicle setVariable[QGVAR(lockpickUsed), [_unit] call A3U_fnc_lockpickGetPlayerItem];
        };
    };
};

nil;
