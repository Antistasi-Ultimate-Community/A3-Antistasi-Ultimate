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

// Распаковываем состояние
A3U_currentTrack = A3U_playerState#0;
A3U_isPlaying = A3U_playerState#1;
A3U_trackProgress = A3U_playerState#2;
A3U_volume = A3U_playerState#3;
A3U_trackStartTime = A3U_playerState#4;
A3U_pausedProgress = A3U_playerState#5;

if (isNil "A3U_loopEnabled") then { A3U_loopEnabled = false; };

if (isNil "A3U_muted") then { A3U_muted = false; };
if (isNil "A3U_volumeBeforeMute") then { A3U_volumeBeforeMute = A3U_volume; };

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

private _selectedCategoryIndex = 0;
private _selectedTrackIndex = -1;

if (count _categories > 0) then {
    // Функция для преобразования первой буквы в заглавную
    private _fnc_capitalize = {
        params ["_str"];
        if (_str == "") exitWith {""};
        toUpper (_str select [0,1]) + toLower (_str select [1])
    };

    {
        private _displayName = if (_x == "unknown") then { "Unknown" } else { [_x] call _fnc_capitalize };
        private _idx = _categoriesList lbAdd _displayName;
        _categoriesList lbSetData [_idx, _x]; // сохраняем исходное значение (нижний регистр) в данных
    } forEach _categories;

    // Найдем категорию текущего трека
    private _currentCategory = "";
    private _currentTrackPath = "";
    private _foundCategory = false;
    
    if (count A3U_currentTrack > 0) then {
        _currentTrackPath = A3U_currentTrack#1;
        private _config = configFile >> "CfgMusic" >> _currentTrackPath;
        if (isClass _config) then {
            _currentCategory = toLower getText (_config >> "theme");
            if (_currentCategory == "") then { _currentCategory = "unknown" };
            
            // Поиск категории в списке
            _selectedCategoryIndex = _categories find _currentCategory;
            if (_selectedCategoryIndex != -1) then {
                _foundCategory = true;
            };
        };
    };
    
    // Если категория не найдена, используем поиск по трекам
    if (!_foundCategory && _currentTrackPath != "") then {
        {
            private _category = _x;
            private _tracks = [_category] call A3U_fnc_getTracksByCategory;
            
            {
                _x params ["_name", "_path"];
                if (_path == _currentTrackPath) exitWith {
                    _currentCategory = _category;
                    _selectedCategoryIndex = _forEachIndex;
                    _foundCategory = true;
                };
            } forEach _tracks;
            
            if (_foundCategory) exitWith {};
        } forEach _categories;
    };
    
    // Гарантируем корректный индекс категории
    if (_selectedCategoryIndex < 0 || _selectedCategoryIndex >= count _categories) then {
        _selectedCategoryIndex = 0;
    };
    
    // Выбираем категорию
    _categoriesList lbSetCurSel _selectedCategoryIndex;
    private _categoryName = _categories select _selectedCategoryIndex;
    
    // Получаем треки для выбранной категории
    private _tracks = [_categoryName] call A3U_fnc_getTracksByCategory;
    
    // Заполняем список треков
    private _tracksList = _display displayCtrl 85102;
    lbClear _tracksList;
    
    if (count _tracks > 0) then {
        {
            _x params ["_name", "_path"];
            private _idx = _tracksList lbAdd _name;
            _tracksList lbSetData [_idx, _path];
            
            // Запоминаем индекс текущего трека
            if (_path == _currentTrackPath) then {
                _selectedTrackIndex = _idx;
            };
        } forEach _tracks;
        
        // Выбираем текущий трек
        if (_selectedTrackIndex != -1) then {
            _tracksList lbSetSelected [_selectedTrackIndex, false]
            //_tracksList lbSetCurSel _selectedTrackIndex;
        } else {
            _tracksList lbSetCurSel 0;
        };
    } else {
        _tracksList lbAdd "Нет треков в категории";
    };
} else {
    systemChat "Нет доступных категорий!";
    _categoriesList lbAdd "Нет категорий";
    
    private _tracksList = _display displayCtrl 85102;
    lbClear _tracksList;
    _tracksList lbAdd "Нет доступных треков";
};

// Настройка громкости
private _volumeSlider = _display displayCtrl 85107;
_volumeSlider sliderSetRange [0, 1];
_volumeSlider sliderSetPosition A3U_volume;

// Обновление иконки громкости
/* private _volumeIcon = _display displayCtrl 85108;
private _icon = switch true do {
    case (A3U_volume >= 0.66): {"a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa"}; ///"\a3\ui_f\data\gui\cfg\hints\volume_high_ca.paa"
    case (A3U_volume >= 0.33): {"a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_on_ca.paa"};  ///"\a3\ui_f\data\gui\cfg\hints\volume_medium_ca.paa"
    default {"a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa"}; //"\a3\ui_f\data\gui\cfg\hints\volume_low_ca.paa"
};
_volumeIcon ctrlSetText _icon; */

/* if (isNil "A3U_musicHandlersSet") then {
    call A3U_fnc_setupMusicHandlers;
    A3U_musicHandlersSet = true;
}; */

// Инициализация громкости и мута
private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;
private _volumeSlider = _display displayCtrl 85107;

_volumeSlider sliderSetRange [0, 1];
if (A3U_muted) then {
    _volOn ctrlShow false;
    _volOff ctrlShow true;
    _volOff ctrlSetTooltip "Включить звук";
    _volumeSlider sliderSetPosition 0;
    0 fadeMusic 0;
} else {
    _volOn ctrlShow true;
    _volOff ctrlShow false;
    _volOn ctrlSetTooltip "Выключить звук";
    _volumeSlider sliderSetPosition A3U_volume;
    0.5 fadeMusic A3U_volume; // или 0 fadeMusic, если не хотите плавности
};

// Установка цвета кнопки повтора
private _loopBtn = _display displayCtrl 85113;
if (!isNull _loopBtn) then {
    if (A3U_loopEnabled) then {
        _loopBtn ctrlSetBackgroundColor [0.95,0.95,0.95,1];
        _loopBtn ctrlSetTooltip "Повтор трека (выкл)";
    } else {
        _loopBtn ctrlSetBackgroundColor [1,1,1,1];
        _loopBtn ctrlSetTooltip "Повтор трека (вкл)";
    };
};

A3U_shuffleEnabled = false; // по умолчанию выключен
// Также можно сразу настроить внешний вид кнопки, если она уже создана
private _shuffleBtn = _display displayCtrl 85114;
if (!isNull _shuffleBtn) then {
    _shuffleBtn ctrlSetBackgroundColor [0.2,0.2,0.2,1];
    _shuffleBtn ctrlSetTooltip "Случайный порядок (выкл)";
};

// Инициализация отладочной панели
A3U_debugVisible = false;
// Инициализация отладочной панели
private _debugBg = _display displayCtrl 85120;
private _debugText = _display displayCtrl 85121;
private _debugBtn = _display displayCtrl 85122;
private _debugCopyBtn = _display displayCtrl 85123;

// Показывать дебаг, если игрок админ (1 или 2) ИЛИ это одиночная игра
private _showDebug = (call BIS_fnc_admin > 0) || (!isMultiplayer);

if (_showDebug) then {
    // Кнопка видна, панель скрыта по умолчанию (её откроет игрок)
    _debugBtn ctrlShow true;
    _debugBg ctrlShow false;
    _debugText ctrlShow false;
    _debugCopyBtn ctrlShow false;
} else {
    // В многопользовательской игре не-админам всё скрыто
    _debugBtn ctrlShow false;
    _debugBg ctrlShow false;
    _debugText ctrlShow false;
    _debugCopyBtn ctrlShow false;
};

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