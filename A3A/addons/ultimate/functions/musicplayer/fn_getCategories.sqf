//fn_getCategories.sqf
#include "..\..\script_component.hpp"

private _categories = [];
private _hasUnknown = false;

{
    private _theme = toLower getText (_x >> "theme");
    if (_theme == "") then {
        _hasUnknown = true;
    } else {
        _categories pushBackUnique _theme;
    };
} forEach ("true" configClasses (configFile >> "CfgMusic"));

if (_hasUnknown) then {
    _categories pushBack "unknown";
};

// Добавляем категорию actualmusic, если есть треки
if (count (call A3U_fnc_getActualTracks) > 0) then {
    _categories pushBackUnique "actualmusic";
};

diag_log format ["[getCategories] returning: %1", _categories];

_categories
