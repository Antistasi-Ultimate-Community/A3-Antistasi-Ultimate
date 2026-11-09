/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_refreshModes

Description:
    Rebuilds ordered provider metadata after registry changes. Official modes sort
    first, followed by numeric priority, case-insensitive label and stable ID.

Parameters:
    None.

Example:
    [] call A3A_ultimate_mapmodes_framework_fnc_refreshModes;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _registry = missionNamespace getVariable [QGVAR(registry), createHashMap];
// TO BE REMOVED | DEV TEST PROVIDER MAPMODE: keep the test provider only while empty.
[_registry] call FUNC(updatePlaceholder);
private _sorted = [];
{
    _y params ["_label", "_activate", "_deactivate", "_order", "_official", ["_icon", ""]];
    _sorted pushBack [[1, 0] select _official, _order, toLower _label, _x, _label, _icon];
} forEach _registry;
_sorted sort true;
private _modes = _sorted apply {[_x select 3, _x select 4, (_x select 0) isEqualTo 0, _x select 1, _x select 5]};
missionNamespace setVariable [QGVAR(modes), _modes];
[true] call FUNC(refreshSelector);