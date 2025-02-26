//CUP - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CUP) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CUP_WheeledVehicles_NewHMMWV"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgVehicles.hpp"