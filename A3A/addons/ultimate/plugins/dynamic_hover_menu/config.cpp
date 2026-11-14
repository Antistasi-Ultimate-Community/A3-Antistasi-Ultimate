#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        addonRootClass = "A3A_ultimate";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_ultimate"};
        units[] = {};
        weapons[] = {};
    };
};

class A3U {
    #include "CfgMapContextMenu.hpp"
};

#include "CfgEventHandlers.hpp"
