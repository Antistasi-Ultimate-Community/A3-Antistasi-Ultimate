private _moneyCost = minefieldCost select 0;
private _hrCost = minefieldCost select 1;

private _resourcesFIA = server getVariable "resourcesFIA";
private _hrFIA = server getVariable "hr";
private _mineQuantity = minefieldCost select 2;

if ((_resourcesFIA < _moneyCost) or (_hrFIA < _hrCost)) exitWith {
	[
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_minefield_header",  
        parseText format [localize "STR_notifiers_minefield_enough_resources", _hrCost, _moneyCost, A3A_faction_civ get "currencySymbol"], 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};
if ("Mines" in A3A_activeTasks) exitWith {
	[
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_minefield_header",  
        parseText (localize "STR_notifiers_minefield_only_one"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_minefield_header",  
        parseText (localize "STR_notifiers_minefield_need_radio"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (_mineQuantity < 5 && {_mineQuantity isNotEqualTo -1}) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_minefield_header",  
        parseText (localize "STR_notifiers_minefield_need_mines"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_minefieldEventHandler;

[
    localize "STR_notifiers_info_type",
    localize "STR_notifiers_minefield_header",
    parseText (localize "STR_notifiers_minefield_click"), 
    60
] spawn SCRT_fnc_ui_showMessage;
