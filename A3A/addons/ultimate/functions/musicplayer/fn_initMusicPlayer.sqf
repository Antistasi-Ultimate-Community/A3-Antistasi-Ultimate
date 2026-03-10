//fn_initMusicPlayer.sqf
#include "..\..\script_component.hpp"
/*
    Инициализирует музыкальный/звуковой плеер.
    Параметры:
        0: STRING - режим работы: "music" (по умолчанию) или "sound"
        1: OBJECT - целевой объект для sound-режима (игнорируется в music)
*/
params [
    ["_mode", "music", [""]],
    ["_targetObject", objNull, [objNull]]
];

// ========== ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ РЕЖИМА ==========
A3U_playbackMode = _mode;
uiNamespace setVariable ["A3U_soundTarget", _targetObject];

// ========== ИНИЦИАЛИЗАЦИЯ ГЛОБАЛЬНОГО СОСТОЯНИЯ ==========
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
        false,  //11: loopEnabled
        _mode,  //12: playbackMode
        false,  // 13: loudspeaker
        0       // 14: boostLevel (0-4)
    ];
} else {
    // Если состояние уже есть, обновляем в нём режим (на случай переоткрытия)
    A3U_playerState set [12, _mode];
};

// Сохраняем текущее состояние перед открытием диалога
private _savedState = +A3U_playerState;

// ========== СОЗДАНИЕ ДИАЛОГА ==========
if (!createDialog "RscDisplayMusicPlayer") exitWith {
    systemChat "Ошибка создания плеера!";
};

// Восстановление состояния
A3U_playerState = _savedState;

// Распаковываем состояние с защитой от старых сохранений
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
A3U_playbackMode = A3U_playerState param [12, _mode]; // перезаписываем переданным
A3U_loudspeaker = A3U_playerState param [13, false];
A3U_boostLevel = A3U_playerState param [14, 0];

// Дополнительные инициализации
if (isNil "A3U_volumeBeforeMute") then { A3U_volumeBeforeMute = A3U_volume; };

// После распаковки состояния
diag_log format ["[init] Loaded state: track=%1, index=%2, category=%3", A3U_currentTrack, A3U_currentTrackIndex, A3U_currentCategory];

// ========== ПОЛУЧЕНИЕ ДИСПЛЕЯ ==========
private _display = findDisplay 85000;
if (isNull _display) exitWith {systemChat "Ошибка: Диалог не найден!"};
_display setVariable ["A3U_skipCategoryChange", false];
_display setVariable ["A3U_skipTrackChange", false];

// ========== ПОДГОТОВКА ДАННЫХ В ЗАВИСИМОСТИ ОТ РЕЖИМА ==========
private _categories = [];
private _categoryType = ""; // будет установлен позже

if (A3U_playbackMode == "music") then {
    // ---- РЕЖИМ МУЗЫКИ ----
    private _allCategories = call {
        if (isNil "A3U_fnc_getCategories") then {
            systemChat "Ошибка: Функция A3U_fnc_getCategories не найдена!";
            []
        } else {
            call A3U_fnc_getCategories
        };
    };

    if (A3U_categoryMode) then {
        // Режим "все категории" – исключаем ручные
        _categories = _allCategories - ["actualmusic", "vietnam_radio"];
        _categoryType = "theme";
    } else {
        // Режим "только избранные" – ручные категории + не-ванильные аддоны
        _categories = [];
        if (count (call A3U_fnc_getActualTracks) > 0) then {
            _categories pushBack "actualmusic";
        };
        if (count (call A3U_fnc_getVietnamRadioTracks) > 0) then {
            _categories pushBack "vietnam_radio";
        };
        private _nonVanillaAddons = call A3U_fnc_getNonVanillaAddons;
        {
            _categories pushBack _x;
        } forEach _nonVanillaAddons;
        _categoryType = "addon";
    };
} else {
    // ---- РЕЖИМ ЗВУКОВ ----
    private _allSoundAddons = call A3U_fnc_getSoundCategories; // все аддоны (сгруппированные)

    if (A3U_categoryMode) then {
        // Режим "все категории" – показываем все аддоны
        _categories = _allSoundAddons;
        _categoryType = "sound_all";
    } else {
        // Режим "только избранные" – ручные категории + не-ванильные аддоны
        //private _nonVanillaAddons = call A3U_fnc_getNonVanillaSoundAddons; //leave it for now
        _categories = [];

        // Добавляем ручные категории
        if (count (call A3U_fnc_getActualMusicSounds) > 0) then {
            _categories pushBack "actualmusic";
        };
        if (count (call A3U_fnc_getVNRadioSounds) > 0) then {
            _categories pushBack "vnradio";
        };

        // Добавляем не-ванильные аддоны
        /* {
            _categories pushBack _x;
        } forEach _nonVanillaAddons; */ //leave it for now

        _categoryType = "sound_filtered";
    };
};

_display setVariable ["A3U_categoryType", _categoryType];

// ========== ГЛОБАЛЬНЫЕ ОБРАБОТЧИКИ МУЗЫКИ (ТОЛЬКО ДЛЯ MUSIC) ==========
if (A3U_playbackMode == "music" && isNil "A3U_musicHandlersInitialized") then {
    if (!isNil "A3U_musicStartEH") then { removeMusicEventHandler ["MusicStart", A3U_musicStartEH]; };
    if (!isNil "A3U_musicStopEH") then { removeMusicEventHandler ["MusicStop", A3U_musicStopEH]; };

    A3U_musicStartEH = addMusicEventHandler ["MusicStart", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        if (_totalLength > 0) then {
            // можно скорректировать startTime, но необязательно
        };
        A3U_isPlaying = true;
        diag_log format ["[MusicStart] %1 at %2", _musicClass, _currentPosition];
    }];

    A3U_musicStopEH = addMusicEventHandler ["MusicStop", {
        params ["_musicClass", "_ehID", "_currentPosition", "_totalLength"];
        A3U_trackProgress = _currentPosition;
        A3U_isPlaying = false;
        diag_log format ["[MusicStop] %1 at %2", _musicClass, _currentPosition];

        if (_currentPosition >= 0.99) then {
            if (A3U_loopEnabled) then {
                if (count A3U_currentTrack > 0) then {
                    A3U_trackProgress = 0;
                    playMusic (A3U_currentTrack#1);
                    A3U_trackStartTime = diag_tickTime;
                    A3U_isPlaying = true;
                };
            } else {
                [] call A3U_fnc_nextTrack;
                if (count A3U_currentTrack > 0) then {
                    [] call A3U_fnc_playTrack;
                };
            };
        };
    }];

    A3U_musicHandlersInitialized = true;
};

// ========== ЗАПОЛНЕНИЕ СПИСКА КАТЕГОРИЙ ==========
private _categoriesList = _display displayCtrl 85101;
lbClear _categoriesList;

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

// ========== ОПРЕДЕЛЕНИЕ КАТЕГОРИИ ДЛЯ ВОССТАНОВЛЕНИЯ ==========
private _targetCategory = "";
private _targetCategoryFound = false;

// 1. Пробуем восстановить сохранённую категорию
if (A3U_currentCategory != "" && {A3U_currentCategory in _categories}) then {
    _targetCategory = A3U_currentCategory;
    _targetCategoryFound = true;
};

// 2. Если не нашли, пробуем найти категорию по сохранённому элементу
if (!_targetCategoryFound && {count A3U_currentTrack > 0}) then {
    private _itemClass = A3U_currentTrack#1;
    
    if (A3U_playbackMode == "music") then {
        // ---- Музыкальный режим ----
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
                if (_path == _itemClass) exitWith {
                    _targetCategory = _cat;
                    _targetCategoryFound = true;
                };
            } forEach _tracks;
            if (_targetCategoryFound) exitWith {};
        } forEach _categories;
        
    } else {
        // ---- Звуковой режим ----
        // Сначала проверим ручные категории
        private _specialCats = [];
        if (count (call A3U_fnc_getActualMusicSounds) > 0) then { _specialCats pushBack "actualmusic"; };
        if (count (call A3U_fnc_getVNRadioSounds) > 0) then { _specialCats pushBack "vnradio"; };
        {
            private _cat = _x;
            private _sounds = [];
            if (_cat == "actualmusic") then {
                _sounds = call A3U_fnc_getActualMusicSounds;
            } else {
                if (_cat == "vnradio") then {
                    _sounds = call A3U_fnc_getVNRadioSounds;
                };
            };
            {
                _x params ["_name", "_class"];
                if (_class == _itemClass) exitWith {
                    _targetCategory = _cat;
                    _targetCategoryFound = true;
                };
            } forEach _sounds;
            if (_targetCategoryFound) exitWith {};
        } forEach _specialCats;

        if (!_targetCategoryFound) then {
            // Ищем в обычных категориях-аддонах
            {
                private _cat = _x;
                private _sounds = [_cat] call A3U_fnc_getSoundsByCategory;
                {
                    _x params ["_name", "_class"];
                    if (_class == _itemClass) exitWith {
                        _targetCategory = _cat;
                        _targetCategoryFound = true;
                    };
                } forEach _sounds;
                if (_targetCategoryFound) exitWith {};
            } forEach _categories;
        };
    };
};

// 3. Если ничего не нашли, берём первую категорию
if (!_targetCategoryFound && count _categories > 0) then {
    _targetCategory = _categories select 0;
};

// После определения _targetCategory
diag_log format ["[init] targetCategory: %1, found: %2", _targetCategory, _targetCategoryFound];

private _selectedCategoryIndex = _categories find _targetCategory;
if (_selectedCategoryIndex == -1) then { _selectedCategoryIndex = 0; };
_display setVariable ["A3U_skipCategoryChange", true];
_categoriesList lbSetCurSel _selectedCategoryIndex;
A3U_currentCategory = _targetCategory;

// ========== ПОЛУЧЕНИЕ ЭЛЕМЕНТОВ ДЛЯ ВЫБРАННОЙ КАТЕГОРИИ ==========
private _items = [];

if (A3U_playbackMode == "music") then {
    // Музыка
    if (_targetCategory == "vietnam_radio") then {
        _items = call A3U_fnc_getVietnamRadioTracks;
    } else {
        if (_targetCategory == "actualmusic") then {
            _items = call A3U_fnc_getActualTracks;
        } else {
            if (_categoryType == "addon") then {
                _items = [_targetCategory] call A3U_fnc_getTracksByAddon;
            } else {
                _items = [_targetCategory] call A3U_fnc_getTracksByCategory;
            };
        };
    };
} else {
    // Звуки
    if (_targetCategory == "actualmusic") then {
        _items = call A3U_fnc_getActualMusicSounds;
    } else {
        if (_targetCategory == "vnradio") then {
            _items = call A3U_fnc_getVNRadioSounds;
        } else {
            _items = [_targetCategory] call A3U_fnc_getSoundsByCategory;
        };
    };
};

// После получения _items
diag_log format ["[init] _items count: %1", count _items];

// ========== ЗАПОЛНЕНИЕ СПИСКА ЭЛЕМЕНТОВ ==========
private _tracksList = _display displayCtrl 85102;
lbClear _tracksList;

private _selectedItemIndex = 0;
if (count _items > 0) then {
    {
        _x params ["_name", "_class"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _class];
    } forEach _items;

    // Определяем индекс сохранённого элемента
    if (count A3U_currentTrack > 0) then {
        private _savedClass = A3U_currentTrack#1;
        diag_log "=== ПОИСК ИНДЕКСА СОХРАНЁННОГО ТРЕКА ===";
        diag_log format ["[init] Ищем класс: %1", _savedClass];
        diag_log format ["[init] Всего элементов в _items: %1", count _items];
        {
            diag_log format ["[init] Элемент #%1: имя='%2', класс='%3'", _forEachIndex, _x#0, _x#1];
        } forEach _items;
        private _foundIndex = _items findIf { _x#1 == _savedClass };
        diag_log format ["[init] Результат поиска: _foundIndex = %1", _foundIndex];
        if (_foundIndex != -1) then { _selectedItemIndex = _foundIndex; };
        diag_log "=== КОНЕЦ ПОИСКА ===";
    };

    // Устанавливаем выделение с блокировкой события
    _display setVariable ["A3U_skipTrackChange", true];
    _tracksList lbSetCurSel _selectedItemIndex;
    _display setVariable ["A3U_skipTrackChange", false];

    // Обновляем глобальные переменные
    A3U_currentTrackList = _items;
    A3U_currentTrackIndex = _selectedItemIndex;
    A3U_currentTrack = _items select _selectedItemIndex;
} else {
    _tracksList lbAdd "Нет элементов в категории";
    A3U_currentTrackList = [];
    A3U_currentTrackIndex = -1;
    A3U_currentTrack = [];
};

// После того как всё готово, сбрасываем флаг категории
_display setVariable ["A3U_skipCategoryChange", false];

// После определения _selectedItemIndex
diag_log format ["[init] _selectedItemIndex: %1", _selectedItemIndex];

// ========== УПРАВЛЕНИЕ ДВУМЯ ПРОГРЕСС-БАРАМИ ==========
private _musicProgress = _display displayCtrl 85106; // слайдер для музыки
private _soundProgress = _display displayCtrl 85117; // прогресс-бар для звуков

if (A3U_playbackMode == "music") then {
    _musicProgress ctrlShow true;
    _soundProgress ctrlShow false;
} else {
    _musicProgress ctrlShow false;
    _soundProgress ctrlShow true;
};

// ========== НАСТРОЙКА ГРОМКОСТИ И МУТА ==========
private _volumeSlider = _display displayCtrl 85107;
_volumeSlider sliderSetRange [0, 1];
_volumeSlider sliderSetPosition A3U_volume;

private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;

if (A3U_muted) then {
    _volOn ctrlShow false;
    _volOff ctrlShow true;
    _volOff ctrlSetTooltip "Включить звук";
    _volumeSlider sliderSetPosition 0;
    if (A3U_playbackMode == "music") then { 0 fadeMusic 0; };
} else {
    _volOn ctrlShow true;
    _volOff ctrlShow false;
    _volOn ctrlSetTooltip "Выключить звук";
    _volumeSlider sliderSetPosition A3U_volume;
    if (A3U_playbackMode == "music") then { 0.5 fadeMusic A3U_volume; };
};

// В звуковом режиме полностью скрываем кнопки мьюта
if (A3U_playbackMode == "sound") then {
    _volOn ctrlShow false;
    _volOff ctrlShow false;
};

// ========== ИНТЕРАКТИВНЫЙ СЛАЙДЕР ПРОГРЕССА (ТОЛЬКО ДЛЯ МУЗЫКИ) ==========
if (A3U_playbackMode == "music") then {
    _display setVariable ["isDragging", false];
    _display setVariable ["wasPlaying", false];

    _musicProgress ctrlAddEventHandler ["MouseMoving", {
        params ["_ctrl", "_xPos", "_yPos"];
        private _disp = ctrlParent _ctrl;
        if (!(_disp getVariable ["isDragging", false]) || {count A3U_currentTrack == 0}) exitWith {};
        private _newPos = sliderPosition _ctrl;
        A3U_trackProgress = _newPos;
    }];

    _musicProgress ctrlAddEventHandler ["MouseButtonDown", {
        params ["_ctrl", "_button", "_xPos", "_yPos"];
        private _disp = ctrlParent _ctrl;
        if (_button != 0 || {count A3U_currentTrack == 0}) exitWith {};
        _disp setVariable ["wasPlaying", A3U_isPlaying];
        if (A3U_isPlaying) then {
            playMusic "";
            A3U_isPlaying = false;
        };
        _disp setVariable ["isDragging", true];
    }];

    _musicProgress ctrlAddEventHandler ["MouseButtonUp", {
        params ["_ctrl", "_button"];
        private _disp = ctrlParent _ctrl;
        if (_button != 0 || {count A3U_currentTrack == 0}) exitWith {};
        private _wasPlaying = _disp getVariable ["wasPlaying", false];
        _disp setVariable ["isDragging", false];
        private _newPos = sliderPosition _ctrl;
        if (abs(_newPos - A3U_trackProgress) < 0.001) exitWith {};
        A3U_trackProgress = _newPos;
        if (_wasPlaying) then {
            private _trackClass = A3U_currentTrack#1;
            private _config = configFile >> "CfgMusic" >> _trackClass;
            private _totalDuration = getNumber (_config >> "duration");
            if (_totalDuration > 0) then {
                private _startTime = _newPos * _totalDuration;
                A3U_trackStartTime = diag_tickTime - _startTime;
                playMusic [_trackClass, _startTime];
                A3U_isPlaying = true;
                if (A3U_muted) then { 0 fadeMusic 0; } else { 0.5 fadeMusic A3U_volume; };
            };
        };
    }];

    A3U_sliderEH = _musicProgress ctrlAddEventHandler ["SliderPosChanged", {
        params ["_ctrl", "_newPos"];
        private _disp = ctrlParent _ctrl;
        if (_disp getVariable ["isDragging", false]) exitWith {};
        if (count A3U_currentTrack == 0) exitWith {};
        if (abs(_newPos - A3U_trackProgress) < 0.001) exitWith {};
        A3U_trackProgress = _newPos;
        if (A3U_isPlaying) then {
            private _trackClass = A3U_currentTrack#1;
            private _config = configFile >> "CfgMusic" >> _trackClass;
            private _totalDuration = getNumber (_config >> "duration");
            if (_totalDuration > 0) then {
                private _startTime = _newPos * _totalDuration;
                A3U_trackStartTime = diag_tickTime - _startTime;
                playMusic [_trackClass, _startTime];
                if (A3U_muted) then { 0 fadeMusic 0; } else { 0.5 fadeMusic A3U_volume; };
            };
        };
    }];
};

// ========== ИНИЦИАЛИЗАЦИЯ КНОПОК УПРАВЛЕНИЯ ==========
// Кнопка повтора
private _loopBtn = _display displayCtrl 85113;
if (!isNull _loopBtn) then {
    if (A3U_loopEnabled) then {
        _loopBtn ctrlSetBackgroundColor [0.95,0.95,0.95,1];
        private _tooltip = if (A3U_playbackMode == "music") then {"Повтор трека (выкл)"} else {"Повтор звука (выкл)"};
        _loopBtn ctrlSetTooltip _tooltip;
    } else {
        _loopBtn ctrlSetBackgroundColor [1,1,1,1];
        private _tooltip = if (A3U_playbackMode == "music") then {"Повтор трека (вкл)"} else {"Повтор звука (вкл)"};
        _loopBtn ctrlSetTooltip _tooltip;
    };
};

// Кнопка shuffle
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

// Кнопка переключения режима категорий (видна в обоих режимах)
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

// ========== ОТЛАДОЧНАЯ ПАНЕЛЬ (ОПЦИОНАЛЬНО) ==========
A3U_debugVisible = false;
private _debugBg = _display displayCtrl 85120;
private _debugText = _display displayCtrl 85121;
private _debugBtn = _display displayCtrl 85122;
private _debugCopyBtn = _display displayCtrl 85123;

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

// Инициализация кнопки Loudspeaker
private _loudBtn = _display displayCtrl 85118;
if (!isNull _loudBtn) then {
    if (A3U_loudspeaker) then {
        _loudBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
        _loudBtn ctrlSetTooltip "Режим громкоговорителя (вкл)";
    } else {
        _loudBtn ctrlSetBackgroundColor [1,1,1,1];
        _loudBtn ctrlSetTooltip "Режим громкоговорителя (выкл)";
    };
    // В звуковом режиме кнопка видна, в музыкальном можно скрыть
    if (A3U_playbackMode != "sound") then { _loudBtn ctrlShow false; };
};

// Инициализация слайдера Boost (теперь виден в обоих режимах)
private _boostSlider = _display displayCtrl 85119;
if (!isNull _boostSlider) then {
    _boostSlider sliderSetRange [0, 4];
    _boostSlider sliderSetPosition A3U_boostLevel;
    _boostSlider sliderSetSpeed [1, 1];
    private _dbValues = [0,2,3,4,5];
    _boostSlider ctrlSetTooltip format ["Усиление: +%1 дБ", _dbValues select A3U_boostLevel];
};

// ========== ОТЛАДКА КАТЕГОРИЙ ЗВУКОВ (ОДИН РАЗ) ==========
if (A3U_playbackMode == "sound") then {
    diag_log "=== SOUND CATEGORIES DEBUG (init) ===";
    {
        private _cat = _x;
        private _sounds = [_cat] call A3U_fnc_getSoundsByCategory;
        private _count = count _sounds;
        private _sample = [];
        for "_i" from 0 to ((_count - 1) min 5) do {
            _sample pushBack (_sounds select _i select 0);
        };
        diag_log format ["Category: %1 | Count: %2 | Samples: %3", _cat, _count, _sample joinString ", "];
    } forEach _categories;
    diag_log "=== END SOUND CATEGORIES DEBUG (init) ===";
};

// ========== ОБРАБОТЧИК ЗАКРЫТИЯ ДИАЛОГА ==========
_display displayAddEventHandler ["Unload", {
    diag_log format ["[Unload] Сохраняемый track: %1, isPlaying: %2, progress: %3", A3U_currentTrack, A3U_isPlaying, A3U_trackProgress];
    if (!isNil "A3U_currentTrack") then {
        private _currentPos = 0;
        private _duration = 0;
        if (A3U_playbackMode == "music") then {
            if (A3U_isPlaying) then {
                _currentPos = getMusicPlayedTime;
            } else {
                _currentPos = A3U_trackProgress * (getNumber (configFile >> "CfgMusic" >> (A3U_currentTrack#1) >> "duration"));
            };
            _duration = getNumber (configFile >> "CfgMusic" >> (A3U_currentTrack#1) >> "duration");
        } else {
            // Для звуков сохраняем прогресс
            _currentPos = A3U_trackProgress;
            _duration = getNumber (configFile >> "CfgSounds" >> (A3U_currentTrack#1) >> "duration");
        };
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
            A3U_loopEnabled,
            A3U_playbackMode,
            A3U_loudspeaker,
            A3U_boostLevel
        ];
    };
}];

// ========== ЗАПУСК МОНИТОРА ПРОГРЕССА ==========
terminate (missionNamespace getVariable ["A3U_progressMonitorScript", scriptNull]);
A3U_progressMonitorScript = [] spawn A3U_fnc_trackProgressMonitor;

// ========== ОБНОВЛЕНИЕ ИНТЕРФЕЙСА ==========
[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;

// ========== СИНХРОНИЗАЦИЯ С ТЕКУЩИМ ВОСПРОИЗВЕДЕНИЕМ ==========
if (A3U_playbackMode == "music" && A3U_isPlaying && {count A3U_currentTrack > 0}) then {
    private _trackClass = A3U_currentTrack#1;
    private _config = configFile >> "CfgMusic" >> _trackClass;
    private _totalDuration = getNumber (_config >> "duration");
    if (_totalDuration > 0) then {
        private _currentPos = getMusicPlayedTime;
        A3U_trackProgress = (_currentPos / _totalDuration) min 1;
        A3U_trackStartTime = diag_tickTime - _currentPos;
    };
};

systemChat format ["Плеер инициализирован в режиме %1", A3U_playbackMode];