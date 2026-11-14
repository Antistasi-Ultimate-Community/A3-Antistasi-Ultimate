private _moneyCost = outpostCost select 0;
private _hrCost = outpostCost select 1;

private _resourcesFIA = server getVariable "resourcesFIA";
private _hrFIA = server getVariable "hr";

if ((_resourcesFIA < _moneyCost) or {_hrFIA < _hrCost}) exitWith {
	[
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_trader_establish_outpost_header",  
        parseText format [localize "STR_notifiers_establish_outpost_not_enough", _hrCost, _moneyCost, A3A_faction_civ get "currencySymbol"], 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if ("outpostTask" in A3A_activeTasks) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_trader_establish_outpost_header",  
        parseText (localize "STR_notifiers_establish_outpost_only_one"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_trader_establish_outpost_header",  
        parseText (localize "STR_notifiers_establish_need_radio"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (outpostType in ["ROADBLOCK", "HMG"] && {tierWar < 3}) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_trader_establish_outpost_header",  
        parseText (localize "STR_notifiers_establish_wl3"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

if (outpostType in ["AA", "AT"] && {tierWar < 4}) exitWith {
    [
        localize "STR_notifiers_fail_type",
        localize "STR_notifiers_trader_establish_outpost_header",  
        parseText (localize "STR_notifiers_establish_wl4"), 
        15
    ] spawn SCRT_fnc_ui_showMessage;
};

["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_establishOutpostEventHandler;

[
    localize "STR_notifiers_info_type",
    localize "STR_notifiers_trader_establish_outpost_header",  
    parseText (localize "STR_notifiers_establish_success"), 
    60
] spawn SCRT_fnc_ui_showMessage;
