/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_refreshSelector

Description:
    Synchronizes the dropdown with the selected provider. Rebuilds rows only when
    requested and suppresses callbacks during programmatic selection changes.

Parameters:
    None required.

Optional:
    0: _rebuild - Recreate rows after registry/control changes; default true <Boolean>

Example:
    [false] call A3A_ultimate_mapmodes_framework_fnc_refreshSelector;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_rebuild", true]];
disableSerialization;
private _control = (findDisplay 12) displayCtrl MM_SELECTOR_IDC;
if (isNull _control) exitWith {};
_control setVariable [QGVAR(updating), true];
if (_rebuild) then {
    lbClear _control;
    private _row = _control lbAdd localize LSTRING(Default);
    _control lbSetData [_row, ""];
    _control lbSetPicture [_row, "\a3\ui_f\data\igui\cfg\simpleTasks\types\map_ca.paa"];
    private _officialSeen = false;
    private _dividerAdded = false;
    {
        _x params ["_id", "_label", "_official", "_order", ["_icon", ""]];
        if (!_official && {_officialSeen} && {!_dividerAdded}) then {
            _row = _control lbAdd "----------------";
            _control lbSetValue [_row, -1];
            _dividerAdded = true;
        };
        _row = _control lbAdd _label;
        _control lbSetData [_row, _id];
        _control lbSetPicture [_row, _icon];
        if (_official) then { _officialSeen = true; };
    } forEach (missionNamespace getVariable [QGVAR(modes), []]);
};
private _active = missionNamespace getVariable [QGVAR(active), ""];
private _selected = 0;
for "_row" from 0 to ((lbSize _control) - 1) do {
    if ((_control lbValue _row) >= 0 && {(_control lbData _row) isEqualTo _active}) exitWith { _selected = _row; };
};
_control lbSetCurSel _selected;
_control setVariable [QGVAR(updating), false];