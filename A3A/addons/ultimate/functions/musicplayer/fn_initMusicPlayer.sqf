//fn_initMusicPlayer.sqf
#include "..\..\script_component.hpp"

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

// Сохраняем состояние воспроизведения перед инициализацией UI
private _wasPlaying = A3U_isPlaying;
private _savedTrack = +A3U_currentTrack; // Копируем текущий трек

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

// Восстановление выбранной категории
private _selectedCategory = "";
if (count _savedTrack > 0) then {
    private _config = configFile >> "CfgMusic" >> (_savedTrack#1);
    _selectedCategory = getText (_config >> "theme");
    if (_selectedCategory == "") then { _selectedCategory = "Unknown"; };
};

private _categoryIndex = 0;
if (_selectedCategory != "") then {
    _categoryIndex = _categories find _selectedCategory;
    if (_categoryIndex == -1) then { _categoryIndex = 0; };
};

_categoriesList lbSetCurSel _categoryIndex;

// Настройка слайдера громкости
private _volumeSlider = _display displayCtrl 85107;
_volumeSlider sliderSetRange [0, 1];
_volumeSlider sliderSetPosition A3U_volume;

// Запуск монитора прогресса трека
[] spawn A3U_fnc_trackProgressMonitor;

// Обновление интерфейса
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

// Восстановление воспроизведения после инициализации UI
if (_wasPlaying && {count _savedTrack > 0}) then {
    [] spawn {
        sleep 0.1; // Даем время на инициализацию UI
        if (!isNull findDisplay 85000) then {
            // Восстанавливаем прогресс
            if (A3U_pausedProgress > 0) then {
                private _config = configFile >> "CfgMusic" >> (_savedTrack#1);
                private _duration = getNumber (_config >> "duration");
                A3U_trackStartTime = diag_tickTime - (A3U_pausedProgress * _duration);
            };
            
            // Воспроизводим трек
            playMusic (_savedTrack#1);
            A3U_isPlaying = true;
            0.5 fadeMusic A3U_volume;
            
            // Обновляем интерфейс
            [] call A3U_fnc_updatePlayButton;
            [] call A3U_fnc_updateTrackInfo;
        };
    };
};

systemChat "Плеер успешно инициализирован!";