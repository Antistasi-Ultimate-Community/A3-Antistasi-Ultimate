//fn_nextTrack.sqf
#include "..\..\script_component.hpp"

if (isNil "A3U_currentTrackList") exitWith {};
if (A3U_currentTrackList isEqualTo []) exitWith {};

private _count = count A3U_currentTrackList;
private _newIndex = 0;

diag_log format ["[nextTrack] ДО: track=%1, index=%2", A3U_currentTrack, A3U_currentTrackIndex];

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

// Устанавливаем новый трек
private _newTrack = A3U_currentTrackList select _newIndex;
A3U_currentTrack = _newTrack;
A3U_currentTrackIndex = _newIndex;
A3U_trackProgress = 0;

diag_log format ["[nextTrack] ПОСЛЕ: track=%1, index=%2", A3U_currentTrack, A3U_currentTrackIndex];

// Если музыка играет, запускаем новый трек
if (A3U_isPlaying) then {
    [] call A3U_fnc_playTrack;
};

// Если диалог открыт, обновляем выделение в списке треков
private _display = findDisplay 85000;
if (!isNull _display) then {
    private _tracksList = _display displayCtrl 85102;
    _tracksList lbSetCurSel _newIndex;
    [] call A3U_fnc_updateTrackInfo;
};
