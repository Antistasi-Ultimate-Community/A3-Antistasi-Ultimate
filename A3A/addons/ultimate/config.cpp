#include "script_component.hpp"

class CfgPatches 
{
    class ADDON 
    {
        name = COMPONENT_NAME;
        magazines[] = {QGVAR(LockpickKit_MultiUse), QGVAR(LockpickKit_SingleUse)};
        units[] = {"A3AU_Stash"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_events", "A3_Weapons_F", "A3_Structures_F"};
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

class CfgEditorCategories
{
	class A3U_EditorCategory
	{
		displayName = "Antistasi Ultimate";
	};
};

class CfgEditorSubcategories
{
	class A3U_EditorSubcategoryStatics
	{
		displayName = "Static Holders";
	};
};

class CfgVehicles
{
    #include "CfgVehicles.hpp"
};

class CfgMarkerClasses
{
    class A3AU_MRK
    {
        displayName="Antistasi Ultimate Markers";
    };
};

class CfgMarkers
{
    #include "CfgMarkers.hpp"
};

class CfgMarkerColors
{
    #include "CfgMarkerColors.hpp"
};