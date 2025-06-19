//fn_initMusicPlayer.sqf
#include "..\..\script_component.hpp"

// Инициализация глобальных переменных
if (isNil "A3U_playerState") then {
    A3U_playerState = [
        [],     // currentTrack
        false,  // isPlaying
        0,      // trackProgress
        0.5,    // volume
        0,      // trackStartTime
        0       // pausedProgress
    ];
};

// Сохраняем текущее состояние перед открытием диалога
private _savedState = +A3U_playerState;

// Создание диалога
if (!createDialog "RscDisplayMusicPlayer") exitWith {
    systemChat "Ошибка создания плеера!";
};

// Восстановление глобального состояния
A3U_playerState = _savedState;

// Распаковываем состояние для удобства
A3U_currentTrack = A3U_playerState#0;
A3U_isPlaying = A3U_playerState#1;
A3U_trackProgress = A3U_playerState#2;
A3U_volume = A3U_playerState#3;
A3U_trackStartTime = A3U_playerState#4;
A3U_pausedProgress = A3U_playerState#5;

// Получение категорий
private _categories = call {
    if (isNil "A3U_fnc_getCategories") then {
        systemChat "Ошибка: Функция A3U_fnc_getCategories не найдена!";
        []
    } else {
        call A3U_fnc_getCategories
    };
};

// Инициализация UI
private _display = findDisplay 85000;
if (isNull _display) exitWith {systemChat "Ошибка: Диалог не найден!"};

// Заполнение категорий
private _categoriesList = _display displayCtrl 85101;
lbClear _categoriesList;

if (count _categories > 0) then {
    { _categoriesList lbAdd _x } forEach _categories;
    
    // Восстановление выбранной категории
    private _selectedCategory = "";
    if (count A3U_currentTrack > 0) then {
        private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
        _selectedCategory = getText (_config >> "theme");
        if (_selectedCategory == "") then { _selectedCategory = "Unknown" };
    };
    
    private _categoryIndex = 0;
    if (_selectedCategory != "") then {
        _categoryIndex = _categories find _selectedCategory;
        if (_categoryIndex == -1) then { _categoryIndex = 0 };
    };
    
    _categoriesList lbSetCurSel _categoryIndex;
} else {
    systemChat "Нет доступных категорий!";
    _categoriesList lbAdd "Нет категорий";
};

// Настройка громкости
private _volumeSlider = _display displayCtrl 85107;
_volumeSlider sliderSetRange [0, 1];
_volumeSlider sliderSetPosition A3U_volume;

// Обновление иконки громкости
private _volumeIcon = _display displayCtrl 85108;
private _icon = switch true do {
    case (A3U_volume >= 0.66): {"\a3\ui_f\data\gui\cfg\hints\volume_high_ca.paa"};
    case (A3U_volume >= 0.33): {"\a3\ui_f\data\gui\cfg\hints\volume_medium_ca.paa"};
    default {"\a3\ui_f\data\gui\cfg\hints\volume_low_ca.paa"};
};
_volumeIcon ctrlSetText _icon;

// Запуск монитора прогресса
terminate (missionNamespace getVariable ["A3U_progressMonitorScript", scriptNull]);
A3U_progressMonitorScript = [] spawn A3U_fnc_trackProgressMonitor;

// Обновление интерфейса
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

// Восстановление воспроизведения
if (A3U_isPlaying && {count A3U_currentTrack > 0}) then {
    [] spawn {
        sleep 0.1; // Даем время на инициализацию UI
        
        if (isNull findDisplay 85000) exitWith {};
        
        // Восстановление позиции
        if (A3U_pausedProgress > 0) then {
            private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
            private _duration = getNumber (_config >> "duration");
            A3U_trackStartTime = diag_tickTime - (A3U_pausedProgress * _duration);
        };
        
        // Воспроизведение
        playMusic (A3U_currentTrack#1);
        0.5 fadeMusic A3U_volume;
        
        // Обновление интерфейса
        [] call A3U_fnc_updatePlayButton;
        [] call A3U_fnc_updateTrackInfo;
    };
};

systemChat "Плеер успешно инициализирован!";