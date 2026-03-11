// fn_getSoundDebugInfo.sqf
/*  
    Author: wersal

    Description:
        Returns structured text with debug information about a sound.

    Params:
        _soundClass : STRING : classname of the sound from CfgSounds

    Returns:
        STRING : formatted text with Structured Text tags

    License: VPN-DPC
*/

#include "..\script_component.hpp"

params ["_soundClass"];

private _config = (configFile >> "CfgSounds" >> _soundClass);
if (!isClass _config) then { _config = (missionConfigFile >> "CfgSounds" >> _soundClass); };
if (!isClass _config) exitWith {format ["<t color='#FF8888'>%1</t>", localize "STR_A3U_sound_not_found"]};

private _name = getText (_config >> "name");
if (_name == "") then { _name = localize "STR_A3U_no_name" };

private _soundArray = getArray (_config >> "sound");
private _file = if (count _soundArray > 0) then { _soundArray select 0 } else { localize "STR_A3U_no_file" };
private _volume = if (count _soundArray > 1) then { _soundArray select 1 } else { 1 };
private _pitch = if (count _soundArray > 2) then { _soundArray select 2 } else { 1 };
private _maxDistance = if (count _soundArray > 3) then { _soundArray select 3 } else { 100 };

private _duration = getNumber (_config >> "duration");
private _titles = getArray (_config >> "titles");
private _theme = getText (_config >> "theme");

private _addon = "";
private _modName = "";
private _addons = configSourceAddonList _config;
if (count _addons > 0) then {
    _addon = _addons select 0;
    private _mods = configSourceModList (configFile >> "CfgPatches" >> _addon);
    if (count _mods > 0) then {
        private _mod = _mods select 0;
        private _params = modParams [_mod, ["name", "logo"]];
        _modName = _params param [0, ""];
    };
};

private _lines = [];
_lines pushBack format ["<t color='#FFFF88'>%1</t>", localize "STR_A3U_debug_sound_header"];
_lines pushBack format [localize "STR_A3U_debug_class", _soundClass];
_lines pushBack format [localize "STR_A3U_debug_name", _name];
_lines pushBack format [localize "STR_A3U_debug_theme", _theme];
_lines pushBack format [localize "STR_A3U_debug_file", _file];
_lines pushBack format [localize "STR_A3U_debug_volume", _volume];
_lines pushBack format [localize "STR_A3U_debug_pitch", _pitch];
_lines pushBack format [localize "STR_A3U_debug_maxdist", _maxDistance];
_lines pushBack format [localize "STR_A3U_debug_duration", _duration];
_lines pushBack format [localize "STR_A3U_debug_titles", if (_titles isEqualTo []) then { localize "STR_A3U_none" } else { str _titles }];
if (_addon != "") then { _lines pushBack format [localize "STR_A3U_debug_addon", _addon]; };
if (_modName != "") then { _lines pushBack format [localize "STR_A3U_debug_mod", _modName]; };

private _result = "<t size='0.7'>" + (_lines joinString "<br/>") + "</t>";
_result