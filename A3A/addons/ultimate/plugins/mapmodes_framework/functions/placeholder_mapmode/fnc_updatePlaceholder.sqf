/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_updatePlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Offers a development provider only when no real providers are registered.
    Cleans up an active test mode before removing it from the registry.

Parameters:
    0: _registry - Client-local provider registry <HashMap>

Example:
    [_registry] call A3A_ultimate_mapmodes_framework_fnc_updatePlaceholder;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_registry"];
private _id = QGVAR(placeholder);
private _present = _id in _registry;
private _hasProviders = count _registry > ([0, 1] select _present);
if (_hasProviders) then {
    if (_present) then {
        if ((missionNamespace getVariable [QGVAR(active), ""]) isEqualTo _id) then {
            ["", false] call FUNC(selectMode);
        };
        _registry deleteAt _id;
    };
} else {
    if (!_present) then {
        _registry set [_id, [
            localize LSTRING(Placeholder),
            { [true] call FUNC(setPlaceholder); },
            { [false] call FUNC(setPlaceholder); },
            100, false, "\a3\ui_f\data\igui\cfg\simpleTasks\types\map_ca.paa"
        ]];
    };
};