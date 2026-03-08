//fn_getSounds.sqf
#include "..\..\script_component.hpp"
/*
    Возвращает список всех звуков из CfgSounds.
    Каждый элемент: [название, класс, длительность]
    Если название пустое или равно имени класса (автоматическое):
        - ищет соответствующий трек в CfgMusic по файлу и использует его название;
        - если не найдено, генерирует имя из класса.
*/
private _sounds = [];

private _configs = (configFile >> "CfgSounds") call BIS_fnc_returnChildren;
_configs append ((missionConfigFile >> "CfgSounds") call BIS_fnc_returnChildren);

private _musicConfigs = "true" configClasses (configFile >> "CfgMusic");

{
    private _config = _x;
    private _className = configName _config;
    private _displayName = getText (_config >> "name");

    // Если имя отсутствует или равно имени класса (автоматическое)
    if (_displayName == "" || {_displayName == _className}) then {
        _displayName = "";
        private _soundArray = getArray (_config >> "sound");
        private _soundFile = if (count _soundArray > 0) then { _soundArray select 0 } else { "" };

        if (_soundFile != "") then {
            private _soundFileName = (_soundFile splitString "\/") select (count (_soundFile splitString "\/") - 1);
            {
                private _musicSound = getArray (_x >> "sound");
                if (count _musicSound > 0) then {
                    private _musicFilePath = _musicSound select 0;

                    // Сравниваем полные пути
                    if (_musicFilePath == _soundFile) exitWith {
                        _displayName = getText (_x >> "name");
                    };
                    // Если не совпали, сравниваем только имена файлов
                    if (_displayName == "") then {
                        private _musicFileName = (_musicFilePath splitString "\/") select (count (_musicFilePath splitString "\/") - 1);
                        if (_musicFileName == _soundFileName) then {
                            _displayName = getText (_x >> "name");
                        };
                    };
                };
            } forEach _musicConfigs;
        };
    };

    // Если имя всё ещё пустое, генерируем из класса
    if (_displayName == "") then {
        _displayName = _className;
        private _prefixes = ["sound_", "audio_", "sfx_"];
        {
            if (_displayName find _x == 0) then {
                _displayName = _displayName select [count _x];
            };
        } forEach _prefixes;
        _displayName = _displayName splitString "_" joinString " ";
        if (count _displayName > 0) then {
            private _firstChar = toUpper (_displayName select [0,1]);
            private _rest = toLower (_displayName select [1]);
            _displayName = _firstChar + _rest;
        };
    };

    private _duration = getNumber (_config >> "duration");
    _sounds pushBack [_displayName, _className, _duration];
} forEach _configs;

_sounds