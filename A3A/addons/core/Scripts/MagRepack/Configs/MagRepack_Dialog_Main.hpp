
#include "..\..\..\script_component.hpp"

class MagRepack_Dialog_Main
{
	idd = -1;
	movingenable = 0;
	onLoad = "uiNamespace setVariable ['outlw_MR_Dialog_Main', (_this select 0)]";
	onUnload = "call outlw_MR_onDialogDestroy;";
	onMouseButtonUp = "call outlw_MR_onMouseButtonUp;";
	
	class Controls
	{
		class MR_BG_ListBox: outlw_MR_IGUIBack
		{
			idc = 2200;
			
			x = 4.25 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 15.75 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_BG_Main: outlw_MR_IGUIBack
		{
			idc = 2201;

			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_BG_LeftBorder: outlw_MR_IGUIBack
		{
			idc = 2955;

			x = 3.7 * GUI_GRID_W + GUI_GRID_X;
			y = 2.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.25 * GUI_GRID_W;
			h = 15.25 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_BG_BottomBorder: outlw_MR_IGUIBack
		{
			idc = 2956;

			x = 8.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 0.25 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_MainTitle: outlw_MR_RscStructuredText
		{
			idc = 1001;

			text = "Mag Repack";
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 0.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class MR_MagListTitle: outlw_MR_RscStructuredText
		{
			idc = 1000;

			text = "$STR_magRepack_allmags";
			x = 7.75 * GUI_GRID_W + GUI_GRID_X;
			y = 1.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
			
			class Attributes
			{
				align = "right";
			};
		};
		class MR_SourceBox: outlw_MR_IGUIBack
		{
			idc = 2208;

			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {1,1,1,0.1};
		};
		class MR_FG_Source: outlw_MR_RscPicture
		{
			idc = 2210;
			text = QPATHTOFOLDER(Scripts\MagRepack\Images\MR_SourceGradient.paa);

			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class MR_TargetBox: outlw_MR_IGUIBack
		{
			idc = 2214;

			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {1,1,1,0.1};
		};
		class MR_FG_Target: outlw_MR_RscPicture
		{
			idc = 2211;
			text = QPATHTOFOLDER(Scripts\MagRepack\Images\MR_TargetGradient.paa);
			
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class MR_BG_SourceText: outlw_MR_RscText
		{
			idc = 1005;
			style = 1;

			text = "";
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class MR_SourceText: outlw_MR_RscText
		{
			idc = 1002;
			style = 0;

			text = "$STR_magRepack_source";
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 2.8125 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.75 * GUI_GRID_H;
		};
		class MR_BG_TargetText: outlw_MR_RscText
		{
			idc = 1003;
			style = 1;

			text = "";
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class MR_TargetText: outlw_MR_RscText
		{
			idc = 1004;
			style = 1;

			text = "$STR_magRepack_target";
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 11.8125 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.75 * GUI_GRID_H;
		};
		class MR_SourcePic: outlw_MR_RscPicture
		{
			idc = 1201;

			text = "";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class MR_SourceInfo: outlw_MR_RscStructuredText
		{
			idc = 1100;

			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 4.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			sizeEx = 0.65 * GUI_GRID_H;
		};
		class MR_TargetPic: outlw_MR_RscPicture
		{
			idc = 1203;

			text = "";
			x = 31.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
		};
		class MR_TargetInfo: outlw_MR_RscStructuredText
		{
			idc = 1101;
	
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			sizeEx = 0.65 * GUI_GRID_H;
		};
		class MR_SourceListBox: outlw_MR_RscListBox
		{
			idc = 1501;
			canDrag = 1;
			rowHeight = 3 * GUI_GRID_H;
			onLBDrag = "[(((_this select 1) select 0) select 1), (((_this select 1) select 0) select 2), 'source'] call outlw_MR_onDrag;";
			onMouseButtonClick = "if ((_this select 1) == 1) then {call outlw_MR_clearSource;};";
			
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			sizeEx = 0.65 * GUI_GRID_H;
			
			colorText[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorScrollbar[] = {0,0,0,0};
			colorSelect[] = {0,0,0,0};
			colorSelect2[] = {0,0,0,0};
			colorSelectBackground[] = {0,0,0,0};
			colorSelectBackground2[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class MR_TargetListBox: outlw_MR_RscListBox
		{
			idc = 1502;
			canDrag = 1;
			rowHeight = 3 * GUI_GRID_H;
			onLBDrag = "[(((_this select 1) select 0) select 1), (((_this select 1) select 0) select 2), 'target'] call outlw_MR_onDrag;";
			onMouseButtonClick = "if ((_this select 1) == 1) then {call outlw_MR_clearTarget;};";
			
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			sizeEx = 0.65 * GUI_GRID_H;
			
			colorText[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
			colorScrollbar[] = {0,0,0,0};
			colorSelect[] = {0,0,0,0};
			colorSelect2[] = {0,0,0,0};
			colorSelectBackground[] = {0,0,0,0};
			colorSelectBackground2[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
		};
		class MR_SourceArea: outlw_MR_IGUIBack
		{
			idc = 2215;
			onLBDrop = "((_this select 4) select 0) call outlw_MR_addSource; true;";
			
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {0,0,0,0};
		};
		class MR_TargetArea: outlw_MR_IGUIBack
		{
			idc = 2216;
			onLBDrop = "((_this select 4) select 0) call outlw_MR_addTarget; true;";

			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 17 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			tooltipColorBox[] = {0,0,0,0};
		};
		class MR_SourceConvertButton: outlw_MR_RscButtonMenu
		{
			idc = 1600;
			text = "";
			action = "['Source'] call outlw_MR_convert;";
			
			x = 33 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			
			size = 0.5 * GUI_GRID_H;
			
			class Attributes
			{
				font = "PuristaMedium";
				align = "center";
			};
			
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
		};
		class MR_TargetConvertButton: outlw_MR_RscButtonMenu
		{
			idc = 1601;
			text = "";
			action = "['target'] call outlw_MR_convert;";
			
			x = 33 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 3 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			
			size = 0.5 * GUI_GRID_H;
			
			class Attributes
			{
				font = "PuristaMedium";
				align = "center";
			};
			
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
		};
		class MR_BG_ComboBox: outlw_MR_IGUIBack
		{
			idc = 15000;
			
			x = 4.75 * GUI_GRID_W + GUI_GRID_X;
			y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 13.95 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.35};
		};
		class MR_MagListBox: outlw_MR_RscListBox
		{
			idc = 1500;
			type = 5; // Type 102 (ListNbox) is not draggable in 1.48 - GiPPO
			canDrag = 1;
			columns[] = {0.12,-0.01,0.006,0.83};
			rowHeight = 1.45 * GUI_GRID_H;
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			onLBDrag = "[(((_this select 1) select 0) select 1), (((_this select 1) select 0) select 2), 'list'] call outlw_MR_onDrag;";
			
			x = 4.75 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 13.6 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class MR_MagListBoxArea: outlw_MR_IGUIBack
		{
			idc = 2217;
			onLBDrop = "call outlw_MR_moveToList; true;";
			
			x = 4.75 * GUI_GRID_W + GUI_GRID_X;
			y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 13.95 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
		};
		class MR_MagListCombo: outlw_MR_RscCombo
		{
			idc = 22170;
			onLBSelChanged = "outlw_MR_currentFilter = (_this select 0) lbData ((_this select 1) - 1); call outlw_MR_populateMagListBox;";
			
			x = 4.75 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
			
			sizeEx = 0.75 * GUI_GRID_H;
		};
		class MR_PB_SourceAmmo: outlw_MR_RscControlsGroup
		{
			idc = 2218;
			x = 19.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
			class Controls
			{
				class MR_SourceAmmo: outlw_MR_IGUIBack
				{
					idc = 22180;
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 3 * GUI_GRID_H + GUI_GRID_Y;
					w = 0.5 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					colorBackground[] = {1,1,1,1};
				};
			};
		};
		class MR_PB_TargetAmmo: outlw_MR_RscControlsGroup
		{
			idc = 2219;
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			
			class Controls
			{
				class MR_TargetAmmo: outlw_MR_IGUIBack
				{
					idc = 22190;
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 3 * GUI_GRID_H + GUI_GRID_Y;
					w = 0.5 * GUI_GRID_W;
					h = 3 * GUI_GRID_H;
					colorBackground[] = {1,1,1,1};
				};
			};
		};
		class MR_BG_RepackProgress: outlw_MR_IGUIBack
		{
			idc = 10005;
			
			x = 20.875 * GUI_GRID_W + GUI_GRID_X;
			y = 13.875 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.3125 * GUI_GRID_W;
			h = 1.25 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.9};
		};
		class MR_PB_Repack: outlw_MR_RscControlsGroup
		{
			idc = 10000;
			
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 13 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			class Controls
			{
				class MR_BG_RepackProgress: outlw_MR_IGUIBack
				{
					idc = 10001;
					
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 0 * GUI_GRID_H + GUI_GRID_Y;
					w = 13 * GUI_GRID_W;
					h = 1 * GUI_GRID_H;
					colorBackground[] = {1,1,1,0.2};
				};
				class MR_RepackProgress: outlw_MR_IGUIBack
				{
					idc = 10002;
					
					x = -13 * GUI_GRID_W + GUI_GRID_X;
					y = 0 * GUI_GRID_H + GUI_GRID_Y;
					w = 13 * GUI_GRID_W;
					h = 1 * GUI_GRID_H;
					colorBackground[] = {1,1,1,0.275};
				};
			};
		};
		class MR_RepackingText: outlw_MR_RscText
		{
			idc = 1008;
			text = "";
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class MR_ButtonClose: outlw_MR_RscActiveText
		{
			idc = 2499;
			style = 48;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
			tooltip = "Close";
			action = "closeDialog 0;";
			colorDisabled[] = {0,0,0,0};
			
			x = 35.625 * GUI_GRID_W + GUI_GRID_X;
			y = 2.125 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.76 * GUI_GRID_W;
			h = 0.75 * GUI_GRID_H;
			
			default = 0;
		};
		class MR_ButtonOptions: outlw_MR_RscButtonMenu
		{
			idc = 2400;
			
			text = "$STR_magRepack_options";
			action = "call outlw_MR_optionsMenu;";
			x = 18.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class MR_Options_Border_Top: outlw_MR_IGUIBack
		{
			idc = 8997;

			x = 36.75 * GUI_GRID_W + GUI_GRID_X;
			y = 5.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.25 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_Options_Border_Bottom: outlw_MR_IGUIBack
		{
			idc = 8998;

			x = 36.75 * GUI_GRID_W + GUI_GRID_X;
			y = 13.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.25 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_Options_Border: outlw_MR_IGUIBack
		{
			idc = 8999;

			x = 36.75 * GUI_GRID_W + GUI_GRID_X;
			y = 8.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.25 * GUI_GRID_W;
			h = 4.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class MR_Options_Group: outlw_MR_RscControlsGroup
		{
			idc = 9000;
			
			x = 36.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 0 * GUI_GRID_W;
			h = 6.125 * GUI_GRID_H;
			
			class Controls
			{
				class MR_BG_Options: outlw_MR_IGUIBack
				{
					idc = 9007;

					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 1.125 * GUI_GRID_H + GUI_GRID_Y;
					w = 8 * GUI_GRID_W;
					h = 3.875 * GUI_GRID_H;
					colorBackground[] = {0,0,0,0.675};
				};
				class MR_OptionsTitle: outlw_MR_RscStructuredText
				{
					idc = 9001;

					text = "$STR_magRepack_options2";
					x = 1.75 * GUI_GRID_W + GUI_GRID_X;
					y = 0 * GUI_GRID_H + GUI_GRID_Y;
					w = 6 * GUI_GRID_W;
					h = 0.875 * GUI_GRID_H;
					colorBackground[] = {0,0,0,1};
					
					class Attributes
					{
						align = "right";
						size = "0.875";
					};
				};
				class MR_ButtonOption_Debug: outlw_MR_RscButtonMenu
				{
					idc = 9002;
					text = "$STR_magRepack_debug";
					action = "call outlw_MR_debugSwitch;";
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 1.125 * GUI_GRID_H + GUI_GRID_Y;
					w = 8 * GUI_GRID_W;
					h = 0.875 * GUI_GRID_H;
					
					class Attributes
					{
						size = "0.875";
					};
					
					default = 0;
				};
				class MR_ButtonOption_ShowFull: outlw_MR_RscButtonMenu
				{
					idc = 9004;
					text = "$STR_magRepack_full";
					action = "call outlw_MR_showFullSwitch;";
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 2.125 * GUI_GRID_H + GUI_GRID_Y;
					w = 8 * GUI_GRID_W;
					h = 0.875 * GUI_GRID_H;
					
					class Attributes
					{
						size = "0.875";
					};
					
					default = 0;
				};
				class MR_ButtonOption_Keybindings: outlw_MR_RscButtonMenu
				{
					idc = 9003;
					text = "$STR_magRepack_keybindings";
					action = "call outlw_MR_openKeybindings";
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 3.125 * GUI_GRID_H + GUI_GRID_Y;
					w = 8 * GUI_GRID_W;
					h = 0.875 * GUI_GRID_H;
					
					class Attributes
					{
						size = "0.875";
					};
					
					default = 0;
				};
				class MR_ButtonOption_About: outlw_MR_RscButtonMenu
				{
					idc = 9005;
					text = "$STR_magRepack_about_header";
					action = "call outlw_MR_openAbout";
					x = 0 * GUI_GRID_W + GUI_GRID_X;
					y = 4.125 * GUI_GRID_H + GUI_GRID_Y;
					w = 8 * GUI_GRID_W;
					h = 0.875 * GUI_GRID_H;
					
					class Attributes
					{
						size = "0.875";
					};
					
					default = 0;
				};
				class MR_ButtonOption_Hide: outlw_MR_RscButtonMenu
				{
					idc = 9006;
					text = "$STR_magRepack_hide";
					action = "call outlw_MR_optionsMenu;";
					x = 4.5 * GUI_GRID_W + GUI_GRID_X;
					y = 5.25 * GUI_GRID_H + GUI_GRID_Y;
					w = 3.5 * GUI_GRID_W;
					h = 0.875 * GUI_GRID_H;
					
					class Attributes
					{
						align = "right";
						size = "0.875";
					};
					
					default = 0;
				};
			};
		};	
	};
};








