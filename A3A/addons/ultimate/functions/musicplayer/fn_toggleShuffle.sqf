// fn_toggleShuffle.sqf
/*  
    Author: wersal

    Description:
        Toggles shuffle (random) mode for track playback.
        Updates the button appearance.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _shuffleBtn = _display displayCtrl 85114;
if (isNull _shuffleBtn) exitWith {};

// Toggle the variable
if (isNil "A3U_shuffleEnabled") then { A3U_shuffleEnabled = false; };
A3U_shuffleEnabled = !A3U_shuffleEnabled;

// Change button appearance
if (A3U_shuffleEnabled) then {
    // Enabled: highlight with a different background color or change icon to "active"
    _shuffleBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1]; // green tint
    _shuffleBtn ctrlSetTooltip localize "STR_A3U_shuffle_on_tooltip";
} else {
    // Disabled: return to normal appearance
    _shuffleBtn ctrlSetBackgroundColor [0.2,0.2,0.2,1];
    _shuffleBtn ctrlSetTooltip localize "STR_A3U_shuffle_off_tooltip";
};

// Optionally output a message in systemChat for debugging
systemChat format [localize "STR_A3U_shuffle_status", ["off","on"] select A3U_shuffleEnabled];