/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_registerPlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Registers the development provider once at client postInit through the same
    public API as an extender, independently of other registered providers.

Parameters:
    None.

Example:
    [] call A3A_ultimate_mapmodes_framework_fnc_registerPlaceholder;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"

if (!hasInterface) exitWith {};
private _registered = [
    QGVAR(placeholder),
    localize LSTRING(Placeholder),
    { [] call FUNC(enablePlaceholder); },
    { [] call FUNC(disablePlaceholder); },
    100,
    "\a3\ui_f\data\igui\cfg\simpleTasks\types\map_ca.paa"
] call A3A_fnc_mapmodesRegister;
if (!_registered) then {
    [1, "Could not register the development provider", "mapmodes_framework fnc_registerPlaceholder"] call A3A_fnc_log;
};