#include "..\script_component.hpp"
/*
    Возвращает структурированный текст с отладочной информацией о треке.
    Параметры:
        0: STRING - classname трека из CfgMusic
    Возвращает:
        STRING - форматированный текст
*/
params ["_trackClass"];

private _config = configFile >> "CfgMusic" >> _trackClass;
if (!isClass _config) exitWith {"<t color='#FF8888'>Трек не найден в CfgMusic</t>"};

// Основные параметры (общие)
private _name = getText (_config >> "name");
if (_name == "") then { _name = "<нет name>" };

private _theme = getText (_config >> "theme");
if (_theme == "") then { _theme = "<нет theme>" };

private _musicClass = getText (_config >> "musicClass"); // дополнительное поле из примера
if (_musicClass == "") then { _musicClass = "<нет musicClass>" };

private _type = getText (_config >> "type");
if (_type == "") then { _type = "<нет type>" };

private _duration = getNumber (_config >> "duration");

// Поле sound может быть строкой или массивом
private _sound = getArray (_config >> "sound");
if (_sound isEqualTo []) then {
    // если массив пуст, возможно это строка?
    private _soundStr = getText (_config >> "sound");
    _sound = if (_soundStr != "") then { [_soundStr] } else { ["<нет sound>"] };
};

// Теги (массив строк)
private _tags = getArray (_config >> "tags");
private _tagsStr = if (_tags isEqualTo []) then { "<нет tags>" } else { _tags joinString ", " };

// Заголовки (массив строк, обычно пустой)
private _titles = getArray (_config >> "titles");
private _titlesStr = if (_titles isEqualTo []) then { "<нет titles>" } else { _titles joinString ", " };

// Информация об аддоне и моде
private _addon = "";
private _modName = "";
private _modLogo = "";
private _addons = configSourceAddonList _config;
if (count _addons > 0) then {
    _addon = _addons select 0;
    private _mods = configSourceModList (configFile >> "CfgPatches" >> _addon);
    if (count _mods > 0) then {
        private _mod = _mods select 0;
        private _params = modParams [_mod, ["name", "logo"]];
        _modName = _params param [0, ""];
        _modLogo = _params param [1, ""];
    };
};

// Форматируем вывод (размер шрифта 0.7, чтобы поместилось много строк)
private _lines = [];
_lines pushBack "<t color='#FFFF88'>=== DEBUG INFO ===</t>";
_lines pushBack format ["Class: %1", _trackClass];
_lines pushBack format ["Name: %1", _name];
_lines pushBack format ["Theme: %1", _theme];
_lines pushBack format ["MusicClass: %1", _musicClass];
_lines pushBack format ["Type: %1", _type];
_lines pushBack format ["Duration: %1 s", _duration];
_lines pushBack format ["Sound: %1", _sound param [0, ""]]; // показываем только путь, остальное опционально
if (count _sound > 1) then {
    _lines pushBack format ["Sound params: volume=%1, pitch=%2", _sound param [1, 1], _sound param [2, 1]];
};
_lines pushBack format ["Tags: %1", _tagsStr];
_lines pushBack format ["Titles: %1", _titlesStr];
if (_addon != "") then { _lines pushBack format ["Addon: %1", _addon]; };
if (_modName != "") then { _lines pushBack format ["Mod: %1", _modName]; };
if (_modLogo != "") then { _lines pushBack format ["Logo: %1", _modLogo]; };

private _result = "<t size='0.7'>" + (_lines joinString "<br/>") + "</t>";
_result