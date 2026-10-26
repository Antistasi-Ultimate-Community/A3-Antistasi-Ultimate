#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_table", "_idc"];
_return = [];	
switch (_table) do {
    case "MAIN": {
        switch (_idc) do {
            case A3A_IDC_MENU_MUSIC_SWITCH_BUTTON: {
                _return pushBack "musicON";
                _return pushBack musicON;
            };
            case A3A_IDC_MENU_PARADROP_SWITCH_BUTTON: {
                _return pushBack "isPlayerParadropable";
                _return pushBack isPlayerParadropable;
            };
            case A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_BUTTON: {
                _return pushBack "randomizeRebelLoadoutUniforms";
                _return pushBack randomizeRebelLoadoutUniforms;
            };
        };
        _return pushBack [localize "STR_commander_menu_switch_enabled", localize "STR_commander_menu_switch_disabled"];			
    };
};
_return