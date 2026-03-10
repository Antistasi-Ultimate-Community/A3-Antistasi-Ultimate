//fn_musicCache.sqf
#include "..\..\script_component.hpp"
/*
    Инициализирует кэши для музыкального плеера.
    Выполняется один раз при старте миссии (preInit).
*/

// ========== МУЗЫКА (CfgMusic) ==========
private _musicConfigs = "true" configClasses (configFile >> "CfgMusic");
A3U_cache_allMusicTracks = [];
A3U_cache_tracksByCategory = createHashMap;
A3U_cache_tracksByAddon = createHashMap;

{
    private _cfg = _x;
    private _class = configName _cfg;
    private _name = getText (_cfg >> "name");
    private _category = toLower getText (_cfg >> "theme");
    private _duration = getNumber (_cfg >> "duration");

    if (_name == "") then {
        _name = _class;
        private _prefixes = ["track_", "music_", "sound_", "theme_", "fx_", "amb_", "bgm_"];
        { if (_name find _x == 0) then { _name = _name select [count _x]; }; } forEach _prefixes;
        _name = _name splitString "_" joinString " ";
        if (count _name > 0) then {
            private _firstChar = toUpper (_name select [0,1]);
            private _rest = toLower (_name select [1]);
            _name = _firstChar + _rest;
        };
        if (_name == "") then { _name = "Unknown"; };
    };

    A3U_cache_allMusicTracks pushBack [_name, _class, _category, _duration];

    // Заполняем tracksByCategory (преобразуем пустую тему в "unknown")
    private _catKey = if (_category == "") then { "unknown" } else { _category };
    private _list = A3U_cache_tracksByCategory getOrDefault [_catKey, []];
    _list pushBack [_name, _class];
    A3U_cache_tracksByCategory set [_catKey, _list];

    // Заполняем tracksByAddon
    private _addons = configSourceAddonList _cfg;
    if (count _addons > 0) then {
        private _addon = _addons select 0;
        private _addonList = A3U_cache_tracksByAddon getOrDefault [_addon, []];
        _addonList pushBack [_name, _class];
        A3U_cache_tracksByAddon set [_addon, _addonList];
    };
} forEach _musicConfigs;

// ========== РУЧНЫЕ КАТЕГОРИИ (МУЗЫКА) ==========
// actualmusic – фиксированные названия из fn_getActualTracks.sqf
private _actualTrackPairs = [
    ["Underwater 2", "BackgroundTrack01_F"],
    ["On The Road", "BackgroundTrack02_F"],
    ["Epic Split", "LeadTrack03_F_Bootcamp"],
    ["Marksmen DLC: Lead Track 02 (Into the Sun)", "LeadTrack02_F_Mark"],
    ["C EA RadioMusic1", "C_EA_RadioMusic1"],
    ["C EA RadioMusic2", "C_EA_RadioMusic2"],
    ["Evolution", "LeadTrack02_F_Bootcamp"],
    ["Track D 01", "Track_D_01"],
    ["Track D 02", "Track_D_02"],
    ["Track D 03", "Track_D_03"],
    ["A2: Close Quarter Combat", "Track_M_01"],
    ["Track M 02", "Track_M_02"],
    ["Track M 03", "Track_M_03"],
    ["Track P 09", "Track_P_09"],
    ["Track P 11", "Track_P_11"],
    ["A2 OA: Revolver Jam", "Track_P_13"],
    ["A2 BAF: Through the Valley", "Track_P_18"],
    ["A2: Manhattan", "Track_R_01"],
    ["Track R 02", "Track_R_02"],
    ["Track R 03", "Track_R_03"],
    ["Track R 04", "Track_R_04"],
    ["Track R 06", "Track_R_06"],
    ["Track R 07", "Track_R_07"],
    ["Track R 08", "Track_R_08"],
    ["Track R 10", "Track_R_10"],
    ["Track R 13", "Track_R_13"],
    ["Track R 14", "Track_R_14"],
    ["Track R 15", "Track_R_15"],
    ["Track R 16", "Track_R_16"],
    ["A2: Insertion", "Track_R_17"],
    ["Track R 18", "Track_R_18"],
    ["Track R 19", "Track_R_19"],
    ["Track R 20", "Track_R_20"],
    ["Track R 22", "Track_R_22"],
    ["Track R 23", "Track_R_23"],
    ["Track R 24", "Track_R_24"]
];
A3U_cache_actualTracks = _actualTrackPairs;

// vietnam_radio – названия из CfgMusic
private _vnRadioMusicClasses = [
    "vn_trippin", "vn_drafted", "vn_unsung_heroes", "vn_route9",
    "vn_blues_for_suzy", "vn_voodoo_girl", "vn_tequila_highway", "vn_there_it_is",
    "vn_kitty_bar_blues", "vn_fire_in_the_sky", "vn_freedom_bird", "vn_dont_cry_baby",
    "vn_up_here_looking_down", "vn_jungle_boots"
];
A3U_cache_vietnamRadioTracks = [];
{
    private _class = _x;
    private _entry = A3U_cache_allMusicTracks select { _x#1 == _class };
    if (_entry isNotEqualTo []) then {
        A3U_cache_vietnamRadioTracks pushBack [_entry#0#0, _class];
    };
    // Если не найдено – ничего не добавляем
} forEach _vnRadioMusicClasses;

// Все категории музыки (с учётом ручных)
private _allMusicCategories = keys A3U_cache_tracksByCategory;
if (count A3U_cache_actualTracks > 0) then { _allMusicCategories pushBackUnique "actualmusic"; };
if (count A3U_cache_vietnamRadioTracks > 0) then { _allMusicCategories pushBackUnique "vietnam_radio"; };
A3U_cache_allMusicCategories = _allMusicCategories;

// ========== ЗВУКИ (CfgSounds) ==========
private _soundConfigs = (configFile >> "CfgSounds") call BIS_fnc_returnChildren;
_soundConfigs append ((missionConfigFile >> "CfgSounds") call BIS_fnc_returnChildren);
A3U_cache_allSounds = [];
A3U_cache_soundsByCategory = createHashMap;
A3U_cache_soundByFile = createHashMap; // для быстрого поиска по файлу

{
    private _cfg = _x;
    private _class = configName _cfg;
    private _name = getText (_cfg >> "name");
    private _duration = getNumber (_cfg >> "duration");
    private _soundArray = getArray (_cfg >> "sound");
    private _file = if (count _soundArray > 0) then { _soundArray select 0 } else { "" };

    if (_name == "" || {_name == _class}) then {
        _name = "";
        // Позже попробуем найти имя в CfgMusic
    };

    // Сохраняем для последующего поиска по файлу
    if (_file != "") then {
        private _fileName = (_file splitString "\/") select (count (_file splitString "\/") - 1);
        A3U_cache_soundByFile set [_fileName, _class];
    };

    A3U_cache_allSounds pushBack [_name, _class, _duration, _file];
} forEach _soundConfigs;

// Теперь проходим по всем звукам, пытаясь заполнить имена из CfgMusic
{
    _x params ["_name", "_class", "_duration", "_file"];
    if (_name == "" && _file != "") then {
        private _fileName = (_file splitString "\/") select (count (_file splitString "\/") - 1);
        // Ищем в CfgMusic трек с таким же файлом (полный путь или имя)
        private _found = "";
        {
            private _musicFile = getArray (_x >> "sound") param [0, ""];
            if (_musicFile != "") then {
                if (_musicFile == _file) exitWith { _found = getText (_x >> "name"); };
                private _musicFileName = (_musicFile splitString "\/") select (count (_musicFile splitString "\/") - 1);
                if (_musicFileName == _fileName) exitWith { _found = getText (_x >> "name"); };
            };
        } forEach _musicConfigs;
        if (_found != "") then {
            _name = _found;
        } else {
            // генерация из класса
            _name = _class;
            private _prefixes = ["sound_", "audio_", "sfx_"];
            { if (_name find _x == 0) then { _name = _name select [count _x]; }; } forEach _prefixes;
            _name = _name splitString "_" joinString " ";
            if (count _name > 0) then {
                private _firstChar = toUpper (_name select [0,1]);
                private _rest = toLower (_name select [1]);
                _name = _firstChar + _rest;
            };
        };
    };
    // Обновляем имя в массиве
    A3U_cache_allSounds set [_forEachIndex, [_name, _class, _duration, _file]];
} forEach A3U_cache_allSounds;

// Заполняем soundsByCategory
{
    _x params ["_name", "_class", "_duration", "_file"];
    private _cfg = configFile >> "CfgSounds" >> _class;
    if (!isClass _cfg) then { _cfg = missionConfigFile >> "CfgSounds" >> _class; };
    private _theme = toLower getText (_cfg >> "theme");
    private _addons = configSourceAddonList _cfg;
    private _category = if (_theme != "") then { _theme } else { if (count _addons > 0) then { _addons select 0 } else { "unknown" } };

    private _list = A3U_cache_soundsByCategory getOrDefault [_category, []];
    _list pushBack [_name, _class];
    A3U_cache_soundsByCategory set [_category, _list];
} forEach A3U_cache_allSounds;

// Все категории звуков
A3U_cache_allSoundCategories = keys A3U_cache_soundsByCategory;

// ========== РУЧНЫЕ КАТЕГОРИИ (ЗВУКИ) ==========
// actualmusic sounds – используем полный список классов и динамические названия из A3U_cache_allSounds
private _actualSoundClasses = [
    "BackgroundTrack01_F", "BackgroundTrack02_F", "LeadTrack03_F_Bootcamp",
    "LeadTrack02_F_Mark", "C_EA_RadioMusic1", "C_EA_RadioMusic2",
    "LeadTrack02_F_Bootcamp",
    "Track_C_01", "Track_C_02", "Track_C_03", "Track_C_04", "Track_C_05",
    "Track_C_06", "Track_C_07", "Track_C_08", "Track_C_09", "Track_C_10",
    "Track_C_11", "Track_C_12", "Track_C_13", "Track_C_14", "Track_C_15",
    "Track_C_16", "Track_C_17", "Track_C_18", "Track_C_19", "Track_C_20",
    "Track_D_01", "Track_D_02", "Track_D_03",
    "Track_M_01", "Track_M_02", "Track_M_03",
    "Track_O_01",
    "Track_P_01", "Track_P_02", "Track_P_03", "Track_P_04", "Track_P_05",
    "Track_P_06", "Track_P_07", "Track_P_08", "Track_P_09", "Track_P_10",
    "Track_P_11", "Track_P_12", "Track_P_13", "Track_P_14", "Track_P_15",
    "Track_P_16", "Track_P_17", "Track_P_18",
    "Track_R_01", "Track_R_02", "Track_R_03", "Track_R_04", "Track_R_05",
    "Track_R_06", "Track_R_07", "Track_R_08", "Track_R_09", "Track_R_10",
    "Track_R_11", "Track_R_12", "Track_R_13", "Track_R_14", "Track_R_15",
    "Track_R_16", "Track_R_17", "Track_R_18", "Track_R_19", "Track_R_20",
    "Track_R_21", "Track_R_22", "Track_R_23", "Track_R_24"
];
A3U_cache_actualMusicSounds = [];
{
    private _class = _x;
    private _entry = A3U_cache_allSounds select { _x#1 == _class };
    if (_entry isNotEqualTo []) then {
        A3U_cache_actualMusicSounds pushBack [_entry#0#0, _class];
    } else {
        A3U_cache_actualMusicSounds pushBack [_class, _class];
    };
} forEach _actualSoundClasses;

// vietnam_radio sounds
private _vnSoundClasses = [
    "vn_drmm_song_os_01", "vn_drmm_song_os_02", "vn_drmm_song_os_03", "vn_drmm_song_os_04",
    "vn_drmm_song_os_05", "vn_drmm_song_os_06", "vn_drmm_song_os_07", "vn_drmm_song_os_08",
    "vn_drmm_song_os_09", "vn_drmm_song_os_10", "vn_drmm_song_os_11", "vn_drmm_song_os_12",
    "vn_drmm_song_os_13", "vn_drmm_song_os_14"
];
A3U_cache_vietnamRadioSounds = [];
{
    private _class = _x;
    private _entry = A3U_cache_allSounds select { _x#1 == _class };
    if (_entry isNotEqualTo []) then {
        A3U_cache_vietnamRadioSounds pushBack [_entry#0#0, _class];
    };
} forEach _vnSoundClasses;

// ========== АДДОНЫ И МОДЫ ==========
// Ванильные аддоны (музыка)
A3U_cache_vanillaAddons = [
    "A3_Music_F", "A3_Music_F_Bootcamp", "A3_Music_F_EPC", "A3_Music_F_EPB",
    "A3_Music_F_Heli", "A3_Music_F_Jets", "A3_Music_F_Mark", "A3_Music_F_Orange",
    "A3_Music_F_Tacops", "A3_Music_F_Tank", "A3_Music_F_Warlords", "A3_Music_F_Enoch",
    "A3_Music_F_Exp", "A3_Music_F_EPA", "A3_Music_F_Argo", "A3_Missions_F_Oldman",
    "A3_Missions_F_Exp", "A3_Missions_F_EPA", "A3_Missions_F_EPC", "A3_Missions_F_EPB",
    "A3_Missions_F_Curator", "A3_Missions_F_Gamma", "A3_Data_F_Curator", "A3_Sounds_F"
];

// Не-ванильные аддоны (музыка)
A3U_cache_nonVanillaAddons = [];
{
    private _addons = configSourceAddonList _x;
    if (count _addons > 0) then {
        private _addon = _addons select 0;
        if !(_addon in A3U_cache_vanillaAddons) then {
            if (_addon != "music_f_vietnam_c") then {
                A3U_cache_nonVanillaAddons pushBackUnique _addon;
            };
        };
    };
} forEach _musicConfigs;

// Ванильные звуковые аддоны (полный список из fn_getVanillaSoundAddons.sqf)
A3U_cache_vanillaSoundAddons = [
    "A3A_ultimate",
    "A3A_core",
    "A3A_patcom",
    "A3_Dubbing_F_Warlords",
    "A3_Sounds_F",
    "A3_Sounds_F_EPB",
    "A3_Sounds_F_EPC",
    "A3_Sounds_F_Bootcamp",
    "A3_Sounds_F_Exp_A",
    "A3_Sounds_F_Jets",
    "A3_Sounds_F_Patrol",
    "A3_Sounds_F_Orange",
    "A3_Sounds_F_Enoch",
    "A3_Sounds_F_AoW",
    "A3_Sounds_F_Decade",
    "A3_Ui_F",
    "A3_Ui_F_Curator",
    "A3_Missions_F",
    "A3_Missions_F_Beta",
    "A3_Missions_F_Gamma",
    "A3_Missions_F_EPA",
    "A3_Missions_F_EPC",
    "A3_Missions_F_EPB",
    "A3_Missions_F_Curator",
    "A3_Missions_F_Bootcamp",
    "A3_Missions_F_Exp",
    "A3_Missions_F_Tacops",
    "A3_Missions_F_Oldman",
    "A3_Missions_F_AoW",
    "A3_Data_F_Curator",
    "A3_3DEN",
    "A3_Modules_F_MP_Mark_Objectives",
    "A3_Animals_F_Beta_Sheep",
    "A3_Air_F_Beta_Parachute_01",
    "structures_f_vietnam_c",
    "sounds_f_vietnam_c",
    "sounds_f_vietnam_02_c",
    "sounds_f_vietnam_03_c",
    "sounds_f_vietnam_04_c"
];

// Не-ванильные звуковые аддоны
A3U_cache_nonVanillaSoundAddons = [];
{
    private _addons = configSourceAddonList _x;
    if (count _addons > 0) then {
        private _addon = _addons select 0;
        if !(_addon in A3U_cache_vanillaSoundAddons) then {
            if (_addon != "music_f_vietnam_c" && _addon != "music_f_vietnam_02_c") then {
                A3U_cache_nonVanillaSoundAddons pushBackUnique _addon;
            };
        };
    };
} forEach _soundConfigs;

// Информация о моде для иконок (кэшируем по аддонам)
A3U_cache_modInfo = createHashMap;
{
    private _addon = _x;
    private _mods = configSourceModList (configFile >> "CfgPatches" >> _addon);
    if (count _mods > 0) then {
        private _mod = _mods select 0;
        private _params = modParams [_mod, ["logo", "name"]];
        A3U_cache_modInfo set [_addon, [_params param [0, ""], _params param [1, ""]]];
    };
} forEach (A3U_cache_nonVanillaAddons + A3U_cache_nonVanillaSoundAddons);

diag_log "[A3U Music Cache] Initialized";