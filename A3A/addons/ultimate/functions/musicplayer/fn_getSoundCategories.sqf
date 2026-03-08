//fn_getSoundCategories.sqf
#include "..\..\script_component.hpp"
/*
    Возвращает список уникальных категорий из CfgSounds.
    - Если есть поле "theme", категория = theme.
    - Если нет theme, но есть аддон, категория = имя аддона.
    - Если нет ни theme, ни аддона, звук относится к "unknown".
*/
private _categories = [];
private _hasUnknown = false;

private _configs = (configFile >> "CfgSounds") call BIS_fnc_returnChildren;
_configs append ((missionConfigFile >> "CfgSounds") call BIS_fnc_returnChildren);

{
    private _theme = toLower getText (_x >> "theme");
    if (_theme != "") then {
        _categories pushBackUnique _theme;
    } else {
        private _addons = configSourceAddonList _x;
        if (count _addons > 0) then {
            _categories pushBackUnique (_addons select 0);
        } else {
            _hasUnknown = true;
        };
    };
} forEach _configs;

if (_hasUnknown) then { _categories pushBack "unknown"; };

diag_log format ["[getSoundCategories] category: %1, returning %2 sounds", _categories, _configs];

_categories