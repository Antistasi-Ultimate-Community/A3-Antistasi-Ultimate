#define SKILL_CAP 40

#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _fnc_checkIfAppropriateLocation = {
	if (theBoss distance2D (getMarkerPos "Synd_HQ") < 50) exitWith {true};
	if (!isNil "traderMarker" && {theBoss distance2D (getMarkerPos traderMarker) < 50}) exitWith {true};
	false;
};

private _hqMarkerPos = getMarkerPos "Synd_HQ";

if (call _fnc_checkIfAppropriateLocation) then {
	menuSliderArray = [
		[localize "STR_commander_menu_abilities_header_upper", A3A_IDC_COMMANDER_MENU_SUPPORT_TAB],
		[localize "STR_commander_menu_garrison_header_upper", A3A_IDC_COMMANDER_MENU_GARRISON_TAB],
		[format [localize "STR_commander_menu_hq_header_upper", (toUpper (A3A_faction_reb get "name"))], A3A_IDC_COMMANDER_MENU_HQ_TAB],
		[localize "STR_commander_menu_environment_header_upper", A3A_IDC_COMMANDER_MENU_ENVIRONMENT_TAB],
		[localize "STR_commander_menu_game_options_header_upper", A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_TAB],
		[localize "STR_commander_menu_game_info_header_upper", A3A_IDC_COMMANDER_MENU_GAME_INFO_TAB]
	];

	if (areRivalsDiscovered) then {
		//memory effiency cries in the corner, but who cares
		private _firstPart = +menuSliderArray;
		_firstPart resize 3;

		private _secondPart = +menuSliderArray;
		reverse _secondPart;
		_secondPart resize 3;
		reverse _secondPart;

		menuSliderArray = _firstPart + [[format [(localize "STR_antistasi_rivals_tab_header"), (toUpper (A3A_faction_riv get "name"))], A3A_IDC_MENU_RIVALS_TAB]] + _secondPart;
	};
} else {
	menuSliderArray = [
		[localize "STR_commander_menu_abilities_header_upper", A3A_IDC_COMMANDER_MENU_SUPPORT_TAB],
		[localize "STR_commander_menu_garrison_header_upper", A3A_IDC_COMMANDER_MENU_GARRISON_TAB],
		[localize "STR_commander_menu_game_options_header_upper", A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_TAB]
	];

	[
		localize "STR_notifiers_info_type",
		localize "STR_commander_menu_options_header",  
		parseText (localize "STR_commander_menu_options_some_tabs"), 
		10
	] spawn SCRT_fnc_ui_showMessage;
};

menuSliderCurrent = 0;

private _display = findDisplay A3A_IDD_COMMANDER_MENU;

ctrlSetFocus (_display displayCtrl A3A_IDC_MENU_TAB_SELECTOR_RIGHT_BUTTON);

if (areRivalsDiscovered && {!areRivalsDefeated}) then {
	private _knownLocationsCount = count (["KNOWN"] call SCRT_fnc_rivals_getLocations);

	ctrlSetText [A3A_IDC_MENU_RIVALS_TOTAL_LOCATIONS_TEXT, format [(localize "STR_antistasi_rivals_total_locations_label"), (count rivalsLocationsMap)]];
	ctrlSetText [A3A_IDC_MENU_RIVALS_KNOWN_LOCATIONS_TEXT, format [(localize "STR_antistasi_rivals_attackable_locations_label"), _knownLocationsCount]];
	ctrlSetText [A3A_IDC_MENU_RIVALS_DESCRIPTION_TITLE, format [(localize "STR_antistasi_rivals_network_header"), A3A_faction_riv get "name"]];
	ctrlSetText [A3A_IDC_MENU_RIVALS_DESCRIPTION_TEXT, format [(localize "STR_antistasi_rivals_network_description"), A3A_faction_riv get "name"]];

	(_display displayCtrl A3A_IDC_MENU_RIVALS_PROGRESS_BAR) progressSetPosition (nextRivalsLocationReveal / 100);
	(_display displayCtrl A3A_IDC_MENU_RIVALS_PROGRESS_BAR) ctrlSetTooltip format [(localize "STR_antistasi_rivals_network_progress_bar_tooltip"), A3A_faction_riv get "name"];

	if (_knownLocationsCount > 0) then {
		(_display displayCtrl A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON) ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376]), (profilenamespace getvariable ['GUI_BCG_RGB_G',0.125]), (profilenamespace getvariable ['GUI_BCG_RGB_B',0.043]), 1];
        ctrlSetText [A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON, localize "STR_antistasi_rivals_show_activity_attack_title"];
    } else {
        ctrlSetText [A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON, format [(localize "STR_antistasi_rivals_show_activity_title"), A3A_faction_riv get "name"]];
    };
    (_display displayCtrl A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON) ctrlSetTooltip format [(localize "STR_antistasi_rivals_show_activity_commander_tooltip"), A3A_faction_riv get "name"];
};

supportType = "SMOKE";
outpostType = "WATCHPOST";
minefieldType = "APERSMine";

//Support Combobox 
lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_smoke_barrage_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 0, "SMOKE"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 0, localize "STR_commander_menu_smoke_barrage_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_flare_barrage_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 1, "FLARE"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 1, localize "STR_commander_menu_flare_barrage_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_lva_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 2, "VEH_AIRDROP"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 2, localize "STR_commander_menu_lva_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_rpr_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 3, "RECON"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 3, localize "STR_commander_menu_rpr_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_sca_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 4, "SUPPLY"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 4, localize "STR_commander_menu_sca_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_hba_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 5, "HE"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 5, localize "STR_commander_menu_hba_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_cba_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 6, "CLUSTER"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 6, localize "STR_commander_menu_cba_tooltip"];

lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_chemba_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 7, "CHEMICAL"];
lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 7, localize "STR_commander_menu_chemba_tooltip"];

private _hasVn = "VN" isEqualTo ((A3A_Reb_template splitString "_") select 0);

if (napalmEnabled) then { 
	lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_na_title"];
	lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 8, "NAPALM"];
	lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 8, localize "STR_commander_menu_na_tooltip"];

	if (!_hasVn) then {
		lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_paradrop_title"];
		lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, "PARADROP"];
		lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, localize "STR_commander_menu_paradrop_tooltip"];
		 
		if (lootCratesEnabled) then {
			lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 10, "LOOTHELI"];
			lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 10, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	} else {
		if (lootCratesEnabled) then {
			lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, "LOOTHELI"];
			lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	};
} else {
	if (!_hasVn) then {
		lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_paradrop_title"];
		lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 8, "PARADROP"];
		lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 8, localize "STR_commander_menu_paradrop_tooltip"];
		 
		if (lootCratesEnabled) then {
			lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, "LOOTHELI"];
			lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	} else {
		if (lootCratesEnabled) then {
			lbAdd [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 8, "LOOTHELI"];
			lbSetTooltip [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 9, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	};
};

lbSetCurSel [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, 0];

//Create Outpost Combobox 
lbAdd [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, localize "STR_commander_menu_watchpost_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, 0, "WATCHPOST"];
lbAdd [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, localize "STR_commander_menu_roadblock_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, 1, "ROADBLOCK"];
lbAdd [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, localize "STR_commander_menu_hmge_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, 2, "HMG"];
lbAdd [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, localize "STR_commander_menu_aae_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, 3, "AA"];
lbAdd [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, localize "STR_commander_menu_ate_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, 4, "AT"];

lbSetCurSel [A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX, 0];

//Minefield Combobox 
lbAdd [A3A_IDC_COMMANDER_MENU_MINE_TYPE_COMBOBOX, localize "STR_commander_menu_apersminefield_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_MINE_TYPE_COMBOBOX, 0, "APERSMine"];
lbAdd [A3A_IDC_COMMANDER_MENU_MINE_TYPE_COMBOBOX, localize "STR_commander_menu_atminefield_title"];
lbSetData [A3A_IDC_COMMANDER_MENU_MINE_TYPE_COMBOBOX, 1, "ATMine"];

lbSetCurSel [A3A_IDC_COMMANDER_MENU_MINE_TYPE_COMBOBOX, 0];

{	
	if (!(ctrlIDC _x in [A3A_IDC_MENU_MESSAGEBOX_TITLE, A3A_IDC_MENU_MESSAGEBOX_TEXT, A3A_IDC_COMMANDER_MENU_GAME_INFO_REROLL_TRADER_BUTTON])) then {
		(_display displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	(_display displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay A3A_IDD_COMMANDER_MENU);

["MAIN", A3A_IDC_MENU_MUSIC_SWITCH_BUTTON, false] call SCRT_fnc_ui_switchButton;
["MAIN", A3A_IDC_MENU_PARADROP_SWITCH_BUTTON, false] call SCRT_fnc_ui_switchButton;
["MAIN", A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_BUTTON, false] call SCRT_fnc_ui_switchButton;

// fog
sliderSetRange [A3A_IDC_COMMANDER_MENU_ENVIRONMENT_FOG_SLIDER, 0, 100];
sliderSetPosition [A3A_IDC_COMMANDER_MENU_ENVIRONMENT_FOG_SLIDER, 50];
(_display displayCtrl A3A_IDC_COMMANDER_MENU_ENVIRONMENT_FOG_SLIDER) ctrlSetText format [localize "STR_commander_menu_fog_title", 50];
fogValue = nil;

// weather
sliderSetRange [A3A_IDC_COMMANDER_MENU_ENVIRONMENT_OVERCAST_SLIDER, 0, 100];
sliderSetPosition [A3A_IDC_COMMANDER_MENU_ENVIRONMENT_OVERCAST_SLIDER, 50];
(_display displayCtrl A3A_IDC_COMMANDER_MENU_ENVIRONMENT_OVERCAST_SLIDER) ctrlSetText format [localize "STR_commander_menu_overcast_title", 50];
overcastValue = nil;

private _gameInfoText = format [
    localize "STR_commander_menu_about_text", 
	worldName,
    QUOTE(VERSION_FULL),
    minWeaps,
    (getArray (configFile >> "A3A" >> "Params" >> "limitedFT" >> "texts")) select limitedFT,
	([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
];

ctrlSetText [A3A_IDC_COMMANDER_MENU_GAME_INFO_DESCRIPTION_TEXT, _gameInfoText];
ctrlSetText [A3A_IDC_COMMANDER_MENU_GAME_INFO_SERVER_MEMBERS_TEXT, ([] call A3A_fnc_membersList)];

private _fiaTrainingText = format [localize "STR_commander_menu_skill_level_title", A3A_faction_reb get "name", skillFIA, SKILL_CAP];
ctrlSetText [A3A_IDC_COMMANDER_MENU_HQ_REBEL_SKILL_TITLE, _fiaTrainingText];

//showing reroll button if task was completed
if (!isTraderQuestCompleted) then {
	ctrlShow [A3A_IDC_COMMANDER_MENU_GAME_INFO_REROLL_TRADER_BUTTON, false];
};


if (isServer || {(call BIS_fnc_admin) isEqualTo 2}) then {
	ctrlShow [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, true];
	ctrlEnable [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, true];
	(_display displayCtrl A3A_IDC_MENU_EDIT_PARAMS_BUTTON) ctrlSetTooltip (localize "STR_commander_menu_edit_params_button_tooltip");
} else {
	ctrlShow [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, true];
	ctrlEnable [A3A_IDC_MENU_EDIT_PARAMS_BUTTON, false];
	(_display displayCtrl A3A_IDC_MENU_EDIT_PARAMS_BUTTON) ctrlSetTooltip (localize "STR_generic_admin_only");
};

if (player distance2D (getMarkerPos "Synd_HQ") > 50) then {
    ctrlShow [A3A_IDC_MENU_SAVE_GAME_BUTTON, false];
};

if (!("outpostTask" in A3A_activeTasks)) then {
	ctrlShow [A3A_IDC_COMMANDER_MENU_GARRISON_CANCEL_TASK_BUTTON, false];
};

[] call SCRT_fnc_ui_updateSupportMenu;
["ADD"] call SCRT_fnc_ui_manageSupportTabEventHandler;