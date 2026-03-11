// fn_getCategoryTracks.sqf
/*  
    Author: wersal

    Description:
        Helper function to get the list of tracks/sounds for a manual category key and type.
        Uses the manual category configuration (fn_musicConfig).

    Params:
        _categoryKey : STRING : category key (e.g., "actualmusic")
        _type : STRING : "music" or "sound"

    Returns:
        ARRAY : list in format [[name, class], ...]

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"
params ["_categoryKey", "_type"];

private _configCategories = call A3U_fnc_musicConfig; // loading config
private _found = _configCategories select { _x#0 == _categoryKey && _x#3 == _type };
if (_found isEqualTo []) exitWith { [] };

_found = _found#0;
private _classes = _found#2;

private _result = [];
private _sourceCache = if (_type == "music") then { A3U_cache_allMusicTracks } else { A3U_cache_allSounds };

{
    private _class = _x;
    private _entry = _sourceCache select { _x#1 == _class };
    if (_entry isNotEqualTo []) then {
        _result pushBack [_entry#0#0, _class]; // name, class
    };
} forEach _classes;

_result