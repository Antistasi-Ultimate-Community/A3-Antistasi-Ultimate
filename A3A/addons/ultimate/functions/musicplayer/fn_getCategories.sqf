//fn_getCategories.sqf
#include "..\..\script_component.hpp"

A3U_fnc_getCategories = {
    private _categories = [];
    {
        private _theme = getText (_x >> "theme");
        if (_theme != "") then {
            _categories pushBackUnique _theme;
        };
    } forEach ("true" configClasses (configFile >> "CfgMusic"));
    _categories
};