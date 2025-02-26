//GM - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CSLA) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","gm_vehicles_land_wheeled_w123_ge_civ_w123"};
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