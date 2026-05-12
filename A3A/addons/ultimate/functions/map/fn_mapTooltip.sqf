#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_mapTooltip

Description:
    Updates the hover tooltip, marker highlight ring, and click ripple for the
    map marker currently closest to the mouse cursor.

Parameters:
    0: _arguments - Per-frame handler arguments
        [display, map control, threshold] <ARRAY>
    1: _handle - Per-frame handler id supplied by the scheduler <NUMBER>

Optional:
    None.

Example:
    [[findDisplay 12, (findDisplay 12) displayCtrl 51, 32], -1]
        call A3U_fnc_mapTooltip;

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

// Existing A3U_fnc_* public function name kept for backwards compatibility.

if !assert(params [
    ["_arguments", nil, [[]]],
    ["_handle", nil, [0]]
]) exitWith {};

if !assert(_arguments isEqualTypeParams [displayNull, controlNull, 0]) exitWith {};

_arguments params ["_mapDisplay", "_mapControl", "_thresholdPixels", "_hoveredMarker"];

if ([_hoveredMarker] call A3U_fnc_isMarkerHidden) exitWith {
    [_mapDisplay, _tooltipControl, _hoverRingControl] call _resetHoverUi;
};

private _resetHoverUi = {
    params ["_display", "_tooltipControl", "_hoverRingControl"];

    if (!isNull _tooltipControl) then {
        _tooltipControl ctrlShow false;
    };

    if (!isNull _hoverRingControl) then {
        _hoverRingControl ctrlShow false;
    };

    _display setVariable ["A3U_tipLastMrk", ""];
    _display setVariable ["A3U_tipAnimStart", 0];
};

if (
    isNull _mapDisplay
    || {isNull _mapControl}
    || {!visibleMap}
) exitWith {
    if (!isNull _mapDisplay) then {
        private _tooltipControl = _mapDisplay getVariable ["A3U_tooltipCtrl", controlNull];
        private _hoverRingControl = _mapDisplay getVariable ["A3U_tooltipRingCtrl", controlNull];

        [_mapDisplay, _tooltipControl, _hoverRingControl] call _resetHoverUi;
    };
};

// Legacy A3U_* hover-cache keys are kept for compatibility with the existing
// hover/browser/context-menu code path that shares this state.

private _tooltipControl = _mapDisplay getVariable ["A3U_tooltipCtrl", controlNull];
private _hoverRingControl = _mapDisplay getVariable ["A3U_tooltipRingCtrl", controlNull];
private _rippleControl = _mapDisplay getVariable ["A3U_tooltipRippleCtrl", controlNull];

if (
    isNull _tooltipControl
    || {isNull _hoverRingControl}
    || {isNull _rippleControl}
) then {
    private _tooltipControls = [_mapDisplay] call A3U_fnc_tooltipCreate;
    if (_tooltipControls isEqualType []) then {
        _tooltipControls params [
            ["_newTooltipControl", controlNull, [controlNull]],
            ["_newHoverRingControl", controlNull, [controlNull]],
            ["_newRippleControl", controlNull, [controlNull]]
        ];

        if (isNull _tooltipControl) then {
            _tooltipControl = _newTooltipControl;
        };

        if (isNull _hoverRingControl) then {
            _hoverRingControl = _newHoverRingControl;
        };

        if (isNull _rippleControl) then {
            _rippleControl = _newRippleControl;
        };
    };

    _mapDisplay setVariable ["A3U_tooltipCtrl", _tooltipControl];
    _mapDisplay setVariable ["A3U_tooltipRingCtrl", _hoverRingControl];
    _mapDisplay setVariable ["A3U_tooltipRippleCtrl", _rippleControl];
};

private _hoverMarkers = missionNamespace getVariable ["A3U_hoverMarkers", []];
if (_hoverMarkers isEqualTo []) exitWith {
    [_mapDisplay, _tooltipControl, _hoverRingControl] call _resetHoverUi;
};

private _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap", createHashMap];

private _mousePosition = getMousePosition;
private _nearestMarker = "";
private _nearestDistanceSquared = 1e12;
private _nearestScreenPosition = [];

private _selectionThreshold = (_thresholdPixels / 1000) max 0.01;

{
    private _screenPosition = _mapControl ctrlMapWorldToScreen (getMarkerPos _x);
    if (_screenPosition isEqualTo []) then {
        continue;
    };

    private _distanceX = (_screenPosition # 0) - (_mousePosition # 0);
    private _distanceY = (_screenPosition # 1) - (_mousePosition # 1);
    private _distanceSquared = (_distanceX * _distanceX) + (_distanceY * _distanceY);

    if (_distanceSquared < _nearestDistanceSquared) then {
        _nearestDistanceSquared = _distanceSquared;
        _nearestMarker = _x;
        _nearestScreenPosition = _screenPosition;
    };
} forEach markersX;

if (
    _nearestMarker != ""
    && {_nearestDistanceSquared <= (_selectionThreshold * _selectionThreshold)}
) then {

    private _markerMetadata = _hoverMetaMap getOrDefault [_nearestMarker, []];
    if (_markerMetadata isEqualTo [] || {count _markerMetadata < 1}) exitWith {
        [_mapDisplay, _tooltipControl, _hoverRingControl] call _resetHoverUi;
    };

    _markerMetadata params ["_hoverTextRaw", ["_flagMarkerType", ""]];

    private _hoverTitle = _hoverTextRaw;
    private _lineBreakIndex = _hoverTextRaw find "<br/>";
    if (_lineBreakIndex > -1) then {
        _hoverTitle = _hoverTextRaw select [0, _lineBreakIndex];
    };

    if (_hoverTextRaw == "") exitWith {
        [_mapDisplay, _tooltipControl, _hoverRingControl] call _resetHoverUi;
    };

    private _iconPath = "";
    if (_flagMarkerType != "") then {
        _iconPath = getText (configFile >> "CfgMarkers" >> _flagMarkerType >> "icon");
    };

    private _lastMarker = _mapDisplay getVariable ["A3U_tipLastMrk", ""];
    if (_lastMarker != _nearestMarker) then {
        _mapDisplay setVariable ["A3U_tipLastMrk", _nearestMarker];
        _mapDisplay setVariable ["A3U_tipFadeInStart", diag_tickTime];
        _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];
    };

    _mapDisplay setVariable ["A3U_tipHoverScreen", _nearestScreenPosition];
    _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];

    if ((_mapDisplay getVariable ["A3U_tipFadeInStart", -1]) < 0) then {
        _mapDisplay setVariable ["A3U_tipFadeInStart", diag_tickTime];
    };

    _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];

    if (!A3AU_setting_alwaysShowMarkerName) then {
        private _tooltipStructuredText = if (_iconPath != "") then {
            format [
                "<img image='%1' size='1.2'/> <t size='0.9' shadow='2'>%2</t>",
                _iconPath,
                _hoverTitle
            ]
        } else {
            format [
                "<t size='0.9' shadow='2'>%1</t>",
                _hoverTitle
            ]
        };

        _tooltipControl ctrlSetStructuredText (parseText _tooltipStructuredText);

        private _tooltipWidth = 0.40;
        private _tooltipHeight = (ctrlTextHeight _tooltipControl) + 0.02;

        private _tooltipPositionX = (_nearestScreenPosition # 0) + 0.018;
        private _tooltipPositionY = (_nearestScreenPosition # 1) - (_tooltipHeight * 0.5);

        _tooltipControl ctrlSetPosition [
            _tooltipPositionX,
            _tooltipPositionY,
            _tooltipWidth,
            _tooltipHeight
        ];

        private _fadeInStartTime = _mapDisplay getVariable ["A3U_tipFadeInStart", diag_tickTime];
        private _fadeInProgress = ((diag_tickTime - _fadeInStartTime) / 0.12) min 1 max 0;

        _tooltipControl ctrlSetFade (1 - _fadeInProgress);
        _tooltipControl ctrlCommit 0;
        _tooltipControl ctrlShow true;
    } else {
        if (!isNull _tooltipControl) then {
            _tooltipControl ctrlShow false;
            _tooltipControl ctrlSetFade 1;
            _tooltipControl ctrlCommit 0;
        };
    };

    if (!isNull _hoverRingControl) then {
        private _baseRingSize = 0.07;
        private _fadeInStartTime = _mapDisplay getVariable ["A3U_tipFadeInStart", -1];

        if (_fadeInStartTime < 0) then {
            _fadeInStartTime = diag_tickTime;
            _mapDisplay setVariable ["A3U_tipFadeInStart", _fadeInStartTime];
        };

        private _fadeInDuration = 0.12;
        private _fadeInAlpha = ((diag_tickTime - _fadeInStartTime) / _fadeInDuration) min 1 max 0;

        private _pulseFrequency = 0.7;
        private _pulseAmount = 0.08;
        private _pulseDegrees = diag_tickTime * _pulseFrequency * 360;
        private _pulseScale = 1 + ((sin _pulseDegrees) * _pulseAmount);
        private _ringSize = _baseRingSize * _pulseScale;

        private _ringPositionX = (_nearestScreenPosition # 0) - (_ringSize * 0.5);
        private _ringPositionY = (_nearestScreenPosition # 1) - (_ringSize * 0.5);

        _hoverRingControl ctrlSetPosition [
            _ringPositionX,
            _ringPositionY,
            _ringSize,
            _ringSize
        ];
        _hoverRingControl ctrlCommit 0;
        _hoverRingControl ctrlSetAngle [0, 0.5, 0.5];
        _hoverRingControl ctrlSetTextColor [0.8, 0.8, 0.8, 0.55 * _fadeInAlpha];
        _hoverRingControl ctrlShow true;
    };
} else {
    if ((_mapDisplay getVariable ["A3U_tipLastMrk", ""]) != "") then {
        if ((_mapDisplay getVariable ["A3U_tipFadeOutStart", -1]) < 0) then {
            _mapDisplay setVariable ["A3U_tipFadeOutStart", diag_tickTime];
        };
    };

    private _fadeOutDuration = 0.12;
    private _fadeOutStartTime = _mapDisplay getVariable ["A3U_tipFadeOutStart", -1];

    if (_fadeOutStartTime >= 0) then {
        private _fadeOutAlpha = 1 - (((diag_tickTime - _fadeOutStartTime) / _fadeOutDuration) min 1 max 0);

        if (!isNull _hoverRingControl) then {
            _hoverRingControl ctrlSetTextColor [0.8, 0.8, 0.8, 0.55 * _fadeOutAlpha];
            if (_fadeOutAlpha <= 0) then {
                _hoverRingControl ctrlShow false;
            };
        };

        if (!isNull _tooltipControl) then {
            _tooltipControl ctrlSetFade (1 - _fadeOutAlpha);
            _tooltipControl ctrlCommit 0;
            if (_fadeOutAlpha <= 0) then {
                _tooltipControl ctrlShow false;
            };
        };

        if (_fadeOutAlpha <= 0) then {
            _mapDisplay setVariable ["A3U_tipLastMrk", ""];
            _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];
            _mapDisplay setVariable ["A3U_tipHoverScreen", []];
        };
    } else {
        if (!isNull _tooltipControl) then {
            _tooltipControl ctrlShow false;
        };

        if (!isNull _hoverRingControl) then {
            _hoverRingControl ctrlShow false;
        };
    };
};

if (!isNull _rippleControl) then {
    private _rippleStartTime = _mapDisplay getVariable ["A3U_tipRippleStart", -1];
    if (_rippleStartTime >= 0) then {
        private _rippleDuration = 0.30;
        private _elapsedTime = diag_tickTime - _rippleStartTime;

        private _rippleCenter = _mapDisplay getVariable ["A3U_tipHoverScreen", []];
        if (_rippleCenter isEqualTo []) exitWith {
            _rippleControl ctrlShow false;
            _mapDisplay setVariable ["A3U_tipRippleStart", -1];
        };

        if (_elapsedTime >= _rippleDuration) then {
            _rippleControl ctrlShow false;
            _mapDisplay setVariable ["A3U_tipRippleStart", -1];
        } else {
            private _progress = (_elapsedTime / _rippleDuration) min 1 max 0;
            private _startSize = 0.035;
            private _endSize = 0.110;
            private _rippleSize = _startSize + ((_endSize - _startSize) * _progress);

            private _ripplePositionX = (_rippleCenter # 0) - (_rippleSize * 0.5);
            private _ripplePositionY = (_rippleCenter # 1) - (_rippleSize * 0.5);
            private _rippleAlpha = (1 - _progress) * 0.65;

            _rippleControl ctrlSetPosition [
                _ripplePositionX,
                _ripplePositionY,
                _rippleSize,
                _rippleSize
            ];
            _rippleControl ctrlCommit 0;
            _rippleControl ctrlSetAngle [0, 0.5, 0.5];
            _rippleControl ctrlSetTextColor [1, 1, 1, _rippleAlpha];
            _rippleControl ctrlShow true;
        };
    } else {
        _rippleControl ctrlShow false;
    };
};