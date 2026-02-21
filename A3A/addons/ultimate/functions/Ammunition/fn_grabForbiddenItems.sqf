/*
    Author:
    Silence

    Description:
    Handles grabbing forbidden items from config. Puts result into the A3U_forbiddenItems global space.

    Params:
	N/A

    Usage:
    [] call A3U_fnc_grabForbiddenItems;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _forbiddenItems = [];
private _inheritedForbiddenItems = [];

private _cfg = (configfile >> "A3U" >> "forbiddenItems") call BIS_fnc_getCfgSubClasses;

{
	// if (getNumber (configFile "A3U" >> "forbiddenItems" >> _configClass >> "inheritedPath") isNotEqualTo "") exitWith {
	// 	_inheritedForbiddenItems pushBack _x;
	// };
    if (["_unlimited_base", _x] call BIS_fnc_inString || ["_limited_base", _x] call BIS_fnc_inString) then {
        Verbose_1("Skipped adding %1 to the forbiddenItems list.", _x);
        continue
    };
    
    private _addons = getArray (configfile >> "A3U" >> "forbiddenItems" >> _x >> "addons");
    
    if (count _addons == 0 || { (isClass (configFile >> "CfgPatches" >> _x)) } count _addons == count _addons) then {
        _forbiddenItems pushBack _x;
        Verbose_1("Added %1 to the forbiddenItems list.", _x);
    };
} forEach _cfg;

A3U_forbiddenItems = _forbiddenItems;

Verbose_1("Final forbiddenItems list: %1", A3U_forbiddenItems);