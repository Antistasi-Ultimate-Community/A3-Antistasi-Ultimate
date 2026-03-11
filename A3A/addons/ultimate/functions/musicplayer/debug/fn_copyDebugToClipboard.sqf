// fn_copyDebugToClipboard.sqf
/*  
    Author: wersal

    Description:
        Copies the content of the debug panel to the clipboard.
        Called when the copy button is pressed.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _debugTextCtrl = _display displayCtrl 85121;
if (isNull _debugTextCtrl) exitWith {};

private _trackClass = A3U_currentTrack#1;
// Get the structured text (it comes with tags)
private _rawText = [_trackClass] call A3U_fnc_getTrackDebugInfo;
private _textWithTags = ctrlText _debugTextCtrl;

// First replace <br/> with actual line breaks
private _withNewLines = _rawText regexReplace ["<br\s*/?>", "\n"];
// Remove HTML tags, leaving plain text
private _cleanText = _withNewLines regexReplace ["<[^>]*>", ""];

// Copy to clipboard
copyToClipboard _cleanText;

// Visual feedback (optional)
systemChat localize "STR_A3U_debug_copied";