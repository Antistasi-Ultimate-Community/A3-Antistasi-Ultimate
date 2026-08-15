#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3U_fnc_context_popup

Description:
    Generates a stylized, stacking toast notification on the player's screen. 
    Accepts direct color names to style the left accent bar. Can be remotely 
    executed if a target player is provided.

Parameters:
    0: _message - The text to display <STRING>
    1: _colorName - The color identifier (e.g., "RED", "BLUE", "GREEN") <STRING>
    2: _target - The player object to receive the popup (defaults to local) <OBJECT>

Example:
    (begin example)
    ["Player punished.", "ORANGE"] spawn A3U_fnc_context_popup;
    ["Admin sent you a message!", "BLUE", _targetPlayer] spawn A3U_fnc_context_popup;
    (end example)

Returns:
    Nothing <ANY>

Environment:
    Client, Unscheduled

Author:
    Maxx
---------------------------------------------------------------------------- */

params [
    ["_message", "", [""]],
    ["_colorName", "GREY", [""]],
    ["_target", objNull, [objNull]]
];

// If a specific target is provided and it's not us, route it over the network
if (!isNull _target && { _target != player }) exitWith {
    [_message, _colorName, player] remoteExec ["A3U_fnc_context_popup", _target];
};

// Don't run on dedicated servers or if message is empty
if (!hasInterface || _message == "") exitWith {};

disableSerialization;
// Try to attach to the Map Display first. If it's closed, attach to the main HUD.
private _display = findDisplay 12; 
if (isNull _display) then { _display = findDisplay 46; };
if (isNull _display) exitWith {};

// -----------------------------------------------------------------------------
// MAP COLOR NAMES TO RGBA
// -----------------------------------------------------------------------------
private _accentColor = switch (toUpper _colorName) do {
    case "RED"; 
    case "ERROR":     { [0.6, 0.1, 0.1, 1] };
    case "GREEN"; 
    case "SUCCESS":   { [0.18, 0.50, 0.20, 1] };
    case "ORANGE"; 
    case "WARNING":   { [0.8, 0.5, 0.1, 1] };
    case "BLUE":      { [0.1, 0.4, 0.6, 1] };
    case "YELLOW":    { [0.85, 0.75, 0.1, 1] };
    case "PURPLE":    { [0.5, 0.1, 0.6, 1] };
    case "CYAN":      { [0.1, 0.7, 0.7, 1] };
    case "PINK":      { [0.9, 0.4, 0.6, 1] };
    case "BROWN":     { [0.5, 0.3, 0.1, 1] };
    case "WHITE":     { [0.9, 0.9, 0.9, 1] };
    case "BLACK":     { [0.1, 0.1, 0.1, 1] };
    case "GREY"; 
    case "GRAY"; 
    case "DEFAULT":   { [0.25, 0.25, 0.25, 1] };
    default           { [0.25, 0.25, 0.25, 1] };
};

// -----------------------------------------------------------------------------
// STACKING LOGIC & UI GENERATION
// -----------------------------------------------------------------------------
private _activePopups = uiNamespace getVariable ["A3U_Context_ActivePopups", []];
_activePopups = _activePopups select { !isNull _x }; // Clean up deleted popups

private _w = 0.22 * safeZoneW;
private _h = 0.045 * safeZoneH;
private _padY = 0.005 * safeZoneH;

// Spawn near the top middle of the screen
private _startX = safeZoneX + (safeZoneW / 2) - (_w / 2);
private _startY = safeZoneY + (0.12 * safeZoneH);

// Slide any currently active popups down to make room for the new one
{
    private _pos = ctrlPosition _x;
    _x ctrlSetPosition [_pos#0, (_pos#1) + _h + _padY, _pos#2, _pos#3];
    _x ctrlCommit 0.2;
} forEach _activePopups;

// Create the new Popup Group
private _grp = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_grp ctrlSetPosition [_startX, _startY - 0.02, _w, _h]; // Start slightly higher for slide-in effect
_grp ctrlSetFade 1;
_grp ctrlCommit 0;

_activePopups pushBack _grp;
uiNamespace setVariable ["A3U_Context_ActivePopups", _activePopups];

// Background
private _bg = _display ctrlCreate ["RscText", -1, _grp];
_bg ctrlSetPosition [0, 0, _w, _h];
_bg ctrlSetBackgroundColor [0.12, 0.12, 0.12, 0.95];
_bg ctrlCommit 0;

// Color Accent Bar
private _accentW = 0.004 * safeZoneW;
private _accent = _display ctrlCreate ["RscText", -1, _grp];
_accent ctrlSetPosition [0, 0, _accentW, _h];
_accent ctrlSetBackgroundColor _accentColor;
_accent ctrlCommit 0;

// Message Text
private _text = _display ctrlCreate ["RscStructuredText", -1, _grp];
_text ctrlSetPosition [_accentW + 0.005, 0.005 * safeZoneH, _w - _accentW - 0.01, _h];
_text ctrlSetStructuredText parseText format ["<t align='center' size='0.85'>%1</t>", _message];
_text ctrlCommit 0;

// Gentle notification sound
playSound "FD_Timer_F";

// Animate the popup sliding in and fading in
_grp ctrlSetPosition [_startX, _startY, _w, _h];
_grp ctrlSetFade 0;
_grp ctrlCommit 0.25;

// Self-destruct thread: Remove the popup after 5 seconds
[_grp] spawn {
    disableSerialization;
    params ["_grp"];
    sleep 5;
    
    if (!isNull _grp) then {
        _grp ctrlSetFade 1;
        _grp ctrlCommit 0.3;
        sleep 0.3;
        ctrlDelete _grp;
    };
};