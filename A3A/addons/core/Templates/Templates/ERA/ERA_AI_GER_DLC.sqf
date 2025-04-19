//////////////////////////
//   Side Information   //
//////////////////////////

["name", "GerAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "GerAF Support Corridor"] call _fnc_saveToTemplate;

["flag", "BWA3_Flag_Germany"] call _fnc_saveToTemplate;
["flagTexture", "bwa3_common\data\bwa3_flag_germany_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Germany"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Weaponcrate_MP40_GER"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["gm_ge_army_k125", "BWA3_Eagle_Fleck"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_FENNEK_GER_Wdl", "gm_ge_army_iltis_cargo", "gm_ge_army_typ1200_cargo", "gm_ge_army_typ253_cargo", "gm_ge_army_typ253_mp", 
    "gm_ge_army_typ247_cargo", "gm_ge_army_typ247_firefighter", "gm_ge_bgs_w123_cargo", "gm_ge_bgs_typ253_cargo", "gm_ge_army_w123_cargo"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["gm_ge_army_iltis_milan", "gm_ge_army_iltis_mg3", "gm_ge_army_iltis_mg3", "gm_ge_army_luchsa1", "gm_ge_army_luchsa2",
	"BWA3_Dingo2_FLW200_GMW_CG13_Fleck", "BWA3_Dingo2_FLW200_M2_CG13_Fleck", "BWA3_Dingo2_FLW100_MG3_CG13_Fleck", "BWA3_Eagle_FLW100_Fleck"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["gm_ge_army_u1300l_cargo", "gm_ge_army_u1300l_container", "gm_ge_army_kat1_451_cargo", "gm_ge_army_kat1_451_container"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["gm_ge_army_kat1_454_cargo", "gm_ge_army_u1300l_container", "gm_ge_army_kat1_452_container", "gm_ge_army_kat1_451_container"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["gm_ge_army_kat1_454_reammo", "gm_ge_army_kat1_451_reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["gm_ge_army_u1300l_repair", "gm_ge_army_bpz2a0", "gm_ge_army_fuchsa0_engineer", "gm_dk_army_m113a1dk_engineer"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["gm_ge_army_kat1_451_refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["gm_ge_army_u1300l_medic", "gm_ge_army_m113a1g_medic"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["gm_dk_army_m113a2dk", "gm_ge_army_Leopard1a1", "gm_ge_army_Leopard1a1a1", "gm_ge_army_Leopard1a1a2", "gm_ge_army_Leopard1a3", "gm_ge_army_Leopard1a3a1", "gm_ge_army_Leopard1a5", 
    "gm_dk_army_Leopard1a3"]] call _fnc_saveToTemplate;
["vehiclesAA", ["gm_ge_army_gepard1a1", "SPE_ST_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["gm_ge_army_fuchsa0_command", "gm_ge_army_fuchsa0_reconnaissance"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["gm_ge_army_m113a1g_apc_milan", "gm_dk_army_m113a1dk_apc", "gm_ge_army_m113a1g_apc", "gm_ge_army_m113a1g_command", "BWA3_Puma_Fleck"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["gm_ge_army_marder1a1plus", "gm_ge_army_marder1a1a", "gm_ge_army_marder1a2", "BWA3_Puma_Fleck", 
    "BWA3_Puma_Fleck"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["gm_ge_army_fuchsa0_command", "gm_ge_army_fuchsa0_reconnaissance"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["gm_ge_army_marder1a1plus", "gm_ge_army_marder1a1a", "gm_ge_army_marder1a2", "BWA3_Puma_Fleck", 
    "BWA3_Puma_Fleck"]] call _fnc_saveToTemplate;

private _vehiclesTransportBoats = ["I_G_Boat_Transport_01_F"];
private _vehiclesGunBoats = ["CUP_B_RHIB_USMC"];
["vehiclesAmphibious", ["gm_ge_army_luchsa1", "gm_ge_army_luchsa2", "gm_ge_army_m113a1g_apc_milan","gm_ge_army_m113a1g_apc", "gm_ge_army_m113a1g_command",
    "gm_ge_army_fuchsa0_command", "gm_ge_army_fuchsa0_reconnaissance"]] call _fnc_saveToTemplate;


if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_c_Vehicles_Boats_c")) then {
    _vehiclesTransportBoats = ["SPEX_LCVP"];
	_vehiclesGunBoats = ["SPEX_LCVP"];
};
["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["SPE_FW190F8"];
private _vehiclesPlanesLargeCAS = [];
private _vehiclesPlanesAA = ["SPE_FW190F8","CUP_B_F35B_USMC"];
private _vehiclesPlanesTransport = ["gm_ge_airforce_do28d2"];

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS append ["sab_fl_bf109g"];
	_vehiclesPlanesLargeCAS append ["sab_fl_ju88a","sab_fl_ju86"];
	_vehiclesPlanesAA append ["sab_fl_bf109e","sab_fl_bf109f","sab_fl_bf109g","sab_fl_bf109k","sab_fl_fw190a","sab_fl_fw190d"];
	_vehiclesPlanesTransport append ["sab_fl_ju52"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
    _vehiclesPlanesCAS append ["sab_sw_bf110"];
	_vehiclesPlanesLargeCAS append ["sab_sw_he111","sab_sw_he177"];
	_vehiclesPlanesAA append ["sab_sw_me262","sab_sw_bf110"];
};

if (isClass (configfile >> "CfgPatches" >> "Tornado_AWS")) then {
    _vehiclesPlanesCAS append ["Tornado_AWS_camo_ger"];
    _vehiclesPlanesAA append ["Tornado_AWS_GER"];
};

if (isClass (configFile >> "CfgPatches" >> "WW2_SPEX_Assets_m_Vehicles_Planes_m")) then {
    _vehiclesPlanesTransport append ["SPEX_C47_Skytrain"];
};
if (isClass (configFile >> "CfgPatches" >> "JK_US_Air_F_DC3")) then {
    _vehiclesPlanesTransport append ["JK_B_C47_F"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _vehiclesPlanesLargeCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["gm_ge_army_bo105m_vbh", "gm_ge_army_bo105p1m_vbh", "gm_ge_army_bo105p1m_vbh_swooper", "BWA3_NH90_TTH_Fleck"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["gm_ge_army_ch53gs", "gm_ge_army_ch53g", "BWA3_NH90_TTH_M3M_Fleck", "CUP_B_UH1D_GER_KSK", "CUP_B_UH1D_slick_GER_KSK", "CUP_B_AW159_Unarmed_GER", "CUP_B_CH53E_GER"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CUP_B_AH64_DL_USA"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["gm_ge_army_bo105p_pah1", "gm_ge_army_bo105p_pah1a1", "BWA3_Tiger_Gunpod_FZ", "BWA3_Tiger_Gunpod_Heavy", "BWA3_Tiger_Gunpod_PARS", "CUP_B_UH1D_armed_GER_KSK", "CUP_B_UH1D_gunship_GER_KSK", "CUP_B_AW159_GER"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SPE_leFH18","gm_ge_army_kat1_463_mlrs", "gm_ge_army_m109g", "gm_dk_army_m109", "BWA3_Panzerhaubitze2000_Tropen"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
	["SPE_leFH18", ["SPE_20x_Shell_105L28_Gr38_HE"]],
	["gm_ge_army_kat1_463_mlrs",["gm_36Rnd_mlrs_110mm_he_dm21","gm_36Rnd_mlrs_110mm_icm_dm602","gm_36Rnd_mlrs_110mm_mine_dm711"]],
    ["gm_ge_army_m109g",["gm_20Rnd_155mm_he_dm21","gm_20Rnd_155mm_he_dm111","gm_20Rnd_155mm_icm_dm602","gm_20Rnd_155mm_he_m107","gm_20Rnd_155mm_he_m795"]],
    ["gm_dk_army_m109",["gm_20Rnd_155mm_he_m107","gm_20Rnd_155mm_he_m795","gm_20Rnd_155mm_he_dm21","gm_20Rnd_155mm_he_dm111","gm_20Rnd_155mm_icm_dm602"]],
	["BWA3_Panzerhaubitze2000_Tropen", ["BWA3_32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SPE_ST_R200_MG34","SPE_ST_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPE_OpelBlitz","SPE_SdKfz250_1"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPE_ST_R200_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SPE_PzKpfwIII_N", "SPE_PzKpfwIII_M", "SPE_PzKpfwIII_L", "SPE_StuG_III_G_Early", "SPE_StuG_III_G_Late", "SPE_StuG_III_G_SKB", "SPE_StuH_42", "SPE_PzKpfwVI_H1", "SPE_PzKpfwV_G", "SPE_PzKpfwIV_G", "SPE_Jagdpanther_G1"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_ST_GER_R200_Hood"]] call _fnc_saveToTemplate;

["staticMGs", ["gm_ge_army_mg3_aatripod", "CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["gm_ge_army_milan_launcher_tripod", "SPE_leFH18_AT", "SPE_Pak40", "BWA3_MELLS_static_Fleck"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FlaK_30", "SPE_FlaK_38", "CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;
["staticMortars", ["SPE_GrW278_1"]] call _fnc_saveToTemplate;
["staticHowitzers", ["SPE_leFH18"]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "SPE_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;
["mortarMagazineHE", "SPE_8Rnd_81mm_FA_Mle_1932_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8Rnd_81mm_FA_Mle_1932_Smoke"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_TMI_42_MINE","gm_minestatic_at_dm21", "gm_minestatic_at_dm1233", "BWA3_DM31AT", "BWA3_AT2"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_SMI_35_Pressure_MINE", "SPE_SMI_35_MINE", "gm_minestatic_ap_dm31"]] call _fnc_saveToTemplate;


#include "ERA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["gm_face_whiteHead_01","gm_face_whiteHead_02","LivonianHead_6","SPE_boyartsev","SPE_bykov","SPE_Connors","SPE_DAgostino","SPE_Davidson","SPE_Elliot","SPE_Grishka","SPE_Hauptmann","SPE_Klimakov","SPE_Krueger","SPE_Kuzmin","SPE_Neumann","SPE_Oberst","SPE_OBrien","SPE_Vasiliev","SPE_Walter","SPE_Wolf","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["SPE_Male01GER", "SPE_Male02GER","gm_voice_male_deu_05","gm_voice_male_deu_06","gm_voice_male_deu_07", "gm_voice_male_deu_01","gm_voice_male_deu_02"]] call _fnc_saveToTemplate;


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

_loadoutData set ["ATMines", ["SPE_TMI_42_MINE_mag", "gm_mine_at_dm21", "gm_mine_at_dm1233", "BWA3_DM31AT_Mag"]];
_loadoutData set ["APMines", ["SPE_SMI_35_Pressure_MINE_mag", "gm_mine_ap_dm31"]];
_loadoutData set ["lightExplosives", ["SPE_Ladung_Small_MINE_mag", "DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SPE_Ladung_Big_MINE_mag", "gm_explosive_petn_charge"]];

_loadoutData set ["antiInfantryGrenades", ["SPE_Shg24", "SPE_M39", "gm_handgrenade_frag_dm51", "gm_handgrenade_frag_dm51a1", "BWA3_DM51A1"]];
_loadoutData set ["antiTankGrenades", ["SPE_Shg24x7"]];
_loadoutData set ["smokeGrenades", ["SPE_NB39", "gm_smokeshell_wht_dm25", "BWA3_DM25"]];
_loadoutData set ["signalsmokeGrenades", ["BWA3_DM32_Yellow", "BWA3_DM32_Red", "BWA3_DM32_Purple", "BWA3_DM32_Orange", "BWA3_DM32_Green", "BWA3_DM32_Blue", "SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue", "gm_smokeshell_grn_dm21", "gm_smokeshell_red_dm23", "gm_smokeshell_yel_dm26", "gm_smokeshell_org_dm32"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_GER_ItemWatch", "gm_watch_kosei_80"]];
_loadoutData set ["compasses", ["SPE_GER_ItemCompass_deg", "SPE_GER_ItemCompass", "gm_ge_army_conat2"]];
_loadoutData set ["radios", ["TFAR_SCR536","ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS7"]];
_loadoutData set ["binoculars", ["SPE_Binocular_GER","gm_df7x40_blk", "gm_ferod16_des", "gm_ferod16_oli", "gm_ferod16_win"]];
_loadoutData set ["rangefinders", ["SPE_Binocular_GER","Rangefinder"]];

_loadoutData set ["traitorUniforms", ["gm_ge_uniform_soldier_90_flk"]];
_loadoutData set ["traitorVests", ["gm_ge_vest_armor_90_leader_flk"]];
_loadoutData set ["traitorHats", ["gm_ge_headgear_hat_boonie_flk"]];

_loadoutData set ["officerUniforms", ["gm_ge_uniform_soldier_90_flk"]];
_loadoutData set ["officerVests", ["gm_ge_vest_armor_90_officer_flk"]];
_loadoutData set ["officerHats", ["gm_ge_headgear_beret_grn_infantry"]];

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
_sfLoadoutData set ["uniforms", ["BWA3_Uniform2_Fleck", "BWA3_Uniform2_sleeves_Fleck"]];
_sfLoadoutData set ["vests", ["BWA3_Vest_JPC_Rifleman_Fleck", "BWA3_Vest_JPC_Radioman_Fleck"]];
_sfLoadoutData set ["slVests", ["BWA3_Vest_JPC_Leader_Fleck"]];
_sfLoadoutData set ["helmets", ["BWA3_CrewmanKSK_Fleck", "BWA3_CrewmanKSK_Fleck_Headset", "H_Shemag_olive_hs"]];
_sfLoadoutData set ["slHat", ["BWA3_Beret_Falli"]];
_sfLoadoutData set ["sniHats", ["BWA3_Beret_Falli"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_sfLoadoutData set ["slRifles", [
["BWA3_G27", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], [], ""],
["BWA3_G38", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G27_AG40", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G38_AG40", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
["BWA3_G36A3", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G36A3", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G27", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], [], ""],
["BWA3_G27", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], [], ""],
["BWA3_G38", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G38", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["BWA3_G36KA4", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G36KA4", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G38K", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""],
["BWA3_G38K", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["BWA3_G36A3_AG40", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G36A3_AG40", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G27_AG40", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G27_AG40", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G38_AG40", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G38_AG40", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_AP", "BWA3_30Rnd_556x45_G36_SD"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["BWA3_MG4", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG4", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30_MicroT2", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG4", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG4", "BWA3_muzzle_snds_Rotex_IIIC", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG5", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], ""],
["BWA3_MG5", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30_MicroT2", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], ""],
["BWA3_MG5", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], ""],
["BWA3_MG5", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech_Mag_Off", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["BWA3_G28", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser", "BWA3_optic_PMII_ShortdotCC", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], [], "BWA3_bipod_Harris"],
["BWA3_G28", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser", "BWA3_optic_PMII_DMR", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], [], "BWA3_bipod_Harris"],
["BWA3_G28", "BWA3_muzzle_snds_Rotex_IIA", "BWA3_acc_VarioRay_irlaser", "BWA3_optic_PMII_DMR_MicroT1_rear", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_SD"], [], "BWA3_bipod_Harris"]
]];
_sfLoadoutData set ["sniperRifles", [
["BWA3_G29", "BWA3_muzzle_snds_Rotex_Monoblock", "BWA3_acc_LLM01_irlaser_tan", "BWA3_optic_M5Xi_Tremor3", ["BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29_Tracer"], [], "BWA3_bipod_Harris"],
["BWA3_G29", "BWA3_muzzle_snds_Rotex_Monoblock", "BWA3_acc_LLM01_irlaser_tan", "BWA3_optic_M5Xi_MSR", ["BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29_Tracer"], [], "BWA3_bipod_Harris"],
["BWA3_G82", "", "", "BWA3_optic_Hensoldt", ["BWA3_10Rnd_127x99_G82_AP", "BWA3_10Rnd_127x99_G82_AP", "BWA3_10Rnd_127x99_G82_AP_Tracer"], [], ""],
["BWA3_G82", "", "", "BWA3_optic_Hensoldt", ["BWA3_10Rnd_127x99_G82_Raufoss"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["BWA3_P12", "BWA3_muzzle_snds_Impuls_IIA", "BWA3_acc_LLMPI_irlaser", "", [], [], ""],
["BWA3_P12", "BWA3_muzzle_snds_Impuls_IIA", "BWA3_acc_LLMPI_irlaser", "", [], [], ""],
["BWA3_P8", "", "BWA3_acc_LLMPI_irlaser", "", [], [], ""]
]]; 	
_sfLoadoutData set ["lightATLaunchers", [
["BWA3_CarlGustav", "", "", "", ["BWA3_CarlGustav_HE", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HE"], [], ""],
["BWA3_CarlGustav", "", "", "BWA3_optic_CarlGustav", ["BWA3_CarlGustav_HE", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "BWA3_optic_CarlGustav", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "BWA3_optic_CarlGustav", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HE"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
["BWA3_PzF3_Tandem_Loaded", "", "", "", [""], [], ""],
["BWA3_PzF3_Tandem_Loaded", "", "", "", [""], [], ""],
["BWA3_RGW90_Loaded", "", "", "", [""], [], ""],
["BWA3_Bunkerfaust_Loaded", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
["BWA3_Fliegerfaust", "", "", "", ["BWA3_Fliegerfaust_Mag"], [], ""]
]];	
	
/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["vests", ["BWA3_Vest_Fleck", "BWA3_Vest_Rifleman_Fleck"]];
_eliteLoadoutData set ["slVests", ["BWA3_Vest_Leader_Fleck"]];
_eliteLoadoutData set ["glVests", ["BWA3_Vest_Grenadier_Fleck"]];
_eliteLoadoutData set ["mgVests", ["BWA3_Vest_MachineGunner_Fleck"]];
_eliteLoadoutData set ["medVests", ["BWA3_Vest_Medic_Fleck"]];
_eliteLoadoutData set ["helmets", ["BWA3_OpsCore_Fleck", "BWA3_OpsCore_Fleck_Camera", "BWA3_OpsCore_Fleck_Patch"]];
_eliteLoadoutData set ["slHat", ["BWA3_Beret_Pz"]];
_eliteLoadoutData set ["sniHats", ["BWA3_OpsCore_Fleck"]];
_eliteLoadoutData set ["binoculars", ["Laserdesignator_03"]];

_eliteLoadoutData set ["slRifles", [
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30_MicroT2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G27", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28_Tracer"], [], ""],
["BWA3_G38", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36A3_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30_MicroT2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G27_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G38_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36A3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G27", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28_Tracer"], [], ""],
["BWA3_G27", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28_Tracer"], [], ""],
["BWA3_G38", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G38", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["BWA3_G36KA3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36KA3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36KA3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G36KA3", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G38K", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""],
["BWA3_G38K", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
["BWA3_MP7", "", "BWA3_acc_VarioRay_irlaser_black", "", ["BWA3_20Rnd_46x30_MP7"], [], ""],
["BWA3_MP7", "", "BWA3_acc_VarioRay_irlaser_black", "", ["BWA3_20Rnd_46x30_MP7"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["BWA3_G36A3_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G36A3_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G36A3_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G36A3_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G27_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G27_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28", "BWA3_20Rnd_762x51_G28_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G38_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_EOTech", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
["BWA3_G38_AG40", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_CompM2", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["BWA3_MG4", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i_MicroT2", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG4", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30_MicroT2", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG4", "", "BWA3_acc_VarioRay_irlaser_black", "BWA3_optic_ZO4x30i", ["BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45", "BWA3_200Rnd_556x45_Tracer"], [], ""],
["BWA3_MG3", "", "BWA3_acc_VarioRay_irlaser_black", "", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], "BWA3_bipod_MG3"],
["BWA3_MG3", "", "BWA3_acc_VarioRay_irlaser_black", "", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], "BWA3_bipod_MG3"],
["BWA3_MG3", "", "BWA3_acc_VarioRay_irlaser_black", "", ["BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51", "BWA3_120Rnd_762x51_Tracer"], [], "BWA3_bipod_MG3"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["BWA3_G28", "", "BWA3_acc_VarioRay_irlaser", "BWA3_optic_PMII_ShortdotCC", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_Tracer"], [], "BWA3_bipod_Harris"],
["BWA3_G28", "", "BWA3_acc_VarioRay_irlaser", "BWA3_optic_PMII_DMR", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_Tracer"], [], "BWA3_bipod_Harris"],
["BWA3_G28", "", "BWA3_acc_VarioRay_irlaser", "BWA3_optic_PMII_DMR_MicroT1_rear", ["BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_AP", "BWA3_20Rnd_762x51_G28_Tracer"], [], "BWA3_bipod_Harris"]
]]; 		
_eliteLoadoutData set ["sniperRifles", [
["BWA3_G29", "", "BWA3_acc_LLM01_irlaser_tan", "BWA3_optic_M5Xi_Tremor3", ["BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29_Tracer"], [], "BWA3_bipod_Harris"],
["BWA3_G29", "", "BWA3_acc_LLM01_irlaser_tan", "BWA3_optic_M5Xi_MSR", ["BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29", "BWA3_10Rnd_86x70_G29_Tracer"], [], "BWA3_bipod_Harris"],
["BWA3_G82", "", "", "BWA3_optic_Hensoldt", ["BWA3_10Rnd_127x99_G82_AP", "BWA3_10Rnd_127x99_G82_AP", "BWA3_10Rnd_127x99_G82_AP_Tracer"], [], ""],
["BWA3_G82", "", "", "BWA3_optic_Hensoldt", ["BWA3_10Rnd_127x99_G82_Raufoss"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", [
["BWA3_CarlGustav", "", "", "", ["BWA3_CarlGustav_HE", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HE"], [], ""],
["BWA3_CarlGustav", "", "", "BWA3_optic_CarlGustav", ["BWA3_CarlGustav_HE", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "BWA3_optic_CarlGustav", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HEAT"], [], ""],
["BWA3_CarlGustav", "", "", "BWA3_optic_CarlGustav", ["BWA3_CarlGustav_HEDP", "BWA3_CarlGustav_HE"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
["BWA3_PzF3_Tandem_Loaded", "", "", "", [""], [], ""],
["BWA3_PzF3_Tandem_Loaded", "", "", "", [""], [], ""],
["BWA3_RGW90_Loaded", "", "", "", [""], [], ""],
["BWA3_Bunkerfaust_Loaded", "", "", "", [""], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
["BWA3_Fliegerfaust", "", "", "", ["BWA3_Fliegerfaust_Mag"], [], ""]
]];


		
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["gm_ge_uniform_soldier_90_flk", "gm_ge_uniform_soldier_rolled_90_flk"]];
_militaryLoadoutData set ["vests", ["gm_ge_vest_armor_90_flk", "gm_ge_vest_armor_90_rifleman_flk"]];
_militaryLoadoutData set ["slVests", ["gm_ge_vest_armor_90_leader_flk", "gm_ge_vest_armor_90_officer_flk"]];
_militaryLoadoutData set ["medVests", ["gm_ge_vest_armor_90_medic_flk"]];
_militaryLoadoutData set ["mgVests", ["gm_ge_vest_armor_90_machinegunner_flk"]];
_militaryLoadoutData set ["glVests", ["gm_ge_vest_armor_90_demolition_flk"]];
_militaryLoadoutData set ["backpacks", ["gm_ge_army_backpack_90_flk", "gm_dk_army_backpack_73_oli"]];
_militaryLoadoutData set ["helmets", ["gm_ge_headgear_m62", "gm_ge_headgear_m62_net", "gm_ge_headgear_m92_flk", "gm_ge_headgear_m92_glasses_flk"]];
_militaryLoadoutData set ["slHat", ["gm_ge_headgear_beret_grn_infantry"]];
_militaryLoadoutData set ["sniHats", ["gm_ge_headgear_hat_boonie_flk"]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryLoadoutData set ["slRifles", [
    ["gm_c7a1_blk", "", "", "gm_c79a1_blk", ["gm_30Rnd_556x45mm_B_M855_stanag_gry", "gm_30Rnd_556x45mm_B_T_M856_stanag_gry"], [], ""],
    ["gm_hk33a2_blk", "gm_bayonet_g3_blk", "", "gm_rv_stanagClaw_blk", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka2_blk", "", "", "gm_rv_stanagClaw_blk", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_sg542_blk", "", "", "gm_rv_stanagSig_blk", ["gm_20Rnd_762x51mm_B_T_DM21_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["gm_g3a3_blk", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk", "gm_1rnd_67mm_heat_dm22a1_g3"], [], ""],
    ["gm_sg542_blk", "", "", "", ["gm_20Rnd_762x51mm_B_T_DM21_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""],
    ["gm_hk33a2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_c7a1_blk", "", "", "gm_c79a1_blk", ["gm_30Rnd_556x45mm_B_M855_stanag_gry", "gm_30Rnd_556x45mm_B_T_M856_stanag_gry"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["gm_g3a4_blk", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], ""],
    ["gm_sg550_blk", "", "", "", ["gm_20Rnd_762x51mm_B_T_DM21_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""],
    ["gm_hk33a3_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka3_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_gvm75carb_oli", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell"], ["1Rnd_HE_Grenade_shell"], ""],
    ["gm_g3a3_blk", "", "", "", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], ["gm_1rnd_67mm_heat_dm22a1_g3"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM11_mp2_blk", "gm_32Rnd_9x19mm_B_DM51_mp2_blk", "gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
    ["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_sg551_blk", "", "", "", ["gm_20Rnd_762x51mm_B_T_DM21_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk", "gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_lmgm62_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""],
    ["gm_g8a2_blk", "", "", "", ["gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk", "gm_40Rnd_762x51mm_AP_DM151_g3_blk", "gm_40Rnd_762x51mm_B_DM111_g3_blk", "gm_40Rnd_762x51mm_B_DM41_g3_blk"], [], ""],
    ["gm_mg8a2_blk", "", "", "", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["gm_g3a3_dmr_blk", "", "acc_pointer_IR", "gm_feroz24_blk", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], "bipod_01_F_blk"],
    ["gm_msg90a1_blk", "", "", "gm_zf10x42_stanaghk_blk", ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk"], [], "gm_msg90_bipod_blk"],
    ["gm_g3sg1_blk", "", "", "gm_feroz24_stanagClaw_blk", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], "gm_g3_bipod_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_G22_wdl", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland_pip", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];
_militaryLoadoutData set ["sidearms", [
    ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p1_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk"], [], ""],
    ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""],
    ["gm_p2a1_blk", "", "", "", ["gm_1Rnd_265mm_flare_multi_red_gc", "gm_1Rnd_265mm_flare_single_red_gc", "gm_1Rnd_265mm_flare_single_wht_gc", "gm_1Rnd_265mm_flare_single_yel_DM10", "gm_1Rnd_265mm_flare_single_grn_DM11", "gm_1Rnd_265mm_flare_single_red_DM13", "gm_1Rnd_265mm_flare_single_wht_DM15", "gm_1Rnd_265mm_flare_para_yel_DM16", "gm_1Rnd_265mm_flare_multi_yel_DM20", "gm_1Rnd_265mm_flare_multi_grn_DM21", "gm_1Rnd_265mm_flare_multi_red_DM23", "gm_1Rnd_265mm_flare_multi_nbc_DM47", "gm_1Rnd_265mm_flare_multi_wht_DM25", "gm_1Rnd_265mm_smoke_single_blk_gc", "gm_1Rnd_265mm_smoke_single_blu_gc", "gm_1Rnd_265mm_smoke_single_yel_gc", "gm_1Rnd_265mm_smoke_single_yel_DM19", "gm_1Rnd_265mm_smoke_single_org_DM22", "gm_1Rnd_265mm_smoke_single_vlt_DM24", "gm_1Rnd_265mm_flare_single_grn_gc"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
	["gm_m72a3_oli", "", "", "", ["gm_1Rnd_66mm_heat_m72a3"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
	["gm_pzf44_2_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2"], [], ""]
]];
_militaryLoadoutData set ["missileATLaunchers", [
	["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""],
    ["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3", "gm_1Rnd_60mm_heat_dm12_pzf3"], [], ""]
]];
_militaryLoadoutData set ["AALaunchers", [
	["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["gm_ge_pol_uniform_suit_80_grn", "gm_ge_pol_uniform_blouse_80_blk"]];
_policeLoadoutData set ["vests", ["gm_ge_pol_vest_80_wht"]];
_policeLoadoutData set ["helmets", ["gm_ge_pol_headgear_cap_80_grn", "gm_ge_pol_headgear_cap_80_wht"]];

_policeLoadoutData set ["SMGs", [
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM11_mp2_blk", "gm_32Rnd_9x19mm_B_DM51_mp2_blk", "gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
    ["gm_mp5a2_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a3_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a4_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5a5_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p1_blk", "gm_8Rnd_9x19mm_B_DM11_p1_blk"], [], ""],
    ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_SPE_GER_Soldier_Boots","U_SPE_GER_Soldier_Boots_open","U_SPE_GER_Soldier_Boots_Rolled","U_SPE_GER_Soldier_Unbloused","U_SPE_GER_Gefreiter"]];
_militiaLoadoutData set ["slUniforms", ["U_SPE_GER_Unterofficer"]];
_militiaLoadoutData set ["vests", ["V_SPE_GER_VestKar98","V_SPE_GER_VestMP40","V_SPE_GER_VestG43","V_SPE_GER_SaniVest2"]];
_militiaLoadoutData set ["glVests", ["V_SPE_GER_VestSTG"]];
_militiaLoadoutData set ["Hvests", ["V_SPE_GER_VestUnterofficer"]];
_militiaLoadoutData set ["backpacks", ["B_SPE_GER_Tonister34_canvas","B_SPE_GER_Tonister41_Frame","B_SPE_GER_Tonister41_Frame_Full","B_SPE_GER_RPzB_Belt_bag_zelt","B_SPE_GER_RPzB_Belt_bag","B_SPE_GER_Pzf_Belt_bag_zelt","B_SPE_GER_Pzf_Belt_bag","B_SPE_GER_ammo_Belt_bag_zelt","B_SPE_GER_ammo_Belt_bag_alt","B_SPE_GER_ammo_Belt_bag","B_SPE_GER_A_frame_MGCan","B_SPE_GER_A_frame_MGCan_zelt"]];
_militiaLoadoutData set ["helmets", ["H_SPE_GER_Helmet","H_SPE_GER_Helmet","H_SPE_GER_Helmet","H_SPE_GER_Helmet_Glasses","H_SPE_GER_Helmet_net","H_SPE_GER_Helmet_ns","H_SPE_GER_Helmet_os","H_SPE_GER_Helmet_ns_wire"]];
_militiaLoadoutData set ["sniHats", ["H_SPE_GER_Cap"]];
_militiaLoadoutData set ["slHat", ["H_SPE_GER_Cap_Offz"]];
_militiaLoadoutData set ["binoculars", ["SPE_Binocular_GER"]];
_militiaLoadoutData set ["longRangeRadios", ["B_SPE_GER_Radio", "B_SPE_GER_Radio_battery"]];
_militiaLoadoutData set ["NVGs", []];

_militiaLoadoutData set ["rifles", [
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
    ["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];
		
_militiaLoadoutData set ["carbines", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""],
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]]; 

_militiaLoadoutData set ["grenadeLaunchers", [
	["SPE_K98", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""],
    ["SPE_K98_Late", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57"], ["SPE_1Rnd_G_SPRGR_30","SPE_1Rnd_G_PZGR_30","SPE_1Rnd_G_PZGR_40"], ""]
	]];
		
_militiaLoadoutData set ["SMGs", [
	["SPE_MP35", "", "", "", ["SPE_24Rnd_MP35_9x19", "SPE_24rnd_MP35_9x19_t"], [], ""],
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
	["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
	]];

_militiaLoadoutData set ["shotguns", [
	["SPE_K98", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_K98_Late", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""],
	["SPE_MP35", "", "", "", ["SPE_24Rnd_MP35_9x19", "SPE_24rnd_MP35_9x19_t"], [], ""],
    ["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""]
	]];

_militiaLoadoutData set ["machineGuns", [
	["SPE_MG34", "", "", "", ["SPE_50Rnd_792x57"], [], ""],
    ["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57"], [], ""]
	]];

_militiaLoadoutData set ["marksmanRifles", [
	["SPE_G43", "", "", "", ["SPE_10Rnd_792x57","SPE_10Rnd_792x57_T2","SPE_10Rnd_792x57_T"], [], ""]
	]];

_militiaLoadoutData set ["sniperRifles", [
	["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57","SPE_5Rnd_792x57_t"], [], ""]
	]];

_militiaLoadoutData set ["sidearms", [
	["SPE_P08", "", "", "", ["SPE_8Rnd_9x19_P08"], [], ""]
	]];
	
_militiaLoadoutData set ["lightATLaunchers", ["SPE_PzFaust_60m", "SPE_PzFaust_30m", "SPE_Faustpatrone"]];
_militiaLoadoutData set ["ATLaunchers", [
["SPE_RPzB_43", "", "", "",["SPE_1Rnd_RPzBGr_4322"], [], ""],
["SPE_RPzB_54", "", "", "",["SPE_1Rnd_RPzBGr_4322"], [], ""]
]];
_militiaLoadoutData set ["missileATLaunchers", []];
_militiaLoadoutData set ["AALaunchers", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["BWA3_Uniform_Crew_Fleck"]];
_crewLoadoutData set ["helmets", ["BWA3_CrewmanKSK_Tropen_Fleck"]];
_crewLoadoutData set ["carbines", [
["BWA3_G38K_tan", "", "", "BWA3_optic_EOTech_sand", ["BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36", "BWA3_30Rnd_556x45_G36_Tracer"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["BWA3_Uniform_Helipilot"]];
_pilotLoadoutData set ["helmets", ["BWA3_TopOwl_nvg", "BWA3_Knighthelm"]];
_pilotLoadoutData set ["carbines", [
["BWA3_MP7", "", "", "", ["BWA3_40Rnd_46x30_MP7", "BWA3_40Rnd_46x30_MP7", "BWA3_40Rnd_46x30_MP7"], [], ""]
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
