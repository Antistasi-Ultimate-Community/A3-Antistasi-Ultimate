/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_registerMode

Description:
    Registers one provider and refreshes the cached list. Restores an unavailable
    saved choice when it registers, unless the player already chose another mode.

Parameters:
    0: _id - Unique namespaced provider ID <String>
    1: _label - Localized display name <String>
    2: _activate - Provider activation callback <Code>
    3: _deactivate - Provider cleanup callback <Code>

Optional:
    4: _order - Sort priority within its group; default 100 <Number>
    5: _icon - Texture path displayed before the label; default empty <String>

Example:
    ["MyAddon_supply", "Supply", {}, {}, 100] call A3A_ultimate_mapmodes_framework_fnc_registerMode;

Returns:
    <Boolean> True on registration; false for invalid input, duplicates or reentrancy.

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface || {missionNamespace getVariable [QGVAR(transitioning), false]}) exitWith {false};
if !(_this isEqualType [] && {count _this in [4, 5, 6]} && {_this findIf {isNil "_x"} < 0}) exitWith {false};
params ["_id", "_label", "_activate", "_deactivate", ["_order", 100], ["_icon", ""]];
if !(_id isEqualType "" && {_label isEqualType ""} && {_id != ""} && {_label != ""}
    && {_activate isEqualType {}} && {_deactivate isEqualType {}} && {_order isEqualType 0} && {finite _order}
    && {_icon isEqualType ""}) exitWith {false};
// TO BE REMOVED | DEV TEST PROVIDER MAPMODE: reserve the development provider ID.
if (_id isEqualTo QGVAR(placeholder)) exitWith {false};
private _official = getArray (configFile >> "A3U" >> "MapmodesFramework" >> "officialIds");
if !(_id in _official || {(_id find "_") > 0}) exitWith {false};
private _registry = missionNamespace getVariable [QGVAR(registry), createHashMap];
if (_id in _registry) exitWith {false};
_registry set [_id, [_label, _activate, _deactivate, _order, _id in _official, _icon]];
missionNamespace setVariable [QGVAR(registry), _registry];
[] call FUNC(refreshModes);
if (!(missionNamespace getVariable [QGVAR(explicitSelection), false]) && {
    !(missionNamespace getVariable [QGVAR(restored), false])
} && {_id isEqualTo (missionNamespace getVariable [QGVAR(preferred), ""])}) then {
    missionNamespace setVariable [QGVAR(restored), true];
    [_id, false] call FUNC(selectMode);
};
true