//fn_playTrack.sqf
#include "..\..\script_component.hpp"

A3U_fnc_playTrack = {
    //params ["_trackClass"];
    if (A3U_currentTrack isEqualTo []) then {
        systemChat "Ошибка: трек не выбран!";
    };

    private _trackClass = A3U_currentTrack#1;
    
    if (A3U_isPlaying) then {
        0.5 fadeMusic 0;
        playMusic "";
        uiSleep 0.5;
    };

    playMusic _trackClass;
    A3U_isPlaying = true;
    A3U_trackStartTime = diag_tickTime;
    
    0.5 fadeMusic A3U_volume;
    
    [] call A3U_fnc_updatePlayButton;
    [] call A3U_fnc_updateTrackInfo;
};