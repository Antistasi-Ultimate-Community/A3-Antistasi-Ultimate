class A3A_VehicleFromStore : A3A_TabbedDialog
{
    idd = A3A_IDD_BUYVEHICLEOUTPOSTDIALOG;
    onUnload = "['onUnload'] spawn A3A_fnc_UI_vehicleFromStore";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_buy_vehicle_titlebar;
            x = -36 * GRID_W;
            y = DIALOG_Y - 40 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class TipText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_war_level_tip;
            font = A3A_NOTIFICATION_FONT;
            x = -36 * GRID_W;
            y = DIALOG_Y - 31 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };
    
        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAINDIALOGTABBUTTONS;
            x = -36 * GRID_W;
            y = DIALOG_Y - 35 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
                class VehiclesTabButton : A3A_Button
                {
                    idc = -1;
                    x = 0 * GRID_W;
                    y = 0;
                    w = 160 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        // Main content
        class  VehiclesTab : A3A_DefaultControlsGroup
        {
            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    show = false;
                    idc = A3A_IDC_BUYSTATICMAIN;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

        class CloseButton : A3A_CloseButton
        {
            idc = -1;
            x = DIALOG_X + DIALOG_W * GRID_W - 5 * GRID_W;
            y = DIALOG_Y - 10 * GRID_H;
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

class A3A_StaticAAFromStore : A3A_VehicleFromStore
{
	onLoad = "['onLoad', ['AA']] spawn A3A_fnc_UI_vehicleFromStore";

    class Controls : Controls
    {
        class TitlebarText : TitlebarText {};
		class TipText : TipText {};

    	class TabButtons : TabButtons
        {
            class Controls : Controls
            {
                class aaVehiclesTabButton : VehiclesTabButton
                {
                    text = $STR_antistasi_dialogs_outpost_tab_staticAA;
                    onButtonClick = "['switchTab', ['AA']] call A3A_fnc_UI_vehicleFromStore";
                };
            };
        };

		class VehiclesTab : VehiclesTab {};
		class CloseButton : CloseButton {};
    };

	class Objects : Objects {};
};

class A3A_StaticATFromStore : A3A_VehicleFromStore
{
	onLoad = "['onLoad', ['AA']] spawn A3A_fnc_UI_vehicleFromStore";

    class Controls : Controls
    {
        class TitlebarText : TitlebarText {};
		class TipText : TipText {};

    	class TabButtons : TabButtons
        {
            class Controls : Controls
            {
                class atVehiclesTabButton : VehiclesTabButton
                {
                    text = $STR_antistasi_dialogs_outpost_tab_staticAT;
                    onButtonClick = "['switchTab', ['AT']] call A3A_fnc_UI_vehicleFromStore";
                };
            };
        };

		class VehiclesTab : VehiclesTab {};
		class CloseButton : CloseButton {};
    };
	
	class Objects : Objects {};
};

class A3A_StaticHMGFromStore : A3A_VehicleFromStore
{
	onLoad = "['onLoad', ['MG']] spawn A3A_fnc_UI_vehicleFromStore";

    class Controls : Controls
    {
        class TitlebarText : TitlebarText {};
		class TipText : TipText {};

    	class TabButtons : TabButtons
        {
            class Controls : Controls
            {
                class mgVehiclesTabButton : VehiclesTabButton
                {
                    text = $STR_antistasi_dialogs_outpost_tab_staticMG;
                    onButtonClick = "['switchTab', ['MG']] call A3A_fnc_UI_vehicleFromStore";
                };
            };
        };

		class VehiclesTab : VehiclesTab {};
		class CloseButton : CloseButton {};
    };
	
	class Objects : Objects {};
};

class A3A_RoadblockFromStore : A3A_VehicleFromStore
{
	onLoad = "['onLoad', ['RB_LA']] spawn A3A_fnc_UI_vehicleFromStore";

    class Controls : Controls
    {
        class TitlebarText : TitlebarText {};
		class TipText : TipText {};

    	class TabButtons : TabButtons
        {
            class Controls : Controls
            {
                class vehiclesLATabButton : VehiclesTabButton
                {
                    text = $STR_antistasi_dialogs_outpost_tab_lightarmed;
                    onButtonClick = "['switchTab', ['RB_LA']] call A3A_fnc_UI_vehicleFromStore";
                    w = 54 * GRID_W;
                };

                class vehiclesATTabButton : VehiclesTabButton
                {
                    text = $STR_antistasi_dialogs_outpost_tab_AT;
                    onButtonClick = "['switchTab', ['RB_AT']] call A3A_fnc_UI_vehicleFromStore";
                    x = 54 * GRID_W;
                    w = 54 * GRID_W;
                };

				class vehiclesAATabButton : VehiclesTabButton
                {
                    text = $STR_antistasi_dialogs_outpost_tab_AA;
                    onButtonClick = "['switchTab', ['RB_AA']] call A3A_fnc_UI_vehicleFromStore";
                    x = 108 * GRID_W;
                    w = 54 * GRID_W;
                };
            };
        };

		class VehiclesTab : VehiclesTab
        {
            class Controls: Controls
            {
                class VehiclesLACtrlGroup : VehiclesControlsGroup
                {
                    idc = A3A_IDC_BUYLAVEHICLEMAIN;
                };

                class VehiclesATCtrlGroup : VehiclesControlsGroup
                {
                    idc = A3A_IDC_BUYATVEHICLEMAIN;
                };

                class VehiclesAACtrlGroup : VehiclesControlsGroup
                {
                    idc = A3A_IDC_BUYAAVEHICLEMAIN;
                };
            };
        };

		class CloseButton : CloseButton {};
    };
	
	class Objects : Objects {};
};
