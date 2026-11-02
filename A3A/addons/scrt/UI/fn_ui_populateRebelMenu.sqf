#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

menuSliderArray = [
    [localize "STR_commander_menu_game_options_header_upper", A3A_IDC_REBEL_MENU_OPTIONS_TAB],
    [localize "STR_commander_menu_game_info_header_upper", A3A_IDC_REBEL_MENU_GAME_INFO_TAB]
];

if (areRivalsDiscovered) then {
    private _rivTitle = format [(localize "STR_antistasi_rivals_tab_header"), (toUpper (A3A_faction_riv get "name"))];

   menuSliderArray = [
        [_rivTitle, A3A_IDC_MENU_RIVALS_TAB],
        [localize "STR_commander_menu_game_options_header_upper", A3A_IDC_REBEL_MENU_OPTIONS_TAB],
        [localize "STR_commander_menu_game_info_header_upper", A3A_IDC_REBEL_MENU_GAME_INFO_TAB]
    ];
    ctrlSetText [A3A_IDC_MENU_TAB_SELECTOR_TITLE, _rivTitle];
};

menuSliderCurrent = 0;

ctrlSetFocus ((findDisplay A3A_IDD_REBEL_MENU) displayCtrl A3A_IDC_MENU_TAB_SELECTOR_RIGHT_BUTTON);

if (areRivalsDiscovered) then {
    private _knownLocationsCount = count (["KNOWN"] call SCRT_fnc_rivals_getLocations);

	ctrlSetText [A3A_IDC_MENU_RIVALS_TOTAL_LOCATIONS_TEXT, format [(localize "STR_antistasi_rivals_total_locations_label"), (count rivalsLocationsMap)]];
	ctrlSetText [A3A_IDC_MENU_RIVALS_KNOWN_LOCATIONS_TEXT, format [(localize "STR_antistasi_rivals_attackable_locations_label"), _knownLocationsCount]];

	ctrlSetText [A3A_IDC_MENU_RIVALS_DESCRIPTION_TITLE, format [(localize "STR_antistasi_rivals_network_header"), A3A_faction_riv get "name"]];
	ctrlSetText [A3A_IDC_MENU_RIVALS_DESCRIPTION_TEXT, format [(localize "STR_antistasi_rivals_network_description"), A3A_faction_riv get "name"]];

	((findDisplay A3A_IDD_REBEL_MENU) displayCtrl A3A_IDC_MENU_RIVALS_PROGRESS_BAR) progressSetPosition (nextRivalsLocationReveal / 100);
	((findDisplay A3A_IDD_REBEL_MENU) displayCtrl A3A_IDC_MENU_RIVALS_PROGRESS_BAR) ctrlSetTooltip format [(localize "STR_antistasi_rivals_network_progress_bar_tooltip"), A3A_faction_riv get "name"];

    ctrlSetText [A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON, format [(localize "STR_antistasi_rivals_show_activity_title"), A3A_faction_riv get "name"]];
    ((findDisplay A3A_IDD_REBEL_MENU) displayCtrl A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON) ctrlSetTooltip format [(localize "STR_antistasi_rivals_show_activity_tooltip"), A3A_faction_riv get "name"];
};

{	
	if (ctrlIDC _x != A3A_IDC_MENU_MESSAGEBOX_TITLE && {ctrlIDC _x != A3A_IDC_MENU_MESSAGEBOX_TEXT}) then {
		((findDisplay A3A_IDD_REBEL_MENU) displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	((findDisplay A3A_IDD_REBEL_MENU) displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay A3A_IDD_REBEL_MENU);

["MAIN", A3A_IDC_MENU_MUSIC_SWITCH_BUTTON, false] call SCRT_fnc_ui_switchButton;
["MAIN", A3A_IDC_MENU_PARADROP_SWITCH_BUTTON, false] call SCRT_fnc_ui_switchButton;

private _gameInfoText = format [
    localize "STR_commander_menu_about_text", 
	worldName,
    QUOTE(VERSION_FULL),
    minWeaps,
    [localize "STR_antistasi_dialogs_generic_button_no_text", localize "STR_antistasi_dialogs_generic_button_yes_text"] select limitedFT,
	([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
];

ctrlSetText [A3A_IDC_REBEL_MENU_GAME_INFO_DESCRIPTION_TEXT, _gameInfoText];

if (isServer || {(call BIS_fnc_admin) isEqualTo 2}) then {
    ctrlShow [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, true];
	ctrlEnable [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, true];
	(_display displayCtrl A3A_IDC_MENU_EDIT_PARAMS_BUTTON) ctrlSetTooltip (localize "STR_commander_menu_edit_params_button_tooltip");
} else {
    ctrlShow [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, false];
	ctrlEnable [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, false];
	(_display displayCtrl A3A_IDC_MENU_EDIT_PARAMS_BUTTON) ctrlSetTooltip (localize "STR_generic_admin_only");
};

if (player distance2D (getMarkerPos "Synd_HQ") > 50) then {
    ctrlShow [A3A_IDC_MENU_SAVE_GAME_BUTTON, false];
};

// Hide "toggle teardown mode" button
if !([player] call FUNCMAIN(isEngineer)) then {
    ctrlShow[A3A_IDC_MENU_TEARDOWN_MODE_BUTTON, false];
    ctrlEnable[A3A_IDC_MENU_TEARDOWN_MODE_BUTTON, false];
};

[A3A_IDD_REBEL_MENU,'RIGHT'] spawn SCRT_fnc_ui_changeTab;
[A3A_IDD_REBEL_MENU,'RIGHT'] spawn SCRT_fnc_ui_changeTab;
[A3A_IDD_REBEL_MENU,'RIGHT'] spawn SCRT_fnc_ui_changeTab;