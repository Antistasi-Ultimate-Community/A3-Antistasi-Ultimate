#include "..\..\script_component.hpp"
/*
    Возвращает иконку мода и его название для указанного класса трека.
    Параметры:
        0: STRING - classname трека из CfgMusic
    Возвращает:
        ARRAY - [путь к иконке, название мода]
*/
params ["_trackClass"];

private _icon = "";
private _modName = "";
private _config = configFile >> "CfgMusic" >> _trackClass;

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