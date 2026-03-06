#include "..\..\script_component.hpp"
/*
    Возвращает список уникальных не-ванильных аддонов,
    которые присутствуют в CfgMusic.
    Аддоны, для которых созданы отдельные категории (например, music_f_vietnam_c),
    исключаются из этого списка.
*/
private _vanillaAddons = call A3U_fnc_getVanillaAddons;
private _addons = [];

{
    private _addonsList = configSourceAddonList _x;
    if (count _addonsList > 0) then {
        private _addon = _addonsList select 0;
        if !(_addon in _vanillaAddons) then {
            // Исключаем аддоны, для которых есть специальная обработка
            if (_addon != "music_f_vietnam_c") then {
                _addons pushBackUnique _addon;
            };
        };
    };
} forEach ("true" configClasses (configFile >> "CfgMusic"));

_addons