//fn_categoryChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlCategory", "_index"];

// Если идёт программное заполнение - игнорируем событие
private _display = ctrlParent _ctrlCategory;
if (_display getVariable ["A3U_skipCategoryChange", false]) exitWith {};

if (_index == -1) exitWith { systemChat "Ошибка: категория не выбрана!"; };

// Получение категории из данных (нижний регистр)
private _category = _ctrlCategory lbData _index;
systemChat format ["Выбрана категория: %1", _category];

// Определяем тип категории
private _categoryType = _display getVariable ["A3U_categoryType", "theme"];
private _items = [];

if (A3U_playbackMode == "music") then {
    // Музыкальный режим
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
    // Звуковой режим
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

private _itemsList = _display displayCtrl 85102;
lbClear _itemsList;

if (count _items == 0) then {
    _itemsList lbAdd "Нет элементов в категории";
} else {
    {
        _x params ["_name", "_class"];
        private _idx = _itemsList lbAdd _name;
        _itemsList lbSetData [_idx, _class];
    } forEach _items;
    _itemsList lbSetCurSel 0;

    A3U_currentTrackList = _items;
    A3U_currentTrackIndex = 0;
    A3U_currentCategory = _category;
    A3U_currentTrack = _items select 0;
};