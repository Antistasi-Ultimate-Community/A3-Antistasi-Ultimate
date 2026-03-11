/*
    fn_musicCache

    Author: wersal

    Description:
        Initializes caches for the music player.
        Runs once at mission start (preInit).

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

// ========== MUSIC (CfgMusic) ==========
private _musicConfigs = "true" configClasses (configFile >> "CfgMusic");
A3U_cache_allMusicTracks = [];
A3U_cache_tracksByCategory = createHashMap;
A3U_cache_tracksByAddon = createHashMap;
A3U_manualCategoryDisplayNames = createHashMap;

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

    // Fill tracksByCategory (convert empty theme to "unknown")
    private _catKey = if (_category == "") then { "unknown" } else { _category };
    private _list = A3U_cache_tracksByCategory getOrDefault [_catKey, []];
    _list pushBack [_name, _class];
    A3U_cache_tracksByCategory set [_catKey, _list];

    // Fill tracksByAddon
    private _addons = configSourceAddonList _cfg;
    if (count _addons > 0) then {
        private _addon = _addons select 0;
        private _addonList = A3U_cache_tracksByAddon getOrDefault [_addon, []];
        _addonList pushBack [_name, _class];
        A3U_cache_tracksByAddon set [_addon, _addonList];
    };
} forEach _musicConfigs;

// ========== SOUNDS (CfgSounds) ==========
private _soundConfigs = (configFile >> "CfgSounds") call BIS_fnc_returnChildren;
_soundConfigs append ((missionConfigFile >> "CfgSounds") call BIS_fnc_returnChildren);
A3U_cache_allSounds = [];
A3U_cache_soundsByCategory = createHashMap;
A3U_cache_soundByFile = createHashMap; // for quick file lookup

{
    private _cfg = _x;
    private _class = configName _cfg;
    private _name = getText (_cfg >> "name");
    private _duration = getNumber (_cfg >> "duration");
    private _soundArray = getArray (_cfg >> "sound");
    private _file = if (count _soundArray > 0) then { _soundArray select 0 } else { "" };

    if (_name == "" || {_name == _class}) then {
        _name = "";
        // Will try to find name in CfgMusic later
    };

    // Save for later file-based search
    if (_file != "") then {
        private _fileName = (_file splitString "\/") select (count (_file splitString "\/") - 1);
        A3U_cache_soundByFile set [_fileName, _class];
    };

    A3U_cache_allSounds pushBack [_name, _class, _duration, _file];
} forEach _soundConfigs;

// Now go through all sounds, trying to fill names from CfgMusic
{
    _x params ["_name", "_class", "_duration", "_file"];
    if (_name == "" && _file != "") then {
        private _fileName = (_file splitString "\/") select (count (_file splitString "\/") - 1);
        // Search in CfgMusic for a track with the same file (full path or file name)
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
            // generate name from class
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
    // Update name in the array
    A3U_cache_allSounds set [_forEachIndex, [_name, _class, _duration, _file]];
} forEach A3U_cache_allSounds;

// Fill soundsByCategory
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

// All sound categories
A3U_cache_allSoundCategories = keys A3U_cache_soundsByCategory;

// ========== MANUAL CATEGORIES FROM CONFIG ==========
private _categoryConfigs = call A3U_fnc_musicConfig;
if (typeName _categoryConfigs != "ARRAY") then {
    _categoryConfigs = [];
};

// Arrays to store keys of categories available in music and sounds
A3U_cache_manualMusicCategories = [];
A3U_cache_manualSoundCategories = [];

// HashMap for era values (key -> era)
A3U_categoryEra = createHashMap;

{
    _x params ["_key", "_displayName", "_classes", "_types", "_era"];
    A3U_manualCategoryDisplayNames set [_key, _displayName];
    A3U_categoryEra set [_key, _era];

    private _hasMusic = "music" in _types;
    private _hasSound = "sound" in _types;

    if (_hasMusic) then {
        private _cacheName = format ["A3U_cache_%1Tracks", _key];
        private _cache = [];
        {
            private _class = _x;
            private _entry = A3U_cache_allMusicTracks select { _x#1 == _class };
            if (_entry isNotEqualTo []) then {
                _cache pushBack [_entry#0#0, _class];
            };
        } forEach _classes;
        missionNamespace setVariable [_cacheName, _cache];
        if (count _cache > 0) then {
            A3U_cache_manualMusicCategories pushBackUnique _key;
        };
    };

    if (_hasSound) then {
        private _cacheName = format ["A3U_cache_%1Sounds", _key];
        private _cache = [];
        {
            private _class = _x;
            private _entry = A3U_cache_allSounds select { _x#1 == _class };
            if (_entry isNotEqualTo []) then {
                _cache pushBack [_entry#0#0, _class];
            };
        } forEach _classes;
        missionNamespace setVariable [_cacheName, _cache];
        if (count _cache > 0) then {
            A3U_cache_manualSoundCategories pushBackUnique _key;
        };
    };
} forEach _categoryConfigs;

// ========== ALL MUSIC CATEGORIES ==========
private _allMusicCategories = keys A3U_cache_tracksByCategory;
{
    _allMusicCategories pushBackUnique _x;
} forEach A3U_cache_manualMusicCategories;
A3U_cache_allMusicCategories = _allMusicCategories;

// ========== ADDONS AND MODS ==========
// Vanilla addons (music)
A3U_cache_vanillaAddons = [
    "A3_Music_F", "A3_Music_F_Bootcamp", "A3_Music_F_EPC", "A3_Music_F_EPB",
    "A3_Music_F_Heli", "A3_Music_F_Jets", "A3_Music_F_Mark", "A3_Music_F_Orange",
    "A3_Music_F_Tacops", "A3_Music_F_Tank", "A3_Music_F_Warlords", "A3_Music_F_Enoch",
    "A3_Music_F_Exp", "A3_Music_F_EPA", "A3_Music_F_Argo", "A3_Missions_F_Oldman",
    "A3_Missions_F_Exp", "A3_Missions_F_EPA", "A3_Missions_F_EPC", "A3_Missions_F_EPB",
    "A3_Missions_F_Curator", "A3_Missions_F_Gamma", "A3_Data_F_Curator", "A3_Sounds_F"
];

// Non‑vanilla addons (music)
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

// Vanilla sound addons
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

// Non‑vanilla sound addons
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

// Mod info for icons (cache by addon)
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