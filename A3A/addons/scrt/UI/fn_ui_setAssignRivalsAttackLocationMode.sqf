if ("RIV_ATT" in A3A_activeTasks) exitWith {
    [
        localize "STR_notifiers_fail_type",
        (localize "STR_antistasi_rivals_destroy_hideoutcell_header"),  
        parseText (localize "STR_antistasi_rivals_destroy_hideoutcell_onetask_text"), 
        10
    ] spawn SCRT_fnc_ui_showMessage;
};

if ("DEF_HQ" in A3A_activeTasks) exitWith {
    [
        localize "STR_notifiers_fail_type",
        (localize "STR_antistasi_rivals_destroy_hideoutcell_header"),  
        parseText (localize "STR_antistasi_rivals_destroy_hideoutcell_defhq_text"), 
        10
    ] spawn SCRT_fnc_ui_showMessage;
};

if ("invaderPunish" in A3A_activeTasks) exitWith {
    [
        localize "STR_notifiers_fail_type",
        (localize "STR_antistasi_rivals_destroy_hideoutcell_header"),  
        parseText (format [localize "STR_antistasi_rivals_destroy_hideoutcell_nobigattack_text", A3A_faction_riv get "name"]),
        10
    ] spawn SCRT_fnc_ui_showMessage;
};

if (bigAttackInProgress) exitWith {
    [
        localize "STR_notifiers_fail_type",
        (localize "STR_antistasi_rivals_destroy_hideoutcell_header"),  
        parseText (format [localize "STR_antistasi_rivals_destroy_hideoutcell_nobigattack_text", A3A_faction_riv get "name"]),
        10
    ] spawn SCRT_fnc_ui_showMessage;
};

private _locationsCount = count ([] call SCRT_fnc_rivals_getLocations);
if (_locationsCount == 0) exitWith {
	[
        localize "STR_notifiers_fail_type",
        (localize "STR_antistasi_rivals_destroy_hideoutcell_header"),  
        parseText (localize "STR_antistasi_rivals_destroy_hideoutcell_notargets_text"), 
        10
    ] spawn SCRT_fnc_ui_showMessage;
};

[] call SCRT_fnc_ui_showRivalsActivity;
["ADD"] call SCRT_fnc_ui_assignRivalsAttackLocationEventHandler;

[
    localize "STR_notifiers_info_type",
    (localize "STR_antistasi_rivals_destroy_hideoutcell_header"),  
    parseText (localize "STR_antistasi_rivals_destroy_hideoutcell_start_text"), 
    60
] spawn SCRT_fnc_ui_showMessage;
