#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        magazines[] = {QGVAR(LockpickKit_MultiUse), QGVAR(LockpickKit_SingleUse)};
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_Events"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CBA_Extended_EventHandlers_base; // Needed for CfgVehicles.hpp

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

class A3U
{
    #include "config\plane\cfgPlaneLoadouts.hpp"
    #include "config\cfgForbiddenItems.hpp"
    #include "config\trader\cfgTraderMods.hpp"
};

class CfgMagazines
{
    #include "CfgMagazines.hpp"
};

class CfgSounds
{
    #include "CfgSounds.hpp"
};

class CfgVehicles
{
    #include "CfgVehicles.hpp"
};
