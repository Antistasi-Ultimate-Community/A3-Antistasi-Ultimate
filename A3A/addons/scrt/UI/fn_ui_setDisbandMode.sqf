["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_disbandGarrisonEventHandler;

[
    localize "STR_notifiers_info_type",
    localize "STR_notifiers_disband_header",  
    parseText (localize "STR_notifiers_disband_tip"), 
    60
] spawn SCRT_fnc_ui_showMessage;
