class A3A_BuyVehicleRoadblockDialog : A3A_TabbedDialog
{
  idd = A3A_IDD_BUYVEHICLEROADBLOCKDIALOG;
  onLoad = "['onLoad'] spawn A3A_fnc_ui_outpostVehicleFromStoreDialog";
  onUnload = "['onUnload'] spawn A3A_fnc_ui_outpostVehicleFromStoreDialog";

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_dialogs_buy_vehicle_titlebar;
            x = DIALOG_X;
            y = DIALOG_Y - 10 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 5 * GRID_H;
        };

        class TipText : A3A_TitlebarText
        {
          idc = -1;
          text = $STR_antistasi_dialogs_war_level_tip;
          font = A3A_NOTIFICATION_FONT;
          x = DIALOG_X;
          y = DIALOG_Y - 1 * GRID_H;
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
                class rebelLightarmedVehiclesVehicleTabButton : A3A_Button ///rebels light armed
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_reb;
                    onButtonClick = "[""switchTab"", [""light""]] call A3A_fnc_ui_outpostVehicleFromStoreDialog";
                    x = 0 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };

                class rebelsATVehiclesTabButton : A3A_Button //rebels vehicle at
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_static;
                    onButtonClick = "[""switchTab"", [""AT""]] call A3A_fnc_ui_outpostVehicleFromStoreDialog";
                    x = 60 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };

				class rebelsAAVehiclesTabButton : A3A_Button //rebels vehicle aa
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_static;
                    onButtonClick = "[""switchTab"", [""AA""]] call A3A_fnc_ui_outpostVehicleFromStoreDialog";
                    x = 90 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        // Main content
        class  rebelLightarmedVehiclesVehicleTab : A3A_DefaultControlsGroup ///rebels light armed
        {
            idc = A3A_IDC_BUYLIGHTARMEDMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_LIGHTARMEDGROUP;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

        class rebelsATVehiclesTab : A3A_DefaultControlsGroup //rebels vehicle at
        {
            idc = A3A_IDC_BUYATVEHICLEMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_ATVEHICLEGROUP;
                    x = 0;
                    y = 4 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 8 * GRID_H;
                };
            };
        };

		class rebelsAAVehiclesTabButton : A3A_DefaultControlsGroup //rebels vehicle aa
        {
            idc = A3A_IDC_BUYAAVEHICLEMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_AAVEHICLEGROUP;
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
