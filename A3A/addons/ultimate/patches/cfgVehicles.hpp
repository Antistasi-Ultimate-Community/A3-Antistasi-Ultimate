class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class Item_Base_F;
    class Thing;

    class Item_TFAR_SCR536: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "SCR-536";
        author = AUTHOR;
        vehicleClass = "Items";
        class TransportItems {
            class _xx_TFAR_SCR536 {
                name="TFAR_SCR536";
                count=1;
            };
        };
    };

    class Prop_TFAR_SCR536: Thing {
        destrType = "DestructNo";
        scope = 2;
        scopeCurator = 2;
        model = QPATHTOFOLDER(patches\scr536);
        displayName = "SCR-536 Handie Talkie";
        // editorCategory = "";
        // vehicleClass="";
    };

    class Helipad_base_F;

    class A3AU_RebHelipad_base_F: Helipad_base_F {
        accuracy = 1000;
        author = AUTHOR;
        authors[] = {"wersal454", "UnseenKill"};

        EGVAR(core,restorePriority) = 95;
        EGVAR(core,onBuildingCompleted) = QUOTE(call A3A_fnc_handlerTerrainManipulator);
        EGVAR(core,onBuildingLoaded) = QUOTE(call A3A_fnc_handlerTerrainManipulator);

        class EGVAR(core,Properties) {
            actions[] = {"terrainCleaner", "terrainSmootherExperimental"};
            cleanRadius = 30;
            cleanTerrainTypes[] = {};
            smoothRadius[] = {40, 70}; // <main zone>,<smoothing zone>
        };
    };

    class A3AU_RebHelipad_Circle_F: A3AU_RebHelipad_base_F {
        scope = 2;
        scopeCurator = 2;

        displayName = $STR_A3_CFGVEHICLES_LAND_HELIPADCIRCLE_F0;
        editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_HelipadCircle_F.jpg";
        model = "\A3\Structures_F\Mil\Helipads\HelipadCircle_F.p3d";
    };

    class A3AU_RebHelipad_Square_F: A3AU_RebHelipad_base_F {
        scope = 2;
        scopeCurator = 2;

        displayName = $STR_A3_CFGVEHICLES_LAND_HELIPADSQUARE_F0;
        editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_HelipadSquare_F.jpg";
        mapSize = 11.92;
        model = "\A3\Structures_F\Mil\Helipads\HelipadSquare_F.p3d";
        icon = "iconObject_1x1";
    };

    class Land_Shovel_F;
    class Land_Axe_F;

    class A3AU_TerrainSmoother_Base_F: Land_Shovel_F {
        scope = 0; // Hide from editor
        scopeCurator = 0; // Hide from Zeus
        displayName = "Terrain Smoother Base";
        author = AUTHOR;
        authors[] = {"wersal454", "UnseenKill"};
        model = "\A3\Structures_F_Bootcamp\VR\Helpers\VR_3DSelector_01_F.p3d";

        EGVAR(core,restorePriority) = 100;
        EGVAR(core,onBuildingCompleted) = QUOTE(call A3A_fnc_handlerTerrainManipulator);
        EGVAR(core,onBuildingLoaded) = QUOTE(call A3A_fnc_handlerTerrainManipulator);

        class EGVAR(core,Properties) {
            actions[] = {"terrainSmoother", "hideObject"};
            previewShape = "ellipse"; // ellipse or rectangle
            smoothRadius[] = {0, 0}; // <main zone>,<smoothing zone>
        };
    };

    class A3AU_TerrainSmoother_VerySmall_F: A3AU_TerrainSmoother_Base_F {
        scope = 2;
        displayName = "Terrain Smoother (4 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            previewWidth = 4;
            previewHeight = 4;
            smoothRadius[] = {4, 8};
        };
    };
    class A3AU_TerrainSmoother_Small_F: A3AU_TerrainSmoother_Base_F {
        scope = 2;
        displayName = "Terrain Smoother (8 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            previewWidth = 8;
            previewHeight = 8;
            smoothRadius[] = {8, 16};
        };
    };
    class A3AU_TerrainSmoother_Medium_F: A3AU_TerrainSmoother_Base_F {
        scope = 2;
        displayName = "Terrain Smoother (15 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            previewWidth = 15;
            previewHeight = 15;
            smoothRadius[] = {15, 27};
        };
    };
    class A3AU_TerrainSmoother_Large_F: A3AU_TerrainSmoother_Base_F {
        scope = 2;
        displayName = "Terrain Smoother (30 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            previewWidth = 30;
            previewHeight = 30;
            smoothRadius[] = {30, 42};
        };
    };

    class A3AU_VegetationCleaner_Base_F: Land_Axe_F {
        scope = 0; // Hide from editor
        scopeCurator = 0; // Hide from Zeus
        displayName = "Vegetation Cleaner Base";
        author = AUTHOR;
        authors[] = {"wersal454", "UnseenKill"};
        model = "\A3\Structures_F_Bootcamp\VR\Helpers\VR_3DSelector_01_F.p3d";

        EGVAR(core,restorePriority) = 100;
        EGVAR(core,onBuildingCompleted) = QUOTE(call A3A_fnc_handlerTerrainManipulator);
        EGVAR(core,onBuildingLoaded) = QUOTE(call A3A_fnc_handlerTerrainManipulator);

        class EGVAR(core,Properties) {
            actions[] = {"terrainCleaner", "hideObject"};
            cleanRadius = 0;
            cleanTerrainTypes[] = {"ROCKS", "ROCK", "TREE", "BUSH", "SMALL TREE", "HIDE"};
            previewShape = "ellipse"; // ellipse or rectangle
        };
    };

    class A3AU_VegetationCleaner_VerySmall_F: A3AU_VegetationCleaner_Base_F {
        scope = 2;
        displayName = "Vegetation Cleaner (4 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 4;
            previewWidth = 4;
            previewHeight = 4;
        };
    };
    class A3AU_VegetationCleaner_Small_F: A3AU_VegetationCleaner_Base_F {
        scope = 2;
        displayName = "Vegetation Cleaner (8 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 8;
            previewWidth = 8;
            previewHeight = 8;
        };
    };
    class A3AU_VegetationCleaner_Medium_F: A3AU_VegetationCleaner_Base_F {
        scope = 2;
        displayName = "Vegetation Cleaner (15 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 15;
            previewWidth = 15;
            previewHeight = 15;
        };
    };
    class A3AU_VegetationCleaner_Large_F: A3AU_VegetationCleaner_Base_F {
        scope = 2;
        displayName = "Vegetation Cleaner (30 m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 30;
            previewWidth = 30;
            previewHeight = 30;
        };
    };

    class Land_ButaneTorch_F;

    // BB -> base builder
    class GVAR(BB_TerrainObjectHider_Base) : Land_ButaneTorch_F {
        scope = 0; // Hide from editor
        scopeCurator = 0; // Hide from Zeus
        displayName = "Terrain Cleaner Base";
        author = AUTHOR;
        authors[] = {"UnseenKill"};
        model = "\A3\Structures_F_Bootcamp\VR\Helpers\VR_3DSelector_01_F.p3d";

        EGVAR(core,restorePriority) = 90;
        EGVAR(core,onBuildingCompleted) = QUOTE(call A3A_fnc_handlerTerrainManipulator);
        EGVAR(core,onBuildingLoaded) = QUOTE(call A3A_fnc_handlerTerrainManipulator);

        class EGVAR(core,Properties) {
            actions[] = {"terrainCleaner", "hideObject"};
            cleanRadius = 0;
            cleanTerrainTypes[] = {};
            previewShape = "ellipse"; // ellipse or rectangle
        };

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
    };

    class GVAR(BB_TerrainObjectHider_Circle4x4) : GVAR(BB_TerrainObjectHider_Base) {
        scope = 2;
        displayName = "Terrain Cleaner (4m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 4;
            previewWidth = 4;
            previewHeight = 4;
        };
    };

    class GVAR(BB_TerrainObjectHider_Circle8x8) : GVAR(BB_TerrainObjectHider_Base) {
        scope = 2;
        displayName = "Terrain Cleaner (8m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 8;
            previewWidth = 8;
            previewHeight = 8;
        };
    };

    class GVAR(BB_TerrainObjectHider_Circle15x15) : GVAR(BB_TerrainObjectHider_Base) {
        scope = 2;
        displayName = "Terrain Cleaner (15m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 15;
            previewWidth = 15;
            previewHeight = 15;
        };
    };

    class GVAR(BB_TerrainObjectHider_Circle30x30) : GVAR(BB_TerrainObjectHider_Base) {
        scope = 2;
        displayName = "Terrain Cleaner (30m)";

        class EGVAR(core,Properties): EGVAR(core,Properties) {
            cleanRadius = 30;
            previewWidth = 30;
            previewHeight = 30;
        };
    };
};

class Extended_InitPost_EventHandlers {
    class A3AU_TerrainSmoother_Base_F {
        class ADDON {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    class A3AU_VegetationCleaner_Base_F {
        class ADDON {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    class GVAR(BB_TerrainObjectHider_Base) {
        class ADDON {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };
};

class Land_HelipadCircle_F;
class Land_HelipadSquare_F;
class A3AU_RebHelipad_Circle_F: Land_HelipadCircle_F {};
class A3AU_RebHelipad_Square_F: Land_HelipadSquare_F {};

class UserTexture10m_F;
class OverObject_HelipadCircle_F: UserTexture10m_F {
    /* hiddenSelections[] = {"camo", "decals"};
    hiddenSelectionsTextures[] = {
        "\A3\Structures_F\Mil\Helipads\Data\HelipadCircle_F_CO.paa",
        "\A3\Structures_F\Mil\Helipads\Data\HelipadDecal_F_CO.paa"
    }; */
};
class OverObject_HelipadSquare_F: UserTexture10m_F {
    /* hiddenSelections[] = {"camo", "decals"};
    hiddenSelectionsTextures[] = {
        "\A3\Structures_F\Mil\Helipads\Data\HelipadSquare_F_CO.paa",
        "\A3\Structures_F\Mil\Helipads\Data\HelipadDecal_F_CO.paa"
    }; */
};