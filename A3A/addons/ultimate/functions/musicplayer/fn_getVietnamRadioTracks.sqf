#include "..\..\script_component.hpp"
/*
    Возвращает список треков из аддона music_f_vietnam_c с темой "rock".
    Каждый элемент: [название, класс]
*/
private _tracks = [];
private _addonName = "music_f_vietnam_c";

{
    private _config = _x;
    private _addons = configSourceAddonList _config;
    if (count _addons > 0) then {
        private _addon = _addons select 0;
        if (_addon == _addonName) then {
            private _theme = toLower getText (_config >> "theme");
            if (_theme == "rock") then {
                private _name = getText (_config >> "name");
                private _path = configName _config;
                
                if (_name == "") then {
                    _name = _path;
                    private _prefixes = ["track_", "music_", "sound_", "theme_", "fx_", "amb_", "bgm_"];
                    { if (_name find _x == 0) then { _name = _name select [count _x]; }; } forEach _prefixes;
                    _name = _name splitString "_" joinString " ";
                    if (count _name > 0) then {
                        private _firstChar = toUpper (_name select [0,1]);
                        private _rest = _name select [1];
                        _name = _firstChar + _rest;
                    };
                    if (_name == "") then { _name = "Unknown"; };
                };
                _tracks pushBack [_name, _path];
            };
        };
    };
} forEach ("true" configClasses (configFile >> "CfgMusic"));

_tracks