// fn_boostChanged.sqf
/*  
    Author: wersal

    Description:
        Event handler for the boost slider.
        Saves the new value, updates the tooltip, and if needed restarts playback.

    Params:
        _ctrl : CONTROL : the slider control
        _value : NUMBER : new slider value (0-4)

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_ctrl", "_value"];

private _intValue = round _value; // 0-4
A3U_boostLevel = _intValue;

// Update slider tooltip
private _dbValues = [0,2,3,4,5];
_ctrl ctrlSetTooltip format [localize "STR_A3U_boost_tooltip_short", _dbValues select _intValue];

if (A3U_isPlaying) then {
    if (A3U_playbackMode == "music") then {
        // For music, change volume with new boost without restarting
        private _boostFactor = [1, 2, 3, 4, 5] select A3U_boostLevel;
        if (A3U_muted) then {
            0 fadeMusic 0;
        } else {
            0.5 fadeMusic (A3U_volume * _boostFactor);
        };
    } else {
        // For sound, restart the track with new boost
        [] call A3U_fnc_playTrack;
    };
};