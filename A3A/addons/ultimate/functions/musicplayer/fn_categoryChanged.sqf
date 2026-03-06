//fn_categoryChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlCategory", "_index"];

// Если идёт программное заполнение - игнорируем событие
private _display = ctrlParent _ctrlCategory;
if (_display getVariable ["A3U_skipCategoryChange", false]) exitWith {};

if (_index == -1) exitWith {
    systemChat "Ошибка: категория не выбрана!";
};

// Получение категории из данных (нижний регистр)
private _category = _ctrlCategory lbData _index;
systemChat format ["Выбрана категория: %1", _category];  // Отладка

// Получение треков
private _tracks = [_category] call A3U_fnc_getTracksByCategory;
systemChat format ["Найдено треков: %1", count _tracks];  // Отладка

private _tracksList = _display displayCtrl 85102;

lbClear _tracksList;
if (count _tracks == 0) then {
    _tracksList lbAdd "Нет треков в категории";
} else {
    {
        _x params ["_name", "_path"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _path];
    } forEach _tracks;
    
    // Выбираем первый трек в категории
    _tracksList lbSetCurSel 0;
};