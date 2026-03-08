#include "..\..\script_component.hpp"
/*
    Возвращает список уникальных не-ванильных аддонов,
    которые присутствуют в CfgSounds.
    Аддоны, для которых созданы отдельные категории (например, music_f_vietnam_c),
    исключаются из этого списка.
*/
private _vanillaAddons = call A3U_fnc_getVanillaSoundAddons;
private _addons = [];

// Собираем все звуки из CfgSounds и missionConfigFile
private _configs = (configFile >> "CfgSounds") call BIS_fnc_returnChildren;
_configs append ((missionConfigFile >> "CfgSounds") call BIS_fnc_returnChildren);

{
    private _addonsList = configSourceAddonList _x;
    if (count _addonsList > 0) then {
        private _addon = _addonsList select 0;
        if !(_addon in _vanillaAddons) then {
            // Исключаем аддоны, для которых есть специальная обработка
            if (_addon != "music_f_vietnam_c" && _addon != "music_f_vietnam_02_c") then {
                _addons pushBackUnique _addon;
            };
        };
    };
} forEach _configs;

_addons