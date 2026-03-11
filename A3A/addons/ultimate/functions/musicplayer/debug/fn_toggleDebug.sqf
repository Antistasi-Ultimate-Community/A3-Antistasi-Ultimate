// fn_toggleDebug.sqf
/*  
    Author: wersal

    Description:
        Toggles the visibility of the debug panel in the player.
        When enabled, updates the displayed information.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _debugBg = _display displayCtrl 85120;
private _debugText = _display displayCtrl 85121;
private _toggleBtn = _display displayCtrl 85122;
private _debugCopyBtn = _display displayCtrl 85123;  // IDC of the copy button

// State variable (can be stored in missionNamespace or display)
if (isNil "A3U_debugVisible") then { A3U_debugVisible = false; };

A3U_debugVisible = !A3U_debugVisible;

// Show/hide elements
_debugBg ctrlShow A3U_debugVisible;
_debugText ctrlShow A3U_debugVisible;
_debugCopyBtn ctrlShow A3U_debugVisible;

// If turned on and there is a track – update data
if (A3U_debugVisible && {count A3U_currentTrack > 0}) then {
    [] call A3U_fnc_updateDebugInfo;
};

// Change button text (optional)
//_toggleBtn ctrlSetText (if (A3U_debugVisible) then {"Debug ON"} else {"Debug OFF"});