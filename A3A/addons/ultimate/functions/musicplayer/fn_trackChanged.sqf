//fn_trackChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlTracks", "_index"];

if (_index == -1) exitWith {};

// Не обновляем, если это тот же трек
private _newTrack = [_ctrlTracks lbText _index, _ctrlTracks lbData _index];
if (count A3U_currentTrack > 0 && {A3U_currentTrack#1 == _newTrack#1}) exitWith {};

// Получение данных трека из списка
private _trackData = [
    _ctrlTracks lbText _index,
    _ctrlTracks lbData _index
];

// Обновление глобальных переменных
A3U_currentTrack = _trackData;
A3U_trackProgress = 0;
A3U_currentTrackIndex = _index; // индекс в списке

// Запуск воспроизведения только если плеер был активен
if (A3U_isPlaying) then {
    [] call A3U_fnc_playTrack;
};

// Обновление интерфейса
[] call A3U_fnc_updateTrackInfo;

// Синхронизация слайдера с мутом
private _display = findDisplay 85000;
if (!isNull _display) then {
    private _slider = _display displayCtrl 85107;
    private _volOn = _display displayCtrl 85108;
    private _volOff = _display displayCtrl 85109;

    if (A3U_muted) then {
        _volOn ctrlShow false;
        _volOff ctrlShow true;
        _volOff ctrlSetTooltip "Включить звук";
        _slider sliderSetPosition 0;
    } else {
        _volOn ctrlShow true;
        _volOff ctrlShow false;
        _volOn ctrlSetTooltip "Выключить звук";
        _slider sliderSetPosition A3U_volume;
    };
};

if (!isNil "A3U_debugVisible" && {A3U_debugVisible}) then {
    [] call A3U_fnc_updateDebugInfo;
};