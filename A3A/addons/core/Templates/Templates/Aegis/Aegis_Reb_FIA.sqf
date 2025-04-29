private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasKart = "kart" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasSOG = "vn" in A3A_enabledDLC;
private _hasSPE = "spe" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FIA"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

private _vehiclesBasic = ["I_G_Quadbike_01_F"];
private _vehiclesLightUnarmed = ["I_G_Offroad_01_F","I_G_Offroad_01_armor_base_lxWS","I_C_Offroad_02_unarmed_F"];
private _vehiclesLightArmed = ["I_G_Offroad_01_armed_F","I_G_Offroad_01_armor_armed_lxWS","I_C_Offroad_02_LMG_F"];
private _vehiclesAt = ["I_G_Offroad_01_AT_F","I_G_Offroad_01_armor_AT_lxWS","I_C_Offroad_02_AT_F"];
private _VehTruck = ["I_G_Van_01_transport_F","I_G_Van_02_transport_F", "I_G_Van_02_vehicle_F"];
private _vehicleAA = ["I_Tura_Truck_02_aa_lxWS"];

private _vehiclesBoat = ["I_C_Boat_Transport_02_F" , "I_SDV_01_F" , "I_Boat_Armed_01_minigun_F" , "O_Boat_Armed_01_hmg_F"];

private _vehiclesMedical = ["a3a_ION_Truck_02_medical_F","C_Van_02_medevac_F"];

private _vehiclesSupply = ["C_Van_01_box_F"];

private _vehiclePlane = ["C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F"];

private _vehicleCivPlane = ["C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F","Aegis_C_Plane_Transport_01_civil_F"];

private _vehiclesCivCar = ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F","C_Offroad_lxWS","C_Truck_02_racing_lxWS","C_Offroad_01_covered_F", "C_Offroad_01_comms_F", "C_Tractor_01_F", "C_Offroad_02_unarmed_F"];
private _CivTruck = ["C_Truck_02_transport_F", "C_Truck_02_covered_F","C_Truck_02_cargo_lxWS", "C_Truck_02_flatbed_lxWS","C_Van_02_vehicle_F", "C_Van_02_transport_F"];
private _civHelicopters = ["C_Heli_Light_01_civil_F", "a3a_C_Heli_Transport_02_F", "a3a_C_Heli_Light_02_blue_F","Aegis_C_Heli_Transport_02_VIP_F"];

private _CivBoat = ["C_Boat_Civil_01_F", "C_Rubberboat","C_Boat_Transport_02_F", "C_Scooter_Transport_01_F","C_Boat_Civil_02_F"];

private _staticMG = ["I_G_HMG_02_high_F", "I_G_HMG_02_F"];
private _staticAT = ["I_static_AT_F"];
private _staticAA = ["I_static_AA_F","I_Tura_ZU23_lxWS"];
private _staticMortars = ["I_G_Mortar_01_F"];
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minesAT", ["ATMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag"]] call _fnc_saveToTemplate;
["minesAPERS", ["ClaymoreDirectionalMine_Remote_Mag","APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag"]] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

if (_hasKart) then {
  #include "..\DLC_content\vehicles\Kart\Rebel_kart.sqf"  
};

if (_hasGM) then {
  #include "..\DLC_content\vehicles\GM\Vanilla_FIA.sqf"
};

if (_hasCSLA) then {
  #include "..\DLC_content\vehicles\CSLA\Vanilla_FIA.sqf"  
};

if (_hasRF) then {
  #include "..\DLC_content\vehicles\RF\Vanilla_FIA.sqf" 
};

if (_hasSOG) then {
  #include "..\DLC_content\vehicles\SOG\Vanilla_FIA.sqf"
};

if (_hasSPE) then {
  #include "..\DLC_content\vehicles\SPE\Vanilla_FIA.sqf"
};

if (isClass (configFile >> "cfgVehicles" >> "SPEX_M2_60")) then {
	#include "..\MOD_content\SPEX\vehicles\Vanilla_FIA.sqf"
};

if (isClass (configFile >> "cfgVehicles" >> "vnx_b_air_ac119_02_01")) then {
	#include "..\MOD_content\Nickelsteel\vehicles\Vanilla_FIA.sqf"
};

["vehiclesCivPlane", _vehicleCivPlane] call _fnc_saveToTemplate;
["vehiclesCivSupply", _vehiclesSupply] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesBoat", _vehiclesBoat] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["staticMGs", _staticMG] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["vehiclesCivHeli", _civHelicopters] call _fnc_saveToTemplate;
["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesPlane", _vehiclePlane] call _fnc_saveToTemplate;
["vehiclesCivTruck", _CivTruck] call _fnc_saveToTemplate;
["vehiclesTruck", _VehTruck] call _fnc_saveToTemplate;
["vehiclesCivBoat", _CivBoat] call _fnc_saveToTemplate;
["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAt] call _fnc_saveToTemplate;

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["variants", [
  #include "..\vehicleVariants\Vanilla_FIA.sqf"
]] call _fnc_saveToTemplate;

#include "Aegis_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
  "hgun_Pistol_heavy_02_F",
  "hgun_PDW2000_F",
  "30Rnd_9x21_Mag", "30Rnd_9x21_Red_Mag",
  "6Rnd_45ACP_Cylinder","MiniGrenade","SmokeShell",
  ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
  "B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_khk",
  "V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_Rangemaster_belt",
  "Binocular",
  "acc_flashlight","acc_flashlight_smg_01","acc_flashlight_pistol",
  "B_FieldPack_blk","B_AssaultPack_blk",
  ["launch_RPG32_F", 2], ["RPG32_F", 6],
  "sgun_HunterShotgun_01_F",
  "sgun_HunterShotgun_01_sawedoff_F",
  "2Rnd_12Gauge_Pellets",
  "2Rnd_12Gauge_Slug",
  "V_BandollierB_ghex_F",
  "V_TacChestrig_cbr_F",
  "V_TacChestrig_grn_F",
  "V_TacChestrig_oli_F",
  "hgun_Pistol_01_F",
  "10Rnd_9x21_Mag",
  ["launch_RPG7_F", 3], 
  ["RPG7_F", 9],
  "V_Pocketed_olive_F", 
  "V_Pocketed_coyote_F", 
  "V_Pocketed_black_F",
  "V_Plain_crystal_F",
  "B_LegStrapBag_black_F", 
  "V_LegStrapBag_coyote_F",
  "V_LegStrapBag_olive_F",
  "V_Safety_blue_F",
  "V_Safety_orange_F",
  "V_Safety_yellow_F",
  "B_Messenger_Black_F", 
  "B_Messenger_Coyote_F", 
  "B_Messenger_Gray_F",
  "B_Messenger_Olive_F",
  "Aegis_SMG_Gepard_blk_F",
  "Aegis_20Rnd_9x21_Gepard_Mag_F",
  "Aegis_V_Ammo_Bandolier_F",
  "Aegis_V_CarrierRigKBT_01_holster_black_F",
  "Aegis_V_CarrierRigKBT_01_holster_cbr_F",
  "Aegis_V_CarrierRigKBT_01_holster_khk_F",
  "Aegis_V_CarrierRigKBT_01_holster_olive_F",
  "V_BandollierB_taiga_F",
  "V_BandollierB_tna_F",
  "V_Pocketed_hunter_F",
  "V_Pocketed_wdl_F",
  "ItemSmartPhone"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "U_IG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F",
    "U_I_L_Uniform_01_deserter_F",
    "U_C_HunterBody_grn",
    "U_BG_Guerrilla_6_1",
    "U_BG_Guerilla1_1",
    "U_BG_Guerilla2_2",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "U_BG_Guerilla3_2",
    "U_BG_leader",
    "U_I_G_Story_Protagonist_F",
    "U_B_survival_uniform",
    "Aegis_U_lxWS_ION_Casualtna_F",
    "Aegis_U_lxWS_ION_Casual_Hawaiian_F",
    "Aegis_U_lxWS_ION_Casual_Hawaiian_2_F",
    "Aegis_U_lxWS_ION_Flanneltna_F",
    "U_BG_Guerilla1_3",
    "U_B_ION_Uniform_01_poloshirt_blue_F",
    "U_B_ION_Uniform_01_poloshirt_wdl_F",
    "U_B_ION_Uniform_01_tshirt_black_F",
    "Atlas_U_UniformBDU_01_oli_F",
    "Atlas_U_UniformBDU_02_oli_F",
    "Atlas_U_I_Afghanka_01_ardi_full_F",
    "Atlas_U_I_Afghanka_01_ardi_half_F",
    "Atlas_U_I_Afghanka_02_ardi_half_F",
    "Atlas_U_I_Afghanka_02_ardi_full_F",
    "Opf_U_O_S_Uniform_01_arid_F",
    "Opf_U_O_S_Uniform_01_sweater_flora_F",
    "Opf_U_I_I_Uniform_01_ghex_F",
    "Opf_U_I_I_Uniform_01_hex_F",
    "Opf_U_O_S_Uniform_01_sweater_F",
    "Opf_U_O_S_Uniform_01_taiga_F",
    "Opf_U_I_I_Uniform_01_urb_F",
    "Opf_U_O_S_Gorka_01_autumn_F",
    "Opf_U_O_S_Gorka_01_summer_F",
    "Opf_U_IG_Guerilla3_3_F",
    "Opf_U_Uniform_01_PLR_F",
    "Opf_U_Uniform_02_PLR_F",
    "Opf_U_Uniform_03_PLR_F",
    "Opf_U_B_P_Uniform_Advisor_F",
    "Opf_U_B_P_FieldJacket_01_F",
    "Opf_U_B_P_FieldJacket_02_F",
    "Opf_U_B_P_FieldJacket_03_F",
    "Opf_U_B_P_Uniform_01_F",
    "Opf_U_B_P_Uniform_01_Shortsleeve_F",
    "Opf_U_O_ParamilitaryBody",
    "Opf_U_I_I_Uniform_01_tshirt_black_F"
];

private _dlcUniforms = [
    "U_C_Paramedic_01_F",
    "U_lxWS_ION_Casual1",
    "U_lxWS_ION_Casual2",
    "U_lxWS_ION_Casual3",
    "U_lxWS_ION_Casual4",
    "U_lxWS_ION_Casual5",
    "U_lxWS_SFIA_deserter",
    "U_lxWS_Djella_02_Brown",
    "U_lxWS_Djella_02_Grey",
    //"U_lxWS_Djella_02_Green",
    "U_lxWS_Djella_02_Sand",
    "U_I_L_Uniform_01_camo_F",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_olive_F",
    "U_I_L_Uniform_01_tshirt_skull_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_I_L_Uniform_01_deserter_F",
    "U_C_E_LooterJacket_01_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_I_C_Soldier_Camo_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_5_F",
    "U_C_ConstructionCoverall_Black_F",
    "U_C_ConstructionCoverall_Blue_F",
    "U_C_ConstructionCoverall_Red_F",
    "U_C_ConstructionCoverall_Vrana_F",
    "U_BG_Guerilla1_2_F",
    "U_C_Paramedic_01_F"
];

private _headgear = [
    "H_Booniehat_khk_hs",
    "H_Booniehat_khk",
    "H_Booniehat_tan",
    "H_Booniehat_oli",    
    "H_Bandanna_gry",
    "H_Bandanna_blu",
    "H_Bandanna_cbr",    
    "H_Bandanna_khk_hs",
    "H_Bandanna_khk",
    "H_Bandanna_sgg",
    "H_Bandanna_sand",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
    "H_Bandanna_camo",
    "H_Watchcap_blk",
    "H_Watchcap_cbr",
    "H_Watchcap_camo",
    "H_Watchcap_khk",
    "H_Beret_blk",
    "H_Booniehat_khk_hs",
    "H_Booniehat_khk",
    "H_Booniehat_oli",
    "H_Booniehat_tan",
    "H_Cap_oli",
    "H_Cap_surfer",
    "H_Cap_tan",
    "H_Cap_oli_hs",
    "H_Cap_blk",
    "H_Cap_headphones",
    "H_Hat_blue",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_checker",
    "H_Hat_grey",
    "H_Hat_tan",
    "H_Cap_marshal",
    "H_MilCap_blue",
    "H_MilCap_gry",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive_hs",
    "H_StrawHat",
    "H_StrawHat_dark"
];

private _dlcheadgear = [
    "lxWS_H_Bandanna_blk_hs",
    "H_Cap_headphones_ion_lxws",
    "lxWS_H_CapB_rvs_blk_ION",
    "lxWS_H_Headset",
    "H_Beret_Headset_lxWS",
    "H_HeadBandage_clean_F",
    "H_HeadBandage_stained_F",
    "H_HeadBandage_bloody_F",
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F",
    "H_WirelessEarpiece_F"
];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", _headgear + _dlcheadgear] call _fnc_saveToTemplate;
/////////////////////
///  Identities   ///
/////////////////////

private _faces = ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04",
"GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08",
"GreekHead_A3_09","GreekHead_A3_10","GreekHead_A3_11","GreekHead_A3_12","GreekHead_A3_13",
"GreekHead_A3_14","Ioannou","Mavros","Sturrock","IG_Leader"];
["voices", ["Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE"]] call _fnc_saveToTemplate;
["faces", _faces] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular","Camera_lxWS"]];
_loadoutData set ["uniforms", _rebUniforms + _dlcUniforms]; ///check this one

_loadoutData set ["glasses", [
  "G_Lady_Blue",
  "G_Shades_Black", 
  "G_Shades_Blue", 
  "G_Shades_Green", 
  "G_Shades_Red", 
  "G_Aviator", 
  "G_Spectacles", 
  "G_Spectacles_Tinted", 
  "G_Sport_BlackWhite", 
  "G_Sport_Blackyellow", 
  "G_Sport_Greenblack", 
  "G_Sport_Checkered", 
  "G_Sport_Red", 
  "G_Squares", 
  "G_Squares_Tinted",
  "G_Sport_Blackred",
  "G_Shades_Yellowred",
  "Aegis_G_Condor_EyePro_F"
]];
_loadoutData set ["goggles", ["G_Lowprofile","G_Combat_Goggles_blk_F","G_Headset_light","G_Combat_Goggles_tna_F"]];
_loadoutData set ["facemask", [
  "G_Bandanna_blk",
  "G_Bandanna_oli", 
  "G_Bandanna_khk", 
  "G_Bandanna_tan", 
  "G_Bandanna_beast",
  "G_Bandanna_shades", 
  "G_Bandanna_sport", 
  "G_Bandanna_aviator",
  "Aegis_G_Armband_BLU_alt_F",
  "Aegis_G_Armband_IND_alt_F",
  "Aegis_G_Armband_OPF_alt_F",
  "Aegis_G_Armband_BLU_F",
  "Aegis_G_Armband_IND_F",
  "Aegis_G_Armband_OPF_F",
  "Aegis_G_Armband_FIA_F",
  "Aegis_G_Armband_FIA_alt_F",
  "G_Bandanna_kawaii",
  "G_Cigarette",
  "Aegis_G_Headset_black_F",
  "Aegis_G_Headset_Olive_F",
  "Aegis_G_Headset_orange_F",
  "Aegis_G_Headset_red_F",
  "Aegis_G_Headset_Sand_F",
  "Aegis_G_Headset_white_F",
  "Aegis_G_Headset_Yellow_F",
  "G_Shemag_khk",
  "G_Shemag_oli",
  "G_Shemag_red",
  "G_Shemag_shades",
  "G_Shemag_tactical",
  "G_Shemag_tan",
  "G_Shemag_white",
  "G_Headset_Tactical",
  "G_Headset_Tactical_grn",
  "G_Headset_Tactical_khk"
]];
_loadoutData set ["balaclavas", [
  "G_Balaclava_blk", 
  "G_Balaclava_BlueStrips", 
  "G_Balaclava_Flecktarn", 
  "G_Balaclava_Halloween_01", 
  "G_Balaclava_lowprofile", 
  "G_Balaclava_oli", 
  "G_Balaclava_Flames1", 
  "G_Balaclava_Scarecrow_01", 
  "G_Balaclava_Skull1", 
  "G_Balaclava_Tropentarn",
  "G_Balaclava_combat",
  "G_Balaclava_light_blk_F",
  "G_Balaclava_light_G_blk_F"
]];
_loadoutData set ["argoFacemask", ["G_Bandanna_BlueFlame1", "G_Bandanna_BlueFlame2", "G_Bandanna_CandySkull", "G_Bandanna_OrangeFlame1", "G_Bandanna_RedFlame1", "G_Bandanna_Skull1", "G_Bandanna_Syndikat1", "G_Bandanna_Syndikat2","G_Bandanna_Skull2", "G_Bandanna_Vampire_01"]];
_loadoutData set ["facewearWS", ["G_Balaclava_blk_lxWS", "G_Balaclava_oli_lxWS", "G_Balaclava_snd_lxWS", "G_Combat_lxWS", "G_Headset_lxWS"]];
_loadoutData set ["facewearContact", ["G_RegulatorMask_F","G_Blindfold_01_black_F","G_Blindfold_01_white_F"]];
_loadoutData set ["facewearLawsOfWar", ["G_Respirator_blue_F", "G_Respirator_white_F", "G_Respirator_yellow_F", "G_EyeProtectors_F", "G_EyeProtectors_Earpiece_F", "G_WirelessEarpiece_F"]];
_loadoutData set ["facewearGM", []];
_loadoutData set ["facewearCLSA", []];
_loadoutData set ["facewearSOG", []];
_loadoutData set ["facewearSPE", []];

if (_hasRF) then {
  #include "..\DLC_content\gear\RF\Vanilla_FIA.sqf"
};

if (_hasGM) then {
  #include "..\DLC_content\gear\GM\Vanilla_FIA.sqf"
};

if (_hasCSLA) then {
  #include "..\DLC_content\gear\CSLA\Vanilla_FIA.sqf"
};

if (_hasArtOfWar) then {
  #include "..\DLC_content\gear\Artofwar\Vanilla_FIA.sqf"
};

if (_hasSOG) then {
  #include "..\DLC_content\gear\SOG\Vanilla_FIA.sqf"
};

if (_hasSPE) then {
  #include "..\DLC_content\gear\SPE\Vanilla_FIA.sqf"
};

if (isClass (configFile >> "cfgVehicles" >> "vnx_b_air_ac119_02_01")) then {
	#include "..\MOD_content\Nickelsteel\gear\Vanilla_FIA.sqf"
};

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1, "balaclavas", 1, "argoFacemask", 1 , "facewearWS", 0.75, "facewearContact", 0.3, "facewearLawsOfWar", 0.5, "facewearGM", 0.3, "facewearCLSA", 0.2,"facewearSOG", 0.3,"facewearSPE", 0.2]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1, "balaclavas", 1, "argoFacemask", 1 , "facewearWS", 0.75, "facewearContact", 0.3, "facewearLawsOfWar", 0.5, "facewearGM", 0.3, "facewearCLSA", 0.2, "facewearSOG", 0.3,"facewearSPE", 0.2]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;