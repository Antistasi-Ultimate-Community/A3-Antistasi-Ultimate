//AEGIS - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(Aegis)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","A3_Aegis_Armor_F_Aegis_APC_Tracked_02", "A3_Atlas_Armor_F_Atlas_APC_Tracked_02"/* , "A3_Opf_Armor_F_Opf_APC_Tracked_02" */};
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