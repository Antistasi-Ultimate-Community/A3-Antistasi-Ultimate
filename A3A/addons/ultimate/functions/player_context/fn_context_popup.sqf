#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_popup

Description:
    Generates a temporary, universally accessible UI toast notification on the 
    main game HUD. Features dynamic routing (automatically sends to the correct 
    client), color-coded themes, an audio cue, and a smart maximum stack limit 
    of 5 that smoothly cascades older notifications off the screen.

Parameters:
    0: _text - The message to be displayed inside the notification <STRING>
    1: _theme - Visual theme ("DEFAULT", "SUCCESS", "WARNING", "ERROR") <STRING> (default: "DEFAULT")
    2: _unit - The target player who will see this popup <OBJECT> (default: local player)

Example:
    (begin example)
    ["Funds transferred successfully.", "SUCCESS", _targetPlayer] spawn A3U_fnc_context_popup;
    ["Target out of range!", "ERROR"] spawn A3U_fnc_context_popup;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client or Server, Scheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params [
    ["_text", "", [""]],
    ["_theme", "DEFAULT", [""]],
    ["_unit", player, [objNull]]
];

if (_text == "") exitWith {};

// -----------------------------------------------------------------------------
// DYNAMIC EXECUTION ROUTING
// -----------------------------------------------------------------------------
if (!hasInterface) exitWith {
    if (!isNull _unit) then {
        [_text, _theme, _unit] remoteExec ["A3U_fnc_context_popup", _unit];
    };
};

if (_unit != player) exitWith {
    [_text, _theme, _unit] remoteExec ["A3U_fnc_context_popup", _unit];
};


disableSerialization;
private _display = findDisplay 46;
if (isNull _display) exitWith {};

// -----------------------------------------------------------------------------
// THEME & COLOR CONFIGURATION
// -----------------------------------------------------------------------------
private _lineColor = [1, 1, 0, 1]; // Yellow default
switch (toUpper _theme) do {
    case "SUCCESS": { _lineColor = [0.18, 0.50, 0.20, 1]; }; // Green
    case "WARNING": { _lineColor = [0.8, 0.5, 0.1, 1]; };    // Orange
    case "ERROR":   { _lineColor = [0.8, 0.1, 0.1, 1]; };    // Red
};

private _w = 0.25 * safeZoneW;
private _h = 0.03 * safeZoneH;
private _xPos = safeZoneX + (safeZoneW / 2) - (_w / 2);
private _baseY = safeZoneY + safeZoneH - 0.12 * safeZoneH;
private _offsetY = 0.035 * safeZoneH;

// -----------------------------------------------------------------------------
// STACK LIMIT & CASCADE LOGIC
// -----------------------------------------------------------------------------
private _activeToasts = uiNamespace getVariable ["A3U_ActiveToasts", []];
_activeToasts = _activeToasts select { !isNull _x }; 

// Enforce max stack of 5. If we have 5 or more, aggressively fade out the oldest ones.
while {count _activeToasts >= 5} do {
    private _oldest = _activeToasts deleteAt 0;
    if (!isNull _oldest) then {
        _oldest ctrlSetFade 1;
        _oldest ctrlCommit 0.2;
        // Clean up memory after fade completes
        [_oldest] spawn { sleep 0.2; if (!isNull (_this#0)) then { ctrlDelete (_this#0); }; };
    };
};

// Smoothly slide all surviving toasts down to fill the empty space
{
    private _targetY = _baseY - (_forEachIndex * _offsetY);
    private _pos = ctrlPosition _x;
    if (_pos#1 != _targetY) then {
        _pos set [1, _targetY];
        _x ctrlSetPosition _pos;
        _x ctrlCommit 0.2; 
    };
} forEach _activeToasts;

// Now that older toasts have moved down, calculate our spawn position at the top
private _yPos = _baseY - (count _activeToasts * _offsetY);

// -----------------------------------------------------------------------------
// RENDER POPUP
// -----------------------------------------------------------------------------
private _toastGrp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
if (isNull _toastGrp) exitWith {}; 

// Initialize invisible for the fade-in effect
_toastGrp ctrlSetPosition [_xPos, _yPos, _w, _h];
_toastGrp ctrlSetFade 1; 
_toastGrp ctrlCommit 0;

_activeToasts pushBack _toastGrp;
uiNamespace setVariable ["A3U_ActiveToasts", _activeToasts];

private _bg = _display ctrlCreate ["RscText", -1, _toastGrp];
_bg ctrlSetPosition [0, 0, _w, _h];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

private _line = _display ctrlCreate ["RscText", -1, _toastGrp];
_line ctrlSetPosition [0, 0, _w, 0.002 * safeZoneH];
_line ctrlSetBackgroundColor _lineColor;
_line ctrlCommit 0;

private _txt = _display ctrlCreate ["RscStructuredText", -1, _toastGrp];
_txt ctrlSetPosition [0, 0.002 * safeZoneH, _w, 0.028 * safeZoneH];
_txt ctrlSetStructuredText parseText format ["<t align='center' valign='middle' size='0.9'>%1</t>", _text];
_txt ctrlCommit 0;

// Execute Audio Cue & Fade-In Animation
playSound "HintExpand"; 
_toastGrp ctrlSetFade 0;
_toastGrp ctrlCommit 0.3;

sleep 2.5; // Wait for the user to read it

if (isNull _toastGrp) exitWith {};

// Execute Fade-Out Animation
_toastGrp ctrlSetFade 1; 
_toastGrp ctrlCommit 0.5;
sleep 0.5;

if (!isNull _toastGrp) then { ctrlDelete _toastGrp; };

// -----------------------------------------------------------------------------
// DYNAMIC CASCADE SLIDE ANIMATION (ON EXPIRY)
// -----------------------------------------------------------------------------
private _currentToasts = uiNamespace getVariable ["A3U_ActiveToasts", []];
_currentToasts = _currentToasts select { !isNull _x };
uiNamespace setVariable ["A3U_ActiveToasts", _currentToasts];

{
    private _targetY = _baseY - (_forEachIndex * _offsetY);
    private _pos = ctrlPosition _x;
    
    if (_pos#1 != _targetY) then {
        _pos set [1, _targetY];
        _x ctrlSetPosition _pos;
        _x ctrlCommit 0.25; 
    };
} forEach _currentToasts;