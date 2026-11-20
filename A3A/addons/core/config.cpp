#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(Occupants_Base),
            QGVAR(Invaders_Base),
            QGVAR(Rivals_Base),
            QGVAR(Civilians_Base),
            QGVAR(Rebels_Base),
            QGVAR(Rebels_Unarmed),
            QGVAR(Rebels_Medic),
            QGVAR(Rebels_Sniper),
            QGVAR(Rebels_Marksman),
            QGVAR(Rebels_LAT),
            QGVAR(Rebels_MachineGunner),
            QGVAR(Rebels_ExplosivesExpert),
            QGVAR(Rebels_Grenadier),
            QGVAR(Rebels_SquadLeader),
            QGVAR(Rebels_Engineer),
            QGVAR(Rebels_AT),
            QGVAR(Rebels_AA),
            QGVAR(Rebels_Petros),
            QGVAR(Occupants_Militia_SquadLeader),
            QGVAR(Occupants_Militia_Rifleman),
            QGVAR(Occupants_Militia_Radioman),
            QGVAR(Occupants_Militia_Medic),
            QGVAR(Occupants_Militia_Engineer),
            QGVAR(Occupants_Militia_ExplosivesExpert),
            QGVAR(Occupants_Militia_Grenadier),
            QGVAR(Occupants_Militia_LAT),
            QGVAR(Occupants_Militia_AT),
            QGVAR(Occupants_Militia_AA),
            QGVAR(Occupants_Militia_MachineGunner),
            QGVAR(Occupants_Militia_Marksman),
            QGVAR(Occupants_Militia_Sniper),
            QGVAR(Occupants_Military_SquadLeader),
            QGVAR(Occupants_Military_Rifleman),
            QGVAR(Occupants_Military_Radioman),
            QGVAR(Occupants_Military_Medic),
            QGVAR(Occupants_Military_Engineer),
            QGVAR(Occupants_Military_ExplosivesExpert),
            QGVAR(Occupants_Military_Grenadier),
            QGVAR(Occupants_Military_LAT),
            QGVAR(Occupants_Military_AT),
            QGVAR(Occupants_Military_AA),
            QGVAR(Occupants_Military_MachineGunner),
            QGVAR(Occupants_Military_Marksman),
            QGVAR(Occupants_Military_Sniper),
            QGVAR(Occupants_Elite_SquadLeader),
            QGVAR(Occupants_Elite_Rifleman),
            QGVAR(Occupants_Elite_Radioman),
            QGVAR(Occupants_Elite_Medic),
            QGVAR(Occupants_Elite_Engineer),
            QGVAR(Occupants_Elite_ExplosivesExpert),
            QGVAR(Occupants_Elite_Grenadier),
            QGVAR(Occupants_Elite_LAT),
            QGVAR(Occupants_Elite_AT),
            QGVAR(Occupants_Elite_AA),
            QGVAR(Occupants_Elite_MachineGunner),
            QGVAR(Occupants_Elite_Marksman),
            QGVAR(Occupants_Elite_Sniper),
            QGVAR(Occupants_SpecialForces_SquadLeader),
            QGVAR(Occupants_SpecialForces_Rifleman),
            QGVAR(Occupants_SpecialForces_Radioman),
            QGVAR(Occupants_SpecialForces_Medic),
            QGVAR(Occupants_SpecialForces_Engineer),
            QGVAR(Occupants_SpecialForces_ExplosivesExpert),
            QGVAR(Occupants_SpecialForces_Grenadier),
            QGVAR(Occupants_SpecialForces_LAT),
            QGVAR(Occupants_SpecialForces_AT),
            QGVAR(Occupants_SpecialForces_AA),
            QGVAR(Occupants_SpecialForces_MachineGunner),
            QGVAR(Occupants_SpecialForces_Marksman),
            QGVAR(Occupants_SpecialForces_Sniper),
            QGVAR(Occupants_Other_Crew),
            QGVAR(Occupants_Other_Unarmed),
            QGVAR(Occupants_Other_Official),
            QGVAR(Occupants_Other_Traitor),
            QGVAR(Occupants_Other_Pilot),
            QGVAR(Occupants_Police_SquadLeader),
            QGVAR(Occupants_Police_Standard),
            QGVAR(Invaders_Militia_SquadLeader),
            QGVAR(Invaders_Militia_Rifleman),
            QGVAR(Invaders_Militia_Radioman),
            QGVAR(Invaders_Militia_Medic),
            QGVAR(Invaders_Militia_Engineer),
            QGVAR(Invaders_Militia_ExplosivesExpert),
            QGVAR(Invaders_Militia_Grenadier),
            QGVAR(Invaders_Militia_LAT),
            QGVAR(Invaders_Militia_AT),
            QGVAR(Invaders_Militia_AA),
            QGVAR(Invaders_Militia_MachineGunner),
            QGVAR(Invaders_Militia_Marksman),
            QGVAR(Invaders_Militia_Sniper),
            QGVAR(Invaders_Military_SquadLeader),
            QGVAR(Invaders_Military_Rifleman),
            QGVAR(Invaders_Military_Radioman),
            QGVAR(Invaders_Military_Medic),
            QGVAR(Invaders_Military_Engineer),
            QGVAR(Invaders_Military_ExplosivesExpert),
            QGVAR(Invaders_Military_Grenadier),
            QGVAR(Invaders_Military_LAT),
            QGVAR(Invaders_Military_AT),
            QGVAR(Invaders_Military_AA),
            QGVAR(Invaders_Military_MachineGunner),
            QGVAR(Invaders_Military_Marksman),
            QGVAR(Invaders_Military_Sniper),
            QGVAR(Invaders_Elite_SquadLeader),
            QGVAR(Invaders_Elite_Rifleman),
            QGVAR(Invaders_Elite_Radioman),
            QGVAR(Invaders_Elite_Medic),
            QGVAR(Invaders_Elite_Engineer),
            QGVAR(Invaders_Elite_ExplosivesExpert),
            QGVAR(Invaders_Elite_Grenadier),
            QGVAR(Invaders_Elite_LAT),
            QGVAR(Invaders_Elite_AT),
            QGVAR(Invaders_Elite_AA),
            QGVAR(Invaders_Elite_MachineGunner),
            QGVAR(Invaders_Elite_Marksman),
            QGVAR(Invaders_Elite_Sniper),
            QGVAR(Invaders_SpecialForces_SquadLeader),
            QGVAR(Invaders_SpecialForces_Rifleman),
            QGVAR(Invaders_SpecialForces_Radioman),
            QGVAR(Invaders_SpecialForces_Medic),
            QGVAR(Invaders_SpecialForces_Engineer),
            QGVAR(Invaders_SpecialForces_ExplosivesExpert),
            QGVAR(Invaders_SpecialForces_Grenadier),
            QGVAR(Invaders_SpecialForces_LAT),
            QGVAR(Invaders_SpecialForces_AT),
            QGVAR(Invaders_SpecialForces_AA),
            QGVAR(Invaders_SpecialForces_MachineGunner),
            QGVAR(Invaders_SpecialForces_Marksman),
            QGVAR(Invaders_SpecialForces_Sniper),
            QGVAR(Invaders_Other_Crew),
            QGVAR(Invaders_Other_Unarmed),
            QGVAR(Invaders_Other_Official),
            QGVAR(Invaders_Other_Traitor),
            QGVAR(Invaders_Other_Pilot),
            QGVAR(Invaders_Police_SquadLeader),
            QGVAR(Invaders_Police_Standard),
            QGVAR(Civilians_Worker),
            QGVAR(Civilians_Press),
            QGVAR(Civilians_Man)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_events"};
        skipWhenAnyAddonPresent[] = {"a3uebet_main"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgDebriefing.hpp"
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
