//SOG - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(SOG) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","wheeled_f_vietnam_02_c"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

// Uncomment when needed
#include "CfgVehicles.hpp"
//#include "CfgMarkers.hpp"
//#include "CfgWeapons.hpp"