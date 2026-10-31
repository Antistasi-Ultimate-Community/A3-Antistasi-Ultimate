//IFA - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(IFA) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"IFA3_Core"};
        skipWhenMissingDependencies = 1; // makes this entire config not load if any requiredAddons are not present
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgVehicles
{
    #include "CfgVehicles.hpp"
};
