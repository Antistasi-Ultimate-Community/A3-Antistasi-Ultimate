// fn_trackChanged.sqf
/*  
    Author: wersal

    Description:
        Event handler for track list selection.
        Updates the current track and starts playback if the player is playing.

    Params:
        _ctrlTracks : CONTROL : the track list control
        _index : NUMBER : selected row index

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_ctrlTracks", "_index"];

private _display = ctrlParent _ctrlTracks;
if (_display getVariable ["A3U_skipTrackChange", false]) exitWith {};

if (_index == -1) exitWith {};

// Do not update if it's the same track
private _newTrack = [_ctrlTracks lbText _index, _ctrlTracks lbData _index];
if (count A3U_currentTrack > 0 && {A3U_currentTrack#1 == _newTrack#1}) exitWith {};

// Get track data from the list
private _trackData = [
    _ctrlTracks lbText _index,
    _ctrlTracks lbData _index
];

// Update global variables
A3U_currentTrack = _trackData;
A3U_trackProgress = 0;
A3U_currentTrackIndex = _index; // index in the list

// Start playback only if the player was active
if (A3U_isPlaying) then {
    [] call A3U_fnc_playTrack;
};

// Update interface
[] call A3U_fnc_updateTrackInfo;

// Synchronize slider with mute
private _display = findDisplay 85000;
if (!isNull _display) then {
    private _slider = _display displayCtrl 85107;
    private _volOn = _display displayCtrl 85108;
    private _volOff = _display displayCtrl 85109;

    if (A3U_playbackMode == "music") then {
        if (A3U_muted) then {
            _volOn ctrlShow false;
            _volOff ctrlShow true;
            _volOff ctrlSetTooltip localize "STR_A3U_mute_on";
            _slider sliderSetPosition 0;
        } else {
            _volOn ctrlShow true;
            _volOff ctrlShow false;
            _volOn ctrlSetTooltip localize "STR_A3U_mute_off";
            _slider sliderSetPosition A3U_volume;
        };
    };
};

if (!isNil "A3U_debugVisible" && {A3U_debugVisible}) then {
    [] call A3U_fnc_updateDebugInfo;
};