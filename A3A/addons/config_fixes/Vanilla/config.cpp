//Vanilla - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(A3) 
    {
        name = COMPONENT_NAME;
        units[] = {
            "a3a_Boat_Armed_01_hmg_blufor_F",
            "a3a_Offroad_01_black_F",
            "a3a_Offroad_01_black_armed_F",
            "a3a_Offroad_01_black_AT_F",
            "a3a_Offroad_02_black_unarmed_F",
            "a3a_Offroad_02_black_AT_F",
            "a3a_Offroad_02_LMG_black_F",
            "a3a_LSV_02_unarmed_black_F",
            "a3a_LSV_02_armed_black_F",
            "a3a_LSV_02_AT_black_F",
            "a3a_LSV_01_unarmed_black_F",
            "a3a_LSV_01_AT_black_F",
            "a3a_Van_02_black_transport_F",
            "a3a_Van_02_black_vehicle_F",
            "a3a_Van_02_black_service_F",
            "a3a_Van_02_black_medevac_F",
            "a3a_Offroad_01_green_F",
            "a3a_Offroad_01_green_armed_F",
            "a3a_Offroad_01_green_AT_F",
            "a3a_Offroad_01_comms_green_F",
            "a3a_Offroad_01_covered_green_F",
            "a3a_Offroad_01_tan_F",
            "a3a_Offroad_01_tan_armed_F",
            "a3a_Offroad_01_tan_AT_F",
            "a3a_Offroad_01_comms_tan_F",
            "a3a_Offroad_01_covered_tan_F",
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
//#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
//#include "CfgMarkers.hpp"
#include "CfgWeapons.hpp"
