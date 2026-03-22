#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

menuSliderArray = [
	[localize "STR_commander_menu_game_options_header_upper", 5000],
	[localize "STR_commander_menu_game_info_header_upper", 6000]
];

menuSliderCurrent = 0;

private _display = findDisplay 60000;

ctrlSetFocus (_display displayCtrl 1151);

(_display displayCtrl 1050) ctrlSetText (localize"STR_options_header");

{	
	if (!(ctrlIDC _x in [1055, 1056, 1140, 1700, 1701, 1750, 1751, 1702, 1703, 1704, 1710, 1711, 1712])) then {
		(_display displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	(_display displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay 60000);

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

(_display displayCtrl 6011) ctrlSetText _gameInfoText;
(_display displayCtrl 6013) ctrlSetText ([] call A3A_fnc_membersList);


private _fiaTrainingText = format [localize "STR_commander_menu_skill_level_title", A3A_faction_reb get "name", skillFIA];
(_display displayCtrl 3102) ctrlSetText _fiaTrainingText;

//hiding reroll button if conditions are not met
if (!isTraderQuestCompleted) then {
	(_display displayCtrl 6014) ctrlShow false;
};

// Hide "toggle teardown mode" button
if !([player] call FUNCMAIN(isEngineer)) then {
    ctrlShow[5190, false];
    ctrlEnable[5190, false];
};

//Support menu is always first tab, the only workaround at the moment
[60000,'LEFT'] spawn SCRT_fnc_ui_changeTab;
sleep 0.1;
[60000,'LEFT'] spawn SCRT_fnc_ui_changeTab;