class A3A_BuyVehicleDialog : A3A_TabbedDialog
{
  idd = A3A_IDD_BUYVEHICLEDIALOG;
  onLoad = "['onLoad'] spawn A3A_fnc_buyVehicleDialog";
  onUnload = "['onUnload'] spawn A3A_fnc_buyVehicleDialog";

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
          h = 15 * GRID_H;
        };
    
        class TabButtons : A3A_ControlsGroupNoScrollbars
        {
            idc = A3A_IDC_MAINDIALOGTABBUTTONS;
            x = DIALOG_X;
            y = DIALOG_Y - 5 * GRID_H;
            w = DIALOG_W * GRID_W;
            h = 15 * GRID_H;

            class Controls
            {
                class civilianVehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_civ;
                    onButtonClick = "[""switchTab"", [""civil""]] call A3A_fnc_buyVehicleDialog";
                    x = 0;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };

                class rebelVehicleTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_reb;
                    onButtonClick = "[""switchTab"", [""rebel""]] call A3A_fnc_buyVehicleDialog";
                    x = 40 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };

                class staticsTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_static;
                    onButtonClick = "[""switchTab"", [""static""]] call A3A_fnc_buyVehicleDialog";
                    x = 80 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };

                class OthersTabButton : A3A_Button
                {
                    idc = -1;
                    text = $STR_antistasi_dialogs_vehicle_tab_other;
                    onButtonClick = "[""switchTab"", [""other""]] call A3A_fnc_buyVehicleDialog";
                    x = 120 * GRID_W;
                    y = 0;
                    w = 40 * GRID_W;
                    h = 5 * GRID_H;
                };

                class VehicleTabCombo : A3A_ComboBox_Small_BM
                {
                    idc = A3A_IDC_SETUP_CVTABLE;
                    fade = 0;
                    access = 1;
                    onLBSelChanged = "private _controller = (_this select 0); private _selectedIndex = lbCurSel _controller; private _selectedString = _controller lbText _selectedIndex; diag_log _selectedString; [""selectCategory"", [_selectedString]] call A3A_fnc_buyVehicleDialog;";
                    x = 0 * GRID_W;
                    y = 5.1 * GRID_H;
                    w = 160 * GRID_W;
                    h = 5 * GRID_H;
                };
            };
        };

        // Main content
        class civilianVehicleTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLEMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUP;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabCivCars : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLECARS;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUPCARS;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };
        class VehicleTabCivTrucks : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLETRUCKS;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUPTRUCKS;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };
        class VehicleTabCivBoats : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLEBOATS;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUPBOATS;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };
        class VehicleTabCivHeli : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLEHELI;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUPHELI;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };
        class VehicleTabCivPlane : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYCIVVEHICLEPLANE;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_CIVVEHICLESGROUPPLANE;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class rebelVehicleTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUP;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };
        ///

        class VehicleTabRebBasic : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEBASIC;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPBASIC;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebTrucks : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLETRUCKS;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPTRUCKS;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebLightUnarmed : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLELIGHTUNARMED;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPLIGHTUNARMED;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebBoats : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEBOATS;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPBOATS;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebMedical : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEMEDICAL;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPMEDICAL;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebLightArmed : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLELIGHTARMED;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPLIGHTARMED;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebAt : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEAT;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPAT;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebAa : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEAA;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPAA;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabRebPlane : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYREBVEHICLEPLANE;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_REBVEHICLESGROUPPLANE;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class staticsTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSTATICMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_STATICSGROUP;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabStaticMG : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSTATICVEHICLEMG;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_STATICVEHICLESGROUPMG;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabStaticAT : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSTATICVEHICLEAT;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_STATICVEHICLESGROUPAT;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabStaticAA : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSTATICVEHICLEAA;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_STATICVEHICLESGROUPAA;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class VehicleTabStaticMortar : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYSTATICVEHICLEMORTAR;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_STATICVEHICLESGROUPMORTAR;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
                };
            };
        };

        class OtherTab : A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_BUYOTHERMAIN;
            show = false;

            class Controls
            {
                class VehiclesControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                    idc = A3A_IDC_OTHERGROUP;
                    x = 0;
                    y = 9 * GRID_H;
                    w = PX_W(DIALOG_W);
                    h = PX_H(DIALOG_H) - 9 * GRID_H;
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