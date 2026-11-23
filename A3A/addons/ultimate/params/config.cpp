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

#ifdef __A3_DEBUG__
#include "CfgParams.hpp"
#endif // __A3_DEBUG__
