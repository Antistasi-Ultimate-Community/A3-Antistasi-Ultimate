// fn_volumeChanged.sqf
/*  
    Author: wersal

    Description:
        Event handler for the volume slider.
        Sets the volume, applies boost for music, and restarts sound playback if needed.

    Params:
        _ctrlVolume : CONTROL : the volume slider
        _value : NUMBER : new slider value (0-1)

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_ctrlVolume", "_value"];

private _display = ctrlParent _ctrlVolume;
private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;
private _slider = _display displayCtrl 85107;

// Unmute if it was on
if (A3U_muted) then { A3U_muted = false; };

// Set volume
A3U_volume = linearConversion [0, 1, _value, 0, 1, true];

// Apply volume depending on mode
if (A3U_playbackMode == "music") then {
    private _boostFactor = [1, 2, 3, 4, 5] select A3U_boostLevel;
    0 fadeMusic (A3U_volume * _boostFactor);
} else {
    // For sounds: if currently playing, restart with new volume
    if (A3U_isPlaying && {A3U_playbackMode == "sound"}) then {
        [] call A3U_fnc_playTrack;
    };
};

if (A3U_playbackMode == "music") then {
    _volOn ctrlShow true;
    _volOff ctrlShow false;
    _volOn ctrlSetTooltip localize "STR_A3U_mute_off";
    _slider sliderSetPosition A3U_volume;
};