//fn_getCategories.sqf
#include "..\..\script_component.hpp"

private _categories = [];
private _hasUnknown = false;

{
    private _theme = getText (_x >> "theme");
    
    if (_theme == "") then {
        _hasUnknown = true;
    } else {
        _categories pushBackUnique _theme;
    };
} forEach ("true" configClasses (configFile >> "CfgMusic"));

if (_hasUnknown) then {
    _categories pushBack "Unknown";
};

_categories
