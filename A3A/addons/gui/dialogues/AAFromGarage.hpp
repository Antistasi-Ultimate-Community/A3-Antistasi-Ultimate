class A3A_StaticAAFromGarageDisplay : A3A_GARAGEDialog
{
	idd = A3A_IDD_DISPLAYGARAGEVEHICLES;
	onLoad = "[""Static""] call A3A_fnc_ui_StaticsAAFromGarage";
	onUnload = "['onUnload'] call A3A_fnc_ui_StaticsAAFromGarage";
    //onLoad = "[""Static"", ""AA""] call A3A_fnc_ui_StaticsFromGarage";
    //onUnload = "[""onUnload"", ""AA""] call A3A_fnc_ui_StaticsFromGarage";
	
	class Controls
    {
    
        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAINDIALOGTABBUTTONS;
            x = -32 * GRID_W;
            y = DIALOG_Y - 36 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
				class VehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_garage_light;
                    onButtonClick = "[""Static""] call A3A_fnc_ui_StaticsAAFromGarage";
                    //onButtonClick = "[""Static"", ""AA""] call A3A_fnc_ui_StaticsFromGarage";
                    x = 0 * GRID_W;
                    y = 0;
                    w = 142 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

		class GARAGE_ListCars//HR_GRG_RscListbox
		{
			idc = A3A_IDC_GARAGE_CATCAR;
            x = -62.6 * GRID_W;
            y = DIALOG_Y - 36 * GRID_H;
            w = 30.6 * GRID_W;
            h = 100 * GRID_H; // Screen height - title and buttons height
            size = TEXT_SIZE_MEDIUM;
            rowHeight = 3 * GRID_NOUISCALE_H;
		    access = 0;
		    type = CT_LISTBOX;
		    style = 0;
		    font = "PuristaMedium";
		    sizeEx = "safeZoneW / safeZoneH min 1.2 / 1.2 / 25";
		    //rowHeight = 0;
		    colorText[] = {1,1,1,1};
		    colorScrollbar[] = {0.34,0.34,0.34,1};
		    colorSelect[] = {1,1,1,0.75};
		    colorSelect2[] = {0.85,0.85,0.55,0.75};
		    colorSelectBackground[] = {0.53,0.53,0.53,0.75};
		    colorSelectBackground2[] = {0.23,0.23,0.23,0.55};
		    colorBackground[] = {0.23,0.23,0.23,0.55};
		    colorDisabled[] = {0,0,0,0};
		    maxHistoryDelay = 1.0;
		    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
		    period = 1;
		    autoScrollSpeed = -1;
		    autoScrollDelay = 5;
		    autoScrollRewind = 0;
		    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		    shadow = 0;
		    class ListScrollBar
		    {
		        color[] = {0.1,0.1,0.1,1};
		        colorActive[] = {0.1,0.1,0.1,1};
		        colorDisabled[] = {0.74,0.74,0.74,0.15};
		        thumb = "#(argb,8,8,3)color(1,1,1,1)";
		        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		        border = "#(argb,8,8,3)color(1,1,1,1)";
		        shadow = 0;
		    };
		};

		class GARAGE_StructuredText : A3A_Text
		{
		    idc = A3A_IDC_GARAGEStructuredText;
		    x = -62.6 * GRID_W;
            y = DIALOG_Y + 64 * GRID_H;
            w = 213.6 * GRID_W;
            h = 16 * GRID_H; // Screen height - title and buttons height
		    text = "";
		    font = "RobotoCondensed";
		    SizeEx = GRID_H * 3;
		    shadow = 0;
		    fixedWidth = 0;
		    linespacing = 1;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
			
		    colorText[] = A3A_COLOR_TEXT;
		    colorShadow[] = A3A_COLOR_SHADOW;
		    colorBackground[] = {0.23,0.23,0.23,0.55};
		};

        class info : A3A_StructuredText
	    {
            idc = A3A_IDC_GARAGEinfo;
            type = CT_STRUCTURED_TEXT;
            x = 110 * GRID_W;
            y = DIALOG_Y - 36 * GRID_H;
            w = 41 * GRID_W;
            h = 100 * GRID_H; // Screen height - title and buttons height
	    	text = "";
	    	id = "detail_info";
	    	textSize = GUI_GRID_H * 0.7;
	    	font = "PuristaMedium";
	    	heightType = ZUI_SIZE_TEXT;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
            SizeEx = GRID_H * 1.2;
            linespacing = 1;

            colorText[] = A3A_COLOR_TEXT;
		    colorShadow[] = A3A_COLOR_SHADOW;
		    colorBackground[] = {0.23,0.23,0.23,0.55};
            class Attributes
		    {
		        font = "PuristaMedium";
		        color = "#FFFFFF";
		        align = "left";
		        valign = "middle";
		        shadow = false;
		        shadowColor = "#F5F5F5";
		        size = "0.7";
                scrollable = 1;
	            padding = GUI_SPACING;
		    };
	    };

        class GARAGE_undercoverIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEundercoverIcon;
            x = -32 * GRID_W;
            y = DIALOG_Y + 59 * GRID_H;
            w = 5 * GRID_W;
            h = 5 * GRID_H;
            tooltip = $STR_antistasi_dialogs_buy_vehicle_undercover_tooltip;
		};

        class GARAGE_selectbutton : A3A_Button
        {
            idc = A3A_IDC_GARAGEselectbutton;
            text = $STR_antistasi_dialogs_vehicle_tab_select;
            x = -32 * GRID_W;
            y = DIALOG_Y + 59 * GRID_H;
            w = 35 * GRID_W;
            h = 5 * GRID_H;
        };

        // Origins Panel
        class HR_GRG_OriginslWrapper
        {
            idc = -1;
            deletable = 1;
            type = CT_CONTROLS_GROUP;
            x = 60 * GRID_W;
            y = DIALOG_Y + 57 * GRID_H;
            w = 50 * GRID_W;
            h = 7 * GRID_H;
            size = GRID_H * 5;
            style = ST_MULTI;
            shadow = 0;
            fade = 0;

            class VScrollbar
            {
                color[] = {1,1,1,1};
                colorActive[] = {0.23,0.23,0.23,0.55};
                colorDisabled[] = {0.23,0.23,0.23,0.55};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
                shadow = 0;
                scrollSpeed = 0.06;
                width = 0.02;
                height = 0;
                autoScrollEnabled = 1;
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
            };
            class HScrollbar
            {
                color[] = {1,1,1,1};
                colorActive[] = {0.23,0.23,0.23,0.55};
                colorDisabled[] = {0.23,0.23,0.23,0.55};
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
                shadow = 0;
                scrollSpeed = 0.06;
                width = 0;
                height = 0.02;
                autoScrollEnabled = 0;
                autoScrollSpeed = -1;
                autoScrollDelay = 5;
                autoScrollRewind = 0;
            };
            class controls
            {
                class HR_GRG_OriginsPanel
                {
                    idc = HR_GRG_IDC_OriginsPanel;
                    type = CT_STRUCTURED_TEXT;
                    style = ST_LEFT;
                    colorBackground[]= {0.23,0.23,0.23,0.55};
                    x = 0;
                    y = 0;
                    w = 50 * GRID_W;
                    h = 7 * GRID_H;
                    size = GRID_H * 5;
                    text = "";
                    class Attributes
                    {
                        font = "PuristaMedium";
                        color = "#FFFFFF";
                        align = "left";
                        valign = "middle";
                        shadow = false;
                        shadowColor = "#F5F5F5";
                        size = "1";
                    };
                };
            };
        };

        class CloseButton : A3A_CloseButton
        {
            idc = -1;
            x = 105 * GRID_W;
            y = DIALOG_Y - 30 * GRID_H;
            tooltip = $STR_antistasi_arsenal_limits_dialog_close;
        };
    };
};