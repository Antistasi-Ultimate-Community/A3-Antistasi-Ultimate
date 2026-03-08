//fn_getTrackByCategory.sqf
#include "..\..\script_component.hpp"

params [["_category", "unknown", [""]]];

/* // Если режим sound, игнорируем категорию и возвращаем все звуки
if (!isNil "A3U_playbackMode" && {A3U_playbackMode == "sound"}) exitWith {
    call A3U_fnc_getSounds
}; */

// Иначе обычный поиск по конфигам музыки (как раньше)
private _categoryLower = toLower _category;
private _tracks = [];
{
    private _theme = toLower getText (_x >> "theme");
    private _name = getText (_x >> "name");
    private _path = configName _x;
    
    // Обработка только для треков без названия
    if (_name == "") then {
        // Создаем имя из пути
        _name = _path;
        
        // Удаляем распространенные префиксы
        private _prefixes = ["track_", "music_", "sound_", "theme_", "fx_", "amb_", "bgm_"];
        { if (_name find _x == 0) then { _name = _name select [count _x]; }; } forEach _prefixes;
        _name = _name splitString "_" joinString " ";
        
        // Делаем первую букву заглавной
        if (count _name > 0) then {
            private _firstChar = toUpper (_name select [0,1]);
            private _rest = _name select [1];
            _name = _firstChar + _rest;
        };
        
        // Если имя пустое после обработки
        if (_name == "") then {_name = "Unknown"};
    };
    
    // Обработка категории
    if (_categoryLower == "unknown") then {
        if (_theme == "") then { _tracks pushBack [_name, _path]; };
    } else {
        if (_theme == _categoryLower) then { _tracks pushBack [_name, _path]; };
    };
} forEach ("true" configClasses (configFile >> "CfgMusic"));

_tracks