//fn_playPause.sqf
#include "..\..\script_component.hpp"

if (A3U_isPlaying) then {
    A3U_pausedProgress = A3U_trackProgress;
    playMusic "";
    A3U_isPlaying = false;
    [] call A3U_fnc_updatePlayButton; // Немедленное обновление кнопки
} else {
    if (A3U_currentTrack isEqualTo []) then {
        // Автоматический выбор первого трека, если ничего не выбрано
        private _tracksList = (findDisplay 85000) displayCtrl 85102;
        if (lbSize _tracksList > 0) then {
            _tracksList lbSetCurSel 0;
        };
    } else {
        // Воспроизводим с сохраненной позиции
        [] call A3U_fnc_playTrack;
    };
};