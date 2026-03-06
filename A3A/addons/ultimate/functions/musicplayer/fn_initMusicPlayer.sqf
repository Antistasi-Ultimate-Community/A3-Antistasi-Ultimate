#include "..\..\script_component.hpp"

// Инициализация глобальных переменных
if (isNil "A3U_playerState") then {
    A3U_playerState = [
        [],     // currentTrack
        false,  // isPlaying
        0,      // trackProgress
        0.5,    // volume
        0       // trackStartTime
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

if (isNil "A3U_loopEnabled") then { A3U_loopEnabled = false; };

if (isNil "A3U_muted") then { A3U_muted = false; };
if (isNil "A3U_volumeBeforeMute") then { A3U_volumeBeforeMute = A3U_volume; };

// Получение категорий (всех)
private _allCategories = call {
    if (isNil "A3U_fnc_getCategories") then {
        systemChat "Ошибка: Функция A3U_fnc_getCategories не найдена!";
        []
    } else {
        call A3U_fnc_getCategories
    };
};

// Применяем фильтр в зависимости от режима
if (isNil "A3U_categoryMode") then { A3U_categoryMode = false; };
private _categories = [];
if (A3U_categoryMode) then {
    // Режим "все категории" – исключаем actualmusic
    _categories = +_allCategories;
    _categories = _categories - ["actualmusic"];
} else {
    // Режим "только избранные": проверяем каждую категорию
    {
        if ([_x] call A3U_fnc_isCategoryAllowed) then {
            _categories pushBack _x;
        };
    } forEach _allCategories;
};

diag_log format ["[init] filtered categories: %1", _categories];

// Инициализация UI
private _display = findDisplay 85000;
if (isNull _display) exitWith {systemChat "Ошибка: Диалог не найден!"};
_display setVariable ["A3U_skipCategoryChange", false];

// ========== ГЛОБАЛЬНЫЕ ОБРАБОТЧИКИ МУЗЫКИ ==========
if (isNil "A3U_musicHandlersInitialized") then {
    if (!isNil "A3U_musicStartEH") then { removeMusicEventHandler ["MusicStart", A3U_musicStartEH]; };
    if (!isNil "A3U_musicStopEH") then { removeMusicEventHandler ["MusicStop", A3U_musicStopEH]; };

    A3U_musicStartEH = addMusicEventHandler ["MusicStart", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        // НЕ обновляем A3U_trackProgress – он может быть неверным (баг Arma)
        if (_totalLength > 0) then {
            // Можно скорректировать startTime, если нужно, но мы уже установили его вручную
            // A3U_trackStartTime = diag_tickTime - (_currentPosition * _totalLength);
        };
        A3U_isPlaying = true; // обязательно
        systemChat format ["[MusicStart] class: %1, pos: %2 (ignored)", _musicClass, _currentPosition];
        diag_log format ["[MusicStart] class: %1, pos: %2 (ignored)", _musicClass, _currentPosition];
    }];

    A3U_musicStopEH = addMusicEventHandler ["MusicStop", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        private _oldProgress = A3U_trackProgress;
        // Можно обновить прогресс, но это не критично
        A3U_trackProgress = _currentPosition;
        A3U_isPlaying = false;
        systemChat format ["[MusicStop] class: %1, pos: %2", _musicClass, _currentPosition];
        diag_log format ["[MusicStop] class: %1, pos: %2", _musicClass, _currentPosition];
    }];

    A3U_musicHandlersInitialized = true;
};
// ========== КОНЕЦ БЛОКА ОБРАБОТЧИКОВ ==========

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
        _categoriesList lbSetData [_idx, _x];
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
            if (_selectedCategoryIndex != -1) then { _foundCategory = true; };
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

    _display setVariable ["A3U_skipCategoryChange", true];
    
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
            if (_path == _currentTrackPath) then { _selectedTrackIndex = _idx; };
        } forEach _tracks;
        
        // Выбираем текущий трек
        if (_selectedTrackIndex != -1) then {
            _tracksList lbSetCurSel _selectedTrackIndex;
        } else {
            _tracksList lbSetCurSel 0;
        };
    } else {
        _tracksList lbAdd "Нет треков в категории";
    };

    _display setVariable ["A3U_skipCategoryChange", false];
    
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
    0.5 fadeMusic A3U_volume;
};

// --- Интерактивный слайдер прогресса (с отладкой) ---
private _progressSlider = _display displayCtrl 85106;
_display setVariable ["isDragging", false];
_display setVariable ["wasPlaying", false];

// Обработчик движения мыши (при зажатой кнопке)
_progressSlider ctrlAddEventHandler ["MouseMoving", {
    params ["_ctrl", "_xPos", "_yPos"];
    private _disp = ctrlParent _ctrl;
    if (!(_disp getVariable ["isDragging", false]) || {count A3U_currentTrack == 0}) exitWith {};
    
    private _newPos = sliderPosition _ctrl;
    private _oldProgress = A3U_trackProgress;
    A3U_trackProgress = _newPos;
    systemChat format ["[MouseMoving] newPos: %1, oldProgress: %2", _newPos, _oldProgress];
    diag_log format ["[MouseMoving] newPos: %1, oldProgress: %2", _newPos, _oldProgress];
}];

// Обработчик нажатия кнопки мыши
_progressSlider ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button", "_xPos", "_yPos"];
    private _disp = ctrlParent _ctrl;
    if (_button != 0 || {count A3U_currentTrack == 0}) exitWith {};
    
    _disp setVariable ["wasPlaying", A3U_isPlaying];
    systemChat format ["[MouseDown] wasPlaying: %1, trackProgress: %2", A3U_isPlaying, A3U_trackProgress];
    diag_log format ["[MouseDown] wasPlaying: %1, trackProgress: %2", A3U_isPlaying, A3U_trackProgress];
    
    // !!! ВАЖНО: останавливаем музыку, чтобы монитор прогресса не обновлялся
    if (A3U_isPlaying) then {
        playMusic "";
        A3U_isPlaying = false;      // Останавливаем монитор прогресса
        systemChat "[MouseDown] Music stopped, isPlaying = false";
        diag_log "[MouseDown] Music stopped, isPlaying = false";
    };
    
    _disp setVariable ["isDragging", true];
}];

// Обработчик отпускания кнопки мыши (после перетаскивания)
_progressSlider ctrlAddEventHandler ["MouseButtonUp", {
    params ["_ctrl", "_button"];
    private _disp = ctrlParent _ctrl;
    if (_button != 0 || {count A3U_currentTrack == 0}) exitWith {};
    
    private _wasPlaying = _disp getVariable ["wasPlaying", false];
    _disp setVariable ["isDragging", false];
    
    private _newPos = sliderPosition _ctrl;
    private _oldProgress = A3U_trackProgress;
    if (abs(_newPos - _oldProgress) < 0.001) exitWith {
        systemChat "[MouseUp] Position unchanged, exiting";
        diag_log "[MouseUp] Position unchanged, exiting";
    };
    
    A3U_trackProgress = _newPos;
    systemChat format ["[MouseUp] newPos: %1, oldProgress: %2, wasPlaying: %3", _newPos, _oldProgress, _wasPlaying];
    diag_log format ["[MouseUp] newPos: %1, oldProgress: %2, wasPlaying: %3", _newPos, _oldProgress, _wasPlaying];
    
    if (_wasPlaying) then {
        private _trackClass = A3U_currentTrack#1;
        private _config = configFile >> "CfgMusic" >> _trackClass;
        private _totalDuration = getNumber (_config >> "duration");
        
        if (_totalDuration > 0) then {
            private _startTime = _newPos * _totalDuration;
            A3U_trackStartTime = diag_tickTime - _startTime;
            systemChat format ["[MouseUp] starting at %1 s", _startTime];
            diag_log format ["[MouseUp] starting at %1 s", _startTime];
            playMusic [_trackClass, _startTime];
            A3U_isPlaying = true;   // Возобновляем монитор
            0.5 fadeMusic A3U_volume;
        };
    };
    // Если трек не играл, A3U_isPlaying остаётся false, прогресс сохранён
}];

// Обработчик изменения позиции слайдера (клик по шкале без перетаскивания)
A3U_sliderEH = _progressSlider ctrlAddEventHandler ["SliderPosChanged", {
    params ["_ctrl", "_newPos"];
    private _disp = ctrlParent _ctrl;
    
    if (_disp getVariable ["isDragging", false]) exitWith {};
    if (count A3U_currentTrack == 0) exitWith {};

    private _oldProgress = A3U_trackProgress;
    if (abs(_newPos - _oldProgress) < 0.001) exitWith {
        systemChat "[SliderPosChanged] Position unchanged, exiting";
        diag_log "[SliderPosChanged] Position unchanged, exiting";
    };
    
    A3U_trackProgress = _newPos;
    systemChat format ["[SliderPosChanged] newPos: %1, oldProgress: %2, isPlaying: %3", _newPos, _oldProgress, A3U_isPlaying];
    diag_log format ["[SliderPosChanged] newPos: %1, oldProgress: %2, isPlaying: %3", _newPos, _oldProgress, A3U_isPlaying];
    
    if (A3U_isPlaying) then {
        private _trackClass = A3U_currentTrack#1;
        private _config = configFile >> "CfgMusic" >> _trackClass;
        private _totalDuration = getNumber (_config >> "duration");
        
        if (_totalDuration > 0) then {
            private _startTime = _newPos * _totalDuration;
            A3U_trackStartTime = diag_tickTime - _startTime;
            systemChat format ["[SliderPosChanged] starting at %1 s", _startTime];
            diag_log format ["[SliderPosChanged] starting at %1 s", _startTime];
            playMusic [_trackClass, _startTime];
            0.5 fadeMusic A3U_volume;
        };
    };
    // Если трек на паузе, просто обновляем A3U_trackProgress (уже сделано)
}];
// -------------------------------------------------

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

A3U_shuffleEnabled = false;
private _shuffleBtn = _display displayCtrl 85114;
if (!isNull _shuffleBtn) then {
    _shuffleBtn ctrlSetBackgroundColor [0.2,0.2,0.2,1];
    _shuffleBtn ctrlSetTooltip "Случайный порядок (выкл)";
};

// Инициализация кнопки переключения режима категорий
private _categoryModeBtn = _display displayCtrl 85116;
if (!isNull _categoryModeBtn) then {
    if (A3U_categoryMode) then {
        _categoryModeBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
        _categoryModeBtn ctrlSetTooltip "Показать только избранные категории";
    } else {
        _categoryModeBtn ctrlSetBackgroundColor [1,1,1,1];
        _categoryModeBtn ctrlSetTooltip "Показать все категории";
    };
};

// Инициализация отладочной панели
A3U_debugVisible = false;
private _debugBg = _display displayCtrl 85120;
private _debugText = _display displayCtrl 85121;
private _debugBtn = _display displayCtrl 85122;
private _debugCopyBtn = _display displayCtrl 85123;

// Показывать дебаг, если игрок админ (1 или 2) ИЛИ это одиночная игра
private _showDebug = (call BIS_fnc_admin > 0) || (!isMultiplayer);

if (_showDebug) then {
    _debugBtn ctrlShow true;
    _debugBg ctrlShow false;
    _debugText ctrlShow false;
    _debugCopyBtn ctrlShow false;
} else {
    _debugBtn ctrlShow false;
    _debugBg ctrlShow false;
    _debugText ctrlShow false;
    _debugCopyBtn ctrlShow false;
};

// ========== ОБРАБОТЧИК ЗАКРЫТИЯ ДИАЛОГА ==========
_display displayAddEventHandler ["Unload", {
    if (!isNil "A3U_currentTrack") then {
        private _currentPos = if (A3U_isPlaying) then { getMusicPlayedTime } else { A3U_trackProgress * (getNumber (configFile >> "CfgMusic" >> (A3U_currentTrack#1) >> "duration")) };
        private _duration = getNumber (configFile >> "CfgMusic" >> (A3U_currentTrack#1) >> "duration");
        A3U_playerState = [
            A3U_currentTrack,
            A3U_isPlaying,
            if (_duration > 0) then { _currentPos / _duration } else { 0 },
            A3U_volume,
            A3U_trackStartTime
        ];
    };
}];
// ========== КОНЕЦ БЛОКА ==========

// Запуск монитора прогресса
terminate (missionNamespace getVariable ["A3U_progressMonitorScript", scriptNull]);
A3U_progressMonitorScript = [] spawn A3U_fnc_trackProgressMonitor;

// Обновление интерфейса
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

// Синхронизация с текущим воспроизведением (без перезапуска)
if (A3U_isPlaying && {count A3U_currentTrack > 0}) then {
    private _trackClass = A3U_currentTrack#1;
    private _config = configFile >> "CfgMusic" >> _trackClass;
    private _totalDuration = getNumber (_config >> "duration");
    if (_totalDuration > 0) then {
        private _currentPos = getMusicPlayedTime;
        A3U_trackProgress = (_currentPos / _totalDuration) min 1;
        A3U_trackStartTime = diag_tickTime - _currentPos;
    };
};

// Обновление интерфейса
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

systemChat "Плеер успешно инициализирован!";