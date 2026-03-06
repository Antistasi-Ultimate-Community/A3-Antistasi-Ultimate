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

// Получаем все категории
private _allCategories = call A3U_fnc_getCategories;

// Фильтруем
private _categories = [];
if (A3U_categoryMode) then {
    // Все категории, кроме actualmusic
    _categories = +_allCategories;
    _categories = _categories - ["actualmusic"];
} else {
    {
        if ([_x] call A3U_fnc_isCategoryAllowed) then {
            _categories pushBack _x;
        };
    } forEach _allCategories;
};

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
    private _tracks = [_category] call A3U_fnc_getTracksByCategory;
    lbClear _tracksList;
    {
        _x params ["_name", "_path"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _path];
    } forEach _tracks;
    _tracksList lbSetCurSel 0;
} else {
    lbClear _tracksList;
    _tracksList lbAdd "Нет доступных категорий";
};