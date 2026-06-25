class UtilityItems {
    class Base {
        scope = 0;
        displayName = ""; // Optional; will override the item's own displayName property
        price = 0;
        iconType = "";
        flags[] = {};
    };

    class BuildBox: Base {
        flags[] = {"place", "move", "build"};
        tooltip = $STR_antistasi_dialogs_buy_vehicle_buildbox_tooltip;
    };

    class Land_PlasticCase_01_small_black_F: BuildBox {
        scope = 1;
        displayName = $STR_A3AP_buyvehdialog_BuildBoxExtraSmall;
        price = 250;
    };

    class Land_PlasticCase_01_medium_black_F: BuildBox {
        scope = 1;
        displayName = $STR_A3AP_buyvehdialog_BuildBoxSmall;
        price = 500;
    };

    class A3AU_Build_Box_Large_1: BuildBox {
        scope = 1;
        displayName = $STR_A3AP_buyvehdialog_BuildBoxMeduim;
        price = 2500;
    };

    class Land_PlasticCase_01_large_black_F: BuildBox {
        scope = 1;
        displayName = $STR_A3AP_buyvehdialog_BuildBoxLarge;
        price = 5000;
    };

    class A3AU_Build_Box_Humongous: BuildBox {
        scope = 1;
        displayName = $STR_A3AP_buyvehdialog_BuildBoxHumongous;
        price = 15000;
        flags[] = {"place", "build"};
    };

    class GVAR(Box_BuildingPlacer_Decorations): BuildBox {
        scope = 1;
        price = 5000;
    };

    class GVAR(Box_BuildingPlacer_Chemlights): BuildBox {
        scope = 1;
        price = 200;
    };
};
