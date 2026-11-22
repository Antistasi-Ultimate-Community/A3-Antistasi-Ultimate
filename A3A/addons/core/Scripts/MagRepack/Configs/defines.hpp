#ifndef A3A_MAGREPACK_DEFINES_HPP
#define A3A_MAGREPACK_DEFINES_HPP

#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

// Control types
#ifndef CT_STATIC
#define CT_STATIC           0
#endif
#ifndef CT_BUTTON
#define CT_BUTTON           1
#endif
#ifndef CT_EDIT
#define CT_EDIT             2
#endif
#ifndef CT_SLIDER
#define CT_SLIDER           3
#endif
#ifndef CT_COMBO
#define CT_COMBO            4
#endif
#ifndef CT_LISTBOX
#define CT_LISTBOX          5
#endif
#ifndef CT_TOOLBOX
#define CT_TOOLBOX          6
#endif
#ifndef CT_CHECKBOXES
#define CT_CHECKBOXES       7
#endif
#ifndef CT_PROGRESS
#define CT_PROGRESS         8
#endif
#ifndef CT_HTML
#define CT_HTML             9
#endif
#ifndef CT_STATIC_SKEW
#define CT_STATIC_SKEW      10
#endif
#ifndef CT_ACTIVETEXT
#define CT_ACTIVETEXT       11
#endif
#ifndef CT_TREE
#define CT_TREE             12
#endif
#ifndef CT_STRUCTURED_TEXT
#define CT_STRUCTURED_TEXT  13
#endif
#ifndef CT_CONTEXT_MENU
#define CT_CONTEXT_MENU     14
#endif
#ifndef CT_CONTROLS_GROUP
#define CT_CONTROLS_GROUP   15
#endif
#ifndef CT_SHORTCUTBUTTON
#define CT_SHORTCUTBUTTON   16
#endif
#ifndef CT_XKEYDESC
#define CT_XKEYDESC         40
#endif
#ifndef CT_XBUTTON
#define CT_XBUTTON          41
#endif
#ifndef CT_XLISTBOX
#define CT_XLISTBOX         42
#endif
#ifndef CT_XSLIDER
#define CT_XSLIDER          43
#endif
#ifndef CT_XCOMBO
#define CT_XCOMBO           44
#endif
#ifndef CT_ANIMATED_TEXTURE
#define CT_ANIMATED_TEXTURE 45
#endif
#ifndef CT_OBJECT
#define CT_OBJECT           80
#endif
#ifndef CT_OBJECT_ZOOM
#define CT_OBJECT_ZOOM      81
#endif
#ifndef CT_OBJECT_CONTAINER
#define CT_OBJECT_CONTAINER 82
#endif
#ifndef CT_OBJECT_CONT_ANIM
#define CT_OBJECT_CONT_ANIM 83
#endif
#ifndef CT_LINEBREAK
#define CT_LINEBREAK        98
#endif
#ifndef CT_USER
#define CT_USER             99
#endif
#ifndef CT_MAP
#define CT_MAP              100
#endif
#ifndef CT_MAP_MAIN
#define CT_MAP_MAIN         101
#endif
#ifndef CT_LISTNBOX
#define CT_LISTNBOX         102
#endif

// Static styles
#ifndef ST_POS
#define ST_POS            0x0F
#endif
#ifndef ST_HPOS
#define ST_HPOS           0x03
#endif
#ifndef ST_VPOS
#define ST_VPOS           0x0C
#endif
#ifndef ST_LEFT
#define ST_LEFT           0x00
#endif
#ifndef ST_RIGHT
#define ST_RIGHT          0x01
#endif
#ifndef ST_CENTER
#define ST_CENTER         0x02
#endif
#ifndef ST_DOWN
#define ST_DOWN           0x04
#endif
#ifndef ST_UP
#define ST_UP             0x08
#endif
#ifndef ST_VCENTER
#define ST_VCENTER        0x0C
#endif

#ifndef ST_TYPE
#define ST_TYPE           0xF0
#endif
#ifndef ST_SINGLE
#define ST_SINGLE         0x00
#endif
#ifndef ST_MULTI
#define ST_MULTI          0x10
#endif
#ifndef ST_TITLE_BAR
#define ST_TITLE_BAR      0x20
#endif
#ifndef ST_PICTURE
#define ST_PICTURE        0x30
#endif
#ifndef ST_FRAME
#define ST_FRAME          0x40
#endif
#ifndef ST_BACKGROUND
#define ST_BACKGROUND     0x50
#endif
#ifndef ST_GROUP_BOX
#define ST_GROUP_BOX      0x60
#endif
#ifndef ST_GROUP_BOX2
#define ST_GROUP_BOX2     0x70
#endif
#ifndef ST_HUD_BACKGROUND
#define ST_HUD_BACKGROUND 0x80
#endif
#ifndef ST_TILE_PICTURE
#define ST_TILE_PICTURE   0x90
#endif
#ifndef ST_WITH_RECT
#define ST_WITH_RECT      0xA0
#endif
#ifndef ST_LINE
#define ST_LINE           0xB0
#endif

#ifndef ST_SHADOW
#define ST_SHADOW         0x100
#endif
#ifndef ST_NO_RECT
#define ST_NO_RECT        0x200
#endif
#ifndef ST_KEEP_ASPECT_RATIO
#define ST_KEEP_ASPECT_RATIO  0x800
#endif

#ifndef ST_TITLE
#define ST_TITLE          ST_TITLE_BAR + ST_CENTER
#endif

// Slider styles
#ifndef SL_DIR
#define SL_DIR            0x400
#endif
#ifndef SL_VERT
#define SL_VERT           0
#endif
#ifndef SL_HORZ
#define SL_HORZ           0x400
#endif

#ifndef SL_TEXTURES
#define SL_TEXTURES       0x10
#endif

// progress bar 
#ifndef ST_VERTICAL
#define ST_VERTICAL       0x01
#endif
#ifndef ST_HORIZONTAL
#define ST_HORIZONTAL     0
#endif

// Listbox styles
#ifndef LB_TEXTURES
#define LB_TEXTURES       0x10
#endif
#ifndef LB_MULTI
#define LB_MULTI          0x20
#endif

// Tree styles
#ifndef TR_SHOWROOT
#define TR_SHOWROOT       1
#endif
#ifndef TR_AUTOCOLLAPSE
#define TR_AUTOCOLLAPSE   2
#endif

// MessageBox styles
#ifndef MB_BUTTON_OK
#define MB_BUTTON_OK      1
#endif
#ifndef MB_BUTTON_CANCEL
#define MB_BUTTON_CANCEL  2
#endif
#ifndef MB_BUTTON_USER
#define MB_BUTTON_USER    4
#endif

class outlw_MR_RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "PuristaMedium";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
};
class outlw_MR_RscStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1,1,1,1};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 1;
};
class outlw_MR_RscPicture
{
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};
class outlw_MR_RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorBackground[] = {0,0,0,0};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ListScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	style = 16;
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	color[] = {1,1,1,1};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class outlw_MR_RscActiveText
{
	access = 0;
	type = 11;
	color[] = {1,1,1,0.7};
	colorActive[] = {1,1,1,1};
	colorText[] = {1,1,1,0.7};
	soundClick[] = {"",0.1,1};
	soundEnter[] = {"",0.1,1};
	soundEscape[] = {"",0.1,1};
	soundPush[] = {"",0.1,1};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};
class outlw_MR_IGUIBack
{
	type = 0;
	idc = 124;
	style = 128;
	text = "";
	colorText[] = {0,0,0,0};
	font = "PuristaMedium";
	sizeEx = 0;
	shadow = 0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = 
	{
		"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
		"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
	};
};
class outlw_MR_RscButtonMenu
{
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	font = "PuristaMedium";
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
	animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.8)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.8)";
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundFocused[] = {0,0,0,0.8};
	colorBackground[] = {0,0,0,0.8};
	colorBackground2[] = {1,1,1,0.5};
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.09,
		1
	};
};
class outlw_MR_RscControlsGroup
{
	class VScrollbar
	{
		color[] = {1,1,1,0};
		width = 0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		shadow = 0;
	};
	class HScrollbar
	{
		color[] = {1,1,1,0};
		height = 0;
		shadow = 0;
	};
	class ScrollBar
	{
		color[] = {1,1,1,0};
		colorActive[] = {1,1,1,0};
		colorDisabled[] = {1,1,1,0};
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
};
class outlw_MR_RscCombo
{
	access = 0;
	type = 4;
	colorSelect[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,1};
	colorScrollbar[] = {1,0,0,1};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] = 
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	maxHistoryDelay = 1;
	class ComboScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	style = "0x10 + 0x200";
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = {1,1,1,0.7};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};




#endif
