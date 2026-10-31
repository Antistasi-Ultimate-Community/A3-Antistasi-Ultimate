
params ["_table", "_idc"];
_return = [];	
switch (_table) do {
    case "MAIN": {
        switch (_idc) do {
            case 5100: {
                _return pushBack "musicON";
                _return pushBack musicON;
            };
            case 5400: {
                _return pushBack "isPlayerParadropable";
                _return pushBack isPlayerParadropable;
            };
            case 5500: {
                _return pushBack "randomizeRebelLoadoutUniforms";
                _return pushBack randomizeRebelLoadoutUniforms;
            };
        };
        _return pushBack [localize "STR_commander_menu_switch_enabled", localize "STR_commander_menu_switch_disabled"];			
    };
};
_return
