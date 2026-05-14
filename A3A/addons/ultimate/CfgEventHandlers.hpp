class Extended_InitPost_EventHandlers {
    class A3AU_TerrainSmoother_Base_F {
        class ADDON  {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    class A3AU_VegetationCleaner_Base_F {
        class ADDON {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };

    class GVAR(BaseVehicleSpawnHelperArrow) {
        class ADDON {
            clientInit = QUOTE([ARR_2(FUNCMAIN(handlerBaseVehicleSpawnPostInitClient),_this)] call CBA_fnc_execNextFrame);
        };
    };

    class GVAR(BB_TerrainObjectHider_Base) {
        class ADDON {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
        };
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = "call A3U_fnc_postInit";
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = "call A3U_fnc_init";
    };
};
