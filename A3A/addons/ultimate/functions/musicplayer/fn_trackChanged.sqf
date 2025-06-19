//fn_trackChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlTracks", "_index"];

if (_index == -1) exitWith {}; // Выход, если выбор сброшен

// Получение данных трека из списка
private _trackData = [
    _ctrlTracks lbText _index, // Название трека
    _ctrlTracks lbData _index  // Путь к аудиофайлу
];

// Обновление глобальных переменных
A3U_currentTrack = _trackData;
A3U_trackProgress = 0;

// Запуск воспроизведения и обновление интерфейса
[] call A3U_fnc_playTrack;
[] call A3U_fnc_updateTrackInfo;