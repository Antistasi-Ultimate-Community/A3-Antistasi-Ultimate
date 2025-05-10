//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AAFxTFAegis"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AAF"]] call _fnc_saveToTemplate;

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_aaf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_AAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["Flex_CUP_AAF_SDV"]] call _fnc_saveToTemplate;

["ammobox", "I_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_AAF_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["Flex_CUP_AAF_Quad", "Flex_CUP_AAF_TowingTractor"/*lol*/]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Tigr233011", "Flex_CUP_AAF_Tigr_233114", "Flex_CUP_AAF_LR_Transport"]
    } else {
        ["Flex_CUP_USA_MRAP", "Flex_CUP_USA_nM1151_Unarmed"]
    };
}] call _fnc_saveToTemplate;
["vehiclesLightArmed", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Tigr_233114_KORD", "Flex_CUP_AAF_LR_MG", "Flex_CUP_AAF_LR_SF_GMG", "Flex_CUP_AAF_LR_SF_HMG"]
    } else {
        ["Flex_CUP_USA_nM1025_SOV_M2", "Flex_CUP_USA_nM1025_SOV_Mk19", "Flex_CUP_USA_nM1151_ogpk_m2", "Flex_CUP_USA_nM1151_ogpk_mk19"]
    };
}] call _fnc_saveToTemplate;
["vehiclesTrucks", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Truck_Transport", "Flex_CUP_AAF_Truck_Covered"]
    } else {
        ["Flex_CUP_USA_Truck_transport", "Flex_CUP_USA_Truck_covered"]
    };
}] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", call {
    if (tierWar < 2) then {
        []
    } else {
        ["Flex_CUP_USA_Truck_cargo", "Flex_CUP_USA_Truck_box", "Flex_CUP_USA_Truck_flatbed"]
    };
}] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Truck_Ammo", "Flex_CUP_AAF_M113A3_Reammo"]
    } else {
        ["Flex_CUP_USA_Truck_ammo"]
    };
}] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", call {
    if (tierWar < 8 ) then {
        ["Flex_CUP_AAF_Truck_Repair", "Flex_CUP_AAF_M113A3_Repair"]
    } else {
        ["Flex_CUP_USA_Truck_Repair"]
    };
}] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Truck_Fuel"]
    } else {
        ["Flex_CUP_USA_Truck_Fuel"]
    };
}] call _fnc_saveToTemplate;
["vehiclesMedical", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Truck_Medical", "Flex_CUP_AAF_LR_Ambulance", "Flex_CUP_AAF_M113A3_Med"]
    } else {
        ["Flex_CUP_USA_Truck_medical"]
    };
}] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["Flex_CUP_AAF_M113A3", "Flex_CUP_AAF_M113A3_HQ"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["Flex_CUP_AAF_Warrior"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["Flex_CUP_AAF_BTR80A"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["Flex_CUP_AAF_Leopard_1A3", "Flex_CUP_AAF_Leopard2A6", "Flex_CUP_AAF_Leopard2A6_ERA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["Flex_CUP_AAF_ZSU23"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["Flex_CUP_AAF_BTR80A", "Flex_CUP_AAF_M113A3", "Flex_CUP_AAF_M113A3_HQ"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["Flex_CUP_AAF_Warrior"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["Flex_CUP_AAF_Boat_Transport", "Flex_CUP_AAF_Lifeboat", "Flex_CUP_AAF_RHIB_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["Flex_CUP_AAF_RHIB", "Flex_CUP_AAF_RHIB2Turret", "Flex_CUP_AAF_Frigate"/*Can't help it lol*/]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["Flex_CUP_AAF_BTR80A", "Flex_CUP_AAF_M113A3", "Flex_CUP_AAF_M113A3_HQ"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Plane_Fighter", "Flex_CUP_AAF_Plane_Fighter_2"]
    } else {
        ["Flex_CUP_USA_A10"]
    };
}] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["Flex_CUP_AAF_Fighter"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["Flex_CUP_AAF_C130J"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Heli_Unarmed"]
    } else {
        ["Flex_CUP_USA_MH6J", "Flex_CUP_USA_MH6M_OBS"]
    };
}] call _fnc_saveToTemplate;
["vehiclesHelisTransport", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Heli_Unarmed", "Flex_CUP_AAF_Merlin_HC3_Armed", "Flex_CUP_AAF_Merlin_HC3", "Flex_CUP_AAF_Mi24_Mk3"]
    } else {
        ["Flex_CUP_USA_MH47E", "Flex_CUP_USA_UH60M", "Flex_CUP_USA_UH60M_FFV", "Flex_CUP_USA_UH60M_Unarmed", "Flex_CUP_USA_Unarmed_FFV"]
    };
}] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Heli_dynamicLoadout"]
    } else {
        ["Flex_CUP_USA_AH6M"]
    };
}] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Flex_CUP_AAF_Mi24_Mk3"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Heli_Unarmed", "Flex_CUP_AAF_Merlin_HC3_Armed", "Flex_CUP_AAF_Merlin_HC3"]
    } else {
        ["Flex_CUP_USA_UH60M", "Flex_CUP_UH60M_FFV"]
    };
}] call _fnc_saveToTemplate;

["vehiclesArtillery", ["Flex_CUP_AAF_Truck_MRL"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["Flex_CUP_AAF_Truck_MRL", ["12Rnd_230mm_rockets", "12Rnd_230mm_rockets_cluster"]]]] call _fnc_saveToTemplate;

["uavsAttack", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_UAV_02_dynamicLoadout"]
    } else {
        ["Flex_CUP_USA_UAV_MQ9"]
    };
}] call _fnc_saveToTemplate;
["uavsPortable", ["Flex_CUP_AAF_UAV_06", "Flex_CUP_AAF_UAV_01"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["Flex_CUP_AAF_Tigr_233114_KORD", "Flex_CUP_AAF_LR_MG"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["Flex_CUP_AAF_Truck_Transport", "Flex_CUP_AAF_Truck_Covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Flex_CUP_AAF_Tigr233011", "Flex_CUP_AAF_Tigr_233114", "Flex_CUP_AAF_LR_Transport"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["Flex_CUP_AAF_BTR80A"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["Flex_CUP_AAF_Tigr_233034"]] call _fnc_saveToTemplate;

["staticMGs", ["Flex_CUP_AAF_HMG_high"]] call _fnc_saveToTemplate;
["staticAT", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Kornet", "Flex_CUP_AAF_Metis"]
    } else {
        ["Flex_CUP_USA_TOW", "Flex_CUP_USA_TOW2"]
    };
}] call _fnc_saveToTemplate;
["staticAA", ["Flex_CUP_AAF_Stinger_AA_pod", "Flex_CUP_AAF_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_Mortar"]
    } else {
        ["Flex_CUP_USA_M252"]
    };
}] call _fnc_saveToTemplate;
["staticHowitzers", call {
    if (tierWar < 2) then {
        ["Flex_CUP_AAF_D30"]
    } else {
        ["Flex_CUP_USA_M119"]
    };
}] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", call {
    if (tierWar < 2) then {
        "CUP_30Rnd_122mmHE_D30_M"
    } else {
        "CUP_30Rnd_105mmHE_M119_M"
    };
}] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "CUP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

private _faces = [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros",
    "GreekHead_A3_10_l",
    "GreekHead_A3_10_sa",
    "GreekHead_A3_10_a"
];
["faces", _faces] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["missileATLaunchers", [
    ["launch_O_Vorona_green_F", "", "", "", ["Vorona_HEAT"], [], ""],
    ["CUP_launch_NLAW", "", "", "", [""], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS14"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["CUP_Vector21Nite"]];

_loadoutData set ["traitorUniforms", ["Flex_CUP_AAF_BDU_Digital_Rolled"]];
_loadoutData set ["traitorVests", ["CUP_V_PMC_CIRAS_OD_Empty", "CUP_V_B_Interceptor_Base_Olive", "CUP_V_B_PASGT_no_bags_OD", "CUP_V_OI_TKI_Jacket1_06"]];
_loadoutData set ["traitorHats", ["Flex_CUP_AAF_cap", ""]];

_loadoutData set ["cloakUniforms", ["U_I_FullGhilie_sard"]];
_loadoutData set ["cloakVests", []];
_loadoutData set ["cloakGlasses", []];

_loadoutData set ["officerUniforms", ["Flex_CUP_AAF_Pullover_Uniform", "Flex_CUP_AAF_Pullover_Uniform_Navy"]];
_loadoutData set ["officerVests", ["Flex_CUP_AAF_Osprey_Mk3_Empty"]];
_loadoutData set ["officerHats", ["Flex_CUP_AAF_Beret_Army", "Flex_CUP_AAF_cap", "Flex_CUP_AAF_Patrol_cap"]];

_loadoutData set ["uniforms", [
    "Flex_CUP_AAF_BDU_Digital", "Flex_CUP_AAF_BDU_Digital_Gloves", "Flex_CUP_AAF_BDU_Digital_Pads", "Flex_CUP_AAF_BDU_Digital_Pads_Gloves",
    "Flex_CUP_AAF_BDU_Digital_Pads_Rolled", "Flex_CUP_AAF_BDU_Digital_Pads_Rolled_Gloves", "Flex_CUP_AAF_BDU_Digital_Rolled", "Flex_CUP_AAF_BDU_Digital_Rolled_Gloves"    
]];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = ["CUP_optic_AN_PVS_10_black"];

if (A3A_hasACE) then {
	_slItems append ["ACE_microDAGR", "ACE_DAGR"];
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

private _opticsSMG = ["CUP_optic_MicroT1_low", "CUP_optic_HoloBlack", "CUP_optic_MRad"];
private _opticsClose = ["CUP_optic_HoloBlack", 3, "CUP_optic_CompM4", 1, "CUP_optic_ACOG2", 1];
private _opticsMid = ["CUP_optic_ACOG", 2, "CUP_optic_AIMM_COMPM4_BLK", 1, "CUP_optic_G33_HWS_BLK", 1];
private _opticsSniper = ["CUP_optic_LeupoldMk4_20x40_LRT", "CUP_optic_LeupoldMk4_25x50_LRT", "CUP_optic_LeupoldMk4"];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["glasses", ["CUP_G_RUS_Ratnik_Balaclava_Winter_Green_1"]];
_sfLoadoutData set ["sniVests", ["CUP_V_B_Armatus_OD"]];
_sfLoadoutData set ["vests", ["CUP_V_B_Armatus_BB_OD"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_khk", "Flex_CUP_AAF_Backpack_Compact"]];
_sfLoadoutData set ["slBackpacks", ["Flex_CUP_AAF_Backpack_Compact", "Flex_CUP_AAF_Radio_Backpack"]];
_sfLoadoutData set ["atBackpacks", ["Flex_CUP_AAF_Predator_Backpack"]];
_sfLoadoutData set ["helmets", ["Flex_CUP_AAF_Opscore_No_Headset", "Flex_CUP_AAF_Opscore_SF"]];
_sfLoadoutData set ["slHat", ["Flex_CUP_AAF_Opscore"]];
_sfLoadoutData set ["sniHats", ["Flex_CUP_AAF_Boonie_Wood", "Flex_CUP_AAF_Opscore"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];
_sfLoadoutData set ["rangefinders", ["CUP_LRTV"]];
_sfLoadoutData set ["longRangeRadios", ["Flex_CUP_AAF_Radio_Backpack"]];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_Mk17_CQC_AFG", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", _opticsMid, ["CUP_20Rnd_762x51_B_SCAR", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR"], [], ""],
    ["CUP_arifle_Mk17_CQC", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", _opticsMid, ["CUP_20Rnd_762x51_B_SCAR", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR"], [], ""],
    ["CUP_arifle_Mk17_CQC_FG", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", _opticsMid, ["CUP_20Rnd_762x51_B_SCAR", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_Mk16_STD_AFG", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_STD", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_STD_FG", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_Mk16_CQC_AFG", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_CQC", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_Mk16_CQC_EGLM", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsMid, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Mk16_STD_EGLM", "CUP_muzzle_snds_SCAR_L", "CUP_acc_ANPEQ_15_Black", _opticsMid, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_glaunch_Mk13", "", "CUP_acc_ANPEQ_15_Black", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["SMG_03C_TR_khaki", "muzzle_snds_570", "CUP_acc_LLM_black", _opticsSMG, ["50Rnd_570x28_SMG_03"], [], ""],
    ["SMG_03_TR_khaki", "muzzle_snds_570", "CUP_acc_LLM_black", _opticsSMG, ["50Rnd_570x28_SMG_03"], [], ""],
    ["CUP_smg_MP7", "", "", _opticsSMG, ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""],
    ["CUP_smg_MP7", "", "", _opticsSMG, ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "optic_MRCO", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_Mk20", "CUP_muzzle_snds_SCAR_H", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR_bkl"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag"], [], ""],
    ["srifle_LRR_camo_F", "", "", "optic_SOS", ["7Rnd_408_Mag","7Rnd_408_Mag"], [], ""],
    ["srifle_LRR_camo_F", "", "", "optic_LRPS", ["7Rnd_408_Mag","7Rnd_408_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["hgun_P07_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", [
    "CUP_U_CRYE_G3C_MC_US", "CUP_U_CRYE_G3C_MC_V2", "CUP_U_CRYE_G3C_MC_V3", "CUP_U_CRYE_G3C_MC", "CUP_U_CRYE_G3C_RGR_MC_US", "CUP_U_CRYE_G3C_Tan_MC_US", "CUP_U_CRYE_G3C_MC_US_V2"
]];
_eliteLoadoutData set ["vests", ["CUP_V_CPC_Fast_mc", "CUP_V_CPC_Fastbelt_mc"]];
_eliteLoadoutData set ["medVests", ["CUP_V_CPC_medical_mc", "CUP_V_CPC_medicalbelt_mc"]];
_eliteLoadoutData set ["sniVests", ["CUP_V_CPC_light_mc", "CUP_V_CPC_lightbelt_mc"]];
_eliteLoadoutData set ["slVests", ["CUP_V_CPC_communications_mc", "CUP_V_CPC_tl_mc", "CUP_V_CPC_communicationsbelt_mc", "CUP_V_CPC_tlbelt_mc"]];
_eliteLoadoutData set ["engVests", ["CUP_V_CPC_weapons_mc", "CUP_V_CPC_weaponsbelt_mc"]];
_eliteLoadoutData set ["backpacks", ["CUP_B_USPack_Coyote", "CUP_B_US_IIID_OCP", "CUP_B_US_Assault_OCP"]];
_eliteLoadoutData set ["longRangeRadios", ["CUP_B_Kombat_Radio_Olive"]];
_eliteLoadoutData set ["glasses", ["G_Tactical_Clear", "G_Tactical_Black", "CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drk"]];
_eliteLoadoutData set ["goggles", ["G_Combat"]];
_eliteLoadoutData set ["slHat", ["H_Beret_02"]];
_eliteLoadoutData set ["helmets", [
    "CUP_H_USArmy_HelmetACH_OCP", "CUP_H_USArmy_HelmetACH_GCOVERED_OCP", "CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OCP", "CUP_H_USArmy_HelmetACH_ESS_OCP", "CUP_H_USArmy_HelmetACH_ESS_Headset_OCP", "CUP_H_USArmy_HelmetACH_Headset_OCP"
]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A3_black", "", "CUP_acc_ANPEQ_15_Black", _opticsMid, ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_M4A3_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_standard_short_black", "", "", _opticsClose, ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "", _opticsMid, ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_Mk48", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_Mk48", "", "", "CUP_optic_ACOG_TA648_308_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""], 1,
    ["CUP_lmg_m249_pip4", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 2,
    ["CUP_lmg_m249_pip3", "", "", "CUP_optic_AIMM_COMPM4_BLK", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""], 2
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M110", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_SB_2_12x50_PMII", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_Harris_1A2_L"], 3,
    ["CUP_srifle_Mk12SPR", "CUP_muzzle_snds_Mk12", "CUP_acc_ANPEQ_15_Black", "CUP_optic_LeupoldMk4_MRT_tan", ["CUP_20Rnd_556x45_Stanag"], [], "CUP_bipod_Harris_1A2_L_BLK"], 1
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M2010_dsrt", "", "acc_pointer_IR", _opticsSniper, ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"], 4,
    ["CUP_srifle_M107_desert", "", "", _opticsSniper, ["CUP_10Rnd_127x99_M107"], [], ""], 1
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_M9A1", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Glock17_blk", "", "CUP_acc_CZ_M3X", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M136", "", "", "", [], [], ""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP", "CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OEFCP"]];
_militaryLoadoutData set ["slUniforms", ["CUP_U_B_USArmy_ACU_Rolled_Gloves_OEFCP"]];
_militaryLoadoutData set ["mgVests", ["Flex_CUP_AAF_Osprey_Mk3_AutomaticRifleman"]];
_militaryLoadoutData set ["medVests", ["Flex_CUP_AAF_Osprey_Mk3_Medic"]];
_militaryLoadoutData set ["slVests", ["Flex_CUP_AAF_Osprey_Mk3_SL"]];
_militaryLoadoutData set ["sniVests", ["Flex_CUP_AAF_Osprey_Mk3_Empty"]];
_militaryLoadoutData set ["glVests", ["Flex_CUP_AAF_Osprey_Mk3_Grenadier"]];
_militaryLoadoutData set ["vests", ["Flex_CUP_AAF_Osprey_Mk3_Rifleman"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_cbr", "CUP_B_AssaultPack_Coyote", "B_AssaultPack_cbr"]];
_militaryLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_US_Assault_OEFCP"]];
_militaryLoadoutData set ["helmets", ["Flex_CUP_AAF_PASGT", "Flex_CUP_AAF_PASGT_gog_cov2", "Flex_CUP_AAF_PASGT_cov"]];
_militaryLoadoutData set ["sniHats", ["Flex_CUP_AAF_Boonie_Wood"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["slRifles", [
    ["arifle_Mk20_plain_F", "", "", _opticsMid + ["optic_MRCO", 3], ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["arifle_Mk20_plain_F", "", "", _opticsClose + ["CUP_optic_TrijiconRx01_black", 3], ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["arifle_Mk20C_plain_F", "", "", _opticsClose + ["CUP_optic_TrijiconRx01_black", 3], ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["arifle_Mk20_GL_plain_F", "", "", _opticsMid + ["CUP_optic_TrijiconRx01_black", 3], ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_AFG", "", "", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_VFG", "", "", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""], 1,
    ["CUP_smg_MP7", "", "", _opticsSMG, ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Red_Tracer"], [], ""], 2
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "optic_MRCO", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_Mk18_blk", "", "", "CUP_optic_SB_11_4x20_PM", ["20Rnd_762x51_Mag"], [], "bipod_03_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_RPG26", "", "", "", [""], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["hgun_P07_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["Flex_CUP_AAF_Pullover_Uniform_Navy"]];
_policeLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_Black_Veh", "CUP_V_PMC_CIRAS_Black_Empty", "CUP_V_PMC_CIRAS_Black_Patrol", "CUP_V_PMC_CIRAS_Black_TL"]];
_policeLoadoutData set ["helmets", ["Flex_CUP_AAF_Opscore_Black_No_Headset", "Flex_CUP_AAF_Opscore_Black", "Flex_CUP_AAF_Beret_MP"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_M1014", "", "", _opticsClose + ["", 5], ["CUP_6Rnd_12Gauge_Slug", "CUP_6Rnd_12Gauge_Pellets_No00_Buck"], [], ""],
    ["CUP_sgun_M1014_vfg", "", "", _opticsClose + ["", 5], ["CUP_6Rnd_12Gauge_Slug", "CUP_6Rnd_12Gauge_Pellets_No00_Buck"], [], ""],
    ["CUP_sgun_M1014_solidstock", "", "", _opticsClose + ["", 5], ["CUP_6Rnd_12Gauge_Slug", "CUP_6Rnd_12Gauge_Pellets_No00_Buck"], [], ""],
    ["CUP_sgun_M1014_Entry", "", "", _opticsSMG + ["", "", ""], ["CUP_6Rnd_12Gauge_Slug", "CUP_6Rnd_12Gauge_Pellets_No00_Buck"], [], ""],
    ["CUP_sgun_M1014_Entry_vfg", "", "", _opticsSMG + ["", "", ""], ["CUP_6Rnd_12Gauge_Slug", "CUP_6Rnd_12Gauge_Pellets_No00_Buck"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "", "", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "", "", _opticsSMG, ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
    ["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
    ["SMG_03_black", "", "", "", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
    ["SMG_03C_TR_black", "", "", _opticsSMG, ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
    ["SMG_03_TR_black", "", "", _opticsSMG, ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["hgun_P07_blk_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["vests", ["CUP_V_B_ALICE", "V_SmershVest_01_F", "CUP_V_O_RUS_RPS_Smersh_AK_Brown", "CUP_V_O_RUS_RPS_Smersh_SVD_Brown"]];
_militiaLoadoutData set ["slVests", ["V_SmershVest_01_radio_F", "CUP_V_O_RUS_RPS_Smersh_PKP_SPP_Brown"]];
_militiaLoadoutData set ["mgVests", ["CUP_V_O_RUS_RPS_Smersh_PKP_Light_Brown", "CUP_V_O_RUS_RPS_Smersh_PKP_Brown"]];
_militiaLoadoutData set ["glVests", ["CUP_V_O_RUS_RPS_Smersh_VOG_SPP_Brown", "CUP_V_O_RUS_RPS_Smersh_VOG_Brown"]];
_militiaLoadoutData set ["backpacks", ["B_Messenger_Coyote_F", "Flex_CUP_AAF_Backpack_Compact", "B_AssaultPack_rgr"]];
_militiaLoadoutData set ["atBackpacks", ["B_FieldPack_green_F"]];
_militiaLoadoutData set ["helmets", ["Flex_CUP_AAF_Mk6", "Flex_CUP_AAF_Mk6_PRR", "Flex_CUP_AAF_Patrol_cap"]];
_militiaLoadoutData set ["slHat", ["Flex_CUP_AAF_Patrol_cap", "Flex_CUP_AAF_cap"]];
_militiaLoadoutData set ["sniHats", ["Flex_CUP_AAF_Boonie_Wood"]];
_militiaLoadoutData set ["NVGs", ["CUP_NVG_PVS7", ""]];

private _militiaOpticsClose = ["CUP_optic_CompM2_low_OD", 1, "CUP_optic_Aimpoint_5000", 1, "", 3];
private _militiaOpticsMid = ["CUP_optic_AIMM_M68_OD", 1, "CUP_optic_HensoldtZ0_low", 1, "", 3];

_militiaLoadoutData set ["slRifles", [
    ["CUP_arifle_G3A3_ris", "", "", _militiaOpticsMid, ["CUP_20Rnd_762x51_G3"], [], ""],
    ["CUP_arifle_G3A3_ris_vfg", "", "", _militiaOpticsMid, ["CUP_20Rnd_762x51_G3"], [], ""],
    ["CUP_arifle_G3A3_modern_ris", "", "", _militiaOpticsMid, ["CUP_20Rnd_762x51_G3"], [], ""],
    ["CUP_arifle_M16A2", "", "", "", ["30Rnd_556x45_Stanag"], [], ""]
]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_G3A3_ris", "", "", _militiaOpticsClose, ["CUP_20Rnd_762x51_G3"], [], ""],
    ["CUP_arifle_G3A3_ris_vfg", "", "", _militiaOpticsClose, ["CUP_20Rnd_762x51_G3"], [], ""],
    ["CUP_arifle_G3A3_modern_ris", "", "", _militiaOpticsClose, ["CUP_20Rnd_762x51_G3"], [], ""],
    ["CUP_arifle_M16A2", "", "", "", ["30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_Colt727_M203", "", "", "", ["30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M16A2_GL", "", "", "", ["30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_FNMAG", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 3,
    ["CUP_lmg_FNMAG_RIS", "", "", ["CUP_optic_CompM2_low", 1, "CUP_optic_ElcanM145", 1, "", 3], ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""], 2,
    ["CUP_lmg_MG3", "", "", "", ["CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""], 5
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_G3A3_modern_ris", "", "", ["CUP_optic_ElcanM145", 4, "", 1], ["CUP_20Rnd_762x51_G3"], [], "CUP_bipod_G3SG1"]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M14_DMR", "", "", ["CUP_optic_LeupoldMk4", 1, "optic_KHS_old", 1], ["10Rnd_Mk14_762x51_Mag", "10Rnd_Mk14_762x51_Mag", "CUP_20Rnd_762x51_DMR"], [], "CUP_bipod_Harris_1A2_L"]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_RPG26", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""],
    ["CUP_hgun_CZ75", "", "", "", ["CUP_16Rnd_9x19_cz75"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", [
    "Flex_CUP_AAF_BDU_Digital", "Flex_CUP_AAF_BDU_Digital_Gloves", "Flex_CUP_AAF_BDU_Digital_Pads", "Flex_CUP_AAF_BDU_Digital_Pads_Gloves"
]];
_crewLoadoutData set ["vests", ["Flex_CUP_AAF_Osprey_Mk3_Crewman"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];
_crewLoadoutData set ["carbines", [
    ["arifle_Mk20C_plain_F", "", "", "CUP_optic_TrijiconRx01_black", ["30Rnd_556x45_Stanag"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", [
    "Flex_CUP_AAF_BDU_Digital", "Flex_CUP_AAF_BDU_Digital_Gloves", "Flex_CUP_AAF_BDU_Digital_Pads", "Flex_CUP_AAF_BDU_Digital_Pads_Gloves"
]];
_pilotLoadoutData set ["vests", ["Aircrew_vest_2_NH", "CUP_V_B_PilotVest"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O"]];
_pilotLoadoutData set ["carbines", [
    ["CUP_smg_MP7", "", "", "", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];	

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _patrolSniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["cloakGlasses"] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["cloakGlasses"] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["slRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};
////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];


[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;