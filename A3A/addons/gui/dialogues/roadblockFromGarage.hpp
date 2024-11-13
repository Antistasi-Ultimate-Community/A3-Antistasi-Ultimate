class A3A_VehiclesFromGarageDisplay : A3A_GARAGEDialog
{
	idd = A3A_IDD_DISPLAYGARAGEVEHICLES;
	onLoad = "[""light""] call A3A_fnc_ui_roadblockFromGarage";
	onUnload = "['onUnload'] call A3A_fnc_ui_outpostVehicleFromGarageDialog";
	
	class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_buy_vehicle_titlebar;
            x = DIALOG_X;
            y = DIALOG_Y - 30 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };
    
        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAINDIALOGTABBUTTONS;
            x = DIALOG_X;
            y = DIALOG_Y - 1 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
				class VehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_select;
                    onButtonClick = "[""light""] call A3A_fnc_ui_roadblockFromGarage";
                    x = 0 * GRID_W;
                    y = 0;
                    w = 35 * GRID_W;
                    h = 5 * GRID_H;
                };

				class rebelsATVehiclesTabButton : A3A_Button //rebels vehicle at
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_static;
                    onButtonClick = "[""heavy""] call A3A_fnc_ui_roadblockFromGarage";
                    x = 40 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

		class GARAGE_ListCars//HR_GRG_RscListbox
		{
			idc = A3A_IDC_GARAGE_CATCAR;
            x = -41 * GRID_W;
            y = DIALOG_Y - 36 * GRID_H;
            w = 30 * GRID_W;
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
		/* class GARAGE_StructuredText : A3A_StructuredText
		{
		    idc = A3A_IDC_GARAGEStructuredText;
		    type = CT_STRUCTURED_TEXT;
		    style = 0;
		    colorBackground[] = {0.23,0.23,0.23,0.55};
		    x = 40 * GRID_W;
            y = DIALOG_Y + 20 * GRID_H;
            w = 40 * GRID_W;
            h = 30 * GRID_H; // Screen height - title and buttons height
		    size = TEXT_SIZE_MEDIUM;
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
		}; */

		class GARAGE_StructuredText : A3A_Text
		{
		    idc = A3A_IDC_GARAGEStructuredText;
		    x = -41 * GRID_W;
            y = DIALOG_Y + 64 * GRID_H;
            w = 181 * GRID_W;
            h = 12 * GRID_H; // Screen height - title and buttons height
		    text = "";
		    font = "RobotoCondensed";
		    SizeEx = GRID_H * 2;
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
            x = 106 * GRID_W;
            y = DIALOG_Y - 36 * GRID_H;
            w = 39 * GRID_W;
            h = 100 * GRID_H; // Screen height - title and buttons height
	    	text = "";
	    	id = "detail_info";
	    	textSize = GUI_GRID_H * 0.6;
	    	font = GUI_STANDARD_FONT;
	    	heightType = ZUI_SIZE_TEXT;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
            SizeEx = GRID_H * 1.0;
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
		        size = "0.6";
                scrollable = 1;
	            padding = GUI_SPACING;
		    };
	    };

        /* class info : A3A_Text
	    {
            idc = A3A_IDC_GARAGEinfo;
            x = 101 * GRID_W;
            y = DIALOG_Y - 30 * GRID_H;
            w = 30 * GRID_W;
            h = 90 * GRID_H; // Screen height - title and buttons height
	    	text = "";
	    	id = "detail_info";
	    	textSize = GUI_TEXT_SIZE_SMALL;
	    	font = GUI_STANDARD_FONT;
	    	heightType = ZUI_SIZE_TEXT;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
            SizeEx = GRID_H * 1.8;
            linespacing = 1;

            colorText[] = A3A_COLOR_TEXT;
		    colorShadow[] = A3A_COLOR_SHADOW;
		    colorBackground[] = {0.23,0.23,0.23,0.55};
	    }; */

        class GARAGE_undercoverIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEundercoverIcon;
            x = 1 * GRID_W;
            y = 4 * GRID_W;
            w = 5 * GRID_W;
            h = 5 * GRID_H;
		};

        class GARAGE_driverIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEdriverIcon;
            x = 5 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            w = 3 * GRID_W;
            h = 3 * GRID_H;
		};
        /* class GARAGE_driverGunsText: A3A_Text
        {
            idc = A3A_IDC_GARAGEdriverGunsText;
            x = 15 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
        }; */

        class GARAGE_coPilotIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEcoPilotIcon;
            x = 10 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            w = 3 * GRID_W;
            h = 3 * GRID_H;
		};
        /* class GARAGE_coPilotGunsText: A3A_Text
        {
            idc = A3A_IDC_GARAGEcoPilotGunsText;
            x = 22 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
        }; */

        class GARAGE_commanderIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEcommanderIcon;
            x = 20 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            w = 3 * GRID_W;
            h = 3 * GRID_H;
		};
        /* class GARAGE_commanderGunsText: A3A_Text
        {
            idc = A3A_IDC_GARAGEcommanderGunsText;
            x = 26 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
        }; */

        class GARAGE_gunnerIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEgunnerIcon;
            x = 30 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            w = 3 * GRID_W;
            h = 3 * GRID_H;
		};
        class GARAGE_gunnerText : A3A_InfoTextLeft
        {
		    idc = A3A_IDC_GARAGEgunnerText;
            x = 33 * GRID_W;
            y = DIALOG_Y + 49.5 * GRID_H;
            w = 20 * GRID_W;
            h = 4 * GRID_H;
		};
        /* class GARAGE_gunnerGunsText: A3A_Text
        {
            idc = A3A_IDC_GARAGEgunnerGunsText;
            x = 35 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            style = ST_LEFT + ST_MULTI + ST_NO_RECT;
        }; */

        class GARAGE_passengerIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEpassengerIcon;
            x = 40 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            w = 3 * GRID_W;
            h = 3 * GRID_H;
		};
        class GARAGE_passengersText : A3A_InfoTextLeft
        {
		    idc = A3A_IDC_GARAGEpassengersText;
            x = 43 * GRID_W;
            y = DIALOG_Y + 49.5 * GRID_H;
            w = 20 * GRID_W;
            h = 4 * GRID_H;
		};

        class GARAGE_ffvIcon : A3A_PictureStroke
        {
		    idc = A3A_IDC_GARAGEffvIcon;
            x = 50 * GRID_W;
            y = DIALOG_Y + 50 * GRID_H;
            w = 3 * GRID_W;
            h = 3 * GRID_H;
		};
        class GARAGE_ffvText : A3A_InfoTextLeft
        {
		    idc = A3A_IDC_GARAGEffvText;
            x = 53 * GRID_W;
            y = DIALOG_Y + 49.5 * GRID_H;
            w = 20 * GRID_W;
            h = 4 * GRID_H;
		};

        class GARAGE_selectbutton : A3A_Button
        {
            idc = A3A_IDC_GARAGEselectbutton;
            text = $STR_antistasi_dialogs_vehicle_tab_select;
            x = 60 * GRID_W;
            y = 0;
            w = 35 * GRID_W;
            h = 5 * GRID_H;
        };

        class CloseButton : A3A_CloseButton
        {
            idc = -1;
            x = 0 * GRID_W;
            y = DIALOG_Y - 20 * GRID_H;
        };
    };

    // Used for preview renders. Has to be defined inline. Class inheritance incompatible. ctrlCreate incompatible.
    class Objects
    {
        class VehiclePreview
        {
            idc = A3A_IDC_BUYOBJECTRENDER;

            type = 82;
            model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
            scale = 0.00001;  // Hide unless there is a mouse hover. This is overwritten by proper ctrlShow command on initialisation.

            direction[] = {0, -0.35, -0.65};
            up[] = {0, 0.65, -0.35};

            x = 0.5;
            y = 0.5;
            z = 0.2;

            xBack = 0.5;
            yBack = 0.5;
            zBack = 1.2;

            inBack = 1;
            enableZoom = 1;
            zoomDuration = 0.001;
        };
    };
};
