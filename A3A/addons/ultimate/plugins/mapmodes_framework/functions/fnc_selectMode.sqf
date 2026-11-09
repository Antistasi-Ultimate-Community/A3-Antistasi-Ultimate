/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_selectMode

Description:
    Switches this client's provider, cleaning up the previous mode first.
    Same-mode selections do not rerun callbacks. Saves successful explicit choices
    but does not overwrite preferences during automatic restoration.

Parameters:
    0: _id - Registered provider ID, or empty string for Default map <String>

Optional:
    1: _explicit - Whether this is a player/script choice; default true <Boolean>

Example:
    ["MyAddon_supply", false] call A3A_ultimate_mapmodes_framework_fnc_selectMode;

Returns:
    <Boolean> True on success; false for unknown modes, reentrancy or callback exceptions.

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_id", ["_explicit", true]];
if (!hasInterface || {missionNamespace getVariable [QGVAR(transitioning), false]}) exitWith {false};
private _registry = missionNamespace getVariable [QGVAR(registry), createHashMap];
if (_id != "" && {!(_id in _registry)}) exitWith {false};
private _previous = missionNamespace getVariable [QGVAR(active), ""];
private _success = true;
missionNamespace setVariable [QGVAR(transitioning), true];
isNil {
    if (_id != _previous) then {
        if (_previous in _registry) then {
            try { [] call ((_registry get _previous) select 2); } catch {
                [1, format ["Mapmode provider %1 deactivation failed: %2", _previous, _exception], "mapmodes_framework fnc_selectMode"] call A3A_fnc_log;
                _success = false;
            };
        };
        if (_success) then {
            missionNamespace setVariable [QGVAR(active), ""];
            if (_id != "") then {
                try {
                    [] call ((_registry get _id) select 1);
                    missionNamespace setVariable [QGVAR(active), _id];
                } catch {
                    [1, format ["Mapmode provider %1 activation failed: %2", _id, _exception], "mapmodes_framework fnc_selectMode"] call A3A_fnc_log;
                    _success = false;
                    try { [] call ((_registry get _id) select 2); } catch {
                        [1, format ["Mapmode provider %1 cleanup failed: %2", _id, _exception], "mapmodes_framework fnc_selectMode"] call A3A_fnc_log;
                    };
                };
            };
        };
    };
};
missionNamespace setVariable [QGVAR(transitioning), false];
if (_success && {_explicit}) then {
    missionNamespace setVariable [QGVAR(explicitSelection), true];
    missionNamespace setVariable [QGVAR(preferred), _id];
    if ((profileNamespace getVariable [QGVAR(preferred), ""]) isNotEqualTo _id) then {
        profileNamespace setVariable [QGVAR(preferred), _id];
        saveProfileNamespace;
    };
};
[false] call FUNC(refreshSelector);
_success