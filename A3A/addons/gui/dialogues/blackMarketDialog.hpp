class A3A_BlackMarketDialog : A3A_TabbedDialogBlackmarket
{
    idd = A3A_IDD_BLACKMARKETVEHICLEDIALOG;
    onLoad = "['onLoad'] spawn A3A_fnc_blackMarketDialog";
    onUnload = "['onUnload'] spawn A3A_fnc_blackMarketDialog";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_trader_black_market_title;
            x = DIALOG_X;
            y = DIALOG_Y - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };
    
        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAINDIALOGTABBUTTONS;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;

            class Controls
            {
                class VehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_select;
                    onButtonClick = "[""switchTab"", [""all""]] call A3A_fnc_blackMarketDialog";
                    x = 125 * GRID_W;
                    y = 0;
                    w = 35 * GRID_W;
                    h = 5 * GRID_H;
                };

                class VehicleTabCombo : A3A_ComboBox_Small_BM
                {
                    idc = A3A_IDC_SETUP_BMTABLE;
                    fade = 0;
                    access = 1;
                    x = 0 * GRID_W;
                    y = 0;
                    w = 125 * GRID_W;
                    h = 5 * GRID_H;/* GRID_H */
                };
            };
        };

        // Main content
        class VehicleTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUP;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabArty : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETARTY;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPATRY;
                    x = 0;
                    y = 5 * GRID_H; //9.5
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H; //9.5
                };
            };
        };

        class VehicleTabAPC : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETAPC;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPAPC;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabAA : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETAA;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPAA;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabUAV : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETUAV;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPUAV;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };
        
        class VehicleTabTank : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETTANK;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPTANK;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabStatics : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETSTATICS;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPSTATICS;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };
        
        class VehicleTabHeli : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETHELI;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPHELI;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabPlane : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETPLANE;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPPLANE;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabArmedCar : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETARMEDCAR;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPARMEDCAR;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabUnarmedCar : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETUNARMEDCAR;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPUNARMED;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class VehicleTabBoat : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BLACKMARKETBOAT;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_BLACKMARKETVEHICLESGROUPBOAT;
                    x = 0;
                    y = 5 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 5 * GRID_H;
                };
            };
        };

        class AboutText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_trader_black_market_requirements;
            font = A3A_NOTIFICATION_FONT;
            x = DIALOG_X;
            y = DIALOG_Y - 1 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };
        class AboutButton : A3A_CloseButton
        {
            idc = -1;
            text = A3A_Icon_Requirements;
            onButtonClick = "";
            url = "https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/wiki/Arms-Dealer#vehicle-unlock-requirements";
            x = DIALOG_X + DIALOG_W * GRID_W - 10 * GRID_W;
            y = DIALOG_Y - 10 * GRID_H;
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
            idc = A3A_IDC_BLACKMARKETBUYOBJECTRENDER;

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
