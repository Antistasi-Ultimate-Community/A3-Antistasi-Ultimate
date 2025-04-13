// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_STRUCTURED_TEXT  13
#define CT_SHORTCUTBUTTON   16
#define CT_XSLIDER          43

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Slider styles
#define SL_DIR                0x400
#define SL_VERT               0
#define SL_HORZ               0x400
#define SL_TEXTURES           0x10

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

#define GRID_TYPE pixelGridNoUIScale
#define GRID_SCALE 2
#define SCALE_FACTOR getNumber (configFile >> "uiScaleFactor")

#define GRID_XX(gridType, gridScale, n) (pixelW * gridType * (((n) * (gridScale)) / SCALE_FACTOR))
#define GRID_YY(gridType, gridScale, n) (pixelH * gridType * (((n) * (gridScale)) / SCALE_FACTOR))

#define GRID_X(n) (pixelW * GRID_TYPE * (((n) * (GRID_SCALE)) / SCALE_FACTOR))
#define GRID_Y(n) (pixelH * GRID_TYPE * (((n) * (GRID_SCALE)) / SCALE_FACTOR))


#define FONT(n) (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * n) //(1.5 * pixelH * GRID_TYPE * n) 
#define SIZE(n) (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * n) //(1.5 * pixelH * GRID_TYPE * n) 
#define CENTER(PARENT, CHILD) ((PARENT / 2) - (CHILD / 2))
#define CENTER_GRID_X(PARENT, CHILD) ((PARENT / 2) - GRID_X(CHILD / 2))
#define CENTER_GRID_Y(PARENT, CHILD) ((PARENT / 2) - GRID_Y(CHILD / 2))


// General size MACROS
#define STORE_W (160)
#define DIALOG_W (183)
#define DIALOG_H (100)
#define DIALOG_X (safeZoneX + CENTER_GRID_X(safeZoneW, STORE_W)) //(safeZoneW / 2) - GRID_X(STORE_W/2))
#define DIALOG_Y (safeZoneY + CENTER_GRID_Y(safeZoneH, DIALOG_H)) //(safeZoneH / 2) - GRID_Y(DIALOG_H/2))

#define STORE_H (DIALOG_H)
#define BUFFER_W 2
#define BUFFER_H 2

#define SPACE_W2 0.5
#define SPACE_H2 0.5
#define SPACE_W 1
#define SPACE_H 1

// Title Bar
#define FUNDS_W (20)
#define FUNDS_H (BAR_H)
#define FUNDS_X (STORE_W - BAR_W - FUNDS_W)

// Item Selection
#define BAR_W 3
#define BAR_H 3
#define COMBO_W 88
#define CARGO_W 44
#define LIST_W (COMBO_W + SPACE_W*4 + BAR_W*4)
#define LIST_H (STORE_H - (BAR_H*2 + SPACE_H2*3 + SPACE_H)) 
#define LIST_Y (BAR_H + SPACE_H2)

// Selected Item 
#define ITEM_W 54
#define ITEM_X (SPACE_W2 + LIST_W + SPACE_W)
#define ITEM_Y (BAR_H*2 + SPACE_H2*4)
#define PIC_H 21

// Trader/Purchase information
#define TRADER_W (DIALOG_W - STORE_W)
#define TRADER_H (DIALOG_H)
#define TRADER_Y (DIALOG_Y + GRID_Y(BAR_H + SPACE_H/*BAR_H*2 + SPACE_H*3*/))
#define TRADER_X (DIALOG_X + GRID_X(STORE_W + SPACE_W))
#define TRADER_PIC_H 21

// Default grid
#define GUI_GRID_WAbs		((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_HAbs		(GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W			(GUI_GRID_WAbs / 40)
#define GUI_GRID_H			(GUI_GRID_HAbs / 25)
#define GUI_GRID_X			(safezoneX)
#define GUI_GRID_Y			(safezoneY + safezoneH - GUI_GRID_HAbs)

// Default text sizes
#define GUI_TEXT_SIZE_SMALL		(GUI_GRID_H * 0.8)
#define GUI_TEXT_SIZE_MEDIUM	(GUI_GRID_H * 1)
#define GUI_TEXT_SIZE_LARGE		(GUI_GRID_H * 1.2)

// Pixel grid
#define pixelScale	0.50
#define GRID_W (pixelW * pixelGrid * pixelScale)
#define GRID_H (pixelH * pixelGrid * pixelScale)

// Base grid calculations
#define pixelGrid (pixelW * 2)

// Dialog position
#define DIALOG_W 80  // Total width in grid cells
#define DIALOG_H 50  // Total height in grid cells
#define DIALOG_X (safeZoneX + (safeZoneW - GRID_X(DIALOG_W))/2)
#define DIALOG_Y (safeZoneY + (safeZoneH - GRID_Y(DIALOG_H))/2)

#define A3A_COLOR_TOOLTIP_TEXT {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BOX {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BACKGROUND {0,0,0,0.65}

#define FONT_SIZE_SMALL (0.04 * GUI_GRID_H)
#define FONT_SIZE_MEDIUM (0.05 * GUI_GRID_H)
#define FONT_SIZE_LARGE (0.06 * GUI_GRID_H)

////////////
// COLORS //
////////////

// Background
#define A3A_COLOR_BACKGROUND {0.2,0.2,0.2,0.75}

#ifndef GUI_BCG_COLOR
    #include "\a3\ui_f\hpp\definecommoncolors.inc"
#endif

// Titlebar background
#define A3A_COLOR_TITLEBAR_BACKGROUND GUI_BCG_COLOR

// Tabs Background
#define A3A_COLOR_TABS_BACKGROUND {0.2,0.2,0.2,0.9}

// Default text
#define A3A_COLOR_TEXT {1,1,1,1}

// Darker text
#define A3A_COLOR_TEXT_DARKER {0.7,0.7,0.7,1}
#define A3A_COLOR_TEXT_DARKER_SQF [0.7,0.7,0.7,1]

// Active elements ("selection color")
#define A3A_COLOR_ACTIVE {0.95,0.95,0.95,1}

// Shadows / Outlines
#define A3A_COLOR_SHADOW {0,0,0,0.5}

// Transparent, defined explicitly for readability
#define A3A_COLOR_TRANSPARENT {0,0,0,0}

// Other useful colors
#define A3A_COLOR_BLACK {0,0,0,1}
#define A3A_COLOR_WHITE {1,1,1,1}

// Tooltips
#define A3A_COLOR_TOOLTIP_TEXT {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BOX {1,1,1,1}
#define A3A_COLOR_TOOLTIP_BACKGROUND {0,0,0,0.65}

// Buttons
#define A3A_COLOR_BUTTON_TEXT A3A_COLOR_TEXT
#define A3A_COLOR_BUTTON_TEXT_DISABLED {1,1,1,0.25}
#define A3A_COLOR_BUTTON_BACKGROUND {0,0,0,1}
#define A3A_COLOR_BUTTON_BACKGROUND_DISABLED {0,0,0,0.5}
#define A3A_COLOR_BUTTON_ACTIVE A3A_COLOR_TITLEBAR_BACKGROUND
#define A3A_COLOR_BUTTON_FOCUSED A3A_COLOR_TITLEBAR_BACKGROUND

// Map select marker
#define A3A_COLOR_SELECT_MARKER {1,1,1,0.75}

// Commander display
#define A3A_COLOR_COMMANDER {1,0.9,0.5,1}
#define A3A_COLOR_ELIGIBLE {0.7,0.7,0.7,1}
#define A3A_COLOR_INELIGIBLE {0.5,0.5,0.5,1}


///////////
// FONTS //
///////////

#define A3A_DEFAULT_FONT "RobotoCondensed"
#define A3A_BUTTON_FONT "PuristaLight"
#define A3A_TITLEBAR_FONT "PuristaMedium"
#define A3A_NOTIFICATION_FONT "PuristaSemiBold"

#define CENTER_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_Y ((getResolution select 3) * 0.5 * pixelH)

#define A3A_COLOR_TITLEBAR_TEXT {1,1,1,1}


class ScrollBar {
	color[] = {1, 1, 1, 0.6};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};

class A3A_CtrlDefault
{
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    access = 0;
    deletable = 0;
    fade = 0;
    default = 0;
    blinkingPeriod = 0;

    x = 0;
    y = 0;
    w = 0;
    h = 0;

    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorText[] = A3A_COLOR_TOOLTIP_TEXT;
    tooltipColorBox[] = A3A_COLOR_TOOLTIP_BOX;
    tooltipColorShade[] = A3A_COLOR_TOOLTIP_BACKGROUND;

    class ScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1,1,1,1};
    };
};

class A3A_Text : A3A_CtrlDefault
{
    w = 20 * GRID_W;
    h = 4 * GRID_H;
    text = "";
    font = "RobotoCondensed";
    SizeEx = 0.04;
    shadow = 0;
    fixedWidth = 0;
    linespacing = 1;

    colorText[] = A3A_COLOR_TEXT;
    colorShadow[] = A3A_COLOR_SHADOW;
    colorBackground[] = A3A_COLOR_TRANSPARENT;
};

class A3A_StructuredText : A3A_Text
{
    type = CT_STRUCTURED_TEXT;
    size = 0.08;
};

class A3A_Background : A3A_Text
{
    colorText[] = A3A_COLOR_TRANSPARENT;
    colorBackground[] = A3A_COLOR_BACKGROUND;
};

class A3A_Listbox : A3A_Text
{
    type = CT_LISTBOX;
    style = LB_TEXTURES;

    rowHeight = 0.08;
    itemSpacing = 0;
    maxHistoryDelay = 1;
    period = 1;
    canDrag = 0;

    colorBackground[] = A3A_COLOR_BACKGROUND;
    colorSelectBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
    colorSelectBackground2[] = A3A_COLOR_TITLEBAR_BACKGROUND;
    colorShadow[] = A3A_COLOR_SHADOW;
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED;
    colorText[] = A3A_COLOR_TEXT;
    colorSelect[] = A3A_COLOR_TEXT;
    colorSelect2[] = A3A_COLOR_TEXT;
    colorTextRight[] = A3A_COLOR_TEXT;
    colorSelectRight[] = A3A_COLOR_TEXT;
    colorSelect2Right[] = A3A_COLOR_TEXT;

    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};

    soundSelect[] =
    {
        "\A3\ui_f\data\sound\RscListbox\soundSelect",
        0.09,
        1
    };

    // Intentionally empty, gets it's style from A3A_CtrlDefault/Scrollbar
    class ListScrollBar: ScrollBar {
        width = 1 * GRID_W; // Явное задание размера
        color[] = {1,1,1,0.6};
        autoScrollEnabled = 1;
    };
};

class A3A_Picture : A3A_CtrlDefault
{
    style = ST_PICTURE;
    w = 16 * GRID_W;
    h = 16 * GRID_H;
    text = "";
    font = "TahomaB";
    sizeEx = 0;
    colorText[] = A3A_COLOR_WHITE; // Controls tint when used on pictures
    colorBackground[] = A3A_COLOR_TRANSPARENT;
    shadow = 0;
    fixedWidth = 0;
    lineSpacing = 0;
};

class A3A_ShortcutButton : A3A_CtrlDefault
{
    type = CT_SHORTCUTBUTTON;
    style = ST_CENTER + ST_UPPERCASE;
    default = false;
    w = GRID_W * 20;
    h = GRID_H * 6;

    text = "";
    font = "PuristaLight";
    size = 0.08;
    sizeEx = 0.08;

    textSecondary = "";
    fontSecondary = "PuristaLight";
    sizeExSecondary = 0.08;

    url = "";
    // shortcuts[] = {'test'};

    // Colors

    // Text
    color[] = A3A_COLOR_BUTTON_TEXT; // Normal
    color2[] = A3A_COLOR_BUTTON_TEXT; // Blinking
    colorFocused[] = A3A_COLOR_BUTTON_TEXT; // Focused (selected with keyboard?)
    colorDisabled[] = A3A_COLOR_BUTTON_TEXT_DISABLED; // Disabled

    // TextSecondary
    colorSecondary[] = A3A_COLOR_BUTTON_TEXT; // Normal
    color2Secondary[] = A3A_COLOR_BUTTON_TEXT; // Blinking
    colorFocusedSecondary[] = A3A_COLOR_BUTTON_TEXT; // Focused
    colorDisabledSecondary[] = A3A_COLOR_BUTTON_TEXT_DISABLED; // Disabled

    // Background
    colorBackground[] = A3A_COLOR_BUTTON_BACKGROUND; // Normal background, or pressed ? gets way darker for some reason
    colorBackground2[] = A3A_COLOR_BUTTON_BACKGROUND; // Blinking background
    colorBackgroundFocused[] = A3A_COLOR_BUTTON_BACKGROUND; // Focused

    // Hack to get around blinking and remaining focus colors
    onMouseEnter = "_this#0 ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13]), (profilenamespace getvariable ['GUI_BCG_RGB_G',0.54]), (profilenamespace getvariable ['GUI_BCG_RGB_B',0.21]), (profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])];";
    onMouseExit = "_this#0 ctrlSetBackgroundColor [0,0,0,1];";

    animTextureDefault = "#(argb,1,1,1)color(0,0,0,1)";
    animTextureNormal = "#(argb,1,1,1)color(0,0,0,1)";
    animTextureDisabled = "#(argb,1,1,1)color(1,1,1,0.5)";
    animTextureOver = "#(argb,1,1,1)color(1,1,1,1)";
    animTextureFocused = "#(argb,1,1,1)color(1,1,1,1)";
    animTexturePressed = "#(argb,1,1,1)color(1,1,1,1)";

    textureNoShortcut = "#(argb,1,1,1)color(0,0,0,0)"; // Used to put images on the button

    period = 0;
    periodFocus = 0;
    periodOver = 0;

    shadow = 0;

    // Sounds
    soundEnter[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };

    class HitZone
    {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };

    class TextPos // Defaults for 0.08, change if using other sizes
    {
        left = 2 * GRID_W;
        right = 2 * GRID_W;
        top = 2 * GRID_H;
        bottom = 2 * GRID_H;
    };

    class ShortcutPos // Used for positioning images on the button
    {
        left = 0;
        top = 0;
        w = 0;
        h = 0;
    };

    class Attributes
    {
        font = "PuristaLight";
        color = "#FFFFFF";
        align = "center";
        shadow = "false";
    };

    class AttributesImage
    {
        font = "PuristaLight";
        color = "#FFFFFF";
        align = "center";
    };
};

class A3A_ScrollBar
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class A3A_Progress : A3A_CtrlDefault
{
    type = CT_PROGRESS;
    style = ST_HORIZONTAL;
    colorBackground[] = A3A_COLOR_BACKGROUND;
    colorFrame[] = {0,0,0,1};
    colorBar[] = A3A_COLOR_TEXT;
    texture = "";// "#(argb,8,8,3)color(1,1,1,1)";
};

class A3A_Slider : A3A_CtrlDefault
{
    type = CT_XSLIDER;
    style = SL_HORZ;
    color[] = {1,1,1,1};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    sliderRange[] = {0,1};
    sliderPosition = 1;
    lineSize = 0.1;
    arrowEmpty = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowEmpty_ca.paa";
    arrowFull = "\a3\3DEN\Data\Controls\CtrlXSlider\arrowFull_ca.paa";
    border = "\a3\3DEN\Data\Controls\CtrlXSlider\border_ca.paa";
    thumb = "\a3\3DEN\Data\Controls\CtrlXSlider\thumb_ca.paa";

    onCanDestroy = "";
    onDestroy = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onSliderPosChanged = "";
};

////////////////////
// ControlsGroups //
////////////////////

class A3A_DefaultDialog
{
    idd = -1;

    class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class Background : A3A_Background
        {
            x = DIALOG_X;
            y = DIALOG_Y;
            w = DIALOG_W * GRID_W;
            h = DIALOG_H * GRID_H;
        };
    };
};