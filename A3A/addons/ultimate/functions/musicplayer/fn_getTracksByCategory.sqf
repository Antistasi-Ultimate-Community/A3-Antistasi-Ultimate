//fn_getTrackByCategory.sqf
#include "..\..\script_component.hpp"

A3U_fnc_getTracksByCategory = {
    params ["_category"];
    private _tracks = [];
    {
        private _theme = getText (_x >> "theme");
        if (_theme == _category) then {
            private _name = getText (_x >> "name");
            private _path = configName _x;
            _tracks pushBack [_name, _path];
        };
    } forEach ("true" configClasses (configFile >> "CfgMusic"));
    _tracks
};