//fn_getSoundsByCategory.sqf
#include "..\..\script_component.hpp"
params [["_category", "unknown", [""]]];

private _sounds = [];
private _configs = (configFile >> "CfgSounds") call BIS_fnc_returnChildren;
_configs append ((missionConfigFile >> "CfgSounds") call BIS_fnc_returnChildren);

{
    private _theme = toLower getText (_x >> "theme");
    private _name = getText (_x >> "name");
    private _class = configName _x;
    
    if (_name == "") then {
        _name = _class;
        // форматирование (можно добавить)
    };
    
    if (_category == "unknown") then {
        // Звук попадает в unknown, если нет theme и нет аддона
        if (_theme == "" && {count (configSourceAddonList _x) == 0}) then {
            _sounds pushBack [_name, _class];
        };
    } else {
        // Сначала проверяем theme
        if (_theme == _category) then {
            _sounds pushBack [_name, _class];
        } else {
            // Если theme не совпадает, проверяем аддон
            private _addons = configSourceAddonList _x;
            if (count _addons > 0 && {(_addons select 0) == _category}) then {
                // Убедимся, что у звука нет theme (иначе он бы уже попал выше)
                if (_theme == "") then {
                    _sounds pushBack [_name, _class];
                };
            };
        };
    };
} forEach _configs;

diag_log format ["[getSoundsByCategory] category: %1, returning %2 sounds", _category,  _sounds];

_sounds