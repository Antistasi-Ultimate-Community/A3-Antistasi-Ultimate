
#include "..\..\..\script_component.hpp"

class MagRepack_Dialog_Keybindings
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['outlw_MR_Dialog_Keybindings', (_this select 0)]";
	onUnload = "outlw_MR_keybindingMenuActive = false;";
	onKeyDown = "_this call outlw_KB_keyDown;";
	onKeyUp = "_this call outlw_KB_keyUp;";
	
	class Controls
	{
		class KB_BG_Main: outlw_MR_IGUIBack
		{
			idc = 2200;
			
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class KB_MainTitle: outlw_MR_RscText
		{
			idc = 1000;
			text = "$STR_magRepack_keybinds";
			
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
		};
		class KB_ButtonCancel: outlw_MR_RscButtonMenu
		{
			idc = 2400;
			text = "$STR_magRepack_cancel";
			action = "closeDialog 0";
			
			x = 22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			default = 0;
			
			class Attributes
			{
				align = "right";
			};
		};
		class KB_BG_MiddleBottom: outlw_MR_IGUIBack
		{
			idc = 2405;
			
			x = 17.625 * GUI_GRID_W + GUI_GRID_X;
			y = 14.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.7225 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class KB_ButtonApply: outlw_MR_RscButtonMenu
		{
			idc = 2401;
			text = "$STR_magRepack_apply";
			action = "[[outlw_KB_cShift, outlw_KB_cCtrl, outlw_KB_cAlt, outlw_KB_cKey]] call outlw_MR_applyKeybinding;";
			
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 14.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			default = 0;
		};
		class KB_BG_Keybinding: outlw_MR_IGUIBack
		{
			idc = 2498;
			
			x = 20.125 * GUI_GRID_W + GUI_GRID_X;
			y = 11.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;

			colorBackground[] = {1,1,1,0.25};
		};
		class KB_Keybinding: outlw_MR_RscStructuredText
		{
			idc = 2499;
			text = "";
			
			x = 20.125 * GUI_GRID_W + GUI_GRID_X;
			y = 11.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			colorBackground[] = {0,0,0,0};
			
			class Attributes
			{
				align = "center";
				valign = "middle";
				size = 0.8;
			};
		};
		class KB_BG_Shift: outlw_MR_IGUIBack
		{
			idc = 2500;
			
			x = 20.125 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.875 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;

			colorBackground[] = {0,0,0,0.8};
		};
		class KB_BG_Ctrl: outlw_MR_IGUIBack
		{
			idc = 2501;
			
			x = 23.1875 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.75 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;

			colorBackground[] = {0,0,0,0.8};
		};
		class KB_BG_Alt: outlw_MR_IGUIBack
		{
			idc = 2502;
			
			x = 26.1875 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.875 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;

			colorBackground[] = {0,0,0,0.8};
		};
		class KB_ButtonShift: outlw_MR_RscButtonMenu
		{
			idc = 2550;
			text = "Shift";
			
			action = "[0] call outlw_KB_modifierSwitch;";
			
			x = 20.125 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.875 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			colorFocused[] = {1,1,1,0.5};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {1,1,1,0.5};
			
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
			
			class Attributes
			{
				align = "center";
				size = "0.875";
			};
		};
		class KB_ButtonCtrl: outlw_MR_RscButtonMenu
		{
			idc = 2551;
			text = "Ctrl";
			
			action = "[1] call outlw_KB_modifierSwitch;";
			
			x = 23.1875 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.75 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			colorFocused[] = {1,1,1,0.5};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {1,1,1,0.5};
			
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
			
			class Attributes
			{
				align = "center";
				size = "0.875";
			};
		};
		class KB_ButtonAlt: outlw_MR_RscButtonMenu
		{
			idc = 2552;
			text = "Alt";
			
			action = "[2] call outlw_KB_modifierSwitch;";
			
			x = 26.1875 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 2.875 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			colorFocused[] = {1,1,1,0.5};
			colorBackgroundFocused[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackground2[] = {1,1,1,0.5};
			
			textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0)";
			
			class Attributes
			{
				align = "center";
				size = "0.875";
			};
		};
		class KB_BG_KeyDescription: outlw_MR_RscPicture
		{
			idc = 2570;
			text = QPATHTOFOLDER(Scripts\MagRepack\Images\MR_TargetGradient.paa);
			
			x = 10.875 * GUI_GRID_W + GUI_GRID_X;
			y = 11.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class KB_BG_ModDescription: outlw_MR_RscPicture
		{
			idc = 2571;
			text = QPATHTOFOLDER(Scripts\MagRepack\Images\MR_TargetGradient.paa);
			
			x = 10.875 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class KB_KeyDescription: outlw_MR_RscStructuredText
		{
			idc = 2572;
			text = "$STR_magRepack_keybinds";
			
			x = 10.875 * GUI_GRID_W + GUI_GRID_X;
			y = 11.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			class Attributes
			{
				align = "right";
			};
		};
		class KB_ModDescription: outlw_MR_RscStructuredText
		{
			idc = 2573;
			text = "$STR_magRepack_modifiers";
			
			x = 10.875 * GUI_GRID_W + GUI_GRID_X;
			y = 12.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			class Attributes
			{
				align = "right";
			};
		};
	};
};








