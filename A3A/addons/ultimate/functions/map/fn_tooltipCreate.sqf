#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_tooltipCreate

Description:
    Creates or reuses the tooltip controls used by the hover system on the map
    display and returns them for later updates.

Parameters:
    0: _mapDisplay - Map display that owns the tooltip controls <DISPLAY>

Optional:
    None.

Example:
    [findDisplay 12] call A3U_fnc_tooltipCreate;

Returns:
    Tooltip, ring, and ripple controls <ARRAY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

// Existing A3U_fnc_* public function name kept for backwards compatibility.

if !assert(params [
    ["_mapDisplay", nil, [displayNull]]
]) exitWith {
    [controlNull, controlNull, controlNull]
};

private _tooltipControlId = 88001;
private _hoverRingControlId = 88002;
private _rippleControlId = 88003;

private _tooltipControl = _mapDisplay displayCtrl _tooltipControlId;
private _hoverRingControl = _mapDisplay displayCtrl _hoverRingControlId;
private _rippleControl = _mapDisplay displayCtrl _rippleControlId;

if (isNull _hoverRingControl) then {
    _hoverRingControl = _mapDisplay ctrlCreate
        ["RscPictureKeepAspect", _hoverRingControlId];
    _hoverRingControl ctrlShow false;
    _hoverRingControl ctrlSetText
        "\x\A3A\addons\ultimate\data\A3AU_hover_icon.paa";
    _hoverRingControl ctrlSetPosition [0, 0, 0, 0];
    _hoverRingControl ctrlCommit 0;
};

if (isNull _rippleControl) then {
    _rippleControl = _mapDisplay ctrlCreate
        ["RscPictureKeepAspect", _rippleControlId];
    _rippleControl ctrlShow false;
    _rippleControl ctrlSetText
        "\x\A3A\addons\ultimate\data\A3AU_hover_icon.paa";
    _rippleControl ctrlSetPosition [0, 0, 0, 0];
    _rippleControl ctrlCommit 0;
};

if (isNull _tooltipControl) then {
    _tooltipControl = _mapDisplay ctrlCreate
        ["RscStructuredText", _tooltipControlId];
    _tooltipControl ctrlShow false;
    _tooltipControl ctrlSetBackgroundColor [0, 0, 0, 0];
};

[_tooltipControl, _hoverRingControl, _rippleControl]
