#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        addonRootClass = "A3A_ultimate";
        requiredAddons[] = {"A3A_ultimate"};
        requiredVersion = 2.20;
        units[] = {};
        weapons[] = {};
    };
};

class A3U {
    class MapmodesFramework {
        officialIds[] = {"frontlines"};
    };
};

#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"