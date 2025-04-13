#include "..\..\script_component.hpp"

if (A3U_isPlaying) then {
    playMusic "";
    A3U_isPlaying = false;
} else {
    if (A3U_currentTrack isEqualTo []) then {
        private _display = findDisplay 85000;
        if (!isNull _display) then {
            private _list = _display displayCtrl 85102;
            private _trackCount = lbSize _list;
            if (_trackCount > 0) then {
                [_list, 0] call A3U_fnc_trackChanged; // Выбор первого трека
            } else {
                systemChat "Нет доступных треков!";
            };
        };
    } else {
        [] call A3U_fnc_playTrack; // Запуск воспроизведения
    };
};

[] call A3U_fnc_updatePlayButton; // Обновление кнопки