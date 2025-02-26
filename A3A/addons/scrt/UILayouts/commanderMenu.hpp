class commanderMenu 
{
	idd = 60000;
	movingenable = false;
	onLoad = "['on'] call SCRT_fnc_ui_toggleMenuBlur";
	onUnload = "isMenuOpen = false; closeDialog 0; ['off'] call SCRT_fnc_ui_toggleMenuBlur; [] spawn SCRT_fnc_ui_dispose;";
	
	class Controls 
	{
		class commanderMenuTitle: TextBase
		{
			idc = 1050;
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
			idc = 1150;
			text = "<";
			x = "safezoneX + (0 * pixelGridNoUIScale * pixelW)";
			y = "safezoneY + (8 * pixelGridNoUIScale * pixelH)";
			w = "2.5 * pixelGridNoUIScale * pixelW";	
			h = "3 * pixelGridNoUIScale * pixelH";
			sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 2) * 0.5";
			action = "[60000,'LEFT'] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;";
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
			action = "[60000,'RIGHT'] spawn SCRT_fnc_ui_changeTab; [] spawn SCRT_fnc_ui_clearSupport; [] call SCRT_fnc_ui_clearOutpost;";
		};					
		
		// SUPPORT
		class SupportTab: ScrtRscControlsGroup 
		{
			idc = 1140;			
			x = safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";

			class Controls 
			{	
				class commanderDescriptionTitle: TextBase
				{
					idc = 1700;
					text = $STR_commander_menu_abilities_header_upper;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class commanderDescriptionText: TextBaseMT
				{
					idc = 1701;			
					text = $STR_commander_menu_abilities_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "7 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class supportTypeComboBox: BaseComboBox
				{
					idc = 1750;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "9.5 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";	
					onLBSelChanged = "[] call SCRT_fnc_ui_setSupportCostText; [] spawn SCRT_fnc_ui_clearSupport;";
				};

				class costsText: TextBase
				{
					idc = 1751;
					text = $STR_commander_menu_abilities_costs;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class supportPointsText: TextBase
				{
					idc = 1702;
					text = $STR_commander_menu_abilities_costs;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (32 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class airstrikePointsText: TextBase
				{
					idc = 1703;
					text = $STR_commander_menu_abilities_available_airstrikes;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (30 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class capturedAirportsText: TextBase
				{
					idc = 1704;
					text = $STR_commander_menu_abilities_captured_airports;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (28 * pixelGridNoUIScale * pixelH)";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};


				class SupportTabFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 1710;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "safezoneH - (26 * pixelGridNoUIScale * pixelH)";
					w = "24 * pixelGridNoUIScale * pixelW";	
					h = "4 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class resetSupportButton: ButtonBase
						{			
							idc = 1711;
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
							idc = 1712;
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
			idc = 2000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";		
			class Controls 
			{		
				class garrisonDescriptionTitle: TextBase
				{
					idc = 2700;
					text = $STR_notifiers_trader_establish_outpost_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class garrisonDescriptionText: TextBaseMT
				{
					idc = 2701;			
					text = $STR_commander_menu_establish_garrison_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class garrisonTypeComboBox: BaseComboBox
				{
					idc = 2750;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "7 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";	
					onLBSelChanged = "[] call SCRT_fnc_ui_setOutpostCost;";
				};

				class garrisonCostText: TextBase
				{
					idc = 2751;
					text = "Costs";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class garrisonFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 2752;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class cancelTaskButton: ButtonBase
						{			
							idc = 2790;
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
							idc = 2753;
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
					idc = 2754;					
					y = "16 * pixelGridNoUIScale * pixelH";	
				};

				class disbandButton: ButtonBase
				{			
					idc = 2755;
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
					idc = 2756;
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
					idc = 2757;					
					y = "24 * pixelGridNoUIScale * pixelH";	
				};

				class mineTypeComboBox: BaseComboBox
				{
					idc = 2758;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "24.5 * pixelGridNoUIScale * pixelH";					
					w = "22 * pixelGridNoUIScale * pixelW";
					h = "2 * pixelGridNoUIScale * pixelH";
					onLBSelChanged = "[] call SCRT_fnc_ui_setMinefieldCost;";		
				};

				class minefieldCostText: TextBase
				{
					idc = 2761;
					text = "Costs";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "27.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class mineFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 2759;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "30 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class minefieldButton: ButtonBase
						{			
							idc = 2760;
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
					idc = 2762;
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
			idc = 3000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			class Controls {	
				class grabButton: ButtonBase
				{			
					idc = 3100;
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
					idc = 3120;
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

				class hqSpacer1: brSpacer 
				{
					idc = 3101;					
					y = "8 * pixelGridNoUIScale * pixelH";	
				};

				class rebelSkillTitle: TextBase
				{
					idc = 3102;
					text = $STR_commander_menu_skill_level_title;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "8.5 * pixelGridNoUIScale * pixelH";	
					w = "22.5 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};
				
				class trainRebelButton: ButtonBase
				{			
					idc = 3103;
					text = $STR_antistasi_dialogs_hq_button_train_ai_text;
					tooltip = $STR_antistasi_dialogs_hq_button_train_ai_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] spawn A3A_fnc_FIAskillAdd";		
				};

				class rebelLoadoutButton: ButtonBase
				{			
					idc = 3104;
					text = $STR_antistasi_dialogs_hq_button_rebel_loadouts_text;
					tooltip = $STR_antistasi_dialogs_hq_button_rebel_loadouts_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "14 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call SCRT_fnc_ui_createRebelLoadoutMenu;";
				};

				class uniformRandomizeButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 5500;
					y = "18 * pixelGridNoUIScale * pixelH";
					class Controls 
					{
						class SwitchPic: switchButtonPic
						{			
							idc = 5501;
							text = "\a3\ui_f\data\igui\cfg\simpletasks\types\armor_ca.paa";
						};
						class SwitchTitle: switchButtonTitle
						{			
							idc = 5502;	
							text = $STR_commander_menu_randomize_unfiroms_header;
						};
						class SwitchText: switchButtonSelect
						{			
							idc = 5503;
							text = "";
						};
						class SwitchButton: switchButton {
							idc = 5504;
							action = "['MAIN', 5500, true, 'UNIFORMRANDOMIZE'] call SCRT_fnc_ui_switchButton";
							tooltip = $STR_commander_menu_randomize_unfiroms_tooltip;
						};
					};		
				};

				class hqSpacer2: brSpacer 
				{
					idc = 3105;					
					y = "22 * pixelGridNoUIScale * pixelH";	
				};

				class movePetrosButton: ButtonBase
				{		
					idc = 3107;
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
					action = "private _knownLocationsCount = count (['KNOWN'] call SCRT_fnc_rivals_getLocations); if (_knownLocationsCount > 0) then {[] call SCRT_fnc_ui_setAssignRivalsAttackLocationMode} else {[] call SCRT_fnc_ui_showRivalsActivity};";
				};
			};
		};

		
		// ENVIRONMENT
		class EnvironmentTab: ScrtRscControlsGroup 
		{
			idc = 4000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class envDescriptionTitle: TextBase
				{
					idc = 4010;
					text = $STR_commander_menu_environment_options_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class envDescriptionText: TextBaseMT
				{
					idc = 4011;			
					text = $STR_commander_menu_environment_options_text;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class envSpacer1: brSpacer 
				{
					idc = 4090;					
					y = "6 * pixelGridNoUIScale * pixelH";	
				};

				class fogTitle: TextBase
				{
					idc = 4040;
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
					idc = 4041;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";	
					w = "21.5 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";					
					onSliderPosChanged = "_value = ((_this select 1)/100); _rounded = [_value, 2] call BIS_fnc_cutDecimals; ((findDisplay 60000) displayCtrl 4040) ctrlSetText format [localize 'STR_commander_menu_fog_title', _rounded]; fogValue = [_rounded,0,0];";
				};

				class fogFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 4110;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class setFogButton: ButtonBase
						{			
							idc = 4112;
							text = $STR_commander_menu_fog_button;
							x = 0;
							y = 0;
							w = "22 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
							shadow = 2;	
							action = "if(player isEqualTo theBoss) then {[10, fogValue] remoteExec ['setFog',2];};";			
						};
					};
				};

				class spacer2: brSpacer 
				{
					idc = 4091;					
					y = "16 * pixelGridNoUIScale * pixelH";	
				};

				class overcastTitle: TextBase
				{
					idc = 4060;
					text = $STR_commander_menu_overcast_title_default;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "16.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";
					colorText[] = {0.75,0.75,0.75,1};
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					font = "PuristaMedium";
					tooltip = $STR_commander_menu_overcast_title_tooltip;
				};

				class overcastSlider: SliderBase
				{
					idc = 4061;
					x = "1.5 * pixelGridNoUIScale * pixelW";
					y = "20 * pixelGridNoUIScale * pixelH";	
					w = "21.5 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";					
					onSliderPosChanged = "_value = ((_this select 1)/100); _rounded = [_value, 2] call BIS_fnc_cutDecimals; ((findDisplay 60000) displayCtrl 4060) ctrlSetText format [localize 'STR_commander_menu_overcast_title', _rounded]; overcastValue = _rounded;";
				};

				class overcastFooter: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 4062;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "22.5 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";

					class Controls 
					{
						class setOvercastButton: ButtonBase
						{			
							idc = 4063;
							text = $STR_commander_menu_overcast_button;
							x = 0;
							y = 0;
							w = "22 * pixelGridNoUIScale * pixelW";	
							h = "3 * pixelGridNoUIScale * pixelH";
							sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
							shadow = 2;	
							action = "if(player isEqualTo theBoss) then {[] spawn {[overcastValue] call BIS_fnc_setOvercast;};};";			
						};
					};
				};

				class hqSpacer3: brSpacer 
				{
					idc = 4200;					
					y = "26 * pixelGridNoUIScale * pixelH";	
				};

				class waitButton: ButtonBase
				{			
					idc = 4212;
					text = $STR_params_rest_button;
					tooltip = $STR_commander_menu_rest_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "26.5 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "[] call A3A_fnc_skiptime;";		
				};

				class clearForestButton: ButtonBase
				{			
					idc = 4213;
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
					idc = 4214;
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
			idc = 5000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class globalOptionsDescriptionTitle: TextBase
				{
					idc = 5010;
					text = $STR_commander_menu_local_options_title;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class globalOptionsDescriptionText: TextBaseMT
				{
					idc = 5011;			
					text = $STR_commander_menu_local_options_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class envSpacer1: brSpacer 
				{
					idc = 5090;					
					y = "4 * pixelGridNoUIScale * pixelH";	
				};

				class musicSwitchButton: ScrtRscControlsGroupNoScrollbarsMain 
				{
					idc = 5100;
					y = "4.5 * pixelGridNoUIScale * pixelH";
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
					y = "8 * pixelGridNoUIScale * pixelH";
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
							tooltip = $STR_commander_menu_paradrop_tooltip;
						};
					};
				};	

				class CheckVictoryButton: ButtonBase
				{			
					idc = 5310;
					text = $STR_commander_menu_victory_check_button;
					tooltip = $STR_commander_menu_victory_check_button_tooltip;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "11.5 * pixelGridNoUIScale * pixelH";
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "3 * pixelGridNoUIScale * pixelH";	
					sizeEx = "((pixelH * (pixelGridNoUIScale) * 2) * 1.25) * 0.5";	
					shadow = 2;	
					action = "closeDialog 0; closeDialog 0; [] spawn A3A_fnc_checkWinCondition;";		
				};

				class saveGameButton: ButtonBase
				{		
					idc = 5300;
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
			idc = 6000;			
			x = -0.4 * safezoneW + safezoneX;
			y = "safezoneY + (12 * pixelGridNoUIScale * pixelH)";
			w = "26 * pixelGridNoUIScale * pixelW";			
			h = "safezoneH - (12 * pixelGridNoUIScale * pixelH)";
			
			class Controls 
			{
				class gameInfoDescriptionTitle: TextBase
				{
					idc = 6010;
					text = $STR_commander_menu_game_info_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "0 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class globalOptionsDescriptionText: TextBaseMT
				{
					idc = 6011;			
					text = "";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "2 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "6 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class serverMembersDescriptionTitle: TextBase
				{
					idc = 6012;
					text = $STR_commander_menu_server_members_header;
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "10 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "1.5 * pixelGridNoUIScale * pixelH";
				};

				class serverMembersDescriptionText: TextBaseMT
				{
					idc = 6013;			
					text = "";
					x = "1 * pixelGridNoUIScale * pixelW";
					y = "12 * pixelGridNoUIScale * pixelH";	
					w = "22 * pixelGridNoUIScale * pixelW";	
					h = "12 * pixelGridNoUIScale * pixelH";
					colorText[] = {1,1,1,0.7};
				};

				class rerollTraderButton: ButtonBase
				{		
					idc = 6014;
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