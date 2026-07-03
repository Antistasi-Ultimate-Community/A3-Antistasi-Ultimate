#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_mapHover

Description:
    Enables or disables the strategic map hover tooltip system, including the
    hover update handler, click interaction, and context menu cleanup.

Parameters:
    0: _attachTooltip - Whether to attach or remove the hover UI system <BOOL>
        (default: true)

Example:
    (begin example)
    [true] call A3U_fnc_mapHover;
    (end example)

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

private _attachTooltip = param [0, true, [true]];
private _mapDisplay = findDisplay 12;
if (isNull _mapDisplay) exitWith {};

private _clearContextMenus = {
    params ["_display"];
    if (isNull _display) exitWith {};

    private _menuGroup = _display getVariable ["A3U_mrkMenu_grp", controlNull];
    if (!isNull _menuGroup) then {
        ctrlDelete _menuGroup;
        _display setVariable ["A3U_mrkMenu_grp", controlNull];
        _display setVariable ["A3U_mrkMenu_marker", ""];
    };

    private _garrisonGroup = _display getVariable ["A3U_mrkMenu_garrGrp", controlNull];
    if (!isNull _garrisonGroup) then {
        ctrlDelete _garrisonGroup;
        _display setVariable ["A3U_mrkMenu_garrGrp", controlNull];
    };
};

private _clearHoverState = {
    params ["_display"];
    _display setVariable ["A3U_tipLastMrk", ""];
    _display setVariable ["A3U_tipFadeInStart", -1];
    _display setVariable ["A3U_tipFadeOutStart", -1];
    _display setVariable ["A3U_tipRippleStart", -1];
    _display setVariable ["A3U_tipHoverScreen", []];
};

private _mapControl = _mapDisplay displayCtrl 51;
if (isNull _mapControl) exitWith {};

if (_attachTooltip) then {
    private _existingClickHandler = _mapDisplay getVariable ["A3U_tipClickEH", -1];
    if (_existingClickHandler >= 0) then {
        _mapControl ctrlRemoveEventHandler ["MouseButtonDown", _existingClickHandler];
        _mapDisplay setVariable ["A3U_tipClickEH", -1];
    };

    private _existingPerFrameHandler = _mapDisplay getVariable ["A3U_tipperFrameHandler", -1];
    if (_existingPerFrameHandler >= 0) then {
        [_existingPerFrameHandler] call CBA_fnc_removePerFrameHandler;
        _mapDisplay setVariable ["A3U_tipperFrameHandler", -1];
    };

    private _tooltipControls = [_mapDisplay] call A3U_fnc_tooltipCreate;
    _tooltipControls params [
        ["_tooltipControl", controlNull, [controlNull]],
        ["_hoverRingControl", controlNull, [controlNull]],
        ["_rippleControl", controlNull, [controlNull]]
    ];

    _mapDisplay setVariable ["A3U_tooltipCtrl", _tooltipControl];
    _mapDisplay setVariable ["A3U_tooltipRingCtrl", _hoverRingControl];
    _mapDisplay setVariable ["A3U_tooltipRippleCtrl", _rippleControl];

    [_mapDisplay] call _clearHoverState;

    private _clickHandlerId = _mapControl ctrlAddEventHandler ["MouseButtonDown", {
        params ["_clickedMapControl", "_button"];
        private _display = ctrlParent _clickedMapControl;
        if (isNull _display) exitWith {};

        private _menuGroup = _display getVariable ["A3U_mrkMenu_grp", controlNull];
        private _garrisonGroup = _display getVariable ["A3U_mrkMenu_garrGrp", controlNull];

        if (!isNull _menuGroup || {!isNull _garrisonGroup}) then {
            private _mousePosition = getMousePosition;
            private _mouseX = _mousePosition # 0;
            private _mouseY = _mousePosition # 1;
            
            private _mouseInsideMenu = false;
            if (!isNull _menuGroup) then {
                private _pos = ctrlPosition _menuGroup;
                _mouseInsideMenu = (_mouseX >= _pos#0 && _mouseX <= _pos#0 + _pos#2 && _mouseY >= _pos#1 && _mouseY <= _pos#1 + _pos#3);
            };

            private _mouseInsideGarrison = false;
            if (!isNull _garrisonGroup) then {
                private _pos = ctrlPosition _garrisonGroup;
                _mouseInsideGarrison = (_mouseX >= _pos#0 && _mouseX <= _pos#0 + _pos#2 && _mouseY >= _pos#1 && _mouseY <= _pos#1 + _pos#3);
            };

            if (_mouseInsideMenu || {_mouseInsideGarrison}) exitWith {};

            if (!isNull _menuGroup) then { ctrlDelete _menuGroup; };
            if (!isNull _garrisonGroup) then { ctrlDelete _garrisonGroup; };

            _display setVariable ["A3U_mrkMenu_grp", controlNull];
            _display setVariable ["A3U_mrkMenu_garrGrp", controlNull];
            _display setVariable ["A3U_mrkMenu_marker", ""];
        };

        if (_button != 0) exitWith {};

        private _hoveredMarker = _display getVariable ["A3U_tipLastMrk", ""];
        private _hoverScreenPosition = _display getVariable ["A3U_tipHoverScreen", []];
        if (_hoveredMarker == "" || {_hoverScreenPosition isEqualTo []}) exitWith {};

        private _originalMarker = _hoveredMarker;
        if ((_originalMarker find "Dum") == 0) then { _originalMarker = _originalMarker select [3, (count _originalMarker) - 3]; };

        if ([_originalMarker] call A3U_fnc_isMarkerHidden) exitWith {
            _display setVariable ["A3U_tipLastMrk", ""];
            _display setVariable ["A3U_tipHoverScreen", []];
        };

        [_hoveredMarker, _hoverScreenPosition] call A3U_fnc_markerContextMenu;
        _display setVariable ["A3U_tipRippleStart", diag_tickTime];
    }];

    _mapDisplay setVariable ["A3U_tipClickEH", _clickHandlerId];

    private _perFrameHandlerId = [{
        _this call A3U_fnc_mapTooltip;
    }, 0.05, [_mapDisplay, _mapControl, 32]] call CBA_fnc_addPerFrameHandler;
    
    _mapDisplay setVariable ["A3U_tipperFrameHandler", _perFrameHandlerId];

} else {
    private _tooltipControl = _mapDisplay getVariable ["A3U_tooltipCtrl", controlNull];
    if (!isNull _tooltipControl) then { _tooltipControl ctrlShow false; };

    private _hoverRingControl = _mapDisplay getVariable ["A3U_tooltipRingCtrl", controlNull];
    if (!isNull _hoverRingControl) then { _hoverRingControl ctrlShow false; };

    private _rippleControl = _mapDisplay getVariable ["A3U_tooltipRippleCtrl", controlNull];
    if (!isNull _rippleControl) then { _rippleControl ctrlShow false; };

    [_mapDisplay] call _clearContextMenus;

    private _clickHandlerId = _mapDisplay getVariable ["A3U_tipClickEH", -1];
    if (_clickHandlerId >= 0) then {
        _mapControl ctrlRemoveEventHandler ["MouseButtonDown", _clickHandlerId];
        _mapDisplay setVariable ["A3U_tipClickEH", -1];
    };

    private _perFrameHandlerId = _mapDisplay getVariable ["A3U_tipperFrameHandler", -1];
    if (_perFrameHandlerId >= 0) then {
        [_perFrameHandlerId] call CBA_fnc_removePerFrameHandler;
        _mapDisplay setVariable ["A3U_tipperFrameHandler", -1];
    };

    [_mapDisplay] call _clearHoverState;
};