class UtilityItems {
    class Base {
        scope = 0;
        displayName = ""; // Optional; will override the item's own displayName property
        price = 0;
        iconType = "";
        flags[] = {};
    };

    class BuildBox: Base {
        flags[] = {"place", "move", "build", "save"};
    };

    class A3AU_Build_Box_ExtraSmall: BuildBox {
        scope = 1;
        displayName = "Build Box (Extra Small)";
        price = 250;
    };

    class A3AU_Build_Box_Small: BuildBox {
        scope = 1;
        displayName = "Build Box (Small)";
        price = 500;
    };

    class A3AU_Build_Box_Large_1: BuildBox {
        scope = 1;
        displayName = "Build Box (Medium)";
        price = 2500;
    };

    class A3AU_Build_Box_Large_2: BuildBox {
        scope = 1;
        displayName = "Build Box (Large)";
        price = 5000;
    };

    class A3AU_Build_Box_Humongous: BuildBox {
        scope = 1;
        displayName = "Build Box (Humongous)";
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
