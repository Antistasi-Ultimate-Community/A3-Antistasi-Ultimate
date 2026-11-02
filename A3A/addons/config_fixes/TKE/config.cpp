//TKE - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(TKE) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "TKE_Mod_LoadOrder", // The Kuiper Engagements
            "TKE_Ext_Heli", // Scifi Vehicles Pack
            "TKE_Ext_Ships" // Scifi Spaceship Pack
        };
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgVehicles.hpp"
