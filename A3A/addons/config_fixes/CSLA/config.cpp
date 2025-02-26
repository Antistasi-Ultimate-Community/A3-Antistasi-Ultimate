//CSLA - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CSLA) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","CSLA_CIV"};
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