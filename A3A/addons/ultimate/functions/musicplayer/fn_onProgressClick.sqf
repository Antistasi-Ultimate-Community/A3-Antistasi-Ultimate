#include "..\..\script_component.hpp"
/*
    Обработчик клика по прогресс-бару для перемотки трека.
    Вызывается из контрола TrackProgressClickCatcher.
*/
params ["_ctrl", "_button", "_xPos", "_yPos", "_shift", "_ctrlKey", "_alt"];

if (_button != 0) exitWith {}; // только левая кнопка мыши

private _display = ctrlParent _ctrl;
private _progressCtrl = _display displayCtrl 85106; // оригинальный прогресс-бар
private _ctrlPos = ctrlPosition _progressCtrl;

// Вычисляем относительную позицию клика (от 0 до 1)
private _relativeX = (_xPos - (_ctrlPos select 0)) / (_ctrlPos select 2);
_relativeX = 0 max _relativeX min 1; // ограничиваем диапазоном

if (count A3U_currentTrack == 0) exitWith {
    systemChat "Нет выбранного трека для перемотки";
};

private _trackClass = A3U_currentTrack#1;
private _config = configFile >> "CfgMusic" >> _trackClass;
private _duration = getNumber (_config >> "duration");

if (_duration <= 0) exitWith {
    systemChat "Не удалось определить длительность трека";
};

private _newTime = _relativeX * _duration;

// Останавливаем текущее воспроизведение
playMusic "";

// Запускаем с новой позиции
playMusic [_trackClass, _newTime];

// Обновляем глобальные переменные
A3U_trackStartTime = diag_tickTime - _newTime;
A3U_trackProgress = _relativeX;

// Если плеер был на паузе, автоматически включаем воспроизведение
if (!A3U_isPlaying) then {
    A3U_isPlaying = true;
    [] call A3U_fnc_updatePlayButton;
};

// Немедленно обновляем положение прогресс-бара
_progressCtrl progressSetPosition _relativeX;

// Обновляем интерфейс (на всякий случай)
[] call A3U_fnc_updateTrackInfo;