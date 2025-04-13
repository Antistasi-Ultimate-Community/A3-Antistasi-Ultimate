#include "..\..\script_component.hpp"

params ["_ctrlCategory", "_index"];

// Проверка индекса
if (_index == -1) exitWith {
    systemChat "Ошибка: категория не выбрана!";
};

// Получение категории
private _category = _ctrlCategory lbText _index;
systemChat format ["Выбрана категория: %1", _category]; // Отладка

// Получение треков
private _tracks = [_category] call A3U_fnc_getTracksByCategory;
systemChat format ["Найдено треков: %1", count _tracks]; // Отладка

private _category = _ctrlCategory lbText _index;
private _tracks = [_category] call A3U_fnc_getTracksByCategory;

private _display = ctrlParent _ctrlCategory;
private _tracksList = _display displayCtrl 85102;

lbClear _tracksList;
{
    _x params ["_name", "_path"];
    
    private _idx = _tracksList lbAdd _name;
    _tracksList lbSetData [_idx, _path];
} forEach _tracks;

[_tracksList, 0] call A3U_fnc_trackChanged; 