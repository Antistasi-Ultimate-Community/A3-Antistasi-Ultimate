#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = QUOTE(PREFIX - SUBADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QEGVAR(ultimage,trader_selling), "ace_interaction"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
