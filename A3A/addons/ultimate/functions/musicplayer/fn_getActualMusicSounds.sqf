#include "..\..\script_component.hpp"
/*
    Возвращает список звуков для категории "actualmusic" в звуковом режиме.
    Названия берутся из CfgSounds (с учётом локализации), если отсутствуют — генерируются.
*/
private _classes = [
    // Добавленные классы из музыкального списка:
    "BackgroundTrack01_F",
    "BackgroundTrack02_F",
    "LeadTrack03_F_Bootcamp",
    "LeadTrack02_F_Mark",
    "C_EA_RadioMusic1",
    "C_EA_RadioMusic2",
    "LeadTrack02_F_Bootcamp",
    "Track_C_01",
    "Track_C_02",
    "Track_C_03",
    "Track_C_04",
    "Track_C_05",
    "Track_C_06",
    "Track_C_07",
    "Track_C_08",
    "Track_C_09",
    "Track_C_10",
    "Track_C_11",
    "Track_C_12",
    "Track_C_13",
    "Track_C_14",
    "Track_C_15",
    "Track_C_16",
    "Track_C_17",
    "Track_C_18",
    "Track_C_19",
    "Track_C_20",
    "Track_D_01",
    "Track_D_02",
    "Track_D_03",
    "Track_M_01",
    "Track_M_02",
    "Track_M_03",
    "Track_O_01",
    "Track_P_01",
    "Track_P_02",
    "Track_P_03",
    "Track_P_04",
    "Track_P_05",
    "Track_P_06",
    "Track_P_07",
    "Track_P_08",
    "Track_P_09",
    "Track_P_10",
    "Track_P_11",
    "Track_P_12",
    "Track_P_13",
    "Track_P_14",
    "Track_P_15",
    "Track_P_16",
    "Track_P_17",
    "Track_P_18",
    "Track_R_01",
    "Track_R_02",
    "Track_R_03",
    "Track_R_04",
    "Track_R_05",
    "Track_R_06",
    "Track_R_07",
    "Track_R_08",
    "Track_R_09",
    "Track_R_10",
    "Track_R_11",
    "Track_R_12",
    "Track_R_13",
    "Track_R_14",
    "Track_R_15",
    "Track_R_16",
    "Track_R_17",
    "Track_R_18",
    "Track_R_19",
    "Track_R_20",
    "Track_R_21",
    "Track_R_22",
    "Track_R_23",
    "Track_R_24"
];

private _sounds = [];
private _musicConfigs = "true" configClasses (configFile >> "CfgMusic");

{
    private _class = _x;
    private _config = configFile >> "CfgSounds" >> _class;
    if (!isClass _config) then { _config = missionConfigFile >> "CfgSounds" >> _class; };
    if (!isClass _config) then { continue; };

    private _name = getText (_config >> "name");
    if (_name == _class) then { _name = ""; }; // игнорируем автоматическое имя

    // Если имя пустое, пытаемся найти по файлу в CfgMusic
    if (_name == "") then {
        private _soundArray = getArray (_config >> "sound");
        private _soundFile = if (count _soundArray > 0) then { _soundArray select 0 } else { "" };

        if (_soundFile != "") then {
            private _soundFileName = (_soundFile splitString "\/") select (count (_soundFile splitString "\/") - 1);
            private _foundName = "";

            {
                private _musicSound = getArray (_x >> "sound");
                if (count _musicSound > 0) then {
                    private _musicFilePath = _musicSound select 0;

                    // Сравниваем полные пути
                    if (_musicFilePath == _soundFile) exitWith {
                        _foundName = getText (_x >> "name");
                    };
                    // Если не совпали, сравниваем имена файлов
                    if (_foundName == "") then {
                        private _musicFileName = (_musicFilePath splitString "\/") select (count (_musicFilePath splitString "\/") - 1);
                        if (_musicFileName == _soundFileName) then {
                            _foundName = getText (_x >> "name");
                        };
                    };
                };
            } forEach _musicConfigs;

            if (_foundName != "") then {
                _name = _foundName;
            };
        };
    };

    // Если имя всё ещё пустое, генерируем из класса
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