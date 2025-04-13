#include "..\..\script_component.hpp"

A3U_fnc_getCategories = {
    private _categories = [];
    {
        private _theme = getText (_x >> "theme");
        /* if (_theme == "vn_dlc") then { // Фильтрация по нужной теме */
            _categories pushBackUnique _theme;
        /* }; */
    } forEach ("true" configClasses (configFile >> "CfgMusic"));
    _categories
    /* private _categories = createHashMap;
    
    {
        private _cfg = _x;
        private _theme = getText (_cfg >> "theme");
        
        // Нормализация названия темы
        _theme = [_theme, "Unknown"] select (_theme == "");
        _theme = toLower _theme;
        
        // Сбор уникальных категорий
        if !(_theme in _categories) then {
            _categories set [_theme, getText (_cfg >> "theme")];
        };
        
    } forEach configProperties [configFile >> "CfgMusic", "isClass _x", true];

    // Сортировка и возврат
    (_categories apply {_x}) sort true */
};