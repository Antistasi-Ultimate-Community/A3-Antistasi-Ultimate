//fn_playPause.sqf
#include "..\..\script_component.hpp"

if (A3U_isPlaying) then {
    A3U_pausedProgress = A3U_trackProgress;
    playMusic "";
    A3U_isPlaying = false;
} else {
    if (A3U_currentTrack isEqualTo []) then {
        // Выбор первого трека
    } else {
        if (A3U_pausedProgress > 0) then {
            private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
            private _duration = getNumber (_config >> "duration");
            A3U_trackStartTime = diag_tickTime - (A3U_pausedProgress * _duration);
        };
        [] call A3U_fnc_playTrack;
    };
};