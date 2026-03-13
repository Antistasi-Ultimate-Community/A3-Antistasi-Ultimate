#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

menuSliderArray = [
    [localize "STR_commander_menu_game_options_header_upper", 1140],
    [localize "STR_commander_menu_game_info_header_upper", 2000]
];

if (areRivalsDiscovered) then {
    private _rivTitle = format [(localize "STR_antistasi_rivals_tab_header"), (toUpper (A3A_faction_riv get "name"))];

   menuSliderArray = [
        [_rivTitle, 7000],
        [localize "STR_commander_menu_game_options_header_upper", 1140],
        [localize "STR_commander_menu_game_info_header_upper", 2000]
    ];
    ((findDisplay 70000) displayCtrl 1101) ctrlSetText _rivTitle;
};

menuSliderCurrent = 0;

ctrlSetFocus ((findDisplay 70000) displayCtrl 1151);

if (areRivalsDiscovered) then {
    private _knownLocationsCount = count (["KNOWN"] call SCRT_fnc_rivals_getLocations);

	((findDisplay 70000) displayCtrl 7703) ctrlSetText format [(localize "STR_antistasi_rivals_total_locations_label"), (count rivalsLocationsMap)];
	((findDisplay 70000) displayCtrl 7704) ctrlSetText format [(localize "STR_antistasi_rivals_attackable_locations_label"), _knownLocationsCount];

	((findDisplay 70000) displayCtrl 7700) ctrlSetText format [(localize "STR_antistasi_rivals_network_header"), A3A_faction_riv get "name"];
	((findDisplay 70000) displayCtrl 7701) ctrlSetText format [(localize "STR_antistasi_rivals_network_description"), A3A_faction_riv get "name"];

	((findDisplay 70000) displayCtrl 7750) progressSetPosition (nextRivalsLocationReveal / 100);
	((findDisplay 70000) displayCtrl 7750) ctrlSetTooltip format [(localize "STR_antistasi_rivals_network_progress_bar_tooltip"), A3A_faction_riv get "name"];

    ((findDisplay 70000) displayCtrl 7762) ctrlSetText format [(localize "STR_antistasi_rivals_show_activity_title"), A3A_faction_riv get "name"];
    ((findDisplay 70000) displayCtrl 7762) ctrlSetTooltip format [(localize "STR_antistasi_rivals_show_activity_tooltip"), A3A_faction_riv get "name"];
};

{	
	if (ctrlIDC _x != 1055 && {ctrlIDC _x != 1056}) then {
		((findDisplay 70000) displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	((findDisplay 70000) displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay 70000);

["MAIN", 5100, false] call SCRT_fnc_ui_switchButton;
["MAIN", 5400, false] call SCRT_fnc_ui_switchButton;

private _gameInfoText = format [
    localize "STR_commander_menu_about_text", 
	worldName,
    QUOTE(VERSION_FULL),
    minWeaps,
    [localize "STR_antistasi_dialogs_generic_button_no_text", localize "STR_antistasi_dialogs_generic_button_yes_text"] select limitedFT,
    [localize "STR_antistasi_dialogs_generic_button_no_text", localize "STR_antistasi_dialogs_generic_button_yes_text"] select areRivalsEnabled,
	([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
];

((findDisplay 70000) displayCtrl 2011) ctrlSetText _gameInfoText;

if (isServer || {(call BIS_fnc_admin) isEqualTo 2}) then {
    ctrlShow [5200, true];
	ctrlEnable [5200, true];
	(_display displayCtrl 5200) ctrlSetTooltip (localize "STR_commander_menu_edit_params_button_tooltip");
} else {
    ctrlShow [5200, false];
	ctrlEnable [5200, false];
	(_display displayCtrl 5200) ctrlSetTooltip (localize "STR_generic_admin_only");
};

if (player distance2D (getMarkerPos "Synd_HQ") > 50) then {
    ((findDisplay 70000) displayCtrl 5300) ctrlShow false;
};

// Hide "toggle teardown mode" button
if !([player] call FUNCMAIN(isEngineer)) then {
    ctrlShow[5190, false];
    ctrlEnable[5190, false];
};

[70000,'RIGHT'] spawn SCRT_fnc_ui_changeTab;
[70000,'RIGHT'] spawn SCRT_fnc_ui_changeTab;
[70000,'RIGHT'] spawn SCRT_fnc_ui_changeTab;