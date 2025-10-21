//////////////////////////
//   Side Information   //
//////////////////////////

["name", "UK"] call _fnc_saveToTemplate;
["spawnMarkerName", "UK Reinforcements"] call _fnc_saveToTemplate;

["flag", "Flag_UK_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "LIB_AmmoCrate_Arty_SU"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["cwr3_b_uk_landrover", "B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["cwr3_b_uk_landrover", "CUP_B_LR_Transport_GB_W"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_LR_MG_GB_W", "CUP_B_BAF_Coyote_GMG_W", "CUP_B_BAF_Coyote_L2A1_W", "CUP_B_Jackal2_L2A1_GB_W", "CUP_B_LR_Special_M2_GB_W", "CUP_B_LR_MG_GB_W", "CUP_B_Ridgback_GMG_GB_W", "CUP_B_Ridgback_HMG_GB_W", "CUP_B_Ridgback_LMG_GB_W", "CUP_B_Wolfhound_GMG_GB_W", "CUP_B_Wolfhound_HMG_GB_W", "CUP_B_Wolfhound_LMG_GB_W"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["cwr3_b_uk_fv620_transport", "CUP_B_MTVR_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["cwr3_b_uk_fv620_transport"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["cwr3_b_uk_fv620_reammo", "CUP_B_MTVR_Ammo_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["cwr3_b_uk_fv620_repair", "CUP_B_MTVR_Repair_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["cwr3_b_uk_fv620_refuel", "CUP_B_MTVR_Refuel_BAF_WOOD"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["cwr3_b_uk_landrover_mev", "cwr3_b_fv432_mev", "CUP_B_LR_Ambulance_GB_W"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["cwr3_b_uk_fv432_gpmg","cwr3_b_uk_fv432_gpmg", "CUP_B_Mastiff_HMG_GB_W", "CUP_B_Mastiff_LMG_GB_W", "CUP_B_Mastiff_GMG_GB_W""CUP_B_FV432_Bulldog_GB_W", "CUP_B_FV432_Bulldog_GB_W"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["cwr3_b_uk_fv432_peak", "cwr3_b_uk_fv510"]] call _fnc_saveToTemplate;            // mortar carrier: "CUP_B_M1129_MC_MK19_Woodland"
["vehiclesIFVs", ["cwr3_b_uk_fv101", "cwr3_b_uk_fv107", "CUP_B_FV510_GB_W", "CUP_B_MCV80_GB_W", "CUP_B_FV510_GB_W_SLAT", "CUP_B_MCV80_GB_W_SLAT"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["cwr3_b_uk_fv4201", "cwr3_b_uk_fv4030", "CUP_B_Challenger2_Woodland_BAF"]] call _fnc_saveToTemplate;
["vehiclesAA", ["cwr3_b_fia_m163", "CUP_B_M6LineBacker_USA_W"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["cwr3_b_uk_fv432_gpmg", "cwr3_b_uk_fv432_peak", "CUP_B_Mastiff_HMG_GB_W", "CUP_B_Mastiff_LMG_GB_W", "CUP_B_Mastiff_GMG_GB_W", "CUP_B_FV432_Bulldog_GB_W", "CUP_B_FV432_Bulldog_GB_W"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["cwr3_b_uk_fv4201", "cwr3_b_uk_fv4030", "CUP_B_FV510_GB_W", "CUP_B_MCV80_GB_W", "CUP_B_FV510_GB_W_SLAT", "CUP_B_MCV80_GB_W_SLAT"]] call _fnc_saveToTemplate; 

["vehiclesTransportBoats", ["LIB_LCVP", "cwr3_b_zodiac"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_LCM3_Armed", "LIB_LCI", "cwr3_b_boat", "CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["LIB_P47", "cwr3_b_frs1", "CUP_B_GR9_DYN_GB"];
private _vehiclesPlanesLargeCAS = [];
private _vehiclesPlanesAA = ["LIB_RAF_P39", "cwr3_b_uk_f4m", "CUP_B_GR9_DYN_GB"];
["vehiclesPlanesTransport", ["LIB_C47_RAF", "cwr3_b_c130", "CUP_B_C130J_GB"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS = ["sab_fl_hurricane_2","sab_fl_tempest","sab_fl_dh98"];
	_vehiclesPlanesAA = ["sab_fl_hurricane","sab_fl_spitfire_mk1","sab_fl_spitfire_mk5","sab_fl_spitfire_mkxiv"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
	_vehiclesPlanesLargeCAS append ["sab_sw_halifax"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _vehiclesPlanesLargeCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["cwr3_b_uk_lynx_ah7_transport", "CUP_B_AW159_Unarmed_RN_Blackcat", "CUP_B_AW159_Unarmed_GB", "CUP_B_AW159_Unarmed_RN_Grey"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["cwr3_b_uk_puma_hc1", "cwr3_b_uk_hc1", "CUP_B_CH47F_GB", "CUP_B_MH47E_GB", "CUP_B_Merlin_HC3_GB", "CUP_B_Merlin_HC3_Armed_GB", "CUP_B_Merlin_HC3A_GB", "CUP_B_Merlin_HC4_GB", "CUP_B_SA330_Puma_HC1_BAF", "CUP_B_SA330_Puma_HC2_BAF"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["cwr3_b_uk_lynx_ah7_cas", "cwr3_b_uk_lynx_ah7_tow", "CUP_B_AW159_GB"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["cwr3_b_ah64", "cwr3_b_ah64_hellfire", "CUP_B_AH1_DL_BAF"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", ["CUP_B_AW159_Unarmed_RN_Blackcat", "CUP_B_AW159_Unarmed_GB", "CUP_B_AW159_Unarmed_RN_Grey", "CUP_B_AW159_GB"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CUP_B_M270_HE_BAF_WOOD"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["CUP_B_M270_HE_BAF_WOOD", ["CUP_12Rnd_MLRS_HE"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["CUP_B_USMC_DYN_MQ9"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
private _vehiclesMilitiaLightArmed = ["LIB_UK_M3_Halftrack", "LIB_UniversalCarrier", "LIB_UK_Willys_MB_M1919"];
["vehiclesMilitiaTrucks", ["LIB_US_GMC_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_UK_Willys_MB"]] call _fnc_saveToTemplate;
private _vehiclesMilitiaAPCs = ["LIB_M4A4_FIREFLY", "LIB_Cromwell_Mk4", "LIB_Churchill_Mk7", "LIB_Cromwell_Mk4", "LIB_Churchill_Mk7_Crocodile", "LIB_Cromwell_Mk4", "LIB_Churchill_Mk7_Howitzer", "LIB_Churchill_Mk7_AVRE"]; 

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesMilitiaLightArmed append ["FA_DaimlerMk2"]; 
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesMilitiaAPCs append ["FA_ValentineMk3","FA_ValentineMk3"];
};
["vehiclesMilitiaAPCs", _vehiclesMilitiaAPCs] call _fnc_saveToTemplate;
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US", "CUP_B_L111A1_BAF_DDPM"]] call _fnc_saveToTemplate;
["staticAT", ["cwr3_b_tow", "CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["cwr3_b_uk_javelin_lml", "CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_M2_60"]] call _fnc_saveToTemplate;
["staticHowitzers", ["cwr3_b_m119"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "CUP_30Rnd_105mmHE_M119_M"] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_60mmHE_M2"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_60mm_M2_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["LIB_US_M1A1_ATMINE", "CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_M3_MINE", "APERSMine"]] call _fnc_saveToTemplate;

#include "ERA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB", "CUP_D_Male01_GB_BAF","CUP_D_Male02_GB_BAF","CUP_D_Male03_GB_BAF","CUP_D_Male04_GB_BAF","CUP_D_Male05_GB_BAF"]] call _fnc_saveToTemplate;
["faces", ["WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;


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
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["LIB_US_M1A1_ATMINE_mag","ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["LIB_M3_MINE_mag","APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag","DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag","SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["LIB_MillsBomb","CUP_HandGrenade_M67"]];
_loadoutData set ["antiTankGrenades", ["LIB_No82"]];
_loadoutData set ["smokeGrenades", ["SmokeShell","SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["TFAR_SCR536","ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS7"]];
_loadoutData set ["binoculars", ["LIB_Binocular_UK","Binocular"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_UK","Binocular"]];

_loadoutData set ["traitorUniforms", ["cwr3_b_uk_uniform_dpm_weathered_gloves"]];
_loadoutData set ["traitorVests", ["cwr3_b_uk_vest_58webbing_belt"]];
_loadoutData set ["traitorHats", ["cwr3_b_uk_headgear_beret_infantry"]];

_loadoutData set ["officerUniforms", ["cwr3_b_uk_uniform_dpm_gloves"]];
_loadoutData set ["officerVests", ["cwr3_b_uk_vest_58webbing_belt"]];
_loadoutData set ["officerHats", ["cwr3_b_uk_headgear_beret_infantry"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = [];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

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

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["CUP_U_B_BAF_MTP_UBACSLONG", "CUP_U_B_BAF_MTP_UBACSLONG_Gloves"]];
_sfLoadoutData set ["vests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Scout"]];
_sfLoadoutData set ["mgVests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_AutomaticRifleman"]];
_sfLoadoutData set ["medVests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Medic"]];
_sfLoadoutData set ["glVests", ["CUP_V_B_BAF_MTP_Osprey_Mk4_Grenadier"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr"]];
_sfLoadoutData set ["slBackpacks", ["CUP_B_Motherlode_Radio_MTP"]];
_sfLoadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Tan_SF"]];
_sfLoadoutData set ["slHat", ["CUP_H_BAF_PARA_PRROVER_BERET"]];
_sfLoadoutData set ["sniHats", ["CUP_H_USArmy_Boonie_OCP"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_GPNVG_black"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2", "CUP_muzzle_snds_L85", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2_G", "CUP_muzzle_snds_L85", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "CUP_muzzle_snds_M16", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2", "CUP_muzzle_snds_L85", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
    ["CUP_arifle_L85A2", "CUP_muzzle_snds_L85", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "CUP_muzzle_snds_MP5", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1", "", "", "CUP_optic_CompM2_low", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_ACOG2", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_ElcanM145", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L7A2_Flat", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_ElcanM145", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_Eotech553_Black", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_CompM2_low", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4_MRT_tan", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
    ["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_Leupold_VX3", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Mk23", "CUP_muzzle_snds_mk23", "CUP_acc_mk23_lam_f", "", ["CUP_12Rnd_45ACP_mk23"], [], ""],
    ["CUP_hgun_M9", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_M9A1", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Browning_HP", "CUP_muzzle_snds_M9", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_sfLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
	["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];

	
/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSLONGKNEE", "CUP_U_B_BAF_DPM_UBACSLONGKNEE_Gloves", "CUP_U_B_BAF_DPM_UBACSROLLED_Gloves", "CUP_U_B_BAF_DPM_UBACSROLLEDKNEE"]];
_eliteLoadoutData set ["vests", ["CUP_V_B_BAF_DPM_Osprey_Mk3_Rifleman"]];
_eliteLoadoutData set ["mgVests", ["CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman"]];
_eliteLoadoutData set ["glVests", ["CUP_V_B_BAF_DPM_Osprey_Mk3_Grenadier"]];
_eliteLoadoutData set ["backpacks", ["B_Carryall_khk"]];
_eliteLoadoutData set ["atBackpacks", ["B_Kitbag_rgr"]];
_eliteLoadoutData set ["helmets", ["CUP_H_BAF_DPM_Mk6_NETTING_PRR", "CUP_H_BAF_DPM_Mk6_GOGGLES_PRR", "CUP_H_BAF_DPM_Mk6_GLASS_PRR", "CUP_H_BAF_DPM_Mk6_CREW_PRR"]];
_eliteLoadoutData set ["slHat", ["CUP_H_FR_PRR_BoonieWDL"]];
_eliteLoadoutData set ["sniHats", ["CUP_H_FR_PRR_BoonieWDL"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_Aimpoint_5000", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_NG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_arifle_L85A2_G", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_L85A2", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Stanag_L85"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_L85A2_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_L110A1", "", "", "CUP_optic_ACOG2", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_CompM2_low", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_Eotech553_Black", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L110A1", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1"], [], ""],
    ["CUP_lmg_L7A2_Flat", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_Elcan_SpecterDR", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_L7A2", "", "", "CUP_optic_CompM2_low", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1", "", "", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"],
    ["CUP_srifle_L129A1", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_L129_M"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["sniperRifles", [
	["CUP_srifle_AWM_blk", "", "", "CUP_optic_Leupold_VX3", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
	["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"],
	["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["sidearms", [   
	["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
	["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
	
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["cwr3_b_uk_uniform_dpm_weathered", "cwr3_b_uk_uniform_dpm_weathered_rolled"]];
_militaryLoadoutData set ["slUniforms", ["cwr3_b_uk_uniform_dpm_weathered_gloves"]];
_militaryLoadoutData set ["vests", ["cwr3_b_uk_vest_58webbing"]];
_militaryLoadoutData set ["mgVests", ["cwr3_b_uk_vest_58webbing_mg"]];
_militaryLoadoutData set ["medVests", ["cwr3_b_uk_vest_58webbing_medic"]];
_militaryLoadoutData set ["slVests", ["cwr3_b_uk_vest_58webbing_officer"]];
_militaryLoadoutData set ["glVests", ["cwr3_b_uk_vest_58webbing_sapper"]];
_militaryLoadoutData set ["engVests", ["cwr3_b_uk_vest_58webbing_sapper"]];
_militaryLoadoutData set ["backpacks", ["cwr3_b_uk_backpack"]];
_militaryLoadoutData set ["slBackpacks", ["cwr3_b_uk_backpack"]];
_militaryLoadoutData set ["atBackpacks", ["cwr3_i_bergen_backpack_dpm"]];
_militaryLoadoutData set ["helmets", ["cwr3_b_uk_headgear_mk5_helmet_dpm_net", "cwr3_b_uk_headgear_mk5_helmet_scrim_dpm"]];
_militaryLoadoutData set ["slHat", ["cwr3_b_uk_headgear_mk5_helmet_dpm_net", "cwr3_b_uk_headgear_mk5_helmet_scrim_dpm"]];
_militaryLoadoutData set ["sniHats", ["cwr3_b_uk_headgear_mk5_helmet_dpm_net", "cwr3_b_uk_headgear_mk5_helmet_scrim_dpm"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];

_militaryLoadoutData set ["slRifles", [
    ["cwr3_arifle_l85a1", "", "", "CUP_optic_SUSAT", ["CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_556x45_Stanag_L85_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["cwr3_arifle_l85a1", "", "", "", ["CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_556x45_Stanag_L85_Tracer_Red"], [], ""],
	["cwr3_arifle_l1a1", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""],
	["cwr3_arifle_l1a1_wood", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["cwr3_arifle_l85a1", "", "", "CUP_optic_SUSAT", ["CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_556x45_Stanag_L85_Tracer_Red"], [], ""],
	["cwr3_arifle_l85a1", "", "", "CUP_optic_SUSAT", ["CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_556x45_Stanag_L85_Tracer_Red"], [], ""],
	["cwr3_arifle_l85a1", "", "", "", ["CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_556x45_Stanag_L85_Tracer_Red"], [], ""],
	["cwr3_arifle_l85a1", "", "", "", ["CUP_30Rnd_556x45_Stanag_L85", "CUP_30Rnd_556x45_Stanag_L85_Tracer_Red"], [], ""],
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A2_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["cwr3_arifle_xm177e2_m203", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["cwr3_smg_sterling", "", "", "", ["cwr3_30rnd_sterling_m"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["cwr3_lmg_bren", "", "", "", ["cwr3_30rnd_762x51_bren_m"], [], ""],
    ["cwr3_arifle_l86a1", "", "", "", ["CUP_30Rnd_556x45_Stanag_L85_Tracer_Yellow"], [], ""],
    ["CUP_lmg_L7A2_Flat", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["cwr3_arifle_l1a1", "", "", "cwr3_optic_suit", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""],
    ["cwr3_srifle_l42a1", "", "", "CUP_optic_no23mk2", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["cwr3_srifle_l42a1", "", "", "CUP_optic_no23mk2", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["cwr3_launch_m72a3"]];
_militaryLoadoutData set ["ATLaunchers", [
	["cwr3_launch_carlgustaf", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""]
]];
_militaryLoadoutData set ["missileATLaunchers", []];
_militaryLoadoutData set ["AALaunchers", [
	["cwr3_launch_javelin", "", "", "", ["cwr3_javelin_m"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["cwr3_b_uk_uniform_dpm_weathered"]];
_policeLoadoutData set ["vests", ["cwr3_b_uk_vest_58webbing_belt"]];
_policeLoadoutData set ["helmets", ["cwr3_b_uk_headgear_cap_weathered_dpm"]];

_policeLoadoutData set ["shotGuns", [
    ["cwr3_smg_sterling", "", "", "", ["cwr3_30rnd_sterling_m"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
	["cwr3_smg_sterling", "", "", "", ["cwr3_30rnd_sterling_m"], [], ""],
	["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_LIB_UK_P37"]];
_militiaLoadoutData set ["slUniforms", ["U_LIB_UK_P37_Sergeant"]];
_militiaLoadoutData set ["vests", ["V_LIB_UK_P37_Rifleman","V_LIB_UK_P37_Holster","V_LIB_UK_P37_Sten"]];
_militiaLoadoutData set ["glVests", ["V_LIB_UK_P37_Heavy"]];
_militiaLoadoutData set ["Hvests", ["V_LIB_UK_P37_Heavy"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_UK_HSack","B_LIB_UK_HSack_Cape","B_LIB_UK_HSack_Tea"]];
_militiaLoadoutData set ["helmets", ["H_LIB_UK_Helmet_Mk2","H_LIB_UK_Helmet_Mk2_Bowed","H_LIB_UK_Helmet_Mk2_Camo","H_LIB_UK_Helmet_Mk2_FAK","H_LIB_UK_Helmet_Mk2_Net","H_LIB_UK_Helmet_Mk2_FAK_Camo"]];
_militiaLoadoutData set ["sniHats", ["H_LIB_UK_Helmet_Mk2","H_LIB_UK_Helmet_Mk2_Bowed","H_LIB_UK_Helmet_Mk2_Camo","H_LIB_UK_Helmet_Mk2_FAK","H_LIB_UK_Helmet_Mk2_Net","H_LIB_UK_Helmet_Mk2_FAK_Camo"]];
_militiaLoadoutData set ["slHat", ["H_LIB_UK_Helmet_Mk2"]];
_militiaLoadoutData set ["longRangeRadios", ["B_LIB_US_Radio"]];
_militiaLoadoutData set ["gpses", []];
_militiaLoadoutData set ["NVGs", []];

_militiaLoadoutData set ["rifles", [
	["LIB_LeeEnfield_No4", "", "", "", ["LIB_10Rnd_770x56"], [], ""],
	["LIB_LeeEnfield_No1", "", "", "", ["LIB_10Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["carbines", [
	["LIB_LeeEnfield_No4", "", "", "", ["LIB_10Rnd_770x56"], [], ""],
	["LIB_LeeEnfield_No1", "", "", "", ["LIB_10Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["grenadeLaunchers", [
	["LIB_LeeEnfield_No1", "lib_acc_gl_enfield_cup_empty", "", "", ["LIB_10Rnd_770x56"], ["LIB_1Rnd_G_MillsBomb"], ""]
	]];
_militiaLoadoutData set ["SMGs", [
	["LIB_Sten_Mk2", "", "", "", ["LIB_32Rnd_9x19_Sten"], [], ""],
	["LIB_Sten_Mk2", "", "", "", ["LIB_32Rnd_9x19_Sten"], [], ""],
	["LIB_Sten_Mk2", "", "", "", ["LIB_32Rnd_9x19_Sten"], [], ""],
	["LIB_M1928_Thompson", "", "", "", ["LIB_50Rnd_45ACP"], [], ""],
	["LIB_M1A1_Thompson", "", "", "", ["LIB_30Rnd_45ACP","LIB_30Rnd_45ACP_t"], [], ""],
	["LIB_M1928A1_Thompson", "", "", "", ["LIB_30Rnd_45ACP","LIB_30Rnd_45ACP_t"], [], ""],
	["LIB_Sten_Mk5", "", "", "", ["LIB_32Rnd_9x19_Sten"], [], ""]
	]];
_militiaLoadoutData set ["machineGuns", [
	["LIB_Bren_Mk2", "", "", "", ["LIB_30Rnd_770x56"], [], ""]
	]];
_militiaLoadoutData set ["marksmanRifles", [
	["LIB_LeeEnfield_No1", "", "", "", ["LIB_10Rnd_770x56"], [], ""],
	["LIB_LeeEnfield_No4", "", "", "", ["LIB_10Rnd_770x56"], [], ""],
	["LIB_DELISLE", "", "", "", ["LIB_7Rnd_45ACP_DeLisle"], [], ""]
	]];
_militiaLoadoutData set ["sniperRifles", [
	["LIB_LeeEnfield_No4_Scoped", "", "", "", ["LIB_10Rnd_770x56","LIB_10Rnd_770x56_MkVIII"], [], ""]
	]];
_militiaLoadoutData set ["sidearms", [
	["LIB_Welrod_mk1", "", "", "", ["LIB_6Rnd_9x19_Welrod"], [], ""],
	["LIB_Webley_mk6", "", "", "", ["LIB_6Rnd_455"], [], ""],
	["LIB_Webley_mk6", "", "", "", ["LIB_6Rnd_455"], [], ""],
	["LIB_Webley_mk6", "", "", "", ["LIB_6Rnd_455"], [], ""],
	["LIB_Webley_mk6", "", "", "", ["LIB_6Rnd_455"], [], ""]
	]];
_militiaLoadoutData set ["ATLaunchers", [
	["LIB_PIAT", "", "", "",["LIB_1Rnd_89m_PIAT"], [], ""]
	]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSLONGKNEE"]];
_crewLoadoutData set ["vests", ["CUP_V_B_BAF_DPM_Osprey_Mk3_Crewman"]];
_crewLoadoutData set ["helmets", ["CUP_H_BAF_DPM_Mk6_CREW_PRR"]];
_crewLoadoutData set ["carbines", [
	["CUP_arifle_L85A2_NG", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_BAF_DPM_UBACSLONGKNEE_Gloves"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_BAF_DPM_Osprey_Mk3_Pilot"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];
_pilotLoadoutData set ["carbines", [
	["CUP_arifle_L85A2_NG", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag_L85"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];	




/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;
    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

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

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;

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
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

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
    // ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    // ["radios"] call _fnc_addRadio;
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
    // ["radios"] call _fnc_addRadio;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines", "marksmanRifles"]] call _fnc_setPrimary;
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
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
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
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
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
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
