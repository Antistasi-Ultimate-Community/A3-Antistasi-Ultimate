#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

menuSliderArray = [
	[localize "STR_commander_menu_game_options_header_upper", A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_TAB],
	[localize "STR_commander_menu_game_info_header_upper", A3A_IDC_COMMANDER_MENU_GAME_INFO_TAB]
];

menuSliderCurrent = 0;

private _display = findDisplay A3A_IDD_COMMANDER_MENU;

ctrlSetFocus (_display displayCtrl A3A_IDC_MENU_TAB_SELECTOR_RIGHT_BUTTON);

ctrlSetText [A3A_IDC_MENU_TITLE, localize"STR_options_header"];
	
{	
	if (!(ctrlIDC _x in [A3A_IDC_MENU_MESSAGEBOX_TITLE, A3A_IDC_MENU_MESSAGEBOX_TEXT, A3A_IDC_COMMANDER_MENU_SUPPORT_TAB, A3A_IDC_COMMANDER_MENU_SUPPORT_DESCRIPTION_TITLE, A3A_IDC_COMMANDER_MENU_SUPPORT_DESCRIPTION_TEXT, A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, A3A_IDC_COMMANDER_MENU_SUPPORT_COSTS_TEXT, A3A_IDC_COMMANDER_MENU_SUPPORT_POINTS_TEXT, A3A_IDC_COMMANDER_MENU_SUPPORT_AIRSTRIKE_POINTS_TEXT, A3A_IDC_COMMANDER_MENU_SUPPORT_CAPTURED_AIRPORTS_TEXT, A3A_IDC_COMMANDER_MENU_SUPPORT_FOOTER, A3A_IDC_COMMANDER_MENU_SUPPORT_RESET_BUTTON, A3A_IDC_COMMANDER_MENU_SUPPORT_LAUNCH_BUTTON])) then {
		(_display displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	(_display displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay A3A_IDD_COMMANDER_MENU);

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

ctrlSetText [A3A_IDC_COMMANDER_MENU_GAME_INFO_DESCRIPTION_TEXT, _gameInfoText];
ctrlSetText [A3A_IDC_COMMANDER_MENU_GAME_INFO_SERVER_MEMBERS_TEXT, ([] call A3A_fnc_membersList)];


private _fiaTrainingText = format [localize "STR_commander_menu_skill_level_title", A3A_faction_reb get "name", skillFIA];
ctrlSetText [A3A_IDC_COMMANDER_MENU_HQ_REBEL_SKILL_TITLE, _fiaTrainingText];

//hiding reroll button if conditions are not met
if (!isTraderQuestCompleted) then {
	ctrlShow [A3A_IDC_COMMANDER_MENU_GAME_INFO_REROLL_TRADER_BUTTON, false];
};

// Hide "toggle teardown mode" button
if !([player] call FUNCMAIN(isEngineer)) then {
    ctrlShow [A3A_IDC_MENU_TEARDOWN_MODE_BUTTON, false];
    ctrlEnable [A3A_IDC_MENU_TEARDOWN_MODE_BUTTON, false];
};

//Support menu is always first tab, the only workaround at the moment
[A3A_IDD_COMMANDER_MENU,'LEFT'] spawn SCRT_fnc_ui_changeTab;
sleep 0.1;
[A3A_IDD_COMMANDER_MENU,'LEFT'] spawn SCRT_fnc_ui_changeTab;