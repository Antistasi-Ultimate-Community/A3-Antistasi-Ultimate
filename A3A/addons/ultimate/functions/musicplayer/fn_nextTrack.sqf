/*  
    fn_nextTrack

    Author: wersal

    Description:
        Switches to the next track in the current list.
        Respects shuffle mode and updates the UI if open.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

if (isNil "A3U_currentTrackList") exitWith {};
if (A3U_currentTrackList isEqualTo []) exitWith {};

private _count = count A3U_currentTrackList;
private _newIndex = 0;

if (A3U_shuffleEnabled) then {
    private _currentIndex = A3U_currentTrackIndex;
    if (_count > 1) then {
        private _randomIndex = _currentIndex;
        while {_randomIndex == _currentIndex} do {
            _randomIndex = floor random _count;
        };
        _newIndex = _randomIndex;
    } else {
        _newIndex = 0;
    };
} else {
    _newIndex = (A3U_currentTrackIndex + 1) min (_count - 1);
};

// Set the new track
private _newTrack = A3U_currentTrackList select _newIndex;
A3U_currentTrack = _newTrack;
A3U_currentTrackIndex = _newIndex;
A3U_trackProgress = 0;

// If music is playing, start the new track
if (A3U_isPlaying) then {
    [] call A3U_fnc_playTrack;
};

// If the dialog is open, update the selection in the track list
private _display = findDisplay 85000;
if (!isNull _display) then {
    private _tracksList = _display displayCtrl 85102;
    _tracksList lbSetCurSel _newIndex;
    [] call A3U_fnc_updateTrackInfo;
};
