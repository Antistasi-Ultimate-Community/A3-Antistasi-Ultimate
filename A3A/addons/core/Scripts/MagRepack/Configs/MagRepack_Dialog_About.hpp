
class MagRepack_Dialog_About
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['outlw_MR_Dialog_About', (_this select 0)]";
	
	class Controls
	{
		class A_BG_Main: outlw_MR_IGUIBack
		{
			idc = 2200;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class A_MainTitle: outlw_MR_RscText
		{
			idc = 1000;
			text = "$STR_magRepack_about";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 9.375 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
		};
		class A_ButtonCancel: outlw_MR_RscButtonMenu
		{
			idc = 2400;
			text = "$STR_magRepack_mkay";
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
		class A_BG_MiddleBottom: outlw_MR_IGUIBack
		{
			idc = 2405;
			x = 17.625 * GUI_GRID_W + GUI_GRID_X;
			y = 14.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.7225 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.75};
		};
		class A_BG_LeftBottom: outlw_MR_IGUIBack
		{
			idc = 2401;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 14.625 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			
			colorBackground[] = {0,0,0,0.75};
		};
		class A_Author: outlw_MR_RscText
		{
			idc = 1002;
			text = "$STR_magRepack_author";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.75 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
					
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class A_Version: outlw_MR_RscText
		{
			idc = 1001;
			text = "$STR_magRepack_version";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.55 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
				
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class A_Date: outlw_MR_RscText
		{
			idc = 1003;
			text = "$STR_magRepack_updated";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.35 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
			
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class A_ForumLink: outlw_MR_RscText
		{
			idc = 1004;
			text = "BI Forum URL:";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.15 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class A_ButtonCopy: outlw_MR_RscButtonMenu
		{
			idc = 1005;
			text = "Copy";
			action = "copyToClipboard 'http://forums.bistudio.com/showthread.php?151402-Mag-Repack';";
			x = 16.25 * GUI_GRID_W + GUI_GRID_X;
			y = 13.25 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 0.8 * GUI_GRID_H;
			
			tooltip = "http://forums.bistudio.com/showthread.php?151402-Mag-Repack";
			
			default = 1;
			
			class Attributes
			{
				align = "center";
				size = "0.75";
				valign = "middle";
			};
		};
	};
};
