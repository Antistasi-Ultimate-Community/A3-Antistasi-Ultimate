#include "ids.inc"

class rebelMenu 
{
	idd = A3A_IDD_REBEL_MENU;
	movingenable = false;
	onLoad = "['on'] call SCRT_fnc_ui_toggleMenuBlur";
	onUnload = "isMenuOpen = false; closeDialog 0; ['off'] call SCRT_fnc_ui_toggleMenuBlur; [] spawn SCRT_fnc_ui_dispose;";
	
	class Controls 
	{
		class menuTitle: TextBase
		{
			idc = A3A_IDC_MENU_TITLE;
			text = $STR_rebel_menu_header;
			x = "safezoneX + (1 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (4 * pixelGridNoUIScale * pixelH)";	
			w = "24 * pixelGridNoUIScale * pixelW";
			h = "4 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2.5) * 0.5";
			shadow = 2;
		};	

		class background: TextBase 
		{
			idc = A3A_IDC_MENU_BACKGROUND;
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "24 * pixelGridNoUIScale * pixelW";
			h = "safezoneH - (18 * pixelGridNoUIScale * pixelH)";
			colorBackground[] = { 0.1, 0.1, 0.1, 0.6 };
			text = "";
		};

		class messageBoxTitle: TextBase {
			idc = A3A_IDC_MENU_MESSAGEBOX_TITLE;	
			x = "safezoneX + (25 * pixelGridNoUIScale * pixelW)";
			y = "(safezoneY + safezoneH) - (10 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW - (32 * pixelGridNoUIScale * pixelW)";	
			h = "2 * pixelGridNoUIScale * pixelH";
			text = "";
			size = "((pixelH * (pixelGridNoUIScale) * 2) * 3) * 0.5";
		};

		class messageBoxText: TextBase
		{
			idc = A3A_IDC_MENU_MESSAGEBOX_TEXT;
			type = CT_STRUCTURED_TEXT;
			font = "PuristaLight";
			text = "";
			x = "safezoneX + (25 * pixelGridNoUIScale * pixelW)";
			y = "(safezoneY + safezoneH) - (8 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW - (32 * pixelGridNoUIScale * pixelW)";	
			h = "6 * pixelGridNoUIScale * pixelH";
			size = "((pixelH * (pixelGridNoUIScale) * 2) * 1.5) * 0.5";
		};

		class mapContainer: ScrtRscMapControl
		{			
			idc = A3A_IDC_MENU_MAP_CONTAINER;			
			x = "safezoneX + (24 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW";
			h = "safezoneH - (18 * pixelGridNoUIScale * pixelH)";
		};	

		class tabSelectorTitle: headerBase
		{
			idc = A3A_IDC_MENU_TAB_SELECTOR_TITLE;			
			style = ST_CENTER;
			text = $STR_commander_menu_game_options_header_upper;
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "24 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";			
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.5) * 0.5";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
		};		
		
		class tabSelectorLeftButton: ButtonBase
		{			
			idc = A3A_IDC_MENU_TAB_SELECTOR_LEFT_BUTTON;
			text = "<";
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";
			action = QUOTE([ARR_2(A3A_IDD_REBEL_MENU,'LEFT')] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;);
		};

		class tabSelectorRightButton: ButtonBase
		{			
			idc = A3A_IDC_MENU_TAB_SELECTOR_RIGHT_BUTTON;
			text = ">";
			x = "safezoneX + (21.5 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";	
			action = QUOTE([ARR_2(A3A_IDD_REBEL_MENU,'RIGHT')] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;);
		};

		// Rivals
		class RivalsTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_MENU_RIVALS_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			class Controls {
				class hideoutsDescriptionTitle: TextBase
				{
					idc = A3A_IDC_MENU_RIVALS_DESCRIPTION_TITLE;
					text = $STR_antistasi_rivals_network_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class hideoutsDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_MENU_RIVALS_DESCRIPTION_TEXT;			
					text = $STR_antistasi_rivals_network_description;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "11.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class hideoutsProgressBar: ProgressBase
				{
					idc = A3A_IDC_MENU_RIVALS_PROGRESS_BAR;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "13.5 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";	
					tooltip = $STR_antistasi_rivals_network_progress_bar_tooltip;
				};

				class totalLocationsText: TextBase
				{
					idc = A3A_IDC_MENU_RIVALS_TOTAL_LOCATIONS_TEXT;
					text = $STR_antistasi_rivals_total_locations_label;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (30 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class knownLocationsText: TextBase
				{
					idc = A3A_IDC_MENU_RIVALS_KNOWN_LOCATIONS_TEXT;
					text = $STR_antistasi_rivals_attackable_locations_label;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (28 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class showLocationsButton: ButtonBase
				{			
					idc = A3A_IDC_MENU_RIVALS_SHOW_LOCATIONS_BUTTON;
					text = $STR_antistasi_rivals_show_activity_title;
					tooltip = $STR_antistasi_rivals_show_activity_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "34 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_showRivalsActivity";
				};
			};
		};
		
		// Game Options (Client)
		class OptionsLiteTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_REBEL_MENU_OPTIONS_TAB;			
			x = safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";

			class Controls 
			{
				class clientOptionsDescriptionTitle: TextBase
				{
					idc = A3A_IDC_REBEL_MENU_CLIENT_OPTIONS_DESCRIPTION_TITLE;
					text = $STR_commander_menu_local_options_title;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class clientOptionsDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_REBEL_MENU_CLIENT_OPTIONS_DESCRIPTION_TEXT;			
					text = $STR_commander_menu_local_options_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class musicSwitchButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_MENU_MUSIC_SWITCH_BUTTON;
					y = "4 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = A3A_IDC_MENU_MUSIC_SWITCH_PICTURE;
							text = "\A3\ui_f\data\igui\cfg\simpleTasks\types\listen_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = A3A_IDC_MENU_MUSIC_SWITCH_TITLE;	
							text = $STR_commander_menu_music_switch;
						};
						class SwitchText: switchButtonSelect
						{			
							idc = A3A_IDC_MENU_MUSIC_SWITCH_TEXT;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = A3A_IDC_MENU_MUSIC_SWITCH_TOGGLE;
							action = QUOTE([ARR_4('MAIN', A3A_IDC_MENU_MUSIC_SWITCH_BUTTON, true, 'MUSIC')] call SCRT_fnc_ui_switchButton);
							tooltip = $STR_commander_menu_music_switch_tooltip;
						};
					};		
				};

				class musicTrackEditorButton: ButtonBase
				{			
					idc = A3A_IDC_MENU_MUSIC_TRACK_EDITOR_BUTTON;
					text = $STR_commander_menu_tracklist_editor_button;
					tooltip = $STR_commander_menu_tracklist_editor_button_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "7.5 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;
					action = QUOTE(while {dialog} do {closeDialog 0}; createDialog QQEGVAR(DOUBLES(ultimate,tracklist_editor),dialog));
				};

				class paradropButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_MENU_PARADROP_SWITCH_BUTTON;
					y = "11 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = A3A_IDC_MENU_PARADROP_SWITCH_PICTURE;
							text = "\a3\ui_f\data\igui\cfg\simpletasks\types\plane_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = A3A_IDC_MENU_PARADROP_SWITCH_TITLE;	
							text = $STR_commander_paradrop_switch;
						};
						class SwitchText: switchButtonSelect
						{			
							idc = A3A_IDC_MENU_PARADROP_SWITCH_TEXT;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = A3A_IDC_MENU_PARADROP_SWITCH_TOGGLE;
							action = QUOTE([ARR_4('MAIN', A3A_IDC_MENU_PARADROP_SWITCH_BUTTON, true, 'PARADROP')] call SCRT_fnc_ui_switchButton);
							tooltip = $STR_commander_menu_paradrop_tooltip_noncomm;
						};
					};
				};

				class paradropDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_REBEL_MENU_PARADROP_DESCRIPTION_TEXT;			
					text = $STR_commander_menu_paradrop_tooltip_noncomm;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "14.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "10 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class TeardownModeButton: ButtonBase
				{			
					idc = A3A_IDC_MENU_TEARDOWN_MODE_BUTTON;
					text = "$STR_commander_menu_toggle_teardown_mode_button";
					tooltip = "$STR_commander_menu_toggle_teardown_mode_button_tooltip";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "26 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;			
					action = QUOTE(while {dialog} do {closeDialog 0}; [] call FUNCMAIN(toggleTeardownMode));
				};

				class EditParamsButton: ButtonBase
				{			
					idc = A3A_IDC_MENU_EDIT_PARAMS_BUTTON;
					text = $STR_commander_menu_edit_params_button;
					tooltip= $STR_commander_menu_edit_params_button_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "30 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;
					action = "['onLoad'] spawn SCRT_fnc_ui_editParamsMenu;";
				};

				class saveGameButton: ButtonBase
				{		
					idc = A3A_IDC_MENU_SAVE_GAME_BUTTON;
					text = $STR_commander_menu_personal_save_button;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;			
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
					tooltip = $STR_commander_menu_personal_save_button_tooltip;
					action = "closeDialog 0; closeDialog 0; [] spawn A3A_fnc_persistentSave;";				
				};
			};
		};

		// INFO
		class GameInfoTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_REBEL_MENU_GAME_INFO_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class gameInfoDescriptionTitle: TextBase
				{
					idc = A3A_IDC_REBEL_MENU_GAME_INFO_DESCRIPTION_TITLE;
					text = $STR_commander_menu_game_info_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class gameInfoDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_REBEL_MENU_GAME_INFO_DESCRIPTION_TEXT;			
					text = "";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "12 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};
			};
		};
	};
};