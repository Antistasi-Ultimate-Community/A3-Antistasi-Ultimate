class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class ReammoBox_F {
        class ADDON {
            serverInit = QUOTE(call FUNC(addVanillaSellInteraction));
        };
    };
};
