#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
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

#include "CfgFunctions.hpp"

class A3U
{
    #include "config\plane\cfgPlaneLoadouts.hpp"
    #include "config\cfgForbiddenItems.hpp"
    #include "config\trader\cfgTraderMods.hpp"
};

class CfgVehicles
{
    #include "CfgVehicles.hpp"
};

class Extended_InitPost_EventHandlers
{
    class A3AU_TerrainSmoother_Base_F 
	{
        class ADDON 
    {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
    };
    };

    class A3AU_VegetationCleaner_Base_F 
    {
        class ADDON 
    {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
    };
    };

    class GVAR(BB_TerrainObjectHider_Base) 
    {
        class ADDON 
        {
            clientInit = QUOTE(call A3A_fnc_handlerTerrainObjectHiderPostInitClient);
    };
};
};

class Extended_PostInit_EventHandlers 
{
    class ADDON
	{
        init = "call A3U_fnc_postInit";
    };
};

class Extended_PreInit_EventHandlers 
{
    class ADDON
	{
        init = "call A3U_fnc_init";
    };
};
