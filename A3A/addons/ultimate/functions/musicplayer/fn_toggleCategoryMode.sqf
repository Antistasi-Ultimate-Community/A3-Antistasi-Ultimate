// fn_toggleCategoryMode.sqf
/*  
    Author: wersal

    Description:
        Toggles between "all categories" and "favorites only" modes.
        Updates the category list and selects the first category.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

if (isNil "A3U_cache_manualMusicCategories") then { call A3U_fnc_musicCache; };

private _btn = _display displayCtrl 85116;

A3U_categoryMode = !A3U_categoryMode;

if (A3U_categoryMode) then {
    _btn ctrlSetBackgroundColor [0.2,0.6,0.2,1];
    _btn ctrlSetTooltip localize "STR_A3U_category_mode_fav";
} else {
    _btn ctrlSetBackgroundColor [1,1,1,1];
    _btn ctrlSetTooltip localize "STR_A3U_category_mode_all";
};

// Get all categories depending on mode
private _categories = [];
private _categoryType = "";

if (A3U_playbackMode == "music") then {
    if (A3U_categoryMode) then {
        private _allCategories = A3U_cache_allMusicCategories;
        _categories = _allCategories - A3U_cache_manualMusicCategories;
        _categoryType = "theme";
    } else {
        _categories = +A3U_cache_manualMusicCategories;
        private _nonVanillaAddons = A3U_cache_nonVanillaAddons;
        {
            _categories pushBack _x;
        } forEach _nonVanillaAddons;
        _categoryType = "addon";
    };
} else {
    if (A3U_categoryMode) then {
        _categories = A3U_cache_allSoundCategories;
        _categoryType = "sound_all";
    } else {
        _categories = +A3U_cache_manualSoundCategories;
        _categoryType = "sound_filtered";
    };
};

_display setVariable ["A3U_categoryType", _categoryType];

// Fill the category list
private _categoriesList = _display displayCtrl 85101;
lbClear _categoriesList;
{
    private _displayName = if (_x == "unknown") then { localize "STR_A3U_unknown_category" } else {
        private _str = _x;
        toUpper (_str select [0,1]) + toLower (_str select [1])
    };
    private _idx = _categoriesList lbAdd _displayName;
    _categoriesList lbSetData [_idx, _x];
} forEach _categories;

// If the list is not empty, select the first category and update the items
private _tracksList = _display displayCtrl 85102;
if (count _categories > 0) then {
    _categoriesList lbSetCurSel 0;
    private _category = _categories select 0;

    private _items = [];
    if (A3U_playbackMode == "music") then {
        if (_category in A3U_cache_manualMusicCategories) then {
            private _cacheName = format ["A3U_cache_%1Tracks", _category];
            _items = missionNamespace getVariable [_cacheName, []];
        } else {
            if (_categoryType == "addon") then {
                _items = A3U_cache_tracksByAddon getOrDefault [_category, []];
            } else {
                _items = A3U_cache_tracksByCategory getOrDefault [_category, []];
            };
        };
    } else {
        if (_category in A3U_cache_manualSoundCategories) then {
            private _cacheName = format ["A3U_cache_%1Sounds", _category];
            _items = missionNamespace getVariable [_cacheName, []];
        } else {
            _items = A3U_cache_soundsByCategory getOrDefault [_category, []];
        };
    };

    lbClear _tracksList;
    {
        _x params ["_name", "_class"];
        private _idx = _tracksList lbAdd _name;
        _tracksList lbSetData [_idx, _class];
    } forEach _items;
    _tracksList lbSetCurSel 0;

    A3U_currentTrackList = _items;
    A3U_currentTrackIndex = 0;
    A3U_currentCategory = _category;
    if (count _items > 0) then {
        A3U_currentTrack = _items select 0;
    } else {
        A3U_currentTrack = [];
    };
} else {
    lbClear _tracksList;
    _tracksList lbAdd localize "STR_A3U_no_categories";
    A3U_currentTrackList = [];
    A3U_currentTrackIndex = -1;
    A3U_currentCategory = "";
    A3U_currentTrack = [];
};