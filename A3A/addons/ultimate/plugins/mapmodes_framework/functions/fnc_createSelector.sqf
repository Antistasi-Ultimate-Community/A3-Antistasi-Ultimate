/* ----------------------------------------------------------------------------
Function: A3A_ultimate_mapmodes_framework_fnc_createSelector

Description:
    Creates or repositions the native dropdown beside AU's Location Browser.
    Waits briefly for a late map display and prevents concurrent creation workers.

Parameters:
    None.

Example:
    [] spawn A3A_ultimate_mapmodes_framework_fnc_createSelector;

Returns:
    <nil>

Scope:
    Client

Author:
    eirish
---------------------------------------------------------------------------- */

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface || {missionNamespace getVariable [QGVAR(selectorWorker), false]}) exitWith {};
missionNamespace setVariable [QGVAR(selectorWorker), true];
disableSerialization;
private _display = findDisplay 12;
if (isNull _display) then {
    private _deadline = diag_tickTime + MM_MAP_WAIT_SECONDS;
    waitUntil {uiSleep 0.05; !isNull findDisplay 12 || {diag_tickTime >= _deadline}};
    _display = findDisplay 12;
};
if (!isNull _display) then {
    private _combo = _display displayCtrl MM_SELECTOR_IDC;
    private _created = isNull _combo;
    if (_created) then {
        _combo = _display ctrlCreate ["RscCombo", MM_SELECTOR_IDC];
        _combo ctrlSetFont "PuristaMedium";
        _combo ctrlSetTooltip localize LSTRING(Selector);
        _combo ctrlAddEventHandler ["LBSelChanged", {
            params ["_control", "_row"];
            if (_row < 0 || {_control getVariable [QGVAR(updating), false]}) exitWith {};
            if ((_control lbValue _row) < 0) exitWith { [false] call FUNC(refreshSelector); };
            [_control lbData _row, true] call FUNC(selectMode);
        }];
    };
    private _width = (0.17 * safeZoneW) min (safeZoneW * 0.4);
    private _anchorX = safeZoneX + safeZoneW * 0.55;
    private _anchorY = safeZoneY + 0.005;
    private _height = 0.028 * safeZoneH;
    private _browser = _display displayCtrl 88011;
    if (isNull _browser) then { _browser = _display getVariable ["A3U_markerBrowser_btn", controlNull]; };
    if (!isNull _browser && {ctrlShown _browser}) then {
        private _position = ctrlPosition _browser;
        private _parent = ctrlParentControlsGroup _browser;
        while {!isNull _parent} do {
            private _offset = ctrlPosition _parent;
            _position set [0, (_position select 0) + (_offset select 0)];
            _position set [1, (_position select 1) + (_offset select 1)];
            _parent = ctrlParentControlsGroup _parent;
        };
        _anchorX = _position select 0;
        _anchorY = _position select 1;
        _height = _position select 3;
    };
    private _left = ((_anchorX - _width - 0.008 * safeZoneW) max safeZoneX) min (safeZoneX + safeZoneW - _width);
    _combo ctrlSetPosition [_left, _anchorY max safeZoneY, _width, _height];
    _combo ctrlCommit 0;
    [_created] call FUNC(refreshSelector);
};
missionNamespace setVariable [QGVAR(selectorWorker), false];