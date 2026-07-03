#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_mapTooltip

Description:
    Updates the hover tooltip, marker highlight ring, and click ripple for the
    map marker currently closest to the mouse cursor.

Parameters:
    0: _arguments - The function's input arguments <ARRAY>
    1: _handle - The per-frame handler ID <NUMBER>

Optional:
    2: _thresholdPixels - Pixel distance threshold for marker detection <NUMBER>
        (default: 32)

Example:
    (begin example)
    [[findDisplay 12, (findDisplay 12) displayCtrl 51, 32], -1] 
        call A3U_fnc_mapTooltip;
    (end example)

Returns:
    Nothing <NONE>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

if !assert(params [["_arguments", [], [[]]], ["_handle", -1, [0]]]) exitWith {};
if ((count _arguments) < 3) exitWith {};

private _mapDisplay = _arguments param [0, displayNull, [displayNull]];
private _mapControl = _arguments param [1, controlNull, [controlNull]];
private _thresholdPixels = _arguments param [2, 32, [0]];

private _resetHoverUi = {
    params ["_display", "_tooltipControl", "_hoverRingControl"];
    if (!isNull _tooltipControl) then {
        _tooltipControl ctrlShow false;
        _tooltipControl ctrlSetFade 1;
        _tooltipControl ctrlCommit 0;
    };
    if (!isNull _hoverRingControl) then { _hoverRingControl ctrlShow false; };

    _display setVariable ["A3U_tipLastMrk", ""];
    _display setVariable ["A3U_tipFadeInStart", -1];
    _display setVariable ["A3U_tipFadeOutStart", -1];
    _display setVariable ["A3U_tipHoverScreen", []];
};

if (isNull _mapDisplay || {isNull _mapControl} || {!visibleMap}) exitWith {
    if (!isNull _mapDisplay) then {
        [_mapDisplay, _mapDisplay getVariable ["A3U_tooltipCtrl", controlNull], _mapDisplay getVariable ["A3U_tooltipRingCtrl", controlNull]] call _resetHoverUi;
    };
};

private _tooltipControl = _mapDisplay getVariable ["A3U_tooltipCtrl", controlNull];
private _hoverRingControl = _mapDisplay getVariable ["A3U_tooltipRingCtrl", controlNull];
private _rippleControl = _mapDisplay getVariable ["A3U_tooltipRippleCtrl", controlNull];

if (isNull _tooltipControl || {isNull _hoverRingControl} || {isNull _rippleControl}) then {
    private _tooltipControls = [_mapDisplay] call A3U_fnc_tooltipCreate;
    if (_tooltipControls isEqualType []) then {
        _tooltipControls params [
            ["_newTooltipControl", controlNull, [controlNull]],
            ["_newHoverRingControl", controlNull, [controlNull]],
            ["_newRippleControl", controlNull, [controlNull]]
        ];
        if (isNull _tooltipControl) then { _tooltipControl = _newTooltipControl; };
        if (isNull _hoverRingControl) then { _hoverRingControl = _newHoverRingControl; };
        if (isNull _rippleControl) then { _rippleControl = _newRippleControl; };
    };

    _mapDisplay setVariable ["A3U_tooltipCtrl", _tooltipControl];
    _mapDisplay setVariable ["A3U_tooltipRingCtrl", _hoverRingControl];
    _mapDisplay setVariable ["A3U_tooltipRippleCtrl", _rippleControl];
};

private _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap", createHashMap];
private _mousePosition = getMousePosition;
private _mouseX = _mousePosition # 0;
private _mouseY = _mousePosition # 1;

private _nearestMarker = "";
private _nearestDistanceSquared = 1e12;
private _nearestScreenPosition = [];
private _selectionThreshold = (_thresholdPixels / 1000) max 0.01;
private _thresholdSq = _selectionThreshold * _selectionThreshold;

/* ----------------------------------------------------------------------------
    FAST Distance Checking
---------------------------------------------------------------------------- */
private _candidates = markersX + milAdministrationsX + mrkAntennas + ["Synd_HQ", "synd_hq", "TraderMarker", "tradermarker", "RallyPointMarker", "rallypointmarker"];

{
    if (_x in controlsX) then { continue; };
    
    private _orig = _x;
    if ((_orig find "Dum") == 0) then { _orig = _orig select [3, (count _orig) - 3]; };
    if ([_orig] call A3U_fnc_isMarkerHidden) then { continue; };

    private _screenPosition = _mapControl ctrlMapWorldToScreen (getMarkerPos _x);
    if (_screenPosition isEqualTo []) then { continue; };

    private _dx = (_screenPosition # 0) - _mouseX;
    private _dy = (_screenPosition # 1) - _mouseY;
    private _dsq = (_dx * _dx) + (_dy * _dy);

    if (_dsq < _nearestDistanceSquared) then {
        _nearestDistanceSquared = _dsq;
        _nearestMarker = _x;
        _nearestScreenPosition = _screenPosition;
    };
} forEach _candidates;


if (_nearestMarker != "" && {_nearestDistanceSquared <= _thresholdSq}) then {

    private _origNearest = _nearestMarker;
    if ((_origNearest find "Dum") == 0) then { _origNearest = _origNearest select [3, (count _origNearest) - 3]; };

    private _lastMarker = _mapDisplay getVariable ["A3U_tipLastMrk", ""];
    if (_lastMarker != _nearestMarker) then {
        _mapDisplay setVariable ["A3U_tipLastMrk", _nearestMarker];
        _mapDisplay setVariable ["A3U_tipFadeInStart", diag_tickTime];
        _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];

        [_origNearest] call A3U_fnc_mrkUpdate;
        _hoverMetaMap = missionNamespace getVariable ["A3U_mrkHoverMetaMap", createHashMap];
    };

    _mapDisplay setVariable ["A3U_tipHoverScreen", _nearestScreenPosition];
    _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];
    if ((_mapDisplay getVariable ["A3U_tipFadeInStart", -1]) < 0) then {
        _mapDisplay setVariable ["A3U_tipFadeInStart", diag_tickTime];
    };

    /* --------------------------------------------------------------------
        Tooltip text/icon configuration
    -------------------------------------------------------------------- */
    private _markerMetadata = _hoverMetaMap getOrDefault [_nearestMarker, []];
    if (_markerMetadata isEqualTo []) then { _markerMetadata = _hoverMetaMap getOrDefault [_origNearest, []]; };

    private _hoverTextRaw = "";
    private _flagMarkerType = "";

    if !(_markerMetadata isEqualTo [] || {count _markerMetadata < 1}) then {
        _hoverTextRaw = _markerMetadata param [0, "", [""]];
        _flagMarkerType = _markerMetadata param [1, "", [""]];
    } else {
        _hoverTextRaw = markerText _origNearest;
        if (_hoverTextRaw isEqualTo "") then { _hoverTextRaw = _origNearest; };
    };

    private _hoverTitle = _hoverTextRaw;
    private _lb = _hoverTextRaw find "<br";
    if (_lb > -1) then { _hoverTitle = _hoverTextRaw select [0, _lb]; };

    private _isDestroyed = false;
    if (_origNearest in destroyedSites) then { _isDestroyed = true; };
    if (!_isDestroyed && {_origNearest in mrkAntennas && {markerType _origNearest == "A3AU_radiotower_dead_mrk"}}) then { _isDestroyed = true; };
    if (!_isDestroyed && {_origNearest in milAdministrationsX}) then {
        private _destroyedAdmins = missionNamespace getVariable ["A3A_destroyedMilAdministrations", []];
        if (_destroyedAdmins findIf { !isNull _x && {getMarkerPos _origNearest distance2D _x < 30} } != -1) then { _isDestroyed = true; };
    };

    private _iconPath = "";
    if (_isDestroyed) then {
        _iconPath = getText (configFile >> "CfgMarkers" >> "A3AU_destroyed_mrk" >> "icon");
    } else {
        if (_flagMarkerType != "") then {
            _iconPath = getText (configFile >> "CfgMarkers" >> _flagMarkerType >> "icon");
        };
    };

    if (!A3AU_setting_alwaysShowMarkerName) then {
        private _tooltipStructuredText = if (_iconPath != "") then {
            format ["<img image='%1' size='1.2'/> <t size='0.9' shadow='2'>%2</t>", _iconPath, _hoverTitle]
        } else {
            format ["<t size='0.9' shadow='2'>%1</t>", _hoverTitle]
        };
        _tooltipControl ctrlSetStructuredText (parseText _tooltipStructuredText);

        private _tooltipWidth = 0.40;
        private _tooltipHeight = (ctrlTextHeight _tooltipControl) + 0.02;
        private _tooltipPositionX = (_nearestScreenPosition # 0) + 0.018;
        private _tooltipPositionY = (_nearestScreenPosition # 1) - (_tooltipHeight * 0.5);
        
        _tooltipControl ctrlSetPosition [_tooltipPositionX, _tooltipPositionY, _tooltipWidth, _tooltipHeight];

        private _fadeInStartTime = _mapDisplay getVariable ["A3U_tipFadeInStart", diag_tickTime];
        private _fadeInProgress = ((diag_tickTime - _fadeInStartTime) / 0.12) min 1 max 0;

        _tooltipControl ctrlSetFade (1 - _fadeInProgress);
        _tooltipControl ctrlCommit 0;
        _tooltipControl ctrlShow true;
    } else {
        _tooltipControl ctrlShow false;
        _tooltipControl ctrlSetFade 1;
        _tooltipControl ctrlCommit 0;
    };

    /* --------------------------------------------------------------------
        Ring highlight
    -------------------------------------------------------------------- */
    if (!isNull _hoverRingControl) then {
        private _baseRingSize = 0.07;
        private _fadeInStartTime = _mapDisplay getVariable ["A3U_tipFadeInStart", -1];
        if (_fadeInStartTime < 0) then {
            _fadeInStartTime = diag_tickTime;
            _mapDisplay setVariable ["A3U_tipFadeInStart", _fadeInStartTime];
        };

        private _fadeInAlpha = ((diag_tickTime - _fadeInStartTime) / 0.12) min 1 max 0;
        private _pulseDegrees = diag_tickTime * 0.7 * 360;
        private _ringSize = _baseRingSize * (1 + ((sin _pulseDegrees) * 0.08));
        
        private _ringPositionX = (_nearestScreenPosition # 0) - (_ringSize * 0.5);
        private _ringPositionY = (_nearestScreenPosition # 1) - (_ringSize * 0.5);
        
        _hoverRingControl ctrlSetPosition [_ringPositionX, _ringPositionY, _ringSize, _ringSize];
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

    private _fadeOutStartTime = _mapDisplay getVariable ["A3U_tipFadeOutStart", -1];
    if (_fadeOutStartTime >= 0) then {
        private _fadeOutAlpha = 1 - (((diag_tickTime - _fadeOutStartTime) / 0.12) min 1 max 0);
        
        if (!isNull _hoverRingControl) then {
            _hoverRingControl ctrlSetTextColor [0.8, 0.8, 0.8, 0.55 * _fadeOutAlpha];
            if (_fadeOutAlpha <= 0) then { _hoverRingControl ctrlShow false; };
        };
        
        if (!isNull _tooltipControl) then {
            _tooltipControl ctrlSetFade (1 - _fadeOutAlpha);
            _tooltipControl ctrlCommit 0;
            if (_fadeOutAlpha <= 0) then { _tooltipControl ctrlShow false; };
        };
        
        if (_fadeOutAlpha <= 0) then {
            _mapDisplay setVariable ["A3U_tipLastMrk", ""];
            _mapDisplay setVariable ["A3U_tipFadeOutStart", -1];
            _mapDisplay setVariable ["A3U_tipHoverScreen", []];
        };
    } else {
        if (!isNull _tooltipControl) then { _tooltipControl ctrlShow false; };
        if (!isNull _hoverRingControl) then { _hoverRingControl ctrlShow false; };
    };
};

/* ----------------------------------------------------------------------------
    Click ripple
---------------------------------------------------------------------------- */
if (!isNull _rippleControl) then {
    private _rippleStartTime = _mapDisplay getVariable ["A3U_tipRippleStart", -1];
    if (_rippleStartTime >= 0) then {
        private _elapsedTime = diag_tickTime - _rippleStartTime;
        private _rippleCenter = _mapDisplay getVariable ["A3U_tipHoverScreen", []];

        if (_rippleCenter isEqualTo []) exitWith {
            _rippleControl ctrlShow false;
            _mapDisplay setVariable ["A3U_tipRippleStart", -1];
        };

        if (_elapsedTime >= 0.30) then {
            _rippleControl ctrlShow false;
            _mapDisplay setVariable ["A3U_tipRippleStart", -1];
        } else {
            private _progress = (_elapsedTime / 0.30) min 1 max 0;
            private _rippleSize = 0.035 + ((0.110 - 0.035) * _progress);

            private _ripplePositionX = (_rippleCenter # 0) - (_rippleSize * 0.5);
            private _ripplePositionY = (_rippleCenter # 1) - (_rippleSize * 0.5);
            private _rippleAlpha = (1 - _progress) * 0.65;
            
            _rippleControl ctrlSetPosition [_ripplePositionX, _ripplePositionY, _rippleSize, _rippleSize];
            _rippleControl ctrlCommit 0;
            _rippleControl ctrlSetAngle [0, 0.5, 0.5];
            _rippleControl ctrlSetTextColor [1, 1, 1, _rippleAlpha];
            _rippleControl ctrlShow true;
        };
    } else {
        _rippleControl ctrlShow false;
    };
};