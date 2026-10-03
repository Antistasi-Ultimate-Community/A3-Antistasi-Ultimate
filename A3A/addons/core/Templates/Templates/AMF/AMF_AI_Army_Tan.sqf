//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "French Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "French Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa)] call _fnc_saveToTemplate;			
["flagMarkerType", "flag_France"] call _fnc_saveToTemplate; 	

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

#include "..\INCLUDES\Init_Base.sqf"

//////////////////////////
//       Vehicles       //
//////////////////////////

_basic append ["B_Quadbike_01_F"];
_lightUnarmed append ["amf_pvp_01_mag_TDF_f", "amf_pvp_01_top_TDF_f", "B_AMF_VAB_ULTIMA_X8_TDF_F", "AMF_VBL_TDF_762_01_F"];
_lightArmed append ["AMF_VB2L_TDF_762_01_F", "amf_VBAE_02_TDF_f", "amf_VBAE_03_TDF_f", "amf_VBAE_01_TDF_f", "AMF_VB2L_TDF", "AMF_VBL_TDF_127_01_F", "AMF_VBL_127_TDF", "AMF_VBL_762_TDF"];
_Trucks append ["AMF_GBC180_PERS_02"];
_cargoTrucks append ["AMF_GBC180_PLATEAU_02", "AMF_GBC180_PERS_02"];
_ammoTrucks append ["AMF_GBC180_AmmoTruck_02"];
_repairTrucks append ["AMF_GBC180_MECA_02"];
_fuelTrucks append ["B_Truck_01_fuel_F"];
_medicalTrucks append ["AMF_VBMR_SAN_TDF"];
_lightAPCs append ["AMF_VBMR_HMG_TDF", "AMF_VBMR_L_TDF_02", "AMF_VBMR_GENIE_TDF", "AMF_VBMR_L_TDF_01", "AMF_VBMRL_762_Tundra", "AMF_VBMRL_127_DA", "AMF_VBMR_L_TDF_01"];
_APCs append ["B_AMF_AMX10_RCR_02_F", "B_AMF_VAB_ULTIMA_TOP_X8_TDF_F", "AMF_VBMR_COMMANDEMENT_TDF", "AMF_VBMR_GMG_TDF", "AMF_VBMR_TDF", "AMF_VBMR_VOA_TDF", "AMF_VBMR_ARX30_TDF", "AMF_VBMR_DEF_TDF", "AMF_VBMR_HMG_TDF", "AMF_VBMR_MMP_TDF"];
_IFVs append ["AMF_VBCI_TDF_01_F", "AMF_VBCI_TDF", "AMF_EBRC_TDF_01"];
_airborneVehicles append ["B_AMF_VAB_ULTIMA_X8_TDF_F", "AMF_VBMR_HMG_TDF", "AMF_VBCI_TDF_01_F", "AMF_EBRC_TDF_01", "B_AMF_AMX10_RCR_02_F"];
_tanks append ["AMF_Leclerc_S2_TDF", "AMF_Leclerc_XLR_TDF", "B_AMF_TANK_TDF_01_F", "B_AMF_TANK_TDF_02_F"];
_lightTanks append ["B_AMF_AMX10_RCR_SEPAR_02_F", "AMF_AMX10RCR_SEPAR_TDF", "B_AMF_AMX10_RCR_02_F"];
_aa append ["AMF_VBMR_MISTRAL_TDF"];

_SDV append ["B_SDV_01_F"];
_DropPod append ["SpaceshipCapsule_01_F"];

_transportBoat append ["B_Boat_Transport_01_F"];
_gunBoat append ["B_Boat_Armed_01_minigun_F"];
_Amphibious append [];

_planesCAS append ["AMF_RAFALE_B_01_F"];
_planesAA append ["AMF_RAFALE_B_01_F", "B_AMF_PLANE_FIGHTER_02_F"];

_planesTransport append ["B_AMF_PLANE_TRANSPORT_01_F"];
_gunship append [];

_helisLight append ["AMF_gazelle_afte_da_f"];
_transportHelicopters append ["amf_nh90_tth_transport", "amf_cougar"];
_helisLightAttack append ["AMF_gazelle_hot_f", "AMF_gazelle_minigun_da_f"];
_helisAttack append ["AMF_TIGRE_01"];
_airPatrol append ["AMF_gazelle_afte_da_f"];

_artillery append ["amf_CAESAR_01_CE_f", "B_T_MBT_01_arty_F", "B_T_MBT_01_mlrs_F"];
_artilleryMags append [
    ["amf_CAESAR_01_CE_f",["32Rnd_155mm_CAESAR_explo"]],
    ["B_T_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]],
    ["B_T_MBT_01_mlrs_F",["12Rnd_230mm_rockets"]]
];

_uavsAttack append ["B_AMF_REAPER_dynamicLoadout_F"];
_uavsPortable append ["AMF_Anafi_01_F"];

_militiaLightArmed append ["amf_pvp_01_mag_TDF_f", "amf_pvp_01_top_TDF_f", "AMF_VBL_TDF_762_01_F"];
_militiaTrucks append ["AMF_GBC180_PERS_02"];
_militiaCars append ["amf_pvp_01_top_TDF_f"];
_militiaAPCs append ["B_AMF_VAB_ULTIMA_TOP_X8_TDF_F"];

_policeVehs append ["B_GEN_Offroad_01_gen_F", "AMF_VBMRL_762_ONU", "AMF_VBMR_VOA_ONU"];

_staticMG append ["B_G_HMG_02_high_F"];
_staticAT append ["AMF_WiredGuided_mmp_F"];
_staticAA append ["B_static_AA_F"];
_staticMortars append ["B_Mortar_01_F"];
_howitzers append ["AMF_Mo120_01_CE_F"];

_mortarMagazineHE = "8Rnd_82mm_Mo_shells";
_mortarMagazineSmoke = "8Rnd_82mm_Mo_Smoke_white";
_mortarMagazineFlare = "8Rnd_82mm_Mo_Flare_white";
_howitzerMagazineHE = "AMF_8Rnd_120mm_OE";

_radar "B_Radar_System_01_F";
_sam = "B_SAM_System_03_F";

_minefieldAT append ["ATMine"];
_minefieldAPERS append ["APERSMine"];

_animations append [];
_variants append [
    ["AMF_GBC180_PERS_02", ["TDF",1]],
    ["AMF_GBC180_PLATEAU_02", ["TDF",1]],
    ["AMF_GBC180_AmmoTruck_02", ["TDF",1]],
    ["AMF_GBC180_MECA_02", ["TDF",1]],
    ["AMF_gazelle_afte_da_f", ["DA",1]],
    ["AMF_gazelle_hot_f", ["DA",1]],
    ["AMF_gazelle_minigun_da_f", ["DA",1]],
    ["CLASS", ["TDF",1]]
];

_faces append ["WhiteHead_01","WhiteHead_02","WhiteHead_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"];
_voices append ["Male01FRE","Male02FRE","Male03FRE","Male01ENGFRE","Male02ENGFRE"];
_sfVoices append [];
_eliteVoices append [];

_insignia append [];
_sfInsignia append [];
_milInsignia append [];

//////////////////////////
//       Loadouts       //
//////////////////////////

_slRifles append [];
_rifles append [];
_carbines append [];
_grenadeLaunchers append [
   ["AMF_614_long_HK269_01_F", "", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
];
_designatedGrenadeLaunchers append [];
_SMGs append [];
_machineGuns append [];
_marksmanRifles append [];
_sniperRifles append [];
_lightATLaunchers append [];
_lightHELaunchers append [];
_ATLaunchers append [];
_missleATLaunchers append [
    ["AMF_AT4CS_Loaded", "", "", "", [""], [], ""],
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
];
_AALaunchers append [
    ["launch_B_Titan_olive_F", "", "", "", ["Titan_AA"], [], ""]
];
_sidearms append [];
_GLsidearms append [];

_ATMines append ["ATMine_Range_Mag"];
_APMines append ["APERSMine_Range_Mag"];
_lightExplosives append ["DemoCharge_Remote_Mag"];
_heavyExplosives append ["SatchelCharge_Remote_Mag"];

_antiInfantryGrenades append ["HandGrenade", "MiniGrenade"];
_antiTankGrenades append [];
_smokeGrenades append ["SmokeShell"];
_signalsmokeGrenades append ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"];

_maps append ["ItemMap"];
_watches append ["ItemWatch"];
_compasses append ["ItemCompass"];
_radios append ["ItemRadio"];
_gpses append ["ItemGPS"];
_NVGs append ["NVGoggles_OPFOR"];
_binoculars append ["Binocular"];
_rangefinders append ["Rangefinder"];

_traitorUniforms append ["amf_uniform_05_TAN"];
_traitorVests append ["amf_SMB_AUXSAN"];
_traitorHats append ["AMF_BERET_MARINE_PARA"];

_officerUniforms append ["amf_uniform_05_MTP"];
_officerVests append ["amf_SMB_FUS"];
_officerHats append ["AMF_BERET_PARA"];

_cloakUniforms append ["amf_uniform_02_DA_MD"];
_cloakVests append ["amf_SMB_TP_HK417"];
_cloakRifles append [];
_cloakCarbines append [];
_cloakSidearms append [];

_uniforms append [];
_SLuniforms append [];
_ENGuniforms append [];
_MGvests append [];
_MEDvests append [];
_SLvests append [];
_SNIvests append [];
_GLvests append [];
_ATvests append [];
_ENGvests append [];
_vests append [];
_backpacks append [];
_ATBackpacks append [];
_AABackpacks append [];
_MGBackpacks append [];
_GLBackpacks append [];
_MEDBackpacks append [];
_ENGBackpacks append [];
_EXPBackpacks append [];
_SLBackpacks append [];
_longRangeRadios append ["AMF_FELIN_BACKPACK_RADIO_TDF"];
_helmets append [];
_MEDhelmets append [];
_SLhelmets append [];
_SLhats append ["AMF_BERET_INFANTERIE"];
_SNIhats append ["AMF_BERET_RPIMa"];

_slItems append ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
_rItems append [];
_mItems append [];
_gItems append [];
_eeItems append ["ToolKit", "MineDetector"];
_latItems append [];
_atItems append [];
_aaItems append [];
_mgItems append [];
_mmItems append [];
_pItems append [];
_cItems append [];
_uItems append [];

// Remove this if not wanted, example: WW2 mods
if (A3A_hasACE) then {
	_slItems append ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
	_eeItems append ["ToolKit", "MineDetector"];
	_mmItems append [];
};

_facewear append [];
_facewear append [];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

_sfslRifles append [
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_III", "AMF_AN_PEQ_15_black", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_V", "AMF_WMX200", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["Famas_F1", "muzzle_snds_M", "AMF_AN_PEQ_15_black", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], "amf_acc_famas_grip5"]
];
_sfrifles append [  
    ["AMF_SCAR_L_02_F", "muzzle_snds_M", "AMF_AN_PEQ_15_black", "AMF_specter", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["AMF_614_short_FS3_BLK", "AMF_ROTEX_V", "", "AMF_exps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS3_BLK", "AMF_ROTEX_V", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_V", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
_sfcarbines append [  
    ["AMF_614_short_FS4_BLK", "", "", "AMF_Eotech_552", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS_BLK", "", "", "AMF_Red_Dot_Sight", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS3_BLK", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS5_BLK", "", "", "AMF_xps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"]
];
_sfgrenadeLaunchers append [
    ["AMF_614_long_HK269_01_F", "", "AMF_WMX200", "AMF_specter_painted", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "AMF_WMX200", "AMF_specter_painted", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
];
_sfdesignatedGrenadeLaunchers append [];
_sfSMGs append [
    ["amf_sig552", "AMF_ROTEX_III", "AMF_AN_PEQ_15_black", "AMF_xps3", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], "amf_acc_sig552_grip3"],
    ["amf_hk_mp5_02_f", "muzzle_snds_L", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], "amf_acc_hkmp5_grip3"]
];
_sfmachineGuns append [
    ["FN_Minimi_MK3", "", "", "AMF_xps3_magnifier_side", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""],
    ["FN_Minimi_MK3", "", "", "ScromeJ4_RIS_NoCover", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""]
];
_sfmarksmanRifles append [
    ["AMF_714_Long_01_F", "", "AMF_AN_PEQ_15_black", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "bipod_03_F_blk"],
    ["AMF_714_Long_01_F", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["20Rnd_762x51_HK417_mag"], [], "bipod_03_F_blk"],
    ["AMF_SCAR_H_02_F_BLK", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], "amf_Scar_VGBipodBLK"],
    ["AMF_714_Long_01_F", "muzzle_snds_B", "", "AMF_schmidt_benderx4", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "amf_acc_714_long_grip3"]
];
_sfsniperRifles append [   
    ["AMF_PGM_ULTIMA_RATIO_F", "", "", "optic_LRPS", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "bipod_01_F_blk"],
    ["AMF_PGM_ULTIMA_RATIO_F", "muzzle_snds_B", "", "optic_LRPS", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "bipod_01_F_blk"],
    ["AMF_PGM_Hecate_II_Poly_RIS", "", "", "optic_LRPS", ["AMF_7Rnd_127x99_HECATE2_IMI_661GR_FMJ"], [], ""]
];
_sflightATLaunchers append ["AMF_NLAW_Loaded"];
_sflightHELaunchers append ["AMF_AT4CS_Loaded"];
_sfATLaunchers append [
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
];
_sfmissleATLaunchers append [
    ["AMF_Eryx", "", "", "", ["Eryx_HEAT"], [], ""]
];
_sfAALaunchers append [];
_sfsidearms append [
    ["AMF_PAMAC_50", "", "", "", ["AMF_9Rnd_9x19_PAMC50"], [], ""],
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
];
_sfGLsidearms append [];

_sfATMines append [];
_sfAPMines append [];
_sflightExplosives append [];
_sfheavyExplosives append [];

_sfantiInfantryGrenades append [];
_sfsmokeGrenades append [];
_sfsignalsmokeGrenades append [];

_sfmaps append [];
_sfwatches append [];
_sfcompasses append [];
_sfradios append [];
_sfgpses append [];
_sfNVGs append ["AMF_ONYX_NVG"];
_sfbinoculars append ["AMF_OB72_SOPHIE"];
_sfrangefinders append [];

_sfuniforms append ["amf_uniform_04_TAN", "amf_uniform_05_TAN"];
_sfMEDuniforms append [];
_sfENGuniforms append [];
_sfSLuniforms append [];
_sfvests append ["amf_SMB_FUS", "amf_SMB_FUS_FAMAS"];
_sfHvests append [];
_sfMGvests append ["amf_SMB_ART"];
_sfMEDvests append ["amf_SMB_AUXSAN", "amf_SMB_AUXSAN_FAMAS"];
_sfSLvests append ["amf_SMB_LEADER_FAMAS", "amf_SMB_LEADER"];
_sfSNIvests append ["amf_SMB_TP_SCAR", "amf_SMB_TP_HK417", "amf_SMB_TP_FRF2"];
_sfGLvests append ["amf_SMB_GRE"];
_sfATvests append [];
_sfENGvests append [];
_sfbackpacks append ["amf_tecpack_30L"];
_sfATBackpacks append ["AMF_Bergen_F2"];
_sfAABackpacks append ["AMF_Bergen_F2"];
_sfMGbackpacks append ["AMF_FELIN_BACKPACK_Minimi"];
_sfGLbackpacks append ["AMF_FELIN_BACKPACK"];
_sfMEDBackpacks append ["AMF_FELIN_BACKPACK"];
_sfENGBackpacks append ["amf_tecpack_70L"];
_sfEXPBackpacks append ["amf_tecpack_70L"];
_sfSLBackpacks append ["AMF_FELIN_BACKPACK_RADIO_TDF"];
_sflongRangeRadios append [];
_sfhelmets append ["AMF_OPSCORE_TAN", "AMF_OPSCORE_TAN_2"];
_sfMEDhelmets append [];
_sfSLhelmets append [];
_sfSLhats append ["AMF_BERET_MARINE_PARA"];
_sfSNIhats append ["AMF_OPSCORE_TAN2_2", "AMF_FELIN_L03_TAN"];

_sffacewear append [];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////


_eliteslRifles append [
    ["AMF_614_short_FS_TAN2", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_TAN", "", "AMF_AN_PEQ_15_black", "AMF_exps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_TAN", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_SCAR_L_01_F", "", "AMF_AN_PEQ_15_black", "AMF_Red_Dot_Sight", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
_eliterifles append [
    ["AMF_614_short_FS_BLK", "", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS_TAN2", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip10"],
    ["AMF_614_short_FS_BLK", "", "AMF_AN_PEQ_15_black", "AMF_EOTECH_553_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["Famas_Valo", "", "", "AMF_EOTECH_553", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Famas_FELIN", "", "", "AMF_Aimpoint_Pro_Patrol", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], ""]
];
_elitecarbines append [
    ["AMF_614_short_FS_BLK", "", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS_TAN2", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip10"],
    ["AMF_SCAR_L_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
_elitegrenadeLaunchers append [
    ["AMF_614_long_HK269_01_F", "", "", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "", "AMF_EOTECH_553", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
];
_elitedesignatedGrenadeLaunchers append [];
_eliteSMGs append [
    ["amf_hk_mp5_02_f", "", "", "AMF_specter", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], "amf_acc_hkmp5_grip3"]
];
_elitemachineGuns append [
    ["FN_Minimi_MK3", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"],
    ["FN_Minimi_MK3", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"]
];
_elitemarksmanRifles append [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], "bipod_01_F_blk"],
    ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "amf_acc_714_long_grip3"]
];
_elitesniperRifles append [
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "AMF_schmidt_benderx4", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["AMF_PGM_Hecate_II_Poly_RIS", "", "", "AMF_SB_PM2_P3L", ["AMF_7Rnd_127x99_HECATE2_IMI_661GR_FMJ"], [], ""],
    ["AMF_PGM_Hecate_II_Poly", "", "", "ScromeJ10", ["AMF_7Rnd_127x99_HECATE2_IMI_661GR_FMJ"], [], ""]
];
_elitelightATLaunchers append ["AMF_NLAW_Loaded"];
_elitelightHELaunchers append ["AMF_AT4CS_Loaded"];
_eliteATLaunchers append [
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
];
_elitemissleATLaunchers append [
    ["AMF_Eryx", "", "", "", ["Eryx_HEAT"], [], ""]
];
_eliteAALaunchers append [];
_elitesidearms append [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
];
_eliteGLsidearms append [];

_eliteATMines append [];
_eliteAPMines append [];
_elitelightExplosives append [];
_eliteheavyExplosives append [];

_eliteantiInfantryGrenades append [];
_elitesmokeGrenades append [];
_elitesignalsmokeGrenades append [];

_elitemaps append [];
_elitewatches append [];
_elitecompasses append [];
_eliteradios append [];
_elitegpses append [];
_eliteNVGs append [];
_elitebinoculars append ["AMF_OB72_SOPHIE"];
_eliterangefinders append [];

_eliteuniforms append ["AMF_CRY_G3_RolledSleeve_DA", "amf_uniform_05_TAN"];
_eliteSLuniforms append ["amf_uniform_04_TAN"];
_elitevests append ["amf_SMB_FUS", "amf_SMB_FUS_FAMAS"];
_eliteHvests append [];
_eliteMGvests append ["amf_SMB_ART"];
_eliteMEDvests append ["amf_SMB_AUXSAN", "amf_SMB_AUXSAN_FAMAS"];
_eliteSLvests append ["amf_SMB_LEADER_FAMAS", "amf_SMB_LEADER"];
_eliteSNIvests append ["amf_SMB_TP_SCAR", "amf_SMB_TP_HK417", "amf_SMB_TP_FRF2"];
_eliteGLvests append ["amf_SMB_GRE"];
_eliteATvests append [];
_eliteENGvests append [];
_elitebackpacks append ["amf_tecpack_30L"];
_eliteATBackpacks append ["AMF_Bergen_F2"];
_eliteAABackpacks append ["AMF_Bergen_F2"];
_eliteMGbackpacks append ["AMF_FELIN_BACKPACK_Minimi"];
_eliteGLbackpacks append ["AMF_FELIN_BACKPACK"];
_eliteMEDBackpacks append ["AMF_FELIN_BACKPACK"];
_eliteENGBackpacks append ["amf_tecpack_70L"];
_eliteEXPBackpacks append ["amf_tecpack_70L"];
_eliteSLBackpacks append ["AMF_FELIN_BACKPACK_RADIO_TDF"];
_elitelongRangeRadios append [];
_elitehelmets append ["AMF_FELIN_05_TAN", "AMF_FELIN_06_TAN", "AMF_OPSCORE_TAN_2", "AMF_OPSCORE3_TAN", "AMF_OPSCORE4_TAN"];
_eliteMEDhelmets append [];
_eliteSLhelmets append [];
_eliteSLhats append [];
_eliteSNIhats append ["AMF_FELIN_L06_TAN", "AMF_FELIN_L04_TAN"];

_elitefacewear append [];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////


_militaryslRifles append [
    ["AMF_614_short_01_F", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip3"],
    ["AMF_614_long_01_F", "", "", "AMF_xps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip3"],
    ["AMF_614_short_FS_BLK", "", "", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"]
];
_militaryrifles append [
    ["AMF_614_short_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_long_01_F", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Famas_G2", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["Famas_G2_PGMP", "", "", "Aimpoint_CompM_PGMP", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""]
];
_militarycarbines append [
    ["AMF_SCAR_L_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
];
_militarygrenadeLaunchers append [
    ["AMF_614_long_HK269_01_F", "", "", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "", "AMF_EOTECH_553", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
];
_militarydesignatedGrenadeLaunchers append [];
_militarySMGs append [
    ["amf_hk_mp5_02_f", "", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
];
_militarymachineGuns append [
    ["FN_Minimi_MK3", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"],
    ["FN_Minimi_MK3", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"]
];
_militarymarksmanRifles append [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "amf_acc_714_long_grip3"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "amf_acc_714_long_grip3"]
];
_militarysniperRifles append [
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "AMF_schmidt_benderx4", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
];
_militarylightATLaunchers append ["AMF_NLAW_Loaded"];
_militarylightHELaunchers append ["AMF_AT4CS_Loaded"];
_militaryATLaunchers append [
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
];
_militarymissleATLaunchers append [
    ["AMF_Eryx", "", "", "", ["Eryx_HEAT"], [], ""]
];
_militaryAALaunchers append [];
_militarysidearms append [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
];
_militaryGLsidearms append [];

_militaryATMines append [];
_militaryAPMines append [];
_militarylightExplosives append [];
_militaryheavyExplosives append [];

_militaryantiInfantryGrenades append [];
_militarysmokeGrenades append [];
_militarysignalsmokeGrenades append [];

_militarymaps append [];
_militarywatches append [];
_militarycompasses append [];
_militaryradios append [];
_militarygpses append [];
_militaryNVGs append [];
_militarybinoculars append ["AMF_APX_M241"];
_militaryrangefinders append [];

_militaryuniforms append ["amf_uniform_01_DA_HX", "amf_uniform_01_RE_DA_MD", "amf_uniform_01_RE_NG_DA_MD"];
_militaryENGuniforms append [];
_militarySLuniforms append ["amf_uniform_05_TAN"];
_militaryvests append ["amf_SMB_FUS", "amf_SMB_FUS_FAMAS"];
_militaryHvests append [];
_militaryMGvests append ["amf_SMB_ART"];
_militaryMEDvests append ["amf_SMB_AUXSAN", "amf_SMB_AUXSAN_FAMAS"];
_militarySLvests append ["amf_SMB_LEADER_FAMAS", "amf_SMB_LEADER"];
_militarySNIvests append ["amf_SMB_TP_SCAR", "amf_SMB_TP_HK417", "amf_SMB_TP_FRF2"];
_militaryGLvests append ["amf_SMB_GRE"];
_militaryATvests append [];
_militaryENGvests append [];
_militarybackpacks append ["amf_tecpack_30L"];
_militaryATBackpacks append ["AMF_Bergen_F2"];
_militaryAABackpacks append ["AMF_Bergen_F2"];
_militaryMGbackpacks append ["AMF_FELIN_BACKPACK_Minimi"];
_militaryGLbackpacks append ["AMF_FELIN_BACKPACK"];
_militaryMEDBackpacks append ["AMF_FELIN_BACKPACK"];
_militaryENGBackpacks append ["amf_tecpack_70L"];
_militaryEXPBackpacks append ["amf_tecpack_70L"];
_militarySLBackpacks append ["AMF_FELIN_BACKPACK_RADIO_TDF"];
_militarylongRangeRadios append [];
_militaryhelmets append ["AMF_FELIN_05_TAN", "AMF_FELIN_05_CE", "AMF_FELIN_06_CE", "AMF_FELIN_06_TAN", "AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"];
_militaryMEDhelmets append [];
_militarySLhelmets append [];
_militarySLhats append [];
_militarySNIhats append ["AMF_FELIN_L05_TAN", "AMF_FELIN_L05_CE", "AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"];

_militaryfacewear append [];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

_policeuniforms append ["U_B_GEN_Soldier_F"];
_policeSLuniforms append [];
_policevests append ["V_TacVest_gen_F"];
_policehelmets append ["H_Beret_gen_F"];
_policeWeapons append [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
];
_policesidearms append [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
];

_policefacewear append [];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////


_militiaslRifles append [];
_militiarifles append [
    ["amf_sig552", "", "", "", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""],
    ["amf_sig552", "", "", "", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""],
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], ""]
];
_militiacarbines append [
    ["AMF_614_short_FS_BLK", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["AMF_SCAR_L_01_F", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["Famas_F1", "", "", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_SS109", "AMF_25Rnd_BO_MEN_SS109"], [], ""],
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_BT_MEN_SS109", "AMF_25Rnd_BO_MEN_SS109"], [], ""]
];
_militiagrenadeLaunchers append [
    ["Famas_F1", "", "", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_SS109"], ["AMF_RFG_AC58", "AMF_RFG_APAV40"], ""]
];
_militiadesignatedGrenadeLaunchers append [];
_militiaSMGs append [
    ["amf_hk_mp5_01_f", "", "", "", [AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
];
_militiamachineGuns append [
    ["amf_mag58_01_f", "", "", "", ["AMF_50Rnd_762x51_MAG58_BO_F3", "AMF_75Rnd_762x51_MAG58_BO_F3"], [], ""],
    ["AANF1_LB", "", "", "", ["AMF_50Rnd_762x51_AANF1_BO_BT_F3"], [], ""]
];
_militiamarksmanRifles append [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["20Rnd_762x51_Mag"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
];
_militiasniperRifles append [
    ["AMF_RFF2_01_F", "", "", "ScromeJ8", ["AMF_10Rnd_762x51_BO_F3"], [], ""]
];
_militialightATLaunchers append ["AMF_AT4CS_Loaded"];
_militialightHELaunchers append ["AMF_LRAC89_F"];
_militiaATLaunchers append [];
_militiamissleATLaunchers append [];
_militiaAALaunchers append [];
_militiasidearms append [
    ["AMF_PSA_Glock_17", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
];
_militiaGLsidearms append [];

_militiaATMines append [];
_militiaAPMines append [];
_militialightExplosives append [];
_militiaheavyExplosives append [];

_militiaantiInfantryGrenades append [];
_militiasmokeGrenades append [];
_militiasignalsmokeGrenades append [];

_militiamaps append [];
_militiawatches append [];
_militiacompasses append [];
_militiaradios append [];
_militiagpses append [];
_militiaNVGs append [];
_militiabinoculars append [];
_militiarangefinders append [];

_militiauniforms append ["amf_uniform_01_RE_NG_DA_HX"];
_militiaMEDuniforms append [];
_militiaENGuniforms append [];
_militiaSLuniforms append [];
_militiavests append ["amf_SMB_FUS"];
_militiaHvests append [];
_militiaMGvests append [];
_militiaMEDvests append [];
_militiaSLvests append [];
_militiaSNIvests append ["amf_SMB_TP_SCAR"];
_militiaGLvests append [];
_militiaATvests append [];
_militiaENGvests append [];
_militiabackpacks append ["amf_tecpack_30L"];
_militiaATBackpacks append ["AMF_FELIN_BACKPACK"];
_militiaAABackpacks append [];
_militiaMGBackpacks append [];
_militiaGLBackpacks append [];
_militiaMEDBackpacks append [];
_militiaENGBackpacks append [];
_militiaEXPBackpacks append [];
_militiaSLBackpacks append ["AMF_FELIN_BACKPACK_RADIO_TDF"];
_militialongRangeRadios append [];
_militiahelmets append ["AMF_FELIN_05_CE", "AMF_FELIN_05_TAN", "AMF_FELIN_06_CE"];
_militiaMEDhelmets append [];
_militiaSLhelmets append [];
_militiaSLhats append [];
_militiaSNIhats append ["AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"];

_militiafacewear append [];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

_crewuniforms append ["amf_uniform_01_CE_HX"];
_crewvests append ["amf_SMB"];
_crewhelmets append ["AMF_ELNO_DH_586"];
_crewcarbines append [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
];
_crewSMGs append [];
_crewsidearms append [];

_crewfacewear append [];

_pilotuniforms append ["amf_pilot_01_f"];
_pilotvests append ["AMF_Pilot_Vest"];
_pilotbackpacks append [];
_pilothelmets append ["AMF_ALPHA900"];
_pilotcarbines append [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""],
    ["amf_sig552", "", "", "", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""]
];
_pilotSMGs append [];
_pilotsidearms append [];

_pilotfacewear append [];

/////////////////////////////
//    Conditional Gear     //
/////////////////////////////

if (_hasLawsOfWar) then {
    _policeVehs append ["B_GEN_Van_02_transport_F", "B_GEN_Van_02_vehicle_F"];
};

if (_hasContact) then {
    _policeVehs append ["B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_covered_F"];
};

if (_hasRF) then {
    _policeVehs append ["B_GEN_Pickup_covered_rf"];
    _airPatrol append ["B_GEN_Heli_EC_01_RF"];
    _transportBoat append ["EF_B_CombatBoat_Unarmed_NATO", "EF_B_CombatBoat_Unarmed_GEN"];
    _gunBoat append ["EF_B_CombatBoat_HMG_NATO", "EF_B_CombatBoat_AT_NATO"];
};

if (_hasEF) then {
    _policeVehs append ["EF_B_Gyra_GEN", "EF_B_Gyra_HMG_GEN"];
};

if (isClass (configFile >> "CfgVehicles" >> "clv_Aml20")) then {
    _lightArmed append ["clv_Aml20", "clv_AmlHS30", "clv_Aml90"];
    _lightTanks append ["clv_Amx13", "clv_Kurassier"];
    _lightAPCs append ["CLV_VCPC"];
    _IFVs append ["CLV_VCTP", "CLV_VCTP2IP"];
    _aa append ["clv_VCLM", "clv_Dragon"];
    _staticAA append ["CLV_OERLIKON"];
    _howitzers append ["CLV_OMM56"];

    _variants append [
        ["clv_Aml20", ["Desert",1]],
        ["clv_Aml90", ["UN",1]],
        ["clv_AmlHS30", ["Desert",1]],
        ["clv_Amx13", ["Desert",1]],
        ["clv_Kurassier", ["Desert",1]],
        ["clv_Kurassier", ["BicolorI",1]],
        ["clv_VCLM", ["BicolorI",1]],
        ["CLV_VCPC", ["lightgreen",1]],
        ["CLV_VCTP2IP", ["Darkgreen",1]],
        ["CLV_VCTP", ["Darkgreen",1]],
        ["CLV_OERLIKON", ["Gdf2",1]],
        ["CLV_OMM56", ["Otomelara2",1]]
    ];
};

// If NIarms is turned on, then these are used over the ones from the mod.
if (isClass (configFile >> "CfgPatches" >> "hlcweapons_core")) then {
    _sfslRifles = [
        ["hlc_rifle_416D10_st6", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
        ["hlc_rifle_416D145_CAG", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
        ["hlc_rifle_416N", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], "hlc_grip_AFG2"],
        ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""]
    ];
    _sfrifles = [
        ["hlc_rifle_416D10", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416D145", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416D165", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
        ["hlc_wp_SCARL_STD_blk", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""]
    ];
    _sfcarbines = [
        ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
    ];
    _sfSMGs = [
        ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
    ];
    _sfmarksmanRifles = [
        ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"],
        ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"]
    ];
    _sfsniperRifles = [
        ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
        ["hlc_rifle_awmagnum", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""]
    ];
    _sfsidearms = [
        ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""],
        ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
    ];

    _eliteslRifles = [
        ["hlc_rifle_416D10_st6", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
        ["hlc_rifle_416D145_CAG", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
        ["hlc_rifle_416N", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], "hlc_grip_AFG2"],
        ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""]
    ];
    _eliterifles = [
        ["hlc_rifle_416D10", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416D145", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416D165", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
        ["hlc_wp_SCARL_STD_blk", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""]
    ];
    _elitecarbines = [
        ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_wp_SCARL_CQC_Blk", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""],
        ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_Aimpoint_Pro_Patrol", ["hlc_30rnd_556x45_EPR"], [], ""],
        ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
        ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
    ];
    _eliteSMGs = [
        ["hlc_smg_mp5N_tac", "", "", "AMF_EOTECH_553", ["hlc_30Rnd_9x19_B_MP5"], [], ""],
        ["hlc_smg_mp5k_PDW", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
    ];
    _elitemarksmanRifles = [
        ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"],
        ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"]
    ];
    _elitesniperRifles = [
        ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
        ["hlc_rifle_awmagnum", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""]
    ];
    _elitesidearms = [
        ["AMF_PSA_Glock_17", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
        ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""],
        ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
    ];

    _militaryslRifles = [
        ["hlc_rifle_416D10", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    _militaryrifles = [
        ["hlc_rifle_416D10", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""],
        ["hlc_rifle_416D165", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], ""],
        ["hlc_rifle_416C", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    _militarycarbines = [
        ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    _militarySMGs = [
        ["hlc_smg_MP5N", "", "", "AMF_Red_Dot_Sight", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
    ];
    _militarymarksmanRifles = [
        ["hlc_wp_SCARH_STD", "", "", "AMF_schmidt_benderx4_tan", ["hlc_20Rnd_762x51_B_SCARH_Tan"], [], ""],
        ["hlc_wp_SCARH_STD", "", "", "optic_LRPS", ["hlc_20Rnd_762x51_B_SCARH_Tan"], [], "bipod_01_F_blk"],
        ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"],
        ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"]
    ];
    _militarysniperRifles = [
        ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
        ["hlc_rifle_psg1", "", "", "", ["hlc_20rnd_762x51_b_G3"], [], ""]
    ];
    _militarysidearms = [
        ["AMF_PSA_Glock_17", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
        ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""],
        ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
    ];

    _policeWeapons = [
        ["hlc_rifle_G36C", "", "", "AMF_Red_Dot_Sight", ["hlc_30rnd_556x45_EPR_G36"], [], ""],
        ["hlc_rifle_416C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    _policesidearms = [
        ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226"], [], ""]
    ];

    _militiaslRifles = [
        ["hlc_rifle_416D10", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
        ["hlc_rifle_416C", "", "", "AMF_exps3", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    _militiarifles = [
        ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_MEN_M193"], [], ""],
        ["Famas_F1_PGMP", "", "", "", ["AMF_25Rnd_BO_MEN_M193"], [], ""],
        ["hlc_rifle_SG551LB", "", "", "", ["hlc_30Rnd_556x45_EPR_sg550"], [], ""]
    ];
    _militiaSMGs = [
        ["hlc_smg_MP5N", "", "", "", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
    ];
    _militiamarksmanRifles = [
        ["hlc_rifle_psg1", "", "", "", ["hlc_20rnd_762x51_b_G3"], [], ""],
        ["hlc_rifle_g3a3", "", "", "hlc_optic_STANAGZF_G3", ["hlc_20rnd_762x51_b_G3"], [], ""]
    ];
    _militiasniperRifles = [
        ["hlc_rifle_FN3011", "", "", "hlc_optic_Kern_3011", ["hlc_10Rnd_762x51_B_fal"], [], ""]
    ];

    _crewcarbines = [
        ["hlc_rifle_416C", "", "", "", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    _pilotcarbines = [
        ["hlc_rifle_416C", "", "", "", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
};

////////////////////////
//       Saving       //
////////////////////////

#include "..\INCLUDES\Init_Layouts.sqf"

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

    ["SMGs"] call _fnc_setPrimary;
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
