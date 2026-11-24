["disbandGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["establishOutpost", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["minefieldMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["recruitGarrison", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
["ADD"] call SCRT_fnc_ui_recruitGarrisonEventHandler;

[
    localize "STR_notifiers_info_type",
    localize "STR_antistasi_journal_entry_header_AI_1",  
    parseText (localize "STR_notifiers_friendly_outpost_recruit"), 
    60
] spawn SCRT_fnc_ui_showMessage;
