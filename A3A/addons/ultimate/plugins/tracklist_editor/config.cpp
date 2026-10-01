#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = QUOTE(PREFIX - SUBADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_ultimate"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgAddon.hpp"
#include "CfgEventHandlers.hpp"
#include "dialog.hpp"
