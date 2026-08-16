class rebelMenu 
{
	idd = 70000;
	movingenable = false;
	onLoad = "['on'] call SCRT_fnc_ui_toggleMenuBlur";
	onUnload = "isMenuOpen = false; closeDialog 0; ['off'] call SCRT_fnc_ui_toggleMenuBlur; [] spawn SCRT_fnc_ui_dispose;";
	
	class Controls 
	{
		class menuTitle: TextBase
		{
			idc = 1050;
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
			idc = 1051;
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "24 * pixelGridNoUIScale * pixelW";
			h = "safezoneH - (18 * pixelGridNoUIScale * pixelH)";
			colorBackground[] = { 0.1, 0.1, 0.1, 0.6 };
			text = "";
		};

		class messageBoxTitle: TextBase {
			idc = 1055;	
			x = "safezoneX + (25 * pixelGridNoUIScale * pixelW)";
			y = "(safezoneY + safezoneH) - (10 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW - (32 * pixelGridNoUIScale * pixelW)";	
			h = "2 * pixelGridNoUIScale * pixelH";
			text = "";
			size = "((pixelH * (pixelGridNoUIScale) * 2) * 3) * 0.5";
		};

		class messageBoxText: TextBase
		{
			idc = 1056;
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
			idc = 1000;			
			x = "safezoneX + (24 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "safezoneW";
			h = "safezoneH - (18 * pixelGridNoUIScale * pixelH)";
		};	

		class tabSelectorTitle: headerBase
		{
			idc = 1101;			
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
			idc = 1150;
			text = "<";
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";
			action = "[70000,'LEFT'] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;";
		};

		class tabSelectorRightButton: ButtonBase
		{			
			idc = 1151;
			text = ">";
			x = "safezoneX + (21.5 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";	
			action = "[70000,'RIGHT'] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;";
		};

		// Rivals
		class RivalsTab: ScrtRscControlsGroup 
		{
			idc = 7000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			class Controls {
				class hideoutsDescriptionTitle: TextBase
				{
					idc = 7700;
					text = $STR_antistasi_rivals_network_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class hideoutsDescriptionText: TextBaseMT
				{
					idc = 7701;			
					text = $STR_antistasi_rivals_network_description;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "11.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class hideoutsProgressBar: ProgressBase
				{
					idc = 7750;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "13.5 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";	
					tooltip = $STR_antistasi_rivals_network_progress_bar_tooltip;
				};

				class totalLocationsText: TextBase
				{
					idc = 7703;
					text = $STR_antistasi_rivals_total_locations_label;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (30 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class knownLocationsText: TextBase
				{
					idc = 7704;
					text = $STR_antistasi_rivals_attackable_locations_label;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (28 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class showLocationsButton: ButtonBase
				{			
					idc = 7762;
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
			idc = 1140;			
			x = safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";

			class Controls 
			{
				class clientOptionsDescriptionTitle: TextBase
				{
					idc = 5020;
					text = $STR_commander_menu_local_options_title;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class clientOptionsDescriptionText: TextBaseMT
				{
					idc = 5021;			
					text = $STR_commander_menu_local_options_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class musicSwitchButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 5100;
					y = "4 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = 5101;
							text = "\A3\ui_f\data\igui\cfg\simpleTasks\types\listen_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = 5102;	
							text = $STR_commander_menu_music_switch;
						};
						class SwitchText: switchButtonSelect
						{			
							idc = 5103;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = 5104;
							action = "['MAIN', 5100, true, 'MUSIC'] call SCRT_fnc_ui_switchButton";
							tooltip = $STR_commander_menu_music_switch_tooltip;
						};
					};		
				};

				class paradropButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 5400;
					y = "7.5 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = 5401;
							text = "\a3\ui_f\data\igui\cfg\simpletasks\types\plane_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = 5402;	
							text = $STR_commander_paradrop_switch;
						};
						class SwitchText: switchButtonSelect
						{			
							idc = 5403;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = 5404;
							action = "['MAIN', 5400, true, 'PARADROP'] call SCRT_fnc_ui_switchButton";
							tooltip = $STR_commander_menu_paradrop_tooltip_noncomm;
						};
					};
				};

				class paradropDescriptionText: TextBaseMT
				{
					idc = 6521;			
					text = $STR_commander_menu_paradrop_tooltip_noncomm;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "11 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "10 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class TeardownModeButton: ButtonBase
				{			
					idc = 5190;
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
					idc = 5200;
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
					idc = 5300;
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
			idc = 2000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class gameInfoDescriptionTitle: TextBase
				{
					idc = 2010;
					text = $STR_commander_menu_game_info_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class gameInfoDescriptionText: TextBaseMT
				{
					idc = 2011;			
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