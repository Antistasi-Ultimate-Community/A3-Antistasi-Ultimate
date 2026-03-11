// fn_getTrackDebugInfo.sqf
/*  
    Author: wersal

    Description:
        Returns structured text with debug information about a track.

    Params:
        _trackClass : STRING : classname of the track from CfgMusic

    Returns:
        STRING : formatted text with Structured Text tags

    License: VPN-DPC
*/

#include "..\script_component.hpp"

params ["_trackClass"];

private _config = configFile >> "CfgMusic" >> _trackClass;
if (!isClass _config) exitWith {format ["<t color='#FF8888'>%1</t>", localize "STR_A3U_track_not_found"]};

// Basic parameters (common)
private _name = getText (_config >> "name");
if (_name == "") then { _name = localize "STR_A3U_no_name" };

private _theme = getText (_config >> "theme");
if (_theme == "") then { _theme = localize "STR_A3U_none" };

private _musicClass = getText (_config >> "musicClass"); // additional field from example
if (_musicClass == "") then { _musicClass = localize "STR_A3U_none" };

private _type = getText (_config >> "type");
if (_type == "") then { _type = localize "STR_A3U_none" };

private _duration = getNumber (_config >> "duration");

// Sound field can be a string or an array
private _sound = getArray (_config >> "sound");
if (_sound isEqualTo []) then {
    // if array is empty, maybe it's a string?
    private _soundStr = getText (_config >> "sound");
    _sound = if (_soundStr != "") then { [_soundStr] } else { [localize "STR_A3U_no_sound"] };
};

// Tags (array of strings)
private _tags = getArray (_config >> "tags");
private _tagsStr = if (_tags isEqualTo []) then { localize "STR_A3U_none" } else { _tags joinString ", " };

// Titles (array of strings, usually empty)
private _titles = getArray (_config >> "titles");
private _titlesStr = if (_titles isEqualTo []) then { localize "STR_A3U_none" } else { _titles joinString ", " };

// Addon and mod info
private _addon = "";
private _modName = "";
private _modLogo = "";
private _addons = configSourceAddonList _config;
if (count _addons > 0) then {
    _addon = _addons select 0;
    private _mods = configSourceModList (configFile >> "CfgPatches" >> _addon);
    if (count _mods > 0) then {
        private _mod = _mods select 0;
        private _params = modParams [_mod, ["name", "logo"]];
        _modName = _params param [0, ""];
        _modLogo = _params param [1, ""];
    };
};

// Format output (font size 0.7 to fit many lines)
private _lines = [];
_lines pushBack format ["<t color='#FFFF88'>%1</t>", localize "STR_A3U_debug_track_header"];
_lines pushBack format [localize "STR_A3U_debug_class", _trackClass];
_lines pushBack format [localize "STR_A3U_debug_name", _name];
_lines pushBack format [localize "STR_A3U_debug_theme", _theme];
_lines pushBack format [localize "STR_A3U_debug_musicclass", _musicClass];
_lines pushBack format [localize "STR_A3U_debug_type", _type];
_lines pushBack format [localize "STR_A3U_debug_duration", _duration];
_lines pushBack format [localize "STR_A3U_debug_sound", _sound param [0, ""]]; // show only path, rest optional
if (count _sound > 1) then {
    _lines pushBack format [localize "STR_A3U_debug_soundparams", _sound param [1, 1], _sound param [2, 1]];
};
_lines pushBack format [localize "STR_A3U_debug_tags", _tagsStr];
_lines pushBack format [localize "STR_A3U_debug_titles", _titlesStr];
if (_addon != "") then { _lines pushBack format [localize "STR_A3U_debug_addon", _addon]; };
if (_modName != "") then { _lines pushBack format [localize "STR_A3U_debug_mod", _modName]; };
if (_modLogo != "") then { _lines pushBack format [localize "STR_A3U_debug_logo", _modLogo]; };

private _result = "<t size='0.7'>" + (_lines joinString "<br/>") + "</t>";
_result