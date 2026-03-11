// fn_categoryChanged.sqf
/*  
    Author: wersal

    Description:
        Event handler for category list selection.
        Loads tracks/sounds for the selected category and displays them.

    Params:
        _ctrlCategory : CONTROL : the category list control
        _index : NUMBER : selected row index

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_ctrlCategory", "_index"];

// If this is a programmatic change – ignore the event
private _display = ctrlParent _ctrlCategory;
if (_display getVariable ["A3U_skipCategoryChange", false]) exitWith {};

if (_index == -1) exitWith { systemChat localize "STR_A3U_error_no_category"; };

// Get category from data (lowercase)
private _category = _ctrlCategory lbData _index;
systemChat format [localize "STR_A3U_category_selected", _category];

// Determine category type
private _categoryType = _display getVariable ["A3U_categoryType", "theme"];
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

private _itemsList = _display displayCtrl 85102;
lbClear _itemsList;

if (count _items == 0) then {
    _itemsList lbAdd localize "STR_A3U_category_empty";
} else {
    {
        _x params ["_name", "_class"];
        private _idx = _itemsList lbAdd _name;
        _itemsList lbSetData [_idx, _class];
    } forEach _items;
    _itemsList lbSetCurSel 0;

    A3U_currentTrackList = _items;
    A3U_currentTrackIndex = 0;
    A3U_currentCategory = _category;
    A3U_currentTrack = _items select 0;
};