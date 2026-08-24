#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "a3a_unit_reb_unarmed",
            "a3a_unit_reb",
            "a3a_unit_reb_medic",
            "a3a_unit_reb_sniper",
            "a3a_unit_reb_marksman",
            "a3a_unit_reb_lat",
            "a3a_unit_reb_mg",
            "a3a_unit_reb_exp",
            "a3a_unit_reb_gl",
            "a3a_unit_reb_sl",
            "a3a_unit_reb_eng",
            "a3a_unit_reb_at",
            "a3a_unit_reb_aa",
            "a3a_unit_reb_petros",
            "a3a_unit_west",
            "a3a_unit_east",
            "a3a_unit_riv",
            "a3a_unit_civ"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_events"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp" 
// Base AI unit definitions
#include "CfgVehicles.hpp"
#include "CfgMarkers.hpp"
#include "CfgWeapons.hpp"
#include "CfgWorlds.hpp"
class A3A {
    #include "IntelMessages.hpp"
    #include "Templates.hpp"
    #include "UtilityItems.hpp"
    #include "Params.hpp"

#if __A3_DEBUG__
    #include "CfgFunctions.hpp"
#endif
};
#if __A3_DEBUG__
    class CfgFunctions {
        class A3A {
            class debug {
                file = QPATHTOFOLDER(functions\debug);
                class prepFunctions { preInit = 1; };
                class runPostInitFuncs { postInit = 1; };
            };
        };
    };
#else
    #include "CfgFunctions.hpp"
#endif

// Load external member list if present
#if __has_include("\A3AMembers.hpp")
#include "\A3AMembers.hpp"
#endif

#ifndef UseDoomGUI
    #include "defines.hpp"
    #include "dialogs.hpp"
#endif

#include "keybinds.hpp"

#include "Scripts\MagRepack\MagRepack_config.hpp"

class CfgMPGameTypes 
{
    class ANTI 
    {
        name = "Antistasi";
        shortcut = "ANTI";
        id = 30;
        picture = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo_small.paa);
        description = "";
    };
};
