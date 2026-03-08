#include "..\script_component.hpp"
/*
    Возвращает структурированный текст с отладочной информацией о звуке.
    Параметры:
        0: STRING - classname звука из CfgSounds
*/
params ["_soundClass"];

private _config = (configFile >> "CfgSounds" >> _soundClass);
if (!isClass _config) then { _config = (missionConfigFile >> "CfgSounds" >> _soundClass); };
if (!isClass _config) exitWith {"<t color='#FF8888'>Звук не найден в CfgSounds</t>"};

private _name = getText (_config >> "name");
if (_name == "") then { _name = "<нет name>" };

private _soundArray = getArray (_config >> "sound");
private _file = if (count _soundArray > 0) then { _soundArray select 0 } else { "<нет файла>" };
private _volume = if (count _soundArray > 1) then { _soundArray select 1 } else { 1 };
private _pitch = if (count _soundArray > 2) then { _soundArray select 2 } else { 1 };
private _maxDistance = if (count _soundArray > 3) then { _soundArray select 3 } else { 100 };

private _duration = getNumber (_config >> "duration");
private _titles = getArray (_config >> "titles");
private _theme = getText (_config >> "theme");

private _addon = "";
private _modName = "";
private _addons = configSourceAddonList _config;
if (count _addons > 0) then {
    _addon = _addons select 0;
    private _mods = configSourceModList (configFile >> "CfgPatches" >> _addon);
    if (count _mods > 0) then {
        private _mod = _mods select 0;
        private _params = modParams [_mod, ["name", "logo"]];
        _modName = _params param [0, ""];
    };
};

private _lines = [];
_lines pushBack "<t color='#FFFF88'>=== SOUND DEBUG INFO ===</t>";
_lines pushBack format ["Class: %1", _soundClass];
_lines pushBack format ["Name: %1", _name];
_lines pushBack format ["Theme: %1", _theme];
_lines pushBack format ["File: %1", _file];
_lines pushBack format ["Volume: %1", _volume];
_lines pushBack format ["Pitch: %1", _pitch];
_lines pushBack format ["Max Distance: %1 m", _maxDistance];
_lines pushBack format ["Duration: %1 s", _duration];
_lines pushBack format ["Titles: %1", if (_titles isEqualTo []) then { "<нет>" } else { str _titles }];
if (_addon != "") then { _lines pushBack format ["Addon: %1", _addon]; };
if (_modName != "") then { _lines pushBack format ["Mod: %1", _modName]; };

private _result = "<t size='0.7'>" + (_lines joinString "<br/>") + "</t>";
_result