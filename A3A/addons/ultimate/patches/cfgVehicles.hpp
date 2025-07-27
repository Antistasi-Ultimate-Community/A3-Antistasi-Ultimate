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

    class Land_HelipadCircle_F;
    class Land_HelipadSquare_F;

    class A3AU_RebHelipad_Circle_F: Land_HelipadCircle_F {
        EGVAR(core,onBuildingCompleted) = QUOTE(call A3A_fnc_terrainCleaner);
        EGVAR(core,onBuildingLoaded) = QUOTE(call A3A_fnc_terrainCleaner);
    };

    class A3AU_RebHelipad_Square_F: Land_HelipadSquare_F {
        EGVAR(core,onBuildingCompleted) = QUOTE(call A3A_fnc_terrainCleaner);
        EGVAR(core,onBuildingLoaded) = QUOTE(call A3A_fnc_terrainCleaner);
    };

    class Land_Shovel_F;
    class Land_Axe_F;

    class A3AU_TerrainSmoother_VerySmall_F: Land_Shovel_F {
        displayName = Terrain Smoother (4 m); ////needs to be localized
    };
    class A3AU_TerrainSmoother_Small_F: Land_Shovel_F {
        displayName = Terrain Smoother (8 m); ////needs to be localized
    };
    class A3AU_TerrainSmoother_Medium_F: Land_Shovel_F {
        displayName = Terrain Smoother (15 m); ////needs to be localized
    };
    class A3AU_TerrainSmoother_Large_F: Land_Shovel_F {
        displayName = Terrain Smoother (30 m); ////needs to be localized
    };

    class A3AU_TerrainCleaner_VerySmall_F: Land_Axe_F {
        displayName = Terrain Cleaner (4 m); ////needs to be localized
    };
    class A3AU_TerrainCleaner_Small_F: Land_Axe_F {
        displayName = Terrain Cleaner (8 m); ////needs to be localized
    };
    class A3AU_TerrainCleaner_Medium_F: Land_Axe_F {
        displayName = Terrain Cleaner (15 m); ////needs to be localized
    };
    class A3AU_TerrainCleaner_Large_F: Land_Axe_F {
        displayName = Terrain Cleaner (30 m); ////needs to be localized
    };

    class VR_3DSelector_01_default_F;

    // BB -> base builder
    class GVAR(BB_MapObjectHider_Base) : VR_3DSelector_01_default_F {
        scope = 0; // Hide from editor
        scopeCurator = 0; // Hide from Zeus
        displayName = "Map Object Hider Base";
        author = AUTHOR;
        authors[] = {"UnseenKill"};

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
    };

    class GVAR(BB_MapObjectHider_Circle5x5) : GVAR(BB_MapObjectHider_Base) {
        scope = 2;
        displayName = "Map Object Hider Circle 5x5";

        class Properties {
            shape = QUOTE(ellipse);
            width = 5;
            height = 5;
        };
    };

    class GVAR(BB_MapObjectHider_Square5x5) : GVAR(BB_MapObjectHider_Base) {
        scope = 2;
        displayName = "Map Object Hider Square 5x5";

        class Properties {
            shape = QUOTE(rectangle);
            width = 5;
            height = 5;
        };
    };

    class GVAR(BB_MapObjectHider_Circle10x10) : GVAR(BB_MapObjectHider_Base) {
        scope = 2;
        displayName = "Map Object Hider Circle 10x10";

        class Properties {
            shape = QUOTE(ellipse);
            width = 10;
            height = 10;
        };
    };

    class GVAR(BB_MapObjectHider_Square10x10) : GVAR(BB_MapObjectHider_Base) {
        scope = 2;
        displayName = "Map Object Hider Square 10x10";

        class Properties {
            shape = QUOTE(rectangle);
            width = 10;
            height = 10;
        };
    };

    class GVAR(BB_MapObjectHider_Circle20x20) : GVAR(BB_MapObjectHider_Base) {
        scope = 2;
        displayName = "Map Object Hider Circle 20x20";

        class Properties {
            shape = QUOTE(ellipse);
            width = 20;
            height = 20;
        };
    };

    class GVAR(BB_MapObjectHider_Square20x20) : GVAR(BB_MapObjectHider_Base) {
        scope = 2;
        displayName = "Map Object Hider Square 20x20";

        class Properties {
            shape = QUOTE(rectangle);
            width = 20;
            height = 20;
        };
    };
};

class Extended_InitPost_EventHandlers {
    class GVAR(BB_MapObjectHider_Base) {
        class ADDON {
            clientInit = QUOTE(call A3A_fnc_handlerMapObjectHiderPostInitClient);
            serverInit = QUOTE(call A3A_fnc_handlerMapObjectHiderPostInitServer);
        };
    };
};
