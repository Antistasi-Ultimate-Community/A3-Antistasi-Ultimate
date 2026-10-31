#define COST 5000

["hqMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_hqTabEventHandler;

[
    localize "STR_notifiers_info_type",
    localize "STR_notifiers_rebuild_assets_header",  
    parseText format [(localize "STR_notifiers_rebuild_assets_info"), str COST, A3A_faction_civ get "currencySymbol"], 
    60
] spawn SCRT_fnc_ui_showMessage;
