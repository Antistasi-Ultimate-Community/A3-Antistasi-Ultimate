//fn_addRadioAction.sqf
#include "..\..\script_component.hpp"
/*
    Добавляет действие на объект для открытия плеера.
    Параметры:
        0: OBJECT - объект
        1: STRING - режим: "sound" (по умолч.) или "music"
        2: STRING - тип объекта для sound-режима: "car", "helicopter", "plane", "backpack" (по умолч. "car")
*/
params [
    ["_object", objNull, [objNull]],
    ["_mode", "sound", [""]],
    ["_objectType", "car", [""]]
];

if (isNull _object) exitWith {};

// Сохраняем тип объекта в переменных объекта для последующего использования в плеере
_object setVariable ["A3U_objectType", _objectType, true];

private _text = if (_mode == "music") then { "Открыть плеер" } else { "Открыть звуковой плеер" };
private _icon = "\A3\ui_f\data\map\vehicleicons\iconSound_ca.paa";

_object addAction [
    format ["<img image='%1' size='1.6' shadow=2 /> <t>%2</t>", _icon, _text],
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments params ["_mode", "_targetObj"];
        
        // Для звукового режима проверяем, жив ли объект
        if (_mode == "sound" && {isNull _targetObj || {!alive _targetObj}}) exitWith {
            systemChat "Радио повреждено и не работает.";
        };
        
        // Вызываем инициализацию плеера с нужным режимом и объектом (для sound передаём объект)
        [_mode, if (_mode == "sound") then { _targetObj } else { objNull }] call A3U_fnc_initMusicPlayer;
    },
    [_mode, _object],
    -99,
    false,
    true,
    "",
    "true",
    3
];