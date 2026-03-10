//fn_toggleCategoryMode.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _btn = _display displayCtrl 85116;

A3U_categoryMode = !A3U_categoryMode;

if (A3U_categoryMode) then {
    _btn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
    _btn ctrlSetTooltip "Показать только избранные категории";
} else {
    _btn ctrlSetBackgroundColor [1,1,1,1];
    _btn ctrlSetTooltip "Показать все категории";
};

// Получаем все категории в зависимости от режима
private _allCategories = [];
private _categories = [];
private _categoryType = "";

if (A3U_playbackMode == "music") then {
    if (A3U_categoryMode) then {
        // Режим "все категории" – все темы, исключая ручные
        _categories = call A3U_fnc_getCategories;
        _categories = _categories - ["actualmusic", "vietnam_radio"];
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
    // Звуковой режим
    _allCategories = call A3U_fnc_getSoundCategories;
    if (A3U_categoryMode) then {
        // Все категории (аддоны)
        _categories = _allCategories;
        _categoryType = "sound_all";
    } else {
        // Только ручные + не-ванильные
        //private _nonVanillaAddons = call A3U_fnc_getNonVanillaSoundAddons; //leave it for later
        _categories = [];
        if (count (call A3U_fnc_getActualMusicSounds) > 0) then {
            _categories pushBack "actualmusic";
        };
        if (count (call A3U_fnc_getVNRadioSounds) > 0) then {
            _categories pushBack "vnradio";
        };
        /* {
            _categories pushBack _x;
        } forEach _nonVanillaAddons; */ //leave it for later
        _categoryType = "sound_filtered";
    };
};

_display setVariable ["A3U_categoryType", _categoryType];

// Заполняем список категорий
private _categoriesList = _display displayCtrl 85101;
lbClear _categoriesList;
{
    private _displayName = if (_x == "unknown") then { "Unknown" } else {
        private _str = _x;
        toUpper (_str select [0,1]) + toLower (_str select [1])
    };
    private _idx = _categoriesList lbAdd _displayName;
    _categoriesList lbSetData [_idx, _x];
} forEach _categories;

// Если список не пуст, выбираем первую категорию и обновляем элементы
private _tracksList = _display displayCtrl 85102;
if (count _categories > 0) then {
    _categoriesList lbSetCurSel 0;
    private _category = _categories select 0;

    private _items = [];
    if (A3U_playbackMode == "music") then {
        // Музыка: логика как в categoryChanged
        if (_category == "vietnam_radio") then {
            _items = call A3U_fnc_getVietnamRadioTracks;
        } else {
            if (_category == "actualmusic") then {
                _items = call A3U_fnc_getActualTracks;
            } else {
                if (_categoryType == "addon") then {
                    _items = [_category] call A3U_fnc_getTracksByAddon;
                } else {
                    _items = [_category] call A3U_fnc_getTracksByCategory;
                };
            };
        };
    } else {
        // Звуки
        if (_category == "actualmusic") then {
            _items = call A3U_fnc_getActualMusicSounds;
        } else {
            if (_category == "vnradio") then {
                _items = call A3U_fnc_getVNRadioSounds;
            } else {
                _items = [_category] call A3U_fnc_getSoundsByCategory;
            };
        };
    };

    lbClear _tracksList;
    {
        _x params ["_name", "_class"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _class];
    } forEach _items;
    _tracksList lbSetCurSel 0;

    A3U_currentTrackList = _items;
    A3U_currentTrackIndex = 0;
    A3U_currentCategory = _category;
    if (count _items > 0) then {
        A3U_currentTrack = _items select 0;
    } else {
        A3U_currentTrack = [];
    };
} else {
    lbClear _tracksList;
    _tracksList lbAdd "Нет доступных категорий";
    A3U_currentTrackList = [];
    A3U_currentTrackIndex = -1;
    A3U_currentCategory = "";
    A3U_currentTrack = [];
};