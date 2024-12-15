class A3A_BuyVehicleAADialog : A3A_TabbedDialog
{
  idd = A3A_IDD_BUYVEHICLEAADIALOG;
  onLoad = "['onLoadAA'] spawn A3A_fnc_ui_outpostStaticFromStoreDialog";
  onUnload = "['onUnload'] spawn A3A_fnc_ui_outpostStaticFromStoreDialog";

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
                class aaStaticsTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_outpost_tab_staticAA;
                    onButtonClick = "[""switchTabAA"", [""staticAA""]] call A3A_fnc_ui_outpostStaticFromStoreDialog";
                    x = 0 * GRID_W;
                    y = 0;
                    w = 160 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        // Main content
        class  aaStaticsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_AASTATICMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_AASTATICGROUP;
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
