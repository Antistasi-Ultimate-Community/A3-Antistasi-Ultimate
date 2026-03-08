#include "..\..\script_component.hpp"
/*
    Возвращает список звуков для категории "vnradio" в звуковом режиме.
    Названия берутся из CfgSounds (с учётом локализации), если отсутствуют — генерируются.
*/
private _classes = [
    "vn_drmm_song_os_01",
    "vn_drmm_song_os_02",
    "vn_drmm_song_os_03",
    "vn_drmm_song_os_04",
    "vn_drmm_song_os_05",
    "vn_drmm_song_os_06",
    "vn_drmm_song_os_07",
    "vn_drmm_song_os_08",
    "vn_drmm_song_os_09",
    "vn_drmm_song_os_10",
    "vn_drmm_song_os_11",
    "vn_drmm_song_os_12",
    "vn_drmm_song_os_13",
    "vn_drmm_song_os_14"
];

private _sounds = [];
{
    private _class = _x;
    private _config = configFile >> "CfgSounds" >> _class;
    if (!isClass _config) then { _config = missionConfigFile >> "CfgSounds" >> _class; };
    
    private _name = getText (_config >> "name");
    if (_name == "") then {
        _name = _class;
        private _prefixes = ["track_", "music_", "sound_", "theme_", "fx_", "amb_", "bgm_"];
        {
            if (_name find _x == 0) then {
                _name = _name select [count _x];
            };
        } forEach _prefixes;
        _name = _name splitString "_" joinString " ";
        if (count _name > 0) then {
            private _firstChar = toUpper (_name select [0,1]);
            private _rest = toLower (_name select [1]);
            _name = _firstChar + _rest;
        };
    };
    _sounds pushBack [_name, _class];
} forEach _classes;

_sounds