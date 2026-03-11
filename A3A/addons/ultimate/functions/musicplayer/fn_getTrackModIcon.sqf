// fn_getTrackModIcon.sqf
/*  
    Author: wersal

    Description:
        Returns the mod icon and mod name for a given track or sound class.
        Depending on the global mode A3U_playbackMode, it uses CfgMusic or CfgSounds.

    Params:
        _class : STRING : classname of the track/sound

    Returns:
        ARRAY : [icon path, mod name]

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

params ["_class"];

private _icon = "";
private _modName = "";
private _config = if (isNil "A3U_playbackMode" || {A3U_playbackMode == "music"}) then {
    configFile >> "CfgMusic" >> _class
} else {
    configFile >> "CfgSounds" >> _class
};
if (!isClass _config) then { _config = missionConfigFile >> "CfgSounds" >> _class; };

if (isClass _config) then {
    private _addons = configSourceAddonList _config;
    if (count _addons > 0) then {
        private _addon = _addons select 0;
        private _mods = configSourceModList (configFile >> "CfgPatches" >> _addon);
        if (count _mods > 0) then {
            private _mod = _mods select 0;
            private _params = modParams [_mod, ["logo", "logoOver", "name"]];
            _icon = _params param [0, ""];
            _modName = _params param [2, ""];
        };
    };
};
if (_icon == "") then {
    _icon = "\a3\ui_f\data\logos\arma3_splash_ca.paa";
};
[_icon, _modName]