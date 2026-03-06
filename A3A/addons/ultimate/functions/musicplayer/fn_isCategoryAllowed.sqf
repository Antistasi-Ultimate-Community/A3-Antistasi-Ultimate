//fn_isCategoryAllowed.sqf
#include "..\..\script_component.hpp"
/*
    Проверяет, разрешена ли категория для отображения в обычном режиме.
    Параметры:
        0: STRING - название категории (нижний регистр)
    Возвращает:
        BOOL - true, если категорию можно показывать
*/
params ["_category"];
diag_log format ["[isCategoryAllowed] checking category: %1", _category];

// Категория "actualmusic" всегда показывается
if (_category == "actualmusic") exitWith { 
    diag_log "[isCategoryAllowed] actualmusic always allowed";
    true 
};

// Получаем все треки в этой категории
private _tracks = [_category] call A3U_fnc_getTracksByCategory;
if (_tracks isEqualTo []) exitWith { 
    diag_log format ["[isCategoryAllowed] category %1 has no tracks -> false", _category];
    false 
};

// Получаем список ванильных аддонов
private _vanillaAddons = call A3U_fnc_getVanillaAddons;

// Проверяем каждый трек
private _hasNonVanilla = false;
{
    _x params ["", "_path"];
    private _config = configFile >> "CfgMusic" >> _path;
    private _addons = configSourceAddonList _config;
    if (_addons isEqualTo []) then {
        diag_log format ["[isCategoryAllowed] Track %1 has no addon, marking as non-vanilla", _path];
        _hasNonVanilla = true;
        break;
    } else {
        private _addon = _addons select 0;
        if (_addon in _vanillaAddons) then {
            diag_log format ["[isCategoryAllowed] Track %1 addon %2 is vanilla", _path, _addon];
        } else {
            diag_log format ["[isCategoryAllowed] Track %1 addon %2 is NOT vanilla", _path, _addon];
            _hasNonVanilla = true;
            break;
        };
    };
} forEach _tracks;

diag_log format ["[isCategoryAllowed] category %1 allowed: %2", _category, _hasNonVanilla];
_hasNonVanilla