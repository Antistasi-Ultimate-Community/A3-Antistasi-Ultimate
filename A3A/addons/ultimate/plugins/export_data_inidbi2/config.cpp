#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        addonRootClass = "A3A_ultimate";
        requiredAddons[] = {"A3A_ultimate"}; //TODO: add inidbi2 dependency
        skipWhenMissingDependencies = 1;
        units[] = {};
        weapons[] = {};
    };
};

#include "CfgEventHandlers.hpp"
