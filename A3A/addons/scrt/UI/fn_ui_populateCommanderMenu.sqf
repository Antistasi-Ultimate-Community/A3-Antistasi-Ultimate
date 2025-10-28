#define SKILL_CAP 40

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
		[localize "STR_commander_menu_abilities_header_upper", 1140],
		[localize "STR_commander_menu_garrison_header_upper", 2000],
		[format [localize "STR_commander_menu_hq_header_upper", (toUpper (A3A_faction_reb get "name"))], 3000],
		[localize "STR_commander_menu_environment_header_upper", 4000],
		[localize "STR_commander_menu_game_options_header_upper", 5000],
		[localize "STR_commander_menu_game_info_header_upper", 6000]
	];

	if (areRivalsDiscovered) then {
		//memory effiency cries in the corner, but who cares
		private _firstPart = +menuSliderArray;
		_firstPart resize 3;

		private _secondPart = +menuSliderArray;
		reverse _secondPart;
		_secondPart resize 3;
		reverse _secondPart;

		menuSliderArray = _firstPart + [[format [(localize "STR_antistasi_rivals_tab_header"), (toUpper (A3A_faction_riv get "name"))], 7000]] + _secondPart;
	};
} else {
	menuSliderArray = [
		[localize "STR_commander_menu_abilities_header_upper", 1140],
		[localize "STR_commander_menu_garrison_header_upper", 2000],
		[localize "STR_commander_menu_game_options_header_upper", 5000]
	];

	[
		localize "STR_notifiers_info_type",
		localize "STR_commander_menu_options_header",  
		parseText (localize "STR_commander_menu_options_some_tabs"), 
		10
	] spawn SCRT_fnc_ui_showMessage;
};

menuSliderCurrent = 0;

private _display = findDisplay 60000;

ctrlSetFocus (_display displayCtrl 1151);

if (areRivalsDiscovered && {!areRivalsDefeated}) then {
	private _knownLocationsCount = count (["KNOWN"] call SCRT_fnc_rivals_getLocations);

	(_display displayCtrl 7703) ctrlSetText format [(localize "STR_antistasi_rivals_total_locations_label"), (count rivalsLocationsMap)];
	(_display displayCtrl 7704) ctrlSetText format [(localize "STR_antistasi_rivals_attackable_locations_label"), _knownLocationsCount];
	(_display displayCtrl 7700) ctrlSetText format [(localize "STR_antistasi_rivals_network_header"), A3A_faction_riv get "name"];
	(_display displayCtrl 7701) ctrlSetText format [(localize "STR_antistasi_rivals_network_description"), A3A_faction_riv get "name"];

	(_display displayCtrl 7750) progressSetPosition (nextRivalsLocationReveal / 100);
	(_display displayCtrl 7750) ctrlSetTooltip format [(localize "STR_antistasi_rivals_network_progress_bar_tooltip"), A3A_faction_riv get "name"];

	if (_knownLocationsCount > 0) then {
		(_display displayCtrl 7762) ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376]), (profilenamespace getvariable ['GUI_BCG_RGB_G',0.125]), (profilenamespace getvariable ['GUI_BCG_RGB_B',0.043]), 1];
        (_display displayCtrl 7762) ctrlSetText (localize "STR_antistasi_rivals_show_activity_attack_title");
    } else {
        (_display displayCtrl 7762) ctrlSetText format [(localize "STR_antistasi_rivals_show_activity_title"), A3A_faction_riv get "name"];
    };
    (_display displayCtrl 7762) ctrlSetTooltip format [(localize "STR_antistasi_rivals_show_activity_commander_tooltip"), A3A_faction_riv get "name"];
};

supportType = "SMOKE";
outpostType = "WATCHPOST";
minefieldType = "APERSMine";

//Support Combobox 
lbAdd [1750, localize "STR_commander_menu_smoke_barrage_title"];
lbSetData [1750, 0, "SMOKE"];
lbSetTooltip [1750, 0, localize "STR_commander_menu_smoke_barrage_tooltip"];

lbAdd [1750, localize "STR_commander_menu_flare_barrage_title"];
lbSetData [1750, 1, "FLARE"];
lbSetTooltip [1750, 1, localize "STR_commander_menu_flare_barrage_tooltip"];

lbAdd [1750, localize "STR_commander_menu_lva_title"];
lbSetData [1750, 2, "VEH_AIRDROP"];
lbSetTooltip [1750, 2, localize "STR_commander_menu_lva_tooltip"];

lbAdd [1750, localize "STR_commander_menu_rpr_title"];
lbSetData [1750, 3, "RECON"];
lbSetTooltip [1750, 3, localize "STR_commander_menu_rpr_tooltip"];

lbAdd [1750, localize "STR_commander_menu_sca_title"];
lbSetData [1750, 4, "SUPPLY"];
lbSetTooltip [1750, 4, localize "STR_commander_menu_sca_tooltip"];

lbAdd [1750, localize "STR_commander_menu_hba_title"];
lbSetData [1750, 5, "HE"];
lbSetTooltip [1750, 5, localize "STR_commander_menu_hba_tooltip"];

lbAdd [1750, localize "STR_commander_menu_cba_title"];
lbSetData [1750, 6, "CLUSTER"];
lbSetTooltip [1750, 6, localize "STR_commander_menu_cba_tooltip"];

lbAdd [1750, localize "STR_commander_menu_chemba_title"];
lbSetData [1750, 7, "CHEMICAL"];
lbSetTooltip [1750, 7, localize "STR_commander_menu_chemba_tooltip"];

private _hasVn = "VN" isEqualTo ((A3A_Reb_template splitString "_") select 0);

if (napalmEnabled) then { 
	lbAdd [1750, localize "STR_commander_menu_na_title"];
	lbSetData [1750, 8, "NAPALM"];
	lbSetTooltip [1750, 8, localize "STR_commander_menu_na_tooltip"];

	if (!_hasVn) then {
		lbAdd [1750, localize "STR_commander_menu_paradrop_title"];
		lbSetData [1750, 9, "PARADROP"];
		lbSetTooltip [1750, 9, localize "STR_commander_menu_paradrop_tooltip"];
		 
		if (lootCratesEnabled) then {
			lbAdd [1750, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [1750, 10, "LOOTHELI"];
			lbSetTooltip [1750, 10, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	} else {
		if (lootCratesEnabled) then {
			lbAdd [1750, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [1750, 9, "LOOTHELI"];
			lbSetTooltip [1750, 9, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	};
} else {
	if (!_hasVn) then {
		lbAdd [1750, localize "STR_commander_menu_paradrop_title"];
		lbSetData [1750, 8, "PARADROP"];
		lbSetTooltip [1750, 8, localize "STR_commander_menu_paradrop_tooltip"];
		 
		if (lootCratesEnabled) then {
			lbAdd [1750, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [1750, 9, "LOOTHELI"];
			lbSetTooltip [1750, 9, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	} else {
		if (lootCratesEnabled) then {
			lbAdd [1750, localize "STR_commander_menu_loot_heli_title"];
			lbSetData [1750, 8, "LOOTHELI"];
			lbSetTooltip [1750, 98, localize "STR_commander_menu_loot_heli_tooltip"];
		};
	};
};

lbSetCurSel [1750, 0];

//Create Outpost Combobox 
lbAdd [2750, localize "STR_commander_menu_watchpost_title"];
lbSetData [2750, 0, "WATCHPOST"];
lbAdd [2750, localize "STR_commander_menu_roadblock_title"];
lbSetData [2750, 1, "ROADBLOCK"];
lbAdd [2750, localize "STR_commander_menu_hmge_title"];
lbSetData [2750, 2, "HMG"];
lbAdd [2750, localize "STR_commander_menu_aae_title"];
lbSetData [2750, 3, "AA"];
lbAdd [2750, localize "STR_commander_menu_ate_title"];
lbSetData [2750, 4, "AT"];

lbSetCurSel [2750, 0];

//Minefield Combobox 
lbAdd [2758, localize "STR_commander_menu_apersminefield_title"];
lbSetData [2758, 0, "APERSMine"];
lbAdd [2758, localize "STR_commander_menu_atminefield_title"];
lbSetData [2758, 1, "ATMine"];

lbSetCurSel [2758, 0];

{	
	if (!(ctrlIDC _x in [1055, 1056, 6014])) then {
		(_display displayCtrl (ctrlIDC _x)) ctrlSetFade 0;
	};

	(_display displayCtrl (ctrlIDC _x)) ctrlCommit 0.3;	
} forEach (allControls findDisplay 60000);

["MAIN", 5100, false] call SCRT_fnc_ui_switchButton;
["MAIN", 5400, false] call SCRT_fnc_ui_switchButton;
["MAIN", 5500, false] call SCRT_fnc_ui_switchButton;

// fog
sliderSetRange [4041, 0, 100];
sliderSetPosition [4041, 50];
(_display displayCtrl 4041) ctrlSetText format [localize "STR_commander_menu_fog_title", 50];
fogValue = nil;

// weather
sliderSetRange [4061, 0, 100];
sliderSetPosition [4061, 50];
(_display displayCtrl 4061) ctrlSetText format [localize "STR_commander_menu_overcast_title", 50];
overcastValue = nil;

private _gameInfoText = format [
    localize "STR_commander_menu_about_text", 
	worldName,
    QUOTE(VERSION_FULL),
    minWeaps,
    (getArray (configFile >> "A3A" >> "Params" >> "limitedFT" >> "texts")) select limitedFT,
    [localize "STR_antistasi_dialogs_generic_button_no_text", localize "STR_antistasi_dialogs_generic_button_yes_text"] select areRivalsEnabled,
	([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
];

(_display displayCtrl 6011) ctrlSetText _gameInfoText;
(_display displayCtrl 6013) ctrlSetText ([] call A3A_fnc_membersList);

private _fiaTrainingText = format [localize "STR_commander_menu_skill_level_title", A3A_faction_reb get "name", skillFIA, SKILL_CAP];
(_display displayCtrl 3102) ctrlSetText _fiaTrainingText;

//showing reroll button if task was completed
if (!isTraderQuestCompleted) then {
	(_display displayCtrl 6014) ctrlShow false;
};

if (player distance2D (getMarkerPos "Synd_HQ") > 50) then {
    (_display displayCtrl 5300) ctrlShow false;
};

if (!("outpostTask" in A3A_activeTasks)) then {
	(_display displayCtrl 2790) ctrlShow false;
};

[] call SCRT_fnc_ui_updateSupportMenu;
["ADD"] call SCRT_fnc_ui_manageSupportTabEventHandler;