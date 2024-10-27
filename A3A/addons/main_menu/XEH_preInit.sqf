#include "script_component.hpp"

private _images = (configfile >> "A3AU_Images") call BIS_fnc_getCfgSubClasses;

private _cfgNameArray = [];
private _pathArray = [];
private _nameArray = [];

{
    private _cfgName = _x;
    private _path = getText (configFile >> "A3AU_Images" >> _x >> "path");
    private _name = getText (configFile >> "A3AU_Images" >> _x >> "name");
    
    _cfgNameArray pushBack _cfgName;
    _pathArray pushBack _path;
    _nameArray pushBack _name;
} forEach _images; // grab each video entry + data for _x

[
    "menu_framework_image", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Main Menu Background", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["Antistasi Ultimate", "Main Menu"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [_pathArray, _nameArray, 0], // [default value], [name for default value], index for default value
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        profileNamespace setVariable ["menu_framework_image", _value];

        call A3U_fnc_menuImage;

        if !([player] call A3U_fnc_isInMenu) exitWith {};
    }
] call CBA_fnc_addSetting;