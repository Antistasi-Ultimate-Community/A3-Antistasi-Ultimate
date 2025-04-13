#include "..\..\script_component.hpp"

A3U_fnc_playTrack = {
    //params ["_trackClass"];
    if (A3U_currentTrack isEqualTo []) then {
        systemChat "Ошибка: трек не выбран!";
    };

    // Плавное затухание текущей музыки (если играет)
    if (A3U_isPlaying) then {
        0.5 fadeMusic 0;
        [] spawn { // Используем spawn для асинхронного выполнения
            sleep 0.5;
            playMusic _trackClass;
            0.5 fadeMusic 1;
        };
    } else {
        playMusic _trackClass;
        A3U_isPlaying = true;
    };

    // Воспроизведение нового трека
    playMusic (A3U_currentTrack#1);
    A3U_isPlaying = true;
    A3U_trackStartTime = diag_tickTime;

    // Плавное восстановление громкости
    0.5 fadeMusic A3U_volume;

    // Обновление интерфейса
    [] call A3U_fnc_updatePlayButton;
    [] call A3U_fnc_updateTrackInfo;
};