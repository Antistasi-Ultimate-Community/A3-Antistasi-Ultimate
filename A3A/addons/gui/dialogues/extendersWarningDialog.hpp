#include "\x\A3A\addons\scrt\defines.hpp"

class GVAR(headerBase): headerBase {
	fade = 0;
	colorBackground[] = {0,0,0,0.8};
};

class GVAR(ButtonBase): ButtonBase {
	fade = 0;
};

class GVAR(RscText): RscText {
	UI_FONT_DEFAULT;
};

/* #Guhuca
$[
	1.063,
	["antistasi_extenders_warning_dialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],2,1,1],
	[-1000,"StaticTitle",[1,"ANTISTASI ULTIMATE SETUP - EXTENDERS COMPATIBILITY NOTICE",["0.257656 * safezoneW + safezoneX","0.192 * safezoneH + safezoneY","0.500156 * safezoneW","0.033 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["moving = 1;"]],
	[-1002,"StaticBackground",[1,"",["0.257656 * safezoneW + safezoneX","0.225 * safezoneH + safezoneY","0.500156 * safezoneW","0.55 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.8],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"StaticTextWarning",[1,"WARNING: You have loaded extenders. Some of them failed the compatibility check to this version of Antistasi Ultimate.",["0.262812 * safezoneW + safezoneX","0.236 * safezoneH + safezoneY","0.489844 * safezoneW","0.11 * safezoneH"],[0.8,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["style = QUOTE(ST_CENTER + ST_MULTI);"]],
	[1500,"ListExtenders",[1,"",["0.262812 * safezoneW + safezoneX","0.357 * safezoneH + safezoneY","0.489844 * safezoneW","0.264 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["type = CT_LISTNBOX;","idcLeft = -1;","idcRight = -1;","drawSideArrows = 0;","UI_FONT_DEFAULT;"]],
	[2800,"CheckConfirm",[1,"",["0.262812 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.0257812 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"LabelConfirm",[1,"I understand and I know what I am doing; let me continue setting up the game.",["0.288594 * safezoneW + safezoneX","0.654 * safezoneH + safezoneY","0.458906 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["color[] = GUI_TEXT_COLOR;","colorActive[] = GUI_TEXT_COLOR;","colorBackground[] = {0, 0, 0, 0};","colorBackgroundActive[] = {0, 0, 0, 0};","colorBorder[] = {0, 0, 0, 0};","colorFocused[] = {0, 0, 0, 0};","colorShadow[] = {0, 0, 0, 0};","colorText[] = GUI_TEXT_COLOR;","style = QUOTE(ST_LEFT);","UI_FONT_DEFAULT;"]],
	[1601,"BtnContinue",[1,"Continue",["0.45875 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.0825 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

// Replace attributes:
//  Search: (^\s*(?:sizeEx|[xywh])) = ([^;]+)
//  Replace: $1 = QUOTE($2)
// Text:
//  Search: (^\s*(?:text|tooltip))\s*=\s*[$]STR_A3_([^;]+)
//  Replace: $1 = QUOTE($STR_$2)

class GVAR(ExtendersWarningDialog) {
	idd = IDD_ANTISTASI_EXTENDERS_WARNING_DIALOG;
    onLoad = QUOTE(call FUNCMAIN(onExtendersWarningDialogLoad));
    onUnload = QUOTE(call FUNCMAIN(onExtendersWarningDialogUnload));
    movingEnable = 1;

    class Controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by goreSplatter, v1.063, #Guhuca)
		////////////////////////////////////////////////////////

		class StaticTitle: GVAR(headerBase)
		{
			moving = 1;

			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_STATICTITLE;
			text = QUOTE($STR_antistasi_extenders_warning_dialog_StaticTitle);
			x = QUOTE(0.257656 * safezoneW + safezoneX);
			y = QUOTE(0.192 * safezoneH + safezoneY);
			w = QUOTE(0.500156 * safezoneW);
			h = QUOTE(0.033 * safezoneH);
		};
		class StaticBackground: GVAR(RscText)
		{
			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_STATICBACKGROUND;
			x = QUOTE(0.257656 * safezoneW + safezoneX);
			y = QUOTE(0.225 * safezoneH + safezoneY);
			w = QUOTE(0.500156 * safezoneW);
			h = QUOTE(0.55 * safezoneH);
			colorBackground[] = {0,0,0,0.8};
		};
		class StaticTextWarning: GVAR(RscText)
		{
			style = QUOTE(ST_CENTER + ST_MULTI);

			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_STATICTEXTWARNING;
			text = QUOTE($STR_antistasi_extenders_warning_dialog_StaticTextWarning);
			x = QUOTE(0.262812 * safezoneW + safezoneX);
			y = QUOTE(0.236 * safezoneH + safezoneY);
			w = QUOTE(0.489844 * safezoneW);
			h = QUOTE(0.11 * safezoneH);
			colorText[] = {0.8,0,0,1};
		};
		class ListExtenders: RscListbox
		{
			type = CT_LISTNBOX;
			idcLeft = -1;
			idcRight = -1;
			drawSideArrows = 0;
			UI_FONT_DEFAULT;

			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_LISTEXTENDERS;
			x = QUOTE(0.262812 * safezoneW + safezoneX);
			y = QUOTE(0.357 * safezoneH + safezoneY);
			w = QUOTE(0.489844 * safezoneW);
			h = QUOTE(0.264 * safezoneH);
		};
		class CheckConfirm: RscCheckbox
		{
			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_CHECKCONFIRM;
			x = QUOTE(0.262812 * safezoneW + safezoneX);
			y = QUOTE(0.654 * safezoneH + safezoneY);
			w = QUOTE(0.0257812 * safezoneW);
			h = QUOTE(0.044 * safezoneH);
		};
		class LabelConfirm: RscButton
		{
			color[] = GUI_TEXT_COLOR;
			colorActive[] = GUI_TEXT_COLOR;
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			colorBorder[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			colorShadow[] = {0, 0, 0, 0};
			colorText[] = GUI_TEXT_COLOR;
			style = QUOTE(ST_LEFT);
			UI_FONT_DEFAULT;

			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_LABELCONFIRM;
			text = QUOTE($STR_antistasi_extenders_warning_dialog_LabelConfirm);
			x = QUOTE(0.288594 * safezoneW + safezoneX);
			y = QUOTE(0.654 * safezoneH + safezoneY);
			w = QUOTE(0.458906 * safezoneW);
			h = QUOTE(0.044 * safezoneH);
		};
		class BtnContinue: GVAR(ButtonBase)
		{
			idc = IDC_ANTISTASI_EXTENDERS_WARNING_DIALOG_BTNCONTINUE;
			text = QUOTE($STR_antistasi_extenders_warning_dialog_BtnContinue);
			x = QUOTE(0.45875 * safezoneW + safezoneX);
			y = QUOTE(0.709 * safezoneH + safezoneY);
			w = QUOTE(0.0825 * safezoneW);
			h = QUOTE(0.044 * safezoneH);
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
    };
};
