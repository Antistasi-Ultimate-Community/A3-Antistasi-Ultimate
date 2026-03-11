// fn_toggleMute.sqf
/*  
    Author: wersal

    Description:
        Toggles mute for music mode.
        Saves the current volume before muting and restores it when unmuted.
        Not used in sound mode.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;
private _slider = _display displayCtrl 85107;

if (A3U_muted) then {
    // Unmute
    A3U_volume = A3U_volumeBeforeMute;
    A3U_muted = false;
    if (A3U_playbackMode == "music") then { 0 fadeMusic A3U_volume; };
    _slider sliderSetPosition A3U_volume;
} else {
    // Mute
    A3U_volumeBeforeMute = A3U_volume;
    A3U_muted = true;
    if (A3U_playbackMode == "music") then { 0 fadeMusic 0; };
    _slider sliderSetPosition 0;
};

// Update UI
if (A3U_playbackMode == "music") then {
    if (A3U_muted) then {
        _volOn ctrlShow false;
        _volOff ctrlShow true;
        _volOff ctrlSetTooltip localize "STR_A3U_mute_on";
    } else {
        _volOn ctrlShow true;
        _volOff ctrlShow false;
        _volOn ctrlSetTooltip localize "STR_A3U_mute_off";
    };
};