private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CDF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "CDF"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3_Atlas\Data_F_Atlas\Flags\flag_CDF_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CDF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["B_SDV_01_F"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["SpaceshipCapsule_01_F"]] call _fnc_saveToTemplate; 

["ammobox", "IG_supplyCrate_F"] call _fnc_saveToTemplate;     
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; 
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; 

["vehiclesBasic", ["B_W_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["I_CDF_Offroad_01_F", "I_CDF_LSV_01_unarmed_F", "I_CDF_MRAP_01_F", "I_CDF_Offroad_01_covered_F"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["I_CDF_LSV_01_armed_F", "I_CDF_MRAP_01_hmg_F", "I_CDF_MRAP_01_gmg_F", "I_CDF_Offroad_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["I_CDF_Truck_02_transport_F", "I_CDF_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["I_CDF_Truck_02_transport_F", "I_CDF_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["I_CDF_Truck_02_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["I_CDF_Truck_02_box_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["I_CDF_Truck_02_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["I_CDF_Truck_02_medical_F", "I_CDF_APC_Tracked_02_medic_F"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["I_CDF_APC_Wheeled_04_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["I_CDF_APC_Tracked_02_F"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["I_CDF_APC_Tracked_02_F"]] call _fnc_saveToTemplate;

["vehiclesAirborne", ["I_CDF_MRAP_01_hmg_F", "I_CDF_LSV_01_armed_F", "I_CDF_APC_Wheeled_04_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["O_R_APC_Wheeled_04_cannon_v2_F", "B_W_UGV_01_rcws_F"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["I_CDF_MBT_02_F"]] call _fnc_saveToTemplate;
["vehiclesAA", ["I_CDF_Truck_02_aa_F", "I_CDF_APC_Tracked_02_AA_F"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["O_R_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["O_R_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["I_CDF_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate;

["vehiclesHelisTransport", ["I_CDF_Heli_Light_02_unarmed_F", "I_CDF_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLight", ["I_CDF_Heli_Light_02_unarmed_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["I_CDF_Heli_Light_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Aegis_O_R_Heli_Attack_04_F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["I_CDF_MBT_02_arty_F", "I_CDF_Truck_02_MRL_F"]] call _fnc_saveToTemplate; 

["magazines", createHashMapFromArray [
    ["I_CDF_MBT_02_arty_F",["32Rnd_155mm_Mo_shells_O"]],
    ["I_CDF_Truck_02_MRL_F",["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_W_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_W_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["I_CDF_Offroad_01_armed_F", "I_CDF_LSV_01_armed_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["I_CDF_Truck_02_transport_F", "I_CDF_Truck_02_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["I_CDF_LSV_01_unarmed_F", "I_CDF_Offroad_01_F", "I_CDF_Offroad_01_covered_F"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["I_CDF_LSV_01_armed_F", "I_CDF_Offroad_01_armed_F"]] call _fnc_saveToTemplate;

private _policeVehs = if (_hasContact) then {
    ["B_GEN_Offroad_01_covered_F", "B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_gen_F"]
} else {
    ["B_GEN_Offroad_01_gen_F"]
};

["vehiclesPolice", _policeVehs] call _fnc_saveToTemplate;

["staticMGs", ["I_CDF_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["I_CDF_Static_AT_F"]] call _fnc_saveToTemplate;
["staticAA", ["I_CDF_Static_AA_F"]] call _fnc_saveToTemplate;
["staticMortars", ["I_CDF_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "I_CDF_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "I_CDF_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;


["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

#include "Aegis_Vehicle_Attributes.sqf"

["variants", [
    ["O_R_Plane_CAS_02_dynamicLoadout_F", ["GreenHex",1]],
    ["O_R_Plane_Fighter_02_F", ["CamoGreenHex",1]],
    ["Aegis_O_R_Heli_Attack_04_F", ["Green",1]]
]] call _fnc_saveToTemplate;

["animations", [
    ["I_CDF_MBT_02_F", ["showCamonetHull",0.3,"showCamonetTurret",0.3,"showLog",0.3]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01RUS","Male02RUS","Male03RUS"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;
"CzechMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", ["hgun_ACPC2_F", "hgun_Pistol_heavy_01_F", "hgun_Rook40_F", "hgun_P07_F", "Aegis_hgun_P320_black_F", "hgun_G17_black_F", "Aegis_hgun_Pistol_R57_F"]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

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
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["U_I_CDF_Uniform_01_F", "U_I_CDF_Uniform_01_shortsleeve_F"]];
_loadoutData set ["traitorVests", ["V_Rangemaster_belt", "V_Chestrig_rgr", "V_BandollierB_oli", "V_TacVest_oli", "Aegis_V_ChestrigEast_oli_F", "Aegis_V_ChestrigEast_grn_F"]];
_loadoutData set ["traitorHats", ["H_Watchcap_camo", "H_Cap_grn", "H_Cap_oli", "H_CDF_Milcap_wdl", "Aegis_H_Milcap_nohs_grn_F", "H_Headset_light"]];

_loadoutData set ["officerUniforms", ["U_I_CDF_Uniform_01_shortsleeve_gloves_digi_F"]];
_loadoutData set ["officerVests", ["V_CDF_Vest_Defender_empty_digi", "V_CDF_Vest_Defender_rifleman_digi", "V_Rangemaster_belt"]];
_loadoutData set ["officerHats", ["H_CDF_Milcap_wdl", "H_Beret_red", "H_Beret_blk"]];

_loadoutData set ["cloakUniforms", ["U_B_W_FullGhillie_wdl_F", "U_I_FullGhillie_lsh"]];
_loadoutData set ["cloakVests", ["V_Chestrig_rgr"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["longRangeRadios", ["B_CDF_Radiobag_digi", "B_CDF_Radiobag_wdl"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["H_CDF_Milcap_wdl"]];
_loadoutData set ["sniHats", ["H_CDF_Booniehat_hs_wdl", "H_CDF_Booniehat_wdl"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
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

_loadoutData set ["glasses", [
    "G_Aviator",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Shades_Yellowred",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_Sport_Red",
    "G_Sport_Blackyellow",
    "G_Sport_BlackWhite",
    "G_Sport_Checkered",
    "G_Sport_Blackred",
    "G_Sport_Greenblack",
    "G_Squares_Tinted",
    "G_Squares",
    "G_Tactical_Clear",
    "G_Tactical_Black",
    "G_Tactical_Yellow",
    "G_Tactical_Camo",
    "G_Shemag_oli",
    "G_Shemag_khk",
    "G_Shemag_shades",
    "G_Shemag_tactical"
]];
_loadoutData set ["goggles", ["G_Combat", "G_Combat_Goggles_blk_F"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

_sfOptics = ["optic_ACO_grn", 1, "optic_Aco", 1, "optic_Holosight", 1, "optic_Hamr", 1, "optic_ACO_grn_AK_F", 1, "Aegis_optic_ACOG", 1, "Aegis_optic_1p87", 1, "Aegis_optic_ICO", 1, "Aegis_optic_ROS", 1, "optic_LRCO_blk_F", 1, "", 1];
_sfLROptics = [ "optic_DMS", 1,  "optic_MRCO", 1,  "optic_LRPS", 1,  "optic_Nightstalker", 1,  "optic_NVS", 1,  "optic_tws", 1];
_sfRails = [ "acc_pointer_IR", 1, "acc_flashlight", 1, "Aegis_acc_pointer_DM", 1, "", 1];
_sf545Muzzles = [ "muzzle_mzls_545", 0.3, "aegis_muzzle_snds_pbs_545_blk", 1, "muzzle_snds_545", 1, "", 0.3];
_sf65Muzzles = [ "muzzle_snds_H", 1, "muzzle_mzls_H", 0.3, "", 0.3];
_sf556Muzzles = [ "muzzle_snds_M", 1, "muzzle_mzls_M", 0.3, "", 0.3];
_sf762Muzzles = [ "muzzle_snds_B", 1, "muzzle_mzls_B", 0.3, "aegis_muzzle_snds_sr25_blk", 1, "", 0.3];

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["U_I_CDF_Uniform_01_gloves_digi_F", "U_I_CDF_Uniform_01_shortsleeve_gloves_digi_F", "U_I_CDF_Gorka_01_wdl_F"]];
_sfLoadoutData set ["vests", ["V_CarrierRigKBT_01_light_CDF_F", "V_CarrierRigKBT_01_CDF_F", "Atlas_V_CarrierRigKBT_01_CQB_CDF_F", "V_CarrierRigKBT_01_heavy_CDF_F", "V_CF_CarrierRig_Lite_F", "V_CF_CarrierRig_MG_F", "V_CDF_Vest_Defender_rifleman_digi", "V_CDF_Vest_Defender_rifleman_wdl", "V_CDF_Vest_Defender_autorifleman_digi", "V_CDF_Vest_Defender_autorifleman_wdl", "V_CDF_Vest_Defender_empty_digi", "V_CDF_Vest_Defender_empty_wdl"]];
_sfLoadoutData set ["backpacks", ["B_CDF_FieldPack_wdl", "B_CDF_Kitbag_digi", "B_AssaultPack_rgr", "B_Kitbag_rgr"]];
_sfLoadoutData set ["atBackpacks", ["B_CDF_Carryall_digi", "B_CDF_Carryall_wdl"]];
_sfLoadoutData set ["helmets", ["H_CDF_HelmetHBK_digi", "H_CDF_HelmetHBK_headset_digi", "Atlas_H_HelmetCCH_HiCut_Headset_grn_F", "Atlas_H_HelmetCCH_HiCut_grn_F", "H_HelmetB_green", "H_HelmetSpecB_green", "Aegis_H_Helmet_FASTMT_Cover_rgr_F", "Aegis_H_Helmet_FASTMT_rgr_F", "Aegis_H_Helmet_FASTMT_Headset_rgr_F", "Atlas_H_HelmetCCH_grn_F", "Atlas_H_HelmetCCH_Headset_grn_F", "H_HelmetB_light_green", "H_HelmetSpecB_light_green"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator", "Laserdesignator_04", "Rangefinder", "Binocular"]];
_sfLoadoutData set ["NVGs", ["NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP", "O_NVGoggles_blk_F", "Aegis_NVG_IVAS_01_blk_F", "Aegis_NVG_IVAS_01_grn_F", "Aegis_NVG_IVAS_01_tan_F"]];

_sfLoadoutData set ["missileATLaunchers", [
    ["launch_I_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_O_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_Titan_short_blk_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_O_Titan_short_camo_F", "", "", "", ["Titan_AT"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
    ["launch_Titan_blk_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_O_Titan_camo_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_B_Titan_coyote_F", "", "", "", ["Titan_AA"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["launch_MRAWS_black_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_black_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
    ["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
    ["arifle_CDF_AK19_F", _sf545Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],
    ["arifle_CDF_AK19_GL_F", _sf545Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CDF_AK19U_F", _sf545Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],

    ["arifle_CDF_AK74M_blk_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],

    ["arifle_MX_Black_F", _sf65Muzzles, _sfRails, _sfOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["arifle_MX_GL_Black_F", _sf65Muzzles, _sfRails, _sfOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_MXC_Black_F", _sf65Muzzles, _sfRails, _sfOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],

    ["Aegis_arifle_M4A1_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Aegis_arifle_M4A1_grip_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Aegis_arifle_M4A1_GL_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_M4A1_short_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["arifle_CDF_AK19_F", _sf545Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],

    ["arifle_CDF_AK74M_blk_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],

    ["arifle_MX_Black_F", _sf65Muzzles, _sfRails, _sfOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],

    ["Aegis_arifle_M4A1_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Aegis_arifle_M4A1_grip_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["arifle_CDF_AK19U_F", _sf545Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],

    ["arifle_MXC_Black_F", _sf65Muzzles, _sfRails, _sfOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],

    ["Aegis_arifle_M4A1_short_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];

_sfLoadoutData set ["designatedGrenadeLaunchers", [
    ["GL_M32_F", "", "", "", ["6Rnd_HE_Grenade_shell"], [], ""],
    ["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["arifle_CDF_AK19_GL_F", _sf545Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_MX_GL_Black_F", _sf65Muzzles, _sfRails, _sfOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["3Rnd_HE_Grenade_shell"], ""],

    ["Aegis_arifle_M4A1_GL_F", _sf556Muzzles, _sfRails, _sfOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_HE_Grenade_shell"], ""]
]];

_sfLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", _sf65Muzzles, _sfRails, _sfOptics, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Red"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["Aegis_arifle_SR25_MR_blk_F", _sf762Muzzles, _sfRails, _sfLROptics, ["Aegis_20Rnd_762x51_SMAG"], [], ""]
]];

_sfLoadoutData set ["sniperRifles", [
    ["srifle_GM6_F", "", _sfRails, _sfLROptics, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

_eliteOptics = ["optic_ACO_grn", 1, "optic_Aco", 1, "optic_Holosight", 1, "optic_Hamr", 1, "optic_ACO_grn_AK_F", 1, "Aegis_optic_ACOG", 1, "Aegis_optic_1p87", 1, "Aegis_optic_ICO", 1, "Aegis_optic_ROS", 1, "optic_LRCO_blk_F", 1, "", 5];
_eliteLROptics = [ "optic_DMS", 1,  "optic_MRCO", 1,  "optic_LRPS", 1,  "optic_Nightstalker", 1,  "optic_NVS", 1,  "optic_tws", 1];
_eliteRails = [ "acc_pointer_IR", 1, "acc_flashlight", 1, "Aegis_acc_pointer_DM", 1, "", 5];
_elite545Muzzles = [ "muzzle_mzls_545", 1, "aegis_muzzle_snds_pbs_545_blk", 1, "muzzle_snds_545", 1, "", 5];
_elite65Muzzles = [ "muzzle_snds_H", 1, "muzzle_mzls_H", 1, "", 5];
_elite556Muzzles = [ "muzzle_snds_M", 1, "muzzle_mzls_M", 1, "", 5];
_elite762DMRMuzzles = [ "muzzle_snds_B", 1, "muzzle_mzls_B", 1, "aegis_muzzle_snds_sr25_blk", 1, "", 5];
_elite762Muzzles = [ "muzzle_snds_B", 1, "muzzle_mzls_B", 1, "aegis_muzzle_snds_pbs_762_blk", 1, "", 5];
_elite58Muzzles = [ "muzzle_mzls_58_F", 1, "", 5];

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["U_I_CDF_Uniform_01_gloves_digi_F", "U_I_CDF_Uniform_01_shortsleeve_gloves_digi_F", "U_I_CDF_Uniform_01_F", "U_I_CDF_Uniform_01_gloves_F", "U_I_CDF_Uniform_01_shortsleeve_F", "U_I_CDF_Uniform_01_shortsleeve_gloves_F", "U_I_CDF_Gorka_01_wdl_F"]];
_eliteLoadoutData set ["vests", ["V_CarrierRigKBT_01_light_CDF_F", "V_CarrierRigKBT_01_CDF_F", "Atlas_V_CarrierRigKBT_01_CQB_CDF_F", "V_CarrierRigKBT_01_heavy_CDF_F", "V_CF_CarrierRig_Lite_F", "V_CF_CarrierRig_MG_F", "V_CDF_Vest_Defender_rifleman_digi", "V_CDF_Vest_Defender_rifleman_wdl", "V_CDF_Vest_Defender_autorifleman_digi", "V_CDF_Vest_Defender_autorifleman_wdl", "V_CDF_Vest_Defender_empty_digi", "V_CDF_Vest_Defender_empty_wdl", "Atlas_V_OCarrierGora_CQB_grn_F", "Atlas_V_OCarrierGora_Lite_grn_F", "Atlas_V_OCarrierGora_grn_F", "Aegis_V_PlateCarrier2_alt_oli", "V_PlateCarrier1_oli", "V_PlateCarrier2_oli", "Aegis_V_OCarrierLuchnik_CQB_grn_F", "Aegis_V_OCarrierLuchnik_GL_grn_F", "Aegis_V_OCarrierLuchnik_Lite_grn_F", "Aegis_V_OCarrierLuchnik_grn_F", "Aegis_V_CarrierRigKBT_01_cqb_olive_F", "Aegis_V_CarrierRigKBT_01_recon_olive_F", "Aegis_V_CarrierRigKBT_01_tac_olive_F"]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_AssaultPack_khk", "B_Kitbag_rgr", "B_TacticalPack_rgr", "B_AssaultPackSpec_rgr", "B_CDF_Kitbag_digi", "B_CDF_FieldPack_wdl"]];
_eliteLoadoutData set ["atBackpacks", ["B_CDF_Carryall_digi", "B_CDF_Carryall_wdl"]];
_eliteLoadoutData set ["helmets", ["H_CDF_HelmetHBK_digi", "H_CDF_HelmetHBK_headset_digi", "Atlas_H_HelmetCCH_HiCut_Headset_grn_F", "Atlas_H_HelmetCCH_HiCut_grn_F", "H_HelmetB_green", "H_HelmetSpecB_green", "Aegis_H_Helmet_FASTMT_Cover_rgr_F", "Aegis_H_Helmet_FASTMT_rgr_F", "Aegis_H_Helmet_FASTMT_Headset_rgr_F", "Atlas_H_HelmetCCH_grn_F", "Atlas_H_HelmetCCH_Headset_grn_F", "H_HelmetB_light_green", "H_HelmetSpecB_light_green", "H_CDF_Helmet_Raven_cover_wdl", "H_HelmetSpecter_F", "H_HelmetSpecter_cover_grn_F", "H_HelmetSpecter_cover_khaki_F", "H_HelmetSpecter_headset_F", "H_HelmetSpecter_paint_F", "H_HelmetSpecter_paint_headset_F", "H_HelmetSpecter_cover_CDF_F", "H_HelmetLuchnik_olive_F", "H_HelmetLuchnik_headset_grn_F"]];
_eliteLoadoutData set ["binoculars", ["Binocular", "Rangefinder"]];
_eliteLoadoutData set ["NVGs", ["NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP", "O_NVGoggles_blk_F", "Aegis_NVG_IVAS_01_blk_F", "Aegis_NVG_IVAS_01_grn_F", "Aegis_NVG_IVAS_01_tan_F"]];

_eliteLoadoutData set ["missileATLaunchers", [
    ["launch_I_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_O_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_Titan_short_blk_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_O_Titan_short_camo_F", "", "", "", ["Titan_AT"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
    ["launch_Titan_blk_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_O_Titan_camo_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_B_Titan_coyote_F", "", "", "", ["Titan_AA"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", [
    ["launch_MRAWS_black_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_black_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
    ["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
    ["launch_NLAW_F", "", "", "", [], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
    ["arifle_CDF_AK19_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],
    ["arifle_CDF_AK19_GL_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CDF_AK19U_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],

    ["arifle_CDF_AK74M_blk_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],

    ["arifle_MX_Black_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
    ["arifle_MX_GL_Black_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_MXC_Black_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],

    ["Aegis_arifle_M4A1_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Aegis_arifle_M4A1_grip_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Aegis_arifle_M4A1_GL_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["Aegis_arifle_M4A1_short_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["Aegis_arifle_AK103_plum_F", _elite762Muzzles, _eliteRails, _eliteOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], [], ""],
    ["Aegis_arifle_AK103_GL_plum_F", _elite762Muzzles, _eliteRails, _eliteOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["arifle_AK12_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], [], ""],
    ["arifle_AK12_GL_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKM74_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_GL_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKS74_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AKSM_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AK12U_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_NCAR15_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_NCAR15B_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_NCAR15_GL_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""]
]];

_eliteLoadoutData set ["rifles", [
    ["arifle_CDF_AK19_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],

    ["arifle_CDF_AK74M_blk_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],

    ["arifle_MX_Black_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],

    ["Aegis_arifle_M4A1_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Aegis_arifle_M4A1_grip_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["Aegis_arifle_AK103_plum_F", _elite762Muzzles, _eliteRails, _eliteOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], [], ""],

    ["arifle_AK12_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], [], ""],
    ["arifle_AK12_GL_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKM74_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_GL_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKS74_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_NCAR15_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["arifle_CDF_AK19U_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],

    ["arifle_MXC_Black_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],

    ["Aegis_arifle_M4A1_short_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["arifle_AKSM_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AK12U_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_NCAR15B_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""]
]];

_eliteLoadoutData set ["designatedGrenadeLaunchers", [
    ["GL_M32_F", "", "", "", ["6Rnd_HE_Grenade_shell"], [], ""],
    ["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["arifle_CDF_AK19_GL_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_MX_GL_Black_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["3Rnd_HE_Grenade_shell"], ""],

    ["Aegis_arifle_M4A1_GL_F", _elite556Muzzles, _eliteRails, _eliteOptics, ["30Rnd_556x45_Stanag_green", "30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_HE_Grenade_shell"], ""],

    ["Aegis_arifle_AK103_GL_plum_F", _elite762Muzzles, _eliteRails, _eliteOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_AK12_GL_545_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["Aegis_arifle_AKM74_GL_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_NCAR15_GL_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""]
]];

_eliteLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", _elite65Muzzles, _eliteRails, _eliteOptics, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Red"], [], ""],

    ["arifle_NCAR15_MG_F", _elite58Muzzles, _eliteRails, _eliteOptics, ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["Aegis_arifle_RPK74M_F", _elite545Muzzles, _eliteRails, _eliteOptics, ["Aegis_45Rnd_545x39_Mag_Tracer_Green_F", "Aegis_60Rnd_545x39_Mag_Green_F"], [], ""],

    ["LMG_Zafir_black_F", _elite762Muzzles, _eliteRails, _eliteOptics, ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["Aegis_arifle_SR25_MR_blk_F", _elite762DMRMuzzles, _eliteRails, _eliteLROptics, ["Aegis_20Rnd_762x51_SMAG"], [], ""],

    ["Aegis_srifle_SVD_blk_f", _elite762DMRMuzzles, _eliteRails, _eliteLROptics, ["10Rnd_762x54_Mag", "Aegis_10Rnd_762x54_SVD_Green_Mag_F"], [], ""]
]];

_eliteLoadoutData set ["sniperRifles", [
    ["srifle_GM6_F", "", _eliteRails, _eliteLROptics, ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
    ["srifle_LRR_F", "", "", _eliteLROptics, ["7Rnd_408_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

_milOptics = ["optic_ACO_grn", 1, "optic_Aco", 1, "optic_Holosight", 1, "optic_Hamr", 1, "optic_ACO_grn_AK_F", 1, "Aegis_optic_ACOG", 1, "Aegis_optic_1p87", 1, "Aegis_optic_ICO", 1, "Aegis_optic_ROS", 1, "optic_LRCO_blk_F", 1, "", 8];
_milLROptics = [ "optic_DMS", 1,  "optic_MRCO", 1,  "optic_LRPS", 1,  "optic_Nightstalker", 1,  "optic_NVS", 1,  "optic_tws", 1];
_milRails = [ "acc_pointer_IR", 1, "acc_flashlight", 1, "Aegis_acc_pointer_DM", 1, "", 8];
_mil545Muzzles = [ "muzzle_mzls_545", 1, "aegis_muzzle_snds_pbs_545_blk", 1, "muzzle_snds_545", 1, "", 8];
_mil65Muzzles = [ "muzzle_snds_H", 1, "muzzle_mzls_H", 1, "", 8];
_mil556Muzzles = [ "muzzle_snds_M", 1, "muzzle_mzls_M", 1, "", 8];
_mil58Muzzles = [ "muzzle_mzls_58_F", 1, "", 8];
_mil762DMRMuzzles = [ "muzzle_snds_B", 1, "muzzle_mzls_B", 1, "aegis_muzzle_snds_sr25_blk", 1, "", 8];
_mil762Muzzles = ["muzzle_mzls_B", 1, "", 8];
_mil9mmMuzzles = ["muzzle_mzls_L", 1, "", 8];

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["U_I_CDF_Uniform_01_gloves_digi_F", "U_I_CDF_Uniform_01_shortsleeve_gloves_digi_F", "U_I_CDF_Uniform_01_F", "U_I_CDF_Uniform_01_gloves_F", "U_I_CDF_Uniform_01_shortsleeve_F", "U_I_CDF_Uniform_01_shortsleeve_gloves_F", "U_I_CDF_Gorka_01_wdl_F"]];
_militaryLoadoutData set ["vests", ["V_CDF_Vest_Defender_rifleman_digi", "V_CDF_Vest_Defender_rifleman_wdl", "V_CDF_Vest_Defender_autorifleman_digi", "V_CDF_Vest_Defender_autorifleman_wdl", "V_CDF_Vest_Defender_empty_digi", "V_CDF_Vest_Defender_empty_wdl", "Atlas_V_OCarrierRig_oli_F", "Atlas_V_OCarrierRig_Lite_oli_F", "Atlas_V_OCarrierRig_Lite_Alt_Oli_F", "Atlas_V_OCarrierRig_GL_oli_F", "Atlas_V_OCarrierRig_GL_alt_Oli_F", "Atlas_V_OCarrierRig_CQB_oli_F", "Atlas_V_OCarrierRig_CQB_alt_oli_F", "Atlas_V_OCarrierGora_grn_F", "Atlas_V_OCarrierGora_Lite_grn_F", "Atlas_V_OCarrierGora_CQB_grn_F", "Aegis_V_OCarrierLuchnik_grn_F", "Aegis_V_OCarrierLuchnik_Lite_grn_F", "Aegis_V_OCarrierLuchnik_GL_grn_F", "Aegis_V_OCarrierLuchnik_CQB_grn_F", "V_CF_CarrierRig_Lite_F", "V_CF_CarrierRig_MG_F", "V_CF_CarrierRig_F"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_AssaultPack_khk", "B_Kitbag_rgr", "B_TacticalPack_rgr", "B_AssaultPackSpec_rgr", "B_CDF_Kitbag_digi", "B_CDF_FieldPack_wdl"]];
_militaryLoadoutData set ["atBackpacks", ["B_CDF_Carryall_digi", "B_CDF_Carryall_wdl"]];
_militaryLoadoutData set ["helmets", ["H_CDF_Helmet_Raven_cover_wdl", "H_HelmetSpecter_F", "H_HelmetSpecter_cover_khaki_F", "H_HelmetSpecter_cover_grn_F", "H_HelmetSpecter_headset_F", "H_HelmetSpecter_paint_headset_F", "H_HelmetSpecter_paint_F", "H_MK7_oli_F", "Aegis_H_Helmet_Virtus_rgr_F", "Aegis_H_Helmet_Virtus_Headset_rgr_F", "H_HelmetLuchnik_cover_grn_F", "H_HelmetLuchnik_headset_grn_F", "H_HelmetLuchnik_olive_F", "H_I_Helmet_canvas_Green", "lxWS_H_PASGT_goggles_green_F", "H_PASGT_basic_green_F", "Atlas_H_PASGT_Cover_Green_F", "Atlas_H_PASGT_Cover_Olive_F"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];
_militaryLoadoutData set ["NVGs", ["NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP", "O_NVGoggles_blk_F"]];

_militaryLoadoutData set ["AALaunchers", [
    ["launch_Titan_blk_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_O_Titan_camo_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_B_Titan_coyote_F", "", "", "", ["Titan_AA"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["launch_MRAWS_black_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_black_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
    ["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
    ["launch_NLAW_F", "", "", "", [], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
    ["arifle_CDF_AK74M_blk_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],

    ["Aegis_arifle_AK103_plum_F", _mil762Muzzles, _milRails, _milOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], [], ""],
    ["Aegis_arifle_AK103_GL_plum_F", _mil762Muzzles, _milRails, _milOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["arifle_AK12_545_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], [], ""],
    ["arifle_AK12_GL_545_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKM74_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],
    ["Aegis_arifle_AKM74_GL_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKS74_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AKSM_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AK12U_545_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_NCAR15_F", _mil58Muzzles, _milRails, _milOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_NCAR15B_F", _mil58Muzzles, _milRails, _milOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_NCAR15_GL_F", _mil58Muzzles, _milRails, _milOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_CDF_AK19_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""],
    ["arifle_CDF_AK19_GL_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CDF_AK19U_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""]
]];

_militaryLoadoutData set ["rifles", [
    ["arifle_CDF_AK74M_blk_F", "", "", "", ["30Rnd_545x39_AK12_Mag_F", "30Rnd_545x39_AK12_Mag_Tracer_F"], [], ""],

    ["Aegis_arifle_AK103_plum_F", _mil762Muzzles, _milRails, _milOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], [], ""],

    ["arifle_AK12_545_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], [], ""],

    ["Aegis_arifle_AKM74_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["Aegis_arifle_AKS74_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_NCAR15_F", _mil58Muzzles, _milRails, _milOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["arifle_CDF_AK19_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""]
]];

_militaryLoadoutData set ["carbines", [
    ["arifle_AKSM_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AK12U_545_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_NCAR15B_F", _mil58Muzzles, _milRails, _milOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["arifle_CDF_AK19U_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], [], ""]
]];

_militaryLoadoutData set ["grenadeLaunchers", [
    ["Aegis_arifle_AK103_GL_plum_F", _mil762Muzzles, _milRails, _milOptics, ["30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F", "30Rnd_762x39_polymer_Black_Mag_Green_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_AK12_GL_545_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_AK12_Mag_Tracer_F", "30Rnd_545x39_AK12_Mag_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["Aegis_arifle_AKM74_GL_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_NCAR15_GL_F", _mil58Muzzles, _milRails, _milOptics, ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""],

    ["arifle_CDF_AK19_GL_F", _mil545Muzzles, _milRails, _milOptics, ["30Rnd_556x45_AK19_CDF_Mag_Green_F", "30Rnd_556x45_AK19_CDF_Mag_F", "30Rnd_556x45_AK19_CDF_Mag_Green_Tracer_F", "30Rnd_556x45_AK19_CDF_Mag_Tracer_F"], ["1Rnd_HE_Grenade_shell"], ""]
]];

_militaryLoadoutData set ["SMGs", [
    ["Aegis_SMG_Gepard_blk_F", _mil9mmMuzzles, _milRails, _milOptics, ["Aegis_40Rnd_9x21_Gepard_Green_Mag_F", "Aegis_40Rnd_9x21_Gepard_Mag_F"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
    ["arifle_NCAR15_MG_F", _mil58Muzzles, _milRails, _milOptics, ["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["Aegis_arifle_RPK74M_F", _mil545Muzzles, _milRails, _milOptics, ["Aegis_45Rnd_545x39_Mag_Tracer_Green_F", "Aegis_60Rnd_545x39_Mag_Green_F"], [], ""],

    ["LMG_Zafir_black_F", _mil762Muzzles, _milRails, _milOptics, ["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
    ["Aegis_srifle_SVD_blk_f", _mil762Muzzles, _milRails, _milLROptics, ["10Rnd_762x54_Mag", "Aegis_10Rnd_762x54_SVD_Green_Mag_F"], [], ""]
]];

_militaryLoadoutData set ["sniperRifles", [
    ["srifle_LRR_F", "", "", _milLROptics, ["7Rnd_408_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["Atlas_U_UniformBDU_01_oli_F", "Atlas_U_UniformBDU_02_oli_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_oli", "V_ChestrigF_oli", "Aegis_V_ChestrigEast_oli_F", "Atlas_V_ORigLBV_oli_F", "V_Rangemaster_belt_oli"]];
_policeLoadoutData set ["helmets", ["H_Beret_blk_POLICE", "H_Beret_grn", "H_CDF_Milcap_wdl", "Aegis_H_Milcap_nohs_grn_F"]];
_policeLoadoutData set ["SMGs", [
    ["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F"], [], ""],

    ["Aegis_SMG_Gepard_blk_F", "", "", "", ["Aegis_40Rnd_9x21_Gepard_Mag_F"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
    ["sgun_Mp153_black_F", "", "", "", ["4Rnd_12Gauge_Pellets", "4Rnd_12Gauge_Slug"], [], ""],

    ["Aegis_sgun_KSG_black_F", "", "", "", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""],

    ["sgun_M4_F", "", "", "", ["8Rnd_12Gauge_Pellets", "8Rnd_12Gauge_Slug"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["Atlas_U_UniformBDU_01_oli_F", "Atlas_U_UniformBDU_02_oli_F", "U_I_CDF_Uniform_01_F", "U_I_CDF_Uniform_01_shortsleeve_F"]];
_militiaLoadoutData set ["vests", ["V_TacVest_oli", "V_TacVest_grn", "V_HarnessOSpec_whex_F"]];
_militiaLoadoutData set ["backpacks", ["B_CDF_FieldPack_wdl", "B_CDF_Kitbag_digi"]];
_militiaLoadoutData set ["atBackpacks", ["B_CDF_Carryall_wdl"]];
_militiaLoadoutData set ["helmets", ["H_PASGT_basic_green_F", "lxWS_H_PASGT_goggles_green_F", "Atlas_H_PASGT_Cover_Green_F"]];
_militiaLoadoutData set ["binoculars", ["Binocular"]];
_militiaLoadoutData set ["NVGs", ["NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP"]];

_militiaLoadoutData set ["AALaunchers", [
    ["launch_Titan_blk_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_O_Titan_camo_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_B_Titan_coyote_F", "", "", "", ["Titan_AA"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["launch_MRAWS_black_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_coyote_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_HE_F"], [], ""],
    ["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""]
]];
_militiaLoadoutData set ["ATLaunchers", [
    ["launch_NLAW_F", "", "", "", [], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["Aegis_arifle_AK74_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],
    ["Aegis_arifle_AK74_GL_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["Aegis_arifle_AKS74_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["Aegis_arifle_AK74_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""],

    ["Aegis_arifle_AKS74_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["arifle_AKSM_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], [], ""]
]];

_militiaLoadoutData set ["grenadeLaunchers", [
    ["Aegis_arifle_AK74_GL_F", "", "", "", ["30Rnd_545x39_Mag_Tracer_Green_F", "30Rnd_545x39_Mag_Green_F"], ["1Rnd_HE_Grenade_shell"], ""]
]];

_militiaLoadoutData set ["machineGuns", [
    ["arifle_RPK_F", "", "", "", ["75Rnd_762x39_Mag_Tracer_Green_F", "75Rnd_762x39_Mag_Green_F"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
    ["Aegis_srifle_SVD_f", "", "", "", ["10Rnd_762x54_Mag", "Aegis_10Rnd_762x54_SVD_Green_Mag_F"], [], ""]
]];

_militiaLoadoutData set ["sniperRifles", [
    ["Aegis_srifle_SVD_f", "", "", _milLROptics, ["10Rnd_762x54_Mag", "Aegis_10Rnd_762x54_SVD_Green_Mag_F"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_I_CDF_Uniform_01_shortsleeve_gloves_digi_F", "U_I_CDF_Uniform_01_shortsleeve_gloves_F"]];
_crewLoadoutData set ["vests", ["V_SmershVest_01_olive_F", "V_SmershVest_01_radio_olive_F"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I", "H_HelmetCrew_B_oli_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_PilotCoveralls"]];
_pilotLoadoutData set ["vests", ["V_Rangemaster_belt_blk"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O", "H_PilotHelmetFighter_O", "H_PilotHelmetHeli_I_E_visor_up"]];

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 0.2, "carbines", 0.5, "SMGs", 0.3]] call _fnc_setPrimary;
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
