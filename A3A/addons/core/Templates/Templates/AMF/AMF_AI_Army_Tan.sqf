//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "French Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "French Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa)] call _fnc_saveToTemplate;			
["flagMarkerType", "flag_France"] call _fnc_saveToTemplate; 	

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["amf_pvp_01_top_DA_f", "AMF_VBL_DA_762_01_F", "AMF_VBL_762_DA", "AMF_VB2L_DA"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["amf_VBAE_01_TDF_f", "AMF_VBMR_L_TDF_01", "AMF_VBMRL_762_DA"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["B_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["B_Truck_01_covered_F", "B_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["B_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["AMF_VBMR_SAN_TDF"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["AMF_VBMR_HMG_TDF", "AMF_VBMR_GENIE_TDF", "AMF_VBMR_L_TDF_01"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["AMF_VBMR_HMG_TDF", "AMF_VBCI_DA_01_F", "AMF_EBRC_TDF_01", "B_AMF_AMX10_RCR_03_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["B_AMF_AMX10_RCR_03_F", "B_AMF_VAB_ULTIMA_TOP_X8_F", "AMF_VBMR_COMMANDEMENT_TDF", "AMF_VBCI_DA_01_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["AMF_VBCI_DA_01_F", "B_AMF_AMX10_RCR_03_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["B_AMF_AMX10_RCR_SEPAR_03_F", "AMF_EBRC_TDF_01"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["B_AMF_TANK_DA_01_F", "B_AMF_TANK_TDF_02_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["AMF_VBMR_ARX30_TDF", "AMF_VBMR_MISTRAL_TDF"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["AMF_RAFALE_B_01_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["AMF_RAFALE_B_01_F", "B_AMF_PLANE_FIGHTER_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["B_AMF_PLANE_TRANSPORT_01_F"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["AMF_gazelle_afte_da_f"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["B_AMF_Heli_Transport_4RHFS_01_F", "AMF_panther_FRA"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["AMF_gazelle_minigun_da_f"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["AMF_TIGRE_01"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["B_T_MBT_01_arty_F","B_T_MBT_01_mlrs_F"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["B_T_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]],
    ["B_T_MBT_01_mlrs_F",["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["AMF_VBL_762_DA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["B_Truck_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["amf_pvp_01_mag_DA_f"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["AMF_VBCI_DA_01_F", "AMF_VBMR_DEF_TDF"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["AMF_VBMRL_762_ONU", "AMF_VBMR_VOA_ONU"]] call _fnc_saveToTemplate;

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["AMF_WiredGuided_mmp_F"]] call _fnc_saveToTemplate;
["staticAA", ["B_static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", ["AMF_Mo120_01_CE_F"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "AMF_8Rnd_120mm_OE"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","AfricanHead_01","AfricanHead_02","AfricanHead_03", "AsianHead_A3_06", "TanoanHead_A3_05"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE","Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

["voices", ["Male01FRE","Male02FRE","Male03FRE","Male01ENGFRE","Male02ENGFRE"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", [
   ["AMF_614_long_HK269_01_F", "", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["missileATLaunchers", [
    ["AMF_AT4CS_Loaded", "", "", "", [""], [], ""],
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["launch_B_Titan_olive_F", "", "", "", ["Titan_AA"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["amf_uniform_05_TAN"]];
_loadoutData set ["traitorVests", ["amf_SMB_AUXSAN"]];
_loadoutData set ["traitorHats", ["AMF_BERET_MARINE_PARA"]];

_loadoutData set ["officerUniforms", ["amf_uniform_05_MTP"]];
_loadoutData set ["officerVests", ["amf_SMB_FUS"]];
_loadoutData set ["officerHats", ["AMF_BERET_PARA"]];

_loadoutData set ["cloakUniforms", ["amf_uniform_02_DA_MD"]];
_loadoutData set ["cloakVests", ["amf_SMB_TP_HK417"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", ["AMF_FELIN_BACKPACK_RADIO_TDF"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["AMF_BERET_INFANTERIE"]];
_loadoutData set ["sniHats", ["AMF_BERET_RPIMa"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["amf_uniform_04_TAN", "amf_uniform_05_TAN"]];
_sfLoadoutData set ["vests", ["AMF_CRY_JPC_V1_RG", "AMF_WA_DCS_V2_RG"]];
_sfLoadoutData set ["mgVests", ["AMF_CRY_JPC_V3_MG_TAN"]];
_sfLoadoutData set ["medVests", ["AMF_WA_DCS_V5_RG"]];
_sfLoadoutData set ["glVests", ["AMF_WA_DCS_V5_RG"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_rgr"]];
_sfLoadoutData set ["slBackpacks", ["amf_tecpack_30L"]];
_sfLoadoutData set ["atBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_sfLoadoutData set ["helmets", ["AMF_OPSCORE_TAN1", "AMF_OPSCORE3_TAN1"]];
_sfLoadoutData set ["slHat", ["AMF_BERET_MARINE_PARA"]];
_sfLoadoutData set ["sniHats", ["AMF_F3_L02"]];
_sfLoadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_sfLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

_sfLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_sfLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_sfLoadoutData set ["slRifles", [
    ["hlc_rifle_416D10_st6", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
    ["hlc_rifle_416D145_CAG", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
    ["hlc_rifle_416N", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], "hlc_grip_AFG2"],
    ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["hlc_rifle_416D10", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416D145", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416D165", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
    ["hlc_wp_SCARL_STD_blk", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
]];
_sfLoadoutData set ["SMGs", [ // why tf does every tier need SMGs, makes 0 sense. Fuck the system, SF get carbines
    ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["FN_Minimi_F1", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""],
    ["FN_Minimi_MK3", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"],
    ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
    ["hlc_rifle_awmagnum", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""],
    ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["amf_uniform_01_RE_DA_HX", "amf_uniform_01_RE_DA_MD", "amf_uniform_01_RE_DA_LowaZephyr"]];
_eliteLoadoutData set ["slUniform", ["amf_uniform_04_TAN"]];
_eliteLoadoutData set ["vests", ["AMF_WA_DCS_V4_MG_TAN", "AMF_WA_DCS_V3_TAN", "AMF_WA_DCS_V5_TAN"]];
_eliteLoadoutData set ["mgVests", ["amf_SMB_ART"]];
_eliteLoadoutData set ["medVests", ["amf_SMB_AUXSAN", "AMF_WA_DCS_V5_TAN"]];
_eliteLoadoutData set ["slVests", ["AMF_WA_DCS_V1_TAN", "amf_SMB_LEADER"]];
_eliteLoadoutData set ["glVests", ["amf_SMB_GRE"]];
_eliteLoadoutData set ["engVests", ["amf_SMB_GRE"]];
_eliteLoadoutData set ["backpacks", ["amf_tecpack_30L", "AMF_FELIN_BACKPACK"]];
_eliteLoadoutData set ["slBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_eliteLoadoutData set ["atBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_eliteLoadoutData set ["helmets", ["AMF_F3", "AMF_F3_02", "AMF_F3_04", "AMF_F3_L04"]];
_eliteLoadoutData set ["sniHats", ["AMF_OPSCORE_TAN_2", "AMF_FELIN_L05_TAN"]];
_eliteLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

_eliteLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_eliteLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_eliteLoadoutData set ["slRifles", [
    ["hlc_rifle_416D10_st6", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
    ["hlc_rifle_416D145_CAG", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
    ["hlc_rifle_416N", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], "hlc_grip_AFG2"],
    ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["hlc_rifle_416D10", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416D145", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416D165", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
    ["hlc_wp_SCARL_STD_blk", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_wp_SCARL_CQC_Blk", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""],
    ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_Aimpoint_Pro_Patrol", ["hlc_30rnd_556x45_EPR"], [], ""],
    ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
    ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["hlc_smg_mp5N_tac", "", "", "AMF_EOTECH_553", ["hlc_30Rnd_9x19_B_MP5"], [], ""],
    ["hlc_smg_mp5k_PDW", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["FN_Minimi_F1", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""],
    ["FN_Minimi_F1", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"],
    ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
    ["hlc_rifle_awmagnum", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["AMF_PSA_Glock_17", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""],
    ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["amf_uniform_01_RE_DA_HX", "amf_uniform_01_RE_NG_DA_HX"]];
_militaryLoadoutData set ["slUniform", ["amf_uniform_01_RE_BM_LowaZephyr"]];
_militaryLoadoutData set ["vests", ["amf_SMB_FUS", "amf_SMB_AUXSAN"]];
_militaryLoadoutData set ["mgVests", ["amf_SMB_ART"]];
_militaryLoadoutData set ["medVests", ["amf_SMB_FUS"]];
_militaryLoadoutData set ["slVests", ["AMF_WA_DCS_V1_TAN", "AMF_WA_DCS_V5_TAN"]];
_militaryLoadoutData set ["glVests", ["amf_SMB_GRE"]];
_militaryLoadoutData set ["engVests", ["amf_SMB_GRE"]];
_militaryLoadoutData set ["backpacks", ["amf_tecpack_30L", "AMF_FELIN_BACKPACK"]];
_militaryLoadoutData set ["slBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_militaryLoadoutData set ["atBackpacks", ["AMF_FELIN_BACKPACK_LIGHT_TDF"]];
_militaryLoadoutData set ["helmets", ["AMF_FELIN_05_TAN", "AMF_FELIN_L05_TAN", "AMF_FELIN_06_TAN"]];
_militaryLoadoutData set ["sniHats", ["AMF_FELIN_L04_TAN"]];
_militaryLoadoutData set ["binoculars", ["AMF_APX_M241"]];

_militaryLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_militaryLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_militaryLoadoutData set ["slRifles", [
    ["hlc_rifle_416D10", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["hlc_rifle_416D10", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""],
    ["hlc_rifle_416D165", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], ""],
    ["hlc_rifle_416C", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["hlc_smg_MP5N", "", "", "AMF_Red_Dot_Sight", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["FN_Minimi_F1", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""],
    ["FN_Minimi_F1", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["hlc_wp_SCARH_STD", "", "", "AMF_schmidt_benderx4_tan", ["hlc_20Rnd_762x51_B_SCARH_Tan"], [], ""],
    ["hlc_wp_SCARH_STD", "", "", "optic_LRPS", ["hlc_20Rnd_762x51_B_SCARH_Tan"], [], "bipod_01_F_blk"],
    ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"],
    ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
    ["hlc_rifle_psg1", "", "", "", ["hlc_20rnd_762x51_b_G3"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["AMF_PSA_Glock_17", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""],
    ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["amf_uniform_01_RE_BM_MD", "amf_uniform_01_RE_NG_BM_MD"]];
_policeLoadoutData set ["vests", ["amf_SMB_FUS", "amf_SMB_AUXSAN_FAMAS"]];
_policeLoadoutData set ["helmets", ["AMF_FELIN_L05_ONU", "AMF_FELIN_03_ONU", "AMF_BERET_ONU"]];

_policeLoadoutData set ["rifles", [
    ["hlc_rifle_G36C", "", "", "AMF_Red_Dot_Sight", ["hlc_30rnd_556x45_EPR_G36"], [], ""],
    ["hlc_rifle_416C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["amf_uniform_01_RE_NG_DA_HX", "amf_uniform_01_RE_DA_HX", "amf_uniform_01_NG_DA_HX", "amf_uniform_01_DA_HX"]];
_militiaLoadoutData set ["vests", ["amf_SMB"]];
_militiaLoadoutData set ["sniVests", ["amf_SMB_TP_SCAR"]];
_militiaLoadoutData set ["backpacks", ["amf_tecpack_30L"]];
_militiaLoadoutData set ["slBackpacks", ["AMF_FELIN_BACKPACK"]];
_militiaLoadoutData set ["atBackpacks", ["B_Kitbag_cbr"]];
_militiaLoadoutData set ["helmets", ["AMF_SPECTRA_2_DA", "AMF_TCNVG_DA"]];
_militiaLoadoutData set ["sniHats", ["AMF_TCNVG_DA"]];

_militiaLoadoutData set ["lightATLaunchers", ["AMF_AT4CS_Loaded"]];
_militiaLoadoutData set ["lightHELaunchers", ["AMF_LRAC89_F"]];

_militiaLoadoutData set ["slRifles", [
    ["hlc_rifle_416D10", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
    ["hlc_rifle_416C", "", "", "AMF_exps3", ["hlc_30rnd_556x45_EPR"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_MEN_M193"], [], ""],
    ["Famas_F1_PGMP", "", "", "", ["AMF_25Rnd_BO_MEN_M193"], [], ""],
    ["hlc_rifle_SG551LB", "", "", "", ["hlc_30Rnd_556x45_EPR_sg550"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["Famas_G2_PGMP_RIS", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["Famas_G2", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["hlc_smg_MP5N", "", "", "", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["amf_mag58_01_f", "", "", "", ["AMF_75Rnd_762x51_MAG58_BO_F3"], [], ""],
    ["amf_aanf1_01_f", "", "", "", ["AMF_75Rnd_762x51_AANF1_BO_F3"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["hlc_rifle_psg1", "", "", "", ["hlc_20rnd_762x51_b_G3"], [], ""],
    ["hlc_rifle_g3a3", "", "", "hlc_optic_STANAGZF_G3", ["hlc_20rnd_762x51_b_G3"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["hlc_rifle_FN3011", "", "", "hlc_optic_Kern_3011", ["hlc_10Rnd_762x51_B_fal"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["amf_uniform_01_DA_MD"]];
_crewLoadoutData set ["vests", ["amf_SMB"]];
_crewLoadoutData set ["helmets", ["AMF_ELNO_DH_586_TAN"]];
_crewLoadoutData set ["carbines", [
    ["hlc_rifle_416C", "", "", "", ["hlc_30rnd_556x45_EPR"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["amf_pilot_01_f"]];
_pilotLoadoutData set ["vests", ["V_Rangemaster_belt"]];
_pilotLoadoutData set ["helmets", ["AMF_ALPHA900"]];
_pilotLoadoutData set ["carbines", [
    ["hlc_rifle_416C", "", "", "", ["hlc_30rnd_556x45_EPR"], [], ""]
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
