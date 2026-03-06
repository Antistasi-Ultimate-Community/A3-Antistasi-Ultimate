//fn_initMusicPlayer.sqf
#include "..\..\script_component.hpp"

// Инициализация глобальных переменных (расширенное состояние)
if (isNil "A3U_playerState") then {
    A3U_playerState = [
        [],     // 0: currentTrack
        false,  // 1: isPlaying
        0,      // 2: trackProgress
        0.5,    // 3: volume
        0,      // 4: trackStartTime
        [],     // 5: currentTrackList
        -1,     // 6: currentTrackIndex
        "",     // 7: currentCategory
        false,  // 8: categoryMode
        false,  // 9: muted
        false,  //10: shuffleEnabled
        false   //11: loopEnabled
    ];
};

// Сохраняем текущее состояние перед открытием диалога
private _savedState = +A3U_playerState;

// Создание диалога
if (!createDialog "RscDisplayMusicPlayer") exitWith {
    systemChat "Ошибка создания плеера!";
};

// Восстановление глобального состояния (с защитой от старых сохранений)
A3U_playerState = _savedState;

// Распаковываем состояние с проверкой длины
A3U_currentTrack = A3U_playerState param [0, []];
A3U_isPlaying = A3U_playerState param [1, false];
A3U_trackProgress = A3U_playerState param [2, 0];
A3U_volume = A3U_playerState param [3, 0.5];
A3U_trackStartTime = A3U_playerState param [4, 0];
A3U_currentTrackList = A3U_playerState param [5, []];
A3U_currentTrackIndex = A3U_playerState param [6, -1];
A3U_currentCategory = A3U_playerState param [7, ""];
A3U_categoryMode = A3U_playerState param [8, false];
A3U_muted = A3U_playerState param [9, false];
A3U_shuffleEnabled = A3U_playerState param [10, false];
A3U_loopEnabled = A3U_playerState param [11, false];

// Дополнительные инициализации (только если нужно)
if (isNil "A3U_volumeBeforeMute") then { A3U_volumeBeforeMute = A3U_volume; };

// Получение категорий (всех) по темам
private _allCategories = call {
    if (isNil "A3U_fnc_getCategories") then {
        systemChat "Ошибка: Функция A3U_fnc_getCategories не найдена!";
        []
    } else {
        call A3U_fnc_getCategories
    };
};

// ========== ФОРМИРОВАНИЕ СПИСКА КАТЕГОРИЙ ==========
if (isNil "A3U_categoryMode") then { A3U_categoryMode = false; };

private _categories = [];
private _categoryType = ""; // "theme" или "addon"

if (A3U_categoryMode) then {
    // Режим "все категории" – используем темы, исключаем actualmusic и vietnam_radio
    _categories = +_allCategories;
    _categories = _categories - ["actualmusic", "vietnam_radio"];
    _categoryType = "theme";
} else {
    // Режим "только аддоны + actualmusic + vietnam_radio"
    private _addons = call A3U_fnc_getNonVanillaAddons;
    _categories = [];
    
    // Сначала actualmusic
    if (count (call A3U_fnc_getActualTracks) > 0) then {
        _categories pushBack "actualmusic";
    };
    
    // Затем vietnam_radio
    if (count (call A3U_fnc_getVietnamRadioTracks) > 0) then {
        _categories pushBack "vietnam_radio";
    };
    
    // Затем все аддоны
    {
        _categories pushBack _x;
    } forEach _addons;
    
    _categoryType = "addon";
};

diag_log format ["[init] filtered categories: %1", _categories];
// ========== КОНЕЦ ФОРМИРОВАНИЯ ==========

// Инициализация UI
private _display = findDisplay 85000;
if (isNull _display) exitWith {systemChat "Ошибка: Диалог не найден!"};
_display setVariable ["A3U_skipCategoryChange", false];
_display setVariable ["A3U_categoryType", _categoryType]; // Сохраняем тип

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
        A3U_isPlaying = true;
        systemChat format ["[MusicStart] class: %1, pos: %2 (ignored)", _musicClass, _currentPosition];
        diag_log format ["[MusicStart] class: %1, pos: %2 (ignored)", _musicClass, _currentPosition];
    }];

    A3U_musicStopEH = addMusicEventHandler ["MusicStop", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        A3U_trackProgress = _currentPosition;
        A3U_isPlaying = false;
        diag_log format ["[MusicStop] class: %1, pos: %2", _musicClass, _currentPosition];

        // Если трек закончился (близко к 1)
        if (_currentPosition >= 0.99) then {
            if (A3U_loopEnabled) then {
                // Повтор текущего трека
                if (count A3U_currentTrack > 0) then {
                    A3U_trackProgress = 0;
                    playMusic (A3U_currentTrack#1);
                    A3U_trackStartTime = diag_tickTime;
                    A3U_isPlaying = true;
                };
            } else {
                [] call A3U_fnc_nextTrack;
                // После переключения запускаем новый трек (если он есть)
                if (count A3U_currentTrack > 0) then {
                    [] call A3U_fnc_playTrack;
                };
            };
        };
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

    // Определяем, какую категорию выбрать
    private _targetCategory = "";
    private _targetCategoryFound = false;

    // 1. Пробуем восстановить сохранённую категорию
    if (A3U_currentCategory != "" && {A3U_currentCategory in _categories}) then {
        _targetCategory = A3U_currentCategory;
        _targetCategoryFound = true;
        _selectedCategoryIndex = _categories find _targetCategory;
    };

    // 2. Если не нашли, пробуем найти категорию по сохранённому треку
    if (!_targetCategoryFound && {count A3U_currentTrack > 0}) then {
        private _trackClass = A3U_currentTrack#1;
        private _nonVanillaAddons = call A3U_fnc_getNonVanillaAddons;
        {
            private _cat = _x;
            private _tracks = [];
            if (_cat == "actualmusic") then {
                _tracks = call A3U_fnc_getActualTracks;
            } else {
                if (_cat == "vietnam_radio") then {
                    _tracks = call A3U_fnc_getVietnamRadioTracks;
                } else {
                    if (_cat in _nonVanillaAddons) then {
                        _tracks = [_cat] call A3U_fnc_getTracksByAddon;
                    } else {
                        _tracks = [_cat] call A3U_fnc_getTracksByCategory;
                    };
                };
            };
            {
                _x params ["_name", "_path"];
                if (_path == _trackClass) exitWith {
                    _targetCategory = _cat;
                    _targetCategoryFound = true;
                };
            } forEach _tracks;
            if (_targetCategoryFound) exitWith {};
        } forEach _categories;
        if (_targetCategoryFound) then {
            _selectedCategoryIndex = _categories find _targetCategory;
        };
    };

    // 3. Если ничего не нашли, берём первую категорию
    if (!_targetCategoryFound) then {
        _targetCategory = _categories select 0;
        _selectedCategoryIndex = 0;
    };

    _display setVariable ["A3U_skipCategoryChange", true];
    
    _categoriesList lbSetCurSel _selectedCategoryIndex;
    private _categoryName = _targetCategory;

    // Получаем треки для выбранной категории
    private _tracks = [];
    if (_categoryName == "vietnam_radio") then {
        _tracks = call A3U_fnc_getVietnamRadioTracks;
    } else {
        if (_categoryType == "addon" && _categoryName != "actualmusic") then {
            _tracks = [_categoryName] call A3U_fnc_getTracksByAddon;
        } else {
            _tracks = [_categoryName] call A3U_fnc_getTracksByCategory;
        };
    };

    // Заполняем список треков
    private _tracksList = _display displayCtrl 85102;
    lbClear _tracksList;

    if (count _tracks > 0) then {
        {
            _x params ["_name", "_path"];
            private _idx = _tracksList lbAdd _name;
            _tracksList lbSetData [_idx, _path];
        } forEach _tracks;

        // Определяем индекс трека
        private _newTrackIndex = 0;
        if (count A3U_currentTrack > 0) then {
            private _savedClass = A3U_currentTrack#1;
            private _foundIndex = -1;
            {
                _x params ["_name", "_path"];
                if (_path == _savedClass) exitWith { _foundIndex = _forEachIndex; };
            } forEach _tracks;
            if (_foundIndex != -1) then {
                _newTrackIndex = _foundIndex;
            } else {
                _newTrackIndex = 0;
            };
        } else {
            _newTrackIndex = 0;
        };

        _tracksList lbSetCurSel _newTrackIndex;
        A3U_currentTrackList = _tracks;
        A3U_currentTrackIndex = _newTrackIndex;
        A3U_currentCategory = _categoryName;

        // Если сохранённый трек отличается от выбранного, обновляем A3U_currentTrack
        if (count A3U_currentTrack == 0 || {A3U_currentTrack#1 != (_tracks select _newTrackIndex select 1)}) then {
            A3U_currentTrack = _tracks select _newTrackIndex;
        };
    } else {
        _tracksList lbAdd "Нет треков в категории";
        A3U_currentTrackList = [];
        A3U_currentTrackIndex = -1;
        A3U_currentCategory = _categoryName;
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

// --- Интерактивный слайдер прогресса ---
private _progressSlider = _display displayCtrl 85106;
_display setVariable ["isDragging", false];
_display setVariable ["wasPlaying", false];

// Обработчик движения мыши
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
        A3U_isPlaying = false;
        systemChat "[MouseDown] Music stopped, isPlaying = false";
        diag_log "[MouseDown] Music stopped, isPlaying = false";
    };
    
    _disp setVariable ["isDragging", true];
}];

// Обработчик отпускания кнопки мыши
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
            A3U_isPlaying = true;
            if (A3U_muted) then {
                0 fadeMusic 0;
            } else {
                0.5 fadeMusic A3U_volume;
            };
            
            // Обновляем UI громкости (слайдер и иконки)
            private _slider = _disp displayCtrl 85107;
            private _volOn = _disp displayCtrl 85108;
            private _volOff = _disp displayCtrl 85109;
            
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
    };
    // Если трек не играл, A3U_isPlaying остаётся false, прогресс сохранён
}];

// Обработчик изменения позиции слайдера (клик по шкале)
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
            A3U_isPlaying = true;
            if (A3U_muted) then {
                0 fadeMusic 0;
            } else {
                0.5 fadeMusic A3U_volume;
            };
            
            // Обновляем UI громкости (слайдер и иконки)
            private _slider = _disp displayCtrl 85107;
            private _volOn = _disp displayCtrl 85108;
            private _volOff = _disp displayCtrl 85109;
            
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
    };
    // Если трек на паузе, просто обновляем A3U_trackProgress
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

// Инициализация кнопки shuffle (без принудительного сброса)
private _shuffleBtn = _display displayCtrl 85114;
if (!isNull _shuffleBtn) then {
    if (A3U_shuffleEnabled) then {
        _shuffleBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
        _shuffleBtn ctrlSetTooltip "Случайный порядок (вкл)";
    } else {
        _shuffleBtn ctrlSetBackgroundColor [0.2,0.2,0.2,1];
        _shuffleBtn ctrlSetTooltip "Случайный порядок (выкл)";
    };
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
            A3U_trackStartTime,
            A3U_currentTrackList,
            A3U_currentTrackIndex,
            A3U_currentCategory,
            A3U_categoryMode,
            A3U_muted,
            A3U_shuffleEnabled,
            A3U_loopEnabled
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