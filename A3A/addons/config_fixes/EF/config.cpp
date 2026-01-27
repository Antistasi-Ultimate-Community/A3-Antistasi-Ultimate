//WS - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(WS) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        skipWhenMissingDependencies = 1;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder", "ef_gyra_c"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
#include "CfgVehicles.hpp"
