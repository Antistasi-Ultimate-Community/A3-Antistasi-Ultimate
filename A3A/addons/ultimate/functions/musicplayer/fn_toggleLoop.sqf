// fn_toggleLoop.sqf
/*  
    Author: wersal

    Description:
        Toggles the loop (repeat) mode for music or sounds.
        Updates the button appearance.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

A3U_loopEnabled = !A3U_loopEnabled;

private _display = findDisplay 85000;
if (!isNull _display) then {
    private _btn = _display displayCtrl 85113;
    private _tooltip = if (A3U_loopEnabled) then {
        if (A3U_playbackMode == "music") then {
            localize "STR_A3U_loop_track_off"
        } else {
            localize "STR_A3U_loop_sound_off"
        }
    } else {
        if (A3U_playbackMode == "music") then {
            localize "STR_A3U_loop_track_on"
        } else {
            localize "STR_A3U_loop_sound_on"
        }
    };
    _btn ctrlSetTooltip _tooltip;

    // Change icon color
    if (A3U_loopEnabled) then {
        _btn ctrlSetBackgroundColor [0.95,0.95,0.95,1]; // light gray (accent)
    } else {
        _btn ctrlSetBackgroundColor [1,1,1,1]; // white
    };
};