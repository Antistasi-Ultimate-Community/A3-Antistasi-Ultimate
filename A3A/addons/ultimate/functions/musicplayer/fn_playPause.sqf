//fn_playPause.sqf
#include "..\..\script_component.hpp"

if (A3U_isPlaying) then {
    // Пауза
    A3U_playerState = [
        A3U_currentTrack,
        false,
        A3U_trackProgress,
        A3U_volume,
        A3U_trackStartTime
    ];
    playMusic "";
    A3U_isPlaying = false;
    [] call A3U_fnc_updatePlayButton;
} else {
    if (A3U_currentTrack isEqualTo []) then {
        private _tracksList = (findDisplay 85000) displayCtrl 85102;
        if (lbSize _tracksList > 0) then {
            _tracksList lbSetCurSel 0;
        };
    } else {
        [] call A3U_fnc_playTrack;
    };
};