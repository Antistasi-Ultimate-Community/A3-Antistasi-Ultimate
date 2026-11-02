#include "ids.inc"

class commanderMenu 
{
	idd = A3A_IDD_COMMANDER_MENU;
	movingenable = false;
	onLoad = "['on'] call SCRT_fnc_ui_toggleMenuBlur";
	onUnload = "isMenuOpen = false; closeDialog 0; ['off'] call SCRT_fnc_ui_toggleMenuBlur; [] spawn SCRT_fnc_ui_dispose;";
	
	class Controls 
	{
		class commanderMenuTitle: TextBase
		{
			idc = A3A_IDC_MENU_TITLE;
			text = $STR_commander_menu_header;
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
			text = $STR_commander_menu_abilities_header_upper;					
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
			action = QUOTE([ARR_2(A3A_IDD_COMMANDER_MENU,'LEFT')] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;);
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
			action = QUOTE([ARR_2(A3A_IDD_COMMANDER_MENU,'RIGHT')] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;);
		};					
		
		// SUPPORT
		class SupportTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_COMMANDER_MENU_SUPPORT_TAB;			
			x = safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";

			class Controls 
			{	
				class commanderDescriptionTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_DESCRIPTION_TITLE;
					text = $STR_commander_menu_abilities_header_upper;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class commanderDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_DESCRIPTION_TEXT;			
					text = $STR_commander_menu_abilities_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "7 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class supportTypeComboBox: BaseComboBox
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "9.5 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";	
					onLBSelChanged = "[] call SCRT_fnc_ui_setSupportCostText; [] spawn SCRT_fnc_ui_clearSupport;";
				};

				class costsText: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_COSTS_TEXT;
					text = $STR_commander_menu_abilities_costs;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class supportPointsText: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_POINTS_TEXT;
					text = $STR_commander_menu_abilities_costs;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (32 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class airstrikePointsText: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_AIRSTRIKE_POINTS_TEXT;
					text = $STR_commander_menu_abilities_available_airstrikes;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (30 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class capturedAirportsText: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_CAPTURED_AIRPORTS_TEXT;
					text = $STR_commander_menu_abilities_captured_airports;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (28 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};


				class SupportTabFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_COMMANDER_MENU_SUPPORT_FOOTER;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "24 * pixelGridNoUIScale * pixelW";	
					h = "4 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class resetSupportButton: ButtonBase
						{			
							idc = A3A_IDC_COMMANDER_MENU_SUPPORT_RESET_BUTTON;
							text = $STR_commander_menu_abilities_reset_button;
							x = "0 * pixelGridNoUIScale * pixelW";
							y = 0;
							w = "9.75 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";
							shadow = 2;
							action = "if(!isNil 'supportCooldown' && {supportCooldown}) then {[localize 'STR_notifiers_support_header', localize 'STR_notifiers_support_inprogress'] call SCRT_fnc_misc_deniedHint;} else {[] spawn SCRT_fnc_ui_clearSupport;};";		
						};
						class launchSupport: ButtonBase
						{			
							idc = A3A_IDC_COMMANDER_MENU_SUPPORT_LAUNCH_BUTTON;
							text = $STR_commander_menu_abilities_launch_button;
							x = "12.25 * pixelGridNoUIScale * pixelW";
							y = 0;
							w = "9.75 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
							shadow = 2;
							colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
							action = "[] spawn SCRT_fnc_ui_launchSupport;";			
						};
					};
				};	
			};
		};
		
		// GARRISON
		class GarrisonTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_COMMANDER_MENU_GARRISON_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";		
			class Controls 
			{		
				class garrisonDescriptionTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_DESCRIPTION_TITLE;
					text = $STR_notifiers_trader_establish_outpost_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class garrisonDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_DESCRIPTION_TEXT;			
					text = $STR_commander_menu_establish_garrison_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class garrisonTypeComboBox: BaseComboBox
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_TYPE_COMBOBOX;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "7 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";	
					onLBSelChanged = "[] call SCRT_fnc_ui_setOutpostCost;";
				};

				class garrisonCostText: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_COST_TEXT;
					text = "Costs";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class garrisonFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_FOOTER;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class cancelTaskButton: ButtonBase
						{			
							idc = A3A_IDC_COMMANDER_MENU_GARRISON_CANCEL_TASK_BUTTON;
							text = $STR_commander_menu_establish_garrison_Cancel;
							x = 0;
							y = 0;
							w = "9.25 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
							shadow = 2;	
							action = "if ('outpostTask' in A3A_activeTasks && {!isNil 'estabNetworkId'}) then {[] remoteExecCall ['SCRT_fnc_outpost_cancelOutpostTask', estabNetworkId]};closeDialog 0;closeDialog 0;";			
						};
						
						class establishButton: ButtonBase
						{			
							idc = A3A_IDC_COMMANDER_MENU_GARRISON_ESTABLISH_BUTTON;
							text = $STR_commander_menu_establish_garrison_establish;
							x = "12.75 * pixelGridNoUIScale * pixelW";
							y = 0;
							w = "9.25 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
							shadow = 2;	
							action = "[] call SCRT_fnc_ui_setEstablishOutpostMode;";			
						};
					};
				};

				class garrisonSpacer: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_SPACER_1;					
					y = "16 * pixelGridNoUIScale * pixelH";	
				};

				class disbandButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_DISBAND_BUTTON;
					text = $STR_antistasi_dialogs_build_disband_units_button_text;
					tooltip = $STR_antistasi_dialogs_build_disband_units_button_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "16.5 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_setDisbandMode;";
				};

				class recruitButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_RECRUIT_BUTTON;
					text = $STR_antistasi_dialogs_build_recruit_units_button_text;
					tooltip = $STR_antistasi_dialogs_build_recruit_units_button_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "20 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_setRecruitMode;";
				};

				class garrisonSpacer1: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_GARRISON_SPACER_2;					
					y = "24 * pixelGridNoUIScale * pixelH";	
				};

				class mineTypeComboBox: BaseComboBox
				{
					idc = A3A_IDC_COMMANDER_MENU_MINE_TYPE_COMBOBOX;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "24.5 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";
					onLBSelChanged = "[] call SCRT_fnc_ui_setMinefieldCost;";		
				};

				class minefieldCostText: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_MINEFIELD_COST_TEXT;
					text = "Costs";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "27.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class mineFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_COMMANDER_MENU_MINE_FOOTER;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "30 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class minefieldButton: ButtonBase
						{			
							idc = A3A_IDC_COMMANDER_MENU_MINEFIELD_BUTTON;
							text = $STR_commander_menu_create_minefield;
							x = "9.25 * pixelGridNoUIScale * pixelW";
							y = 0;
							w = "12.25 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
							shadow = 2;	
							action = "[] call SCRT_fnc_ui_setMinefieldMode;";			
						};
					};
				};

				class clearMinefieldButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_CLEAR_MINEFIELD_BUTTON;
					text = $STR_antistasi_dialogs_minefield_button_remove_text;
					tooltip = $STR_antistasi_dialogs_minefield_button_remove_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "34 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "closeDialog 0; closeDialog 0; ['delete'] spawn A3A_fnc_mineDialog;";
				};
			};
		};

		// HQ
		class HqTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_COMMANDER_MENU_HQ_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			class Controls {	
				class grabButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_HQ_GRAB_BUTTON;
					text = $STR_antistasi_dialogs_hq_button_withdraw_text;
					tooltip = $STR_antistasi_dialogs_hq_button_withdraw_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "if (player isEqualTo theBoss) then {[] call A3A_fnc_theBossSteal} else {[localize 'STR_antistasi_actions_common_notifications_money_found_title', localize 'STR_generic_commander_only'] call SCRT_fnc_misc_deniedHint;};";		
				};

				class rebuildAssetsButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_HQ_REBUILD_ASSETS_BUTTON;
					text = $STR_antistasi_dialogs_hq_button_rebuild_assets_text;
					tooltip = $STR_antistasi_dialogs_hq_button_rebuild_assets_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "4 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_setRebuildAssetMode;";		
				};

				class respawnPetros: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_HQ_RESPAWN_PETROS_BUTTON;
					text = $STR_antistasi_dialogs_hq_button_respawn_petros_text;
					tooltip = $STR_antistasi_dialogs_hq_button_respawn_petros_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "8 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_respawnPetros;";		
				};

				class hqSpacer1: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_HQ_SPACER_1;					
					y = "12 * pixelGridNoUIScale * pixelH";	
				};

				class rebelSkillTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_HQ_REBEL_SKILL_TITLE;
					text = $STR_commander_menu_skill_level_title;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12.5 * pixelGridNoUIScale * pixelH";	
					w = "22.5 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};
				
				class trainRebelButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_HQ_TRAIN_REBEL_BUTTON;
					text = $STR_antistasi_dialogs_hq_button_train_ai_text;
					tooltip = $STR_antistasi_dialogs_hq_button_train_ai_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "14 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] spawn A3A_fnc_FIAskillAdd";		
				};

				class rebelLoadoutButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_HQ_REBEL_LOADOUT_BUTTON;
					text = $STR_antistasi_dialogs_hq_button_rebel_loadouts_text;
					tooltip = $STR_antistasi_dialogs_hq_button_rebel_loadouts_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "18 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_createRebelLoadoutMenu;";
				};

				/*
				// ! This no longer does anything since new partial AI loadout system was introduced
				// ! Leaving it commented out instead of removing it in case we want to use this button for something else later
				class uniformRandomizeButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_BUTTON;
					y = "18 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_PICTURE;
							text = "\a3\ui_f\data\igui\cfg\simpletasks\types\armor_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_TITLE;	
							text = $STR_commander_menu_randomize_unfiroms_header;
						};
						class SwitchText: switchButtonSelect
						{			
							idc = A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_TEXT;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_TOGGLE;
							action = QUOTE([ARR_4('MAIN', A3A_IDC_COMMANDER_MENU_HQ_UNIFORM_RANDOMIZE_BUTTON, true, 'UNIFORMRANDOMIZE')] call SCRT_fnc_ui_switchButton);
							tooltip = $STR_commander_menu_randomize_unfiroms_tooltip;
						};
					};		
				};
				*/

				class hqSpacer2: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_HQ_SPACER_2;					
					y = "22 * pixelGridNoUIScale * pixelH";	
				};

				class movePetrosButton: ButtonBase
				{		
					idc = A3A_IDC_COMMANDER_MENU_HQ_MOVE_PETROS_BUTTON;
					text = $STR_antistasi_dialogs_hq_button_move_headquarters_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;			
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
					tooltip = $STR_antistasi_dialogs_hq_button_move_headquarters_tooltip;
					action = "closeDialog 0; closeDialog 0; [] spawn A3A_fnc_moveHQ;";				
				};
			};
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
					action = "private _knownLocationsCount = count (['KNOWN'] call SCRT_fnc_rivals_getLocations); if (_knownLocationsCount > 0) then {[] call SCRT_fnc_ui_setAssignRivalsAttackLocationMode} else {[] call SCRT_fnc_ui_showRivalsActivity};";
				};
			};
		};

		
		// ENVIRONMENT
		class EnvironmentTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class envDescriptionTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_DESCRIPTION_TITLE;
					text = $STR_commander_menu_environment_options_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class envDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_DESCRIPTION_TEXT;			
					text = $STR_commander_menu_environment_options_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class envSpacer1: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_SPACER_1;					
					y = "6 * pixelGridNoUIScale * pixelH";	
				};

				class fogTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_FOG_TITLE;
					text = $STR_commander_menu_fog_title_default;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "6.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					colorText[] = {0.75,0.75,0.75,1};
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					font = "PuristaMedium";
					tooltip = $STR_commander_menu_fog_title_tooltip;
				};

				class fogSlider: SliderBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_FOG_SLIDER;
					sliderPosition = 50;
					sliderRange[] = {0, 100}; // doesn't work with 0..1 range and 0.1 step for some reason
					sliderStep = 1;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";	
					w = "16 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";					
					onSliderPosChanged = QUOTE(_value = (_this select 1)/100; ((findDisplay A3A_IDD_COMMANDER_MENU) displayCtrl A3A_IDC_COMMANDER_MENU_ENVIRONMENT_FOG_TITLE) ctrlSetText format [ARR_2(localize 'STR_commander_menu_fog_title', _value)]; fogValue = [ARR_3(_value,0,0)];);
				};

				class setFogButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_SET_FOG_BUTTON;
					text = $STR_commander_menu_fog_button;
					x = "18.5 * pixelGridNoUIScale * pixelW";
					y = "9.5 * pixelGridNoUIScale * pixelH";	
					w = "4.5 * pixelGridNoUIScale * pixelW"; 
					h = "1.5 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "if(player isEqualTo theBoss) then {[10, fogValue] remoteExec ['setFog',2];};";			
				};

				class spacer2: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_SPACER_2;					
					y = "12.5 * pixelGridNoUIScale * pixelH";	
				};

				class overcastTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_OVERCAST_TITLE;
					text = $STR_commander_menu_overcast_title_default;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "13 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					colorText[] = {0.75,0.75,0.75,1};
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					font = "PuristaMedium";
					tooltip = $STR_commander_menu_overcast_title_tooltip;
				};

				class overcastSlider: SliderBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_OVERCAST_SLIDER;
					sliderPosition = 50;
					sliderRange[] = {0, 100}; // doesn't work with 0..1 range and 0.1 step for some reason
					sliderStep = 1;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "16.5 * pixelGridNoUIScale * pixelH";	
					w = "16 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";					
					onSliderPosChanged = QUOTE(_value = (_this select 1)/100; ((findDisplay A3A_IDD_COMMANDER_MENU) displayCtrl A3A_IDC_COMMANDER_MENU_ENVIRONMENT_OVERCAST_TITLE) ctrlSetText format [ARR_2(localize 'STR_commander_menu_overcast_title', _value)]; overcastValue = _value;);
				};

				class setOvercastButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_SET_OVERCAST_BUTTON;
					text = $STR_commander_menu_overcast_button;
					x = "18.5 * pixelGridNoUIScale * pixelW";
					y = "16 * pixelGridNoUIScale * pixelH";	
					w = "4.5 * pixelGridNoUIScale * pixelW"; 
					h = "1.5 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "if(player isEqualTo theBoss) then {[] spawn {[overcastValue] call BIS_fnc_setOvercast;};};";
				};

				class spacer3: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_SPACER_3;					
					y = "19 * pixelGridNoUIScale * pixelH";	
				};

				class waitTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_WAIT_TITLE;
					text = __EVAL(format [localize "STR_commander_menu_wait_title_default", localize "STR_antistasi_timeSpan_hours"]);
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "19.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					colorText[] = {0.75,0.75,0.75,1};
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					font = "PuristaMedium";
					tooltip = __EVAL(format [localize "STR_commander_menu_wait_title_tooltip", localize "STR_antistasi_timeSpan_hours"]);
				};

				class waitSlider: SliderBase
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_WAIT_SLIDER;
					sliderPosition = 6;
					sliderRange[] = {0, 12};
					sliderStep = 0.25;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "23 * pixelGridNoUIScale * pixelH";	
					w = "16 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";					
					onSliderPosChanged = QUOTE(_value = _this select 1; ((findDisplay A3A_IDD_COMMANDER_MENU) displayCtrl A3A_IDC_COMMANDER_MENU_ENVIRONMENT_WAIT_TITLE) ctrlSetText format [ARR_3(localize 'STR_commander_menu_wait_title', _value, localize 'STR_antistasi_timeSpan_hours')]; (_this select 0) setVariable [ARR_2('timeToSkip', _value)];);
				};

				class waitButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_WAIT_BUTTON;
					text = $STR_commander_menu_wait_button;
					x = "18.5 * pixelGridNoUIScale * pixelW";
					y = "22.5 * pixelGridNoUIScale * pixelH";	
					w = "4.5 * pixelGridNoUIScale * pixelW"; 
					h = "1.5 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = QUOTE(((findDisplay A3A_IDD_COMMANDER_MENU) displayCtrl A3A_IDC_COMMANDER_MENU_ENVIRONMENT_WAIT_SLIDER) getVariable [ARR_2('timeToSkip', 6)] call A3A_fnc_skiptime;);
				};

				class spacer4: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_SPACER_4;					
					y = "25.5 * pixelGridNoUIScale * pixelH";	
				};

				class clearForestButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_CLEAR_FOREST_BUTTON;
					text = $STR_commander_menu_clear_forest_button;
					tooltip= $STR_commander_menu_clear_forest_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "30 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;			
					action = "[] call A3A_fnc_clearForest; closeDialog 0; closeDialog 0;";		
				};

				class clearGarbageButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_ENVIRONMENT_CLEAR_GARBAGE_BUTTON;
					text = $STR_commander_menu_clear_garbage_button;
					tooltip = $STR_commander_menu_clear_garbage_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "33.5 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";		
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "if (player isEqualTo theBoss) then {closedialog 0;[] remoteExecCall [""A3A_fnc_garbageCleaner"",2]} else {[localize 'STR_antistasi_journal_entry_header_Options_7', localize 'STR_generic_commander_only'] call SCRT_fnc_misc_deniedHint;};";		
				};
			};
		};

		// OPTIONS
		class GameOptionsTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class globalOptionsDescriptionTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_DESCRIPTION_TITLE;
					text = $STR_commander_menu_local_options_title;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class globalOptionsDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_DESCRIPTION_TEXT;			
					text = $STR_commander_menu_local_options_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class envSpacer1: brSpacer 
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_SPACER_1;					
					y = "4 * pixelGridNoUIScale * pixelH";	
				};

				class musicSwitchButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_MENU_MUSIC_SWITCH_BUTTON;
					y = "4.5 * pixelGridNoUIScale * pixelH";
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
					y = "8 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;
					action = QUOTE(while {dialog} do {closeDialog 0}; createDialog QQEGVAR(DOUBLES(ultimate,tracklist_editor),dialog));
				};

				class paradropButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = A3A_IDC_MENU_PARADROP_SWITCH_BUTTON;
					y = "11.5 * pixelGridNoUIScale * pixelH";
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
							tooltip = $STR_commander_menu_paradrop_tooltip;
						};
					};
				};	

				class CheckVictoryButton: ButtonBase
				{			
					idc = A3A_IDC_COMMANDER_MENU_GAME_OPTIONS_CHECK_VICTORY_BUTTON;
					text = $STR_commander_menu_victory_check_button;
					tooltip = $STR_commander_menu_victory_check_button_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "15 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "closeDialog 0; closeDialog 0; [] spawn A3A_fnc_checkWinCondition;";		
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
					text = $STR_commander_menu_persistent_save_button;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;			
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.376])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.125])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.043])",1};
					tooltip = $STR_commander_menu_persistent_save_button_tooltip;
					action = "closeDialog 0; closeDialog 0; [] spawn A3A_fnc_persistentSave;";				
				};
			};
		};

		// INFO
		class GameInfoTab: ScrtRscControlsGroup 
		{
			idc = A3A_IDC_COMMANDER_MENU_GAME_INFO_TAB;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class gameInfoDescriptionTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_INFO_DESCRIPTION_TITLE;
					text = $STR_commander_menu_game_info_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class globalOptionsDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_INFO_DESCRIPTION_TEXT;			
					text = "";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "6 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class serverMembersDescriptionTitle: TextBase
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_INFO_SERVER_MEMBERS_TITLE;
					text = $STR_commander_menu_server_members_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class serverMembersDescriptionText: TextBaseMT
				{
					idc = A3A_IDC_COMMANDER_MENU_GAME_INFO_SERVER_MEMBERS_TEXT;			
					text = "";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "12 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class rerollTraderButton: ButtonBase
				{		
					idc = A3A_IDC_COMMANDER_MENU_GAME_INFO_REROLL_TRADER_BUTTON;
					text = $STR_commander_menu_redo_arms_dealer_task;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					fade = 0;
					shadow = 2;
					colorBackground[] = {0.376, 0.125, 0.043, 1};
					tooltip = $STR_commander_menu_redo_arms_dealer_task_tooltip;
					action = "if (player isEqualTo theBoss) then {[] spawn SCRT_fnc_trader_rerollTrader;} else {closeDialog 0; closeDialog 0; [localize 'STR_generic_commander_reroll', localize 'STR_generic_commander_only'] call SCRT_fnc_misc_deniedHint;};";			
				};
			};
		};
	};
};