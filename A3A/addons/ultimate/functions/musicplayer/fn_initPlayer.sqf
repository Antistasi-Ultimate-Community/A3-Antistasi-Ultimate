//fn_initPlayer.sqf
#include "..\..\script_component.hpp"

// Определение функции с префиксом A3U_fnc_
// Создание диалога плеера
if (!createDialog "RscDisplayMusicPlayer") exitWith {
    systemChat "Ошибка создания плеера!";
};

// Инициализация глобальных переменных с префиксом A3U_
if (isNil "A3U_currentTrack") then { A3U_currentTrack = []; };
if (isNil "A3U_isPlaying") then { A3U_isPlaying = false; };
if (isNil "A3U_trackProgress") then { A3U_trackProgress = 0; };
if (isNil "A3U_volume") then { A3U_volume = 0.5; };
if (isNil "A3U_trackStartTime") then { A3U_trackStartTime = 0; };
if (isNil "A3U_pausedProgress") then { A3U_pausedProgress = 0; };

// Получение динамических категорий
private _categories = [];
if (isNil "A3U_fnc_getCategories") then {
    systemChat "Ошибка: Функция A3U_fnc_getCategories не найдена!";
} else {
    _categories = call A3U_fnc_getCategories;
    if (count _categories == 0) exitWith {
        systemChat "Нет доступных музыкальных категорий!";
    };
};

// Заполнение списка категорий
private _display = findDisplay 85000;
private _categoriesList = _display displayCtrl 85101;
{ _categoriesList lbAdd _x } forEach _categories;
_categoriesList lbSetCurSel 0;

// Настройка слайдера громкости
private _volumeSlider = _display displayCtrl 85107;
_volumeSlider sliderSetRange [0, 1];
_volumeSlider sliderSetPosition A3U_volume;

// Запуск монитора прогресса трека
[] spawn A3U_fnc_trackProgressMonitor;

// Обновление интерфейса
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

systemChat "Плеер успешно инициализирован!";