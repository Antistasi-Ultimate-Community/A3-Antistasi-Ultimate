class Extended_PostInit_EventHandlers {
    class SUBADDON {
        serverInit = QUOTE(call COMPILE_SCRIPT(XEH_postInitServer));
    };
};

class Extended_PreInit_EventHandlers {
    class SUBADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};
