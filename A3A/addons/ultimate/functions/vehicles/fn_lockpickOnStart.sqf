#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3U_fnc_lockpickOnStart

Description:
    Validates and prepares a lockpick attempt

Parameters:
    0: _vehicle - the vehicle being lockpicked <OBJECT>
    1: _unit - the unit that is lockpicking <OBJECT>

Returns:
    Whether lockpicking can start <BOOL>

Author:
    UnseenKill
---------------------------------------------------------------------------- */
if !assert(params[
    ["_vehicle", nil, [objNull]],
    ["_unit", nil, [objNull]]
]) exitWith { false };

if !assert(!isNull _vehicle) exitWith { false };
if !assert(!isNull _unit) exitWith { false };

private _isEngineer = [_unit] call A3A_fnc_isEngineer;
private _lockpickKit = "";

if (!_isEngineer && {!GVAR(allowLockpickKits)}) exitWith {
    [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_not_engineer"] call A3A_fnc_customHint;
    false
};

if (!_isEngineer) then {
    _lockpickKit = [_unit] call A3U_fnc_lockpickGetPlayerItem;
};

if (!_isEngineer && {_lockpickKit isEqualTo ""}) exitWith {
    [localize "STR_A3AU_action_lockpick_title", localize "STR_A3AU_action_lockpick_not_engineer_no_lockpicks"] call A3A_fnc_customHint;
    false
};

if !([_unit, _vehicle] call A3U_fnc_canLockpick) exitWith { false };

if (!_isEngineer) then {
    _vehicle setVariable [QGVAR(lockpickWillBreak), random 100 < GVAR(lockpickKitBreakChance)];
    _vehicle setVariable [QGVAR(lockpickUsed), _lockpickKit];
};

true;
