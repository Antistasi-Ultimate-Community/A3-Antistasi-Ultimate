/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_attachPlaceholder

Description:
    TO BE REMOVED | DEV TEST PROVIDER MAPMODE:
    Attaches the test provider's owned draw handler to a live main-map control.
    Reuses an existing attachment and handles map display recreation.

Parameters:
    None.

Example:
    [] call A3A_ultimate_mapmodes_framework_fnc_attachPlaceholder;

Returns:
    <Boolean> True when attached; false when inactive or the map is unavailable.

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(missionNamespace getVariable [QGVAR(placeholderEnabled), false]) exitWith {false};
private _map = (findDisplay 12) displayCtrl 51;
if (isNull _map) exitWith {false};
private _previousMap = uiNamespace getVariable [QGVAR(placeholderMap), controlNull];
private _previousHandler = uiNamespace getVariable [QGVAR(placeholderDrawHandler), -1];
if (_map isEqualTo _previousMap && {_previousHandler >= 0}) exitWith {true};
if (!isNull _previousMap && {_previousHandler >= 0}) then {
    _previousMap ctrlRemoveEventHandler ["Draw", _previousHandler];
};
private _handler = _map ctrlAddEventHandler ["Draw", { _this call FUNC(drawPlaceholder); }];
uiNamespace setVariable [QGVAR(placeholderMap), _map];
uiNamespace setVariable [QGVAR(placeholderDrawHandler), _handler];
true