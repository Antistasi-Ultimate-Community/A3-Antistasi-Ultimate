//fn_addRadioAction.sqf
#include "..\..\script_component.hpp"

params ["_object"];

/* _object addAction [
    "\A3\ui_f\data\map\vehicleicons\iconSound_ca.paa", //"Открыть плеер",         // Название действия
    {
        [] call A3U_fnc_initMusicPlayer; // Вызов функции инициализации плеера
    },
    nil,                     // Аргументы (не требуются)
    1.5,                     // Приоритет
    true,                    // Показывать в визоре
    true,                    // Показывать при наведении
    "",                      // Условие видимости (всегда)
    "true",                  // Условие доступности (всегда)
    3                        // Дистанция взаимодействия (метры)
]; */

_object addAction [
    format ["<img image='\A3\ui_f\data\map\vehicleicons\iconSound_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", "Открыть плеер"], // или просто "Открыть плеер"
    {
        [] call A3U_fnc_initMusicPlayer;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "true",
    3
];

//_object addAction [format ["<img image='a3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_build_hq"], A3A_fnc_buildHQ,nil,0,false,true,"","(_this == theBoss) and (petros != leader group petros)",4];