//fn_toggleCategoryMode.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _btn = _display displayCtrl 85116;

if (isNil "A3U_categoryMode") then { A3U_categoryMode = false; };
A3U_categoryMode = !A3U_categoryMode;

if (A3U_categoryMode) then {
    _btn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
    _btn ctrlSetTooltip "Показать только избранные категории";
} else {
    _btn ctrlSetBackgroundColor [1,1,1,1];
    _btn ctrlSetTooltip "Показать все категории";
};

// Получаем все категории (по темам)
private _allCategories = call A3U_fnc_getCategories;

// Формируем список категорий в зависимости от режима
private _categories = [];
private _categoryType = "";

if (A3U_categoryMode) then {
    // Все категории, кроме actualmusic
    _categories = +_allCategories;
    _categories = _categories - ["actualmusic"];
    _categoryType = "theme";
} else {
    // Режим "только аддоны + actualmusic + специальные категории"
    private _addons = call A3U_fnc_getNonVanillaAddons;
    _categories = [];
    
    // Сначала добавляем actualmusic (если есть)
    if (count (call A3U_fnc_getActualTracks) > 0) then {
        _categories pushBack "actualmusic";
    };
    
    // Затем vietnam_radio (если есть)
    if (count (call A3U_fnc_getVietnamRadioTracks) > 0) then {
        _categories pushBack "vietnam_radio";
    };
    
    // Затем все остальные аддоны
    {
        _categories pushBack _x;
    } forEach _addons;
    
    _categoryType = "addon";
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

// Если список не пуст, выбираем первую категорию и обновляем треки
private _tracksList = _display displayCtrl 85102;
if (count _categories > 0) then {
    _categoriesList lbSetCurSel 0;
    private _category = _categories select 0;
    
    // Получаем треки в зависимости от типа
    private _tracks = [];
	if (_category == "vietnam_radio") then {
	    _tracks = call A3U_fnc_getVietnamRadioTracks;
	} else {
	    if (_categoryType == "addon" && _category != "actualmusic") then {
	        _tracks = [_category] call A3U_fnc_getTracksByAddon;
	    } else {
	        _tracks = [_category] call A3U_fnc_getTracksByCategory;
	    };
	};
    
    lbClear _tracksList;
    {
        _x params ["_name", "_path"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _path];
    } forEach _tracks;
    _tracksList lbSetCurSel 0;
	A3U_currentTrackList = _tracks;
    A3U_currentTrackIndex = 0;
    A3U_currentCategory = _category;
} else {
    lbClear _tracksList;
    _tracksList lbAdd "Нет доступных категорий";
};