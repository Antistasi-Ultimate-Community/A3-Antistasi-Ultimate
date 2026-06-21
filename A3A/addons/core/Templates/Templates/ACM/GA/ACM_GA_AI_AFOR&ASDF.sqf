private _hasQAV = "@QAV - Challenger 2" in (getLoadedModsInfo apply {_x select 1});

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ASDFxAFOR"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "AAF"]] call _fnc_saveToTemplate;

["flag", "flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "x\A3A\addons\core\Templates\Templates\ACM\flags\flag_afor&asdf_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_afor"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

_vehiclesBasic = [];
_vehiclesLightUnarmed = ["acm_gm_aaf2028_afor_ge_wheeled_Fennek_MRAP"];
_vehiclesLightArmed = [
    "acm_gm_aaf2028_afor_ge_wheeled_Fennek_MRAP_GMG", "acm_gm_aaf2028_afor_ge_wheeled_Fennek_MRAP_HMG",
    "acm_gm_aaf2028_afor_us_wheeled_fuchsa0_command", "acm_gm_aaf2028_afor_ge_wheeled_fuchsa0_engineer", "acm_gm_aaf2028_afor_ge_wheeled_fuchsa0_recon"
];
_vehiclesTrucks = ["acm_gm_aaf2028_afor_ge_wheeled_kat1_451_cargo"];
_vehiclesCargoTrucks = ["acm_gm_aaf2028_afor_ge_wheeled_kat1_451_cargo"];
_vehiclesAmmoTrucks = ["acm_gm_aaf2028_afor_ge_wheeled_kat1_454_reammo", "acm_gm_aaf2028_afor_ge_wheeled_kat1_451_reammo"];
_vehiclesRepairTrucks = ["acm_gm_aaf2028_afor_ge_wheeled_fuchsa0_engineer"];
_vehiclesFuelTrucks = ["acm_gm_aaf2028_afor_ge_wheeled_kat1_451_refuel"];
_vehiclesMedical = ["acm_gm_aaf2028_afor_dk_tracked_m113a1dk_medic", "acm_gm_aaf2028_afor_ge_wheeled_fuchsa0_medic"];
_vehiclesTanks = ["acm_gm_aaf2028_afor_ge_tracked_leopard2a4R"];
if (_hasQAV) then { _vehiclesTanks pushBack "acm_gm_aaf2028_afor_gb_tracked_qav_challenger2" };
_vehiclesAA = ["acm_gm_aaf2028_asdf_tracked_Gepard"]; // from ASDF
_vehiclesLightAPCs = ["acm_gm_aaf2028_afor_us_wheeled_fuchsa0_command", "acm_gm_aaf2028_afor_ge_wheeled_fuchsa0_engineer", "acm_gm_aaf2028_afor_ge_wheeled_fuchsa0_recon", "acm_gm_aaf2028_afor_ge_wheeled_fuchsa1_jammer"];
_vehiclesAPCs = [
    "acm_gm_aaf2028_afor_dk_tracked_m113a1DK_apc", "acm_gm_aaf2028_afor_dk_tracked_m113a1dk_command", "acm_gm_aaf2028_afor_dk_tracked_m113a1dk_engineer",
    "acm_gm_aaf2028_afor_ge_tracked_m113a1g_apc", "acm_gm_aaf2028_afor_ge_tracked_m113a1g_apc_milan"
];
_vehiclesIFVs = ["acm_gm_aaf2028_afor_dk_tracked_m113a2dk", "acm_gm_aaf2028_afor_ge_tracked_marder1a2"];
_vehiclesAirborne = _vehiclesLightUnarmed + _vehiclesLightArmed;
_vehiclesLightTanks = ["acm_gm_aaf2028_afor_dk_tracked_bpz2a0"];
_vehiclesTransportBoats = ["acm_gm_aaf2028_asdf_boat_transport"]; // from ASDF
_vehiclesGunBoats = ["acm_gm_aaf2028_asdf_boat_armed_minigun"]; // from ASDF
_vehiclesAmphibious = _vehiclesLightUnarmed + _vehiclesLightArmed + _vehiclesLightAPCs + _vehiclesAPCs;
_vehiclesPlanesCAS = ["acm_gm_aaf2028_asdf_Plane_Gripen"]; // from ASDF
_vehiclesPlanesAA = ["acm_gm_aaf2028_asdf_Plane_Gripen"]; // from ASDF
_vehiclesPlanesTransport = ["acm_gm_aaf2028_asdf_plane_l410s", "acm_gm_aaf2028_asdf_plane_l410t"]; // from ASDF
_vehiclesHelisLight = ["acm_gm_aaf2028_afor_us_heli_UH80"];
_vehiclesHelisTransport = ["acm_gm_aaf2028_afor_ge_heli_ch53gs", "acm_gm_aaf2028_afor_us_heli_UH80"];
_vehiclesHelisAttack = ["acm_gm_aaf2028_afor_ge_heli_bo105p_pah1a1"];
_vehiclesHelisLightAttack = ["acm_gm_aaf2028_afor_ge_heli_bo105p_pah1a1"];
_vehiclesArtillery = ["acm_gm_aaf2028_afor_ge_wheeled_kat1_463_mlrs", "acm_gm_aaf2028_afor_dk_tracked_m109", "acm_gm_aaf2028_afor_ge_tracked_m113a1g_apc_mortar"];
_magazines = [
    ["acm_gm_aaf2028_afor_ge_wheeled_kat1_463_mlrs",["gm_36Rnd_mlrs_110mm_he_dm21","gm_36Rnd_mlrs_110mm_icm_dm602","gm_36Rnd_mlrs_110mm_mine_dm711"]],
    ["acm_gm_aaf2028_afor_dk_tracked_m109",["gm_20Rnd_155mm_he_m107","gm_20Rnd_155mm_he_m795","gm_20Rnd_155mm_he_dm21","gm_20Rnd_155mm_he_dm111","gm_20Rnd_155mm_icm_dm602"]],
    ["acm_gm_aaf2028_afor_ge_tracked_m113a1g_apc_mortar", ["gm_40Rnd_120mm_he_dm51","gm_10Rnd_120mm_illum_dm26","gm_10Rnd_120mm_smoke_dm25"]]
];
_uavsAttack = ["acm_gm_aaf2028_afor_us_plane_MQ4A"];
_uavsPortable = [];

// * Militia, police, and static vehicles provided kindly by the ASDF lol
_vehiclesMilitiaLightArmed = ["acm_gm_aaf2028_asdf_wheeled_Hunter_HMG"];
_vehiclesMilitiaTrucks = ["acm_gm_aaf2028_asdf_wheeled_u1300l_cargo", "acm_gm_aaf2028_asdf_wheeled_kat1_451_cargo"];
_vehiclesMilitiaCars = ["acm_gm_aaf2028_asdf_wheeled_Hunter", "acm_gm_aaf2028_asdf_wheeled_Iltis_cargo"];
_vehiclesMilitiaAPCs = ["acm_gm_aaf2028_asdf_wheeled_btr60pu12", "acm_gm_aaf2028_asdf_wheeled_fuchsa_command", "acm_gm_aaf2028_asdf_wheeled_fuchsa_engineer", "acm_gm_aaf2028_asdf_wheeled_fuchsa_recon"];
_vehiclesPolice = ["acm_gm_aaf2028_apd_wheeled_offroad", "acm_gm_aaf2028_apd_wheeled_offroad_comms", "acm_gm_aaf2028_apd_wheeled_offroad_covered", "acm_gm_aaf2028_apd_heli_bo105m_vbh"];
_staticMGs = ["acm_gm_aaf2028_asdf_Turret_HMG_High_02", "acm_gm_aaf2028_asdf_Turret_MG3_Tripod"];
_staticAT = ["acm_gm_aaf2028_asdf_Turret_Milan_Tripod", "acm_gm_aaf2028_asdf_Turret_Titan_AT"];
_staticAA = ["acm_gm_aaf2028_asdf_Turret_Titan_AA"];
_staticMortars = ["acm_gm_aaf2028_asdf_Turret_Mortar_01"];
_staticHowitzers = [];
_vehicleRadar = [];
_vehicleSAM = [];
_howitzerMagazineHE = [];
_mortarMagazineHE = ["8Rnd_82mm_Mo_shells"];
_mortarMagazineSmoke = ["8Rnd_82mm_Mo_Smoke_white"];
_mortarMagazineFlare = ["8Rnd_82mm_Mo_Flare_white"];

["vehiclesBasic", _vehiclesBasic] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesTrucks", _vehiclesTrucks] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", _vehiclesCargoTrucks] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _vehiclesAmmoTrucks] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", _vehiclesRepairTrucks] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", _vehiclesFuelTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate;
["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;

["vehiclesLightAPCs", _vehiclesLightAPCs] call _fnc_saveToTemplate;
["vehiclesAPCs", _vehiclesAPCs] call _fnc_saveToTemplate;
["vehiclesIFVs", _vehiclesIFVs] call _fnc_saveToTemplate;

["vehiclesAirborne", _vehiclesAirborne] call _fnc_saveToTemplate;
["vehiclesLightTanks",  _vehiclesLightTanks] call _fnc_saveToTemplate;


["vehiclesTransportBoats", _vehiclesTransportBoats] call _fnc_saveToTemplate;
["vehiclesGunBoats", _vehiclesGunBoats] call _fnc_saveToTemplate;
["vehiclesAmphibious", _vehiclesAmphibious] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", _vehiclesPlanesTransport] call _fnc_saveToTemplate;

["vehiclesHelisLight", _vehiclesHelisLight] call _fnc_saveToTemplate;
["vehiclesHelisTransport", _vehiclesHelisTransport] call _fnc_saveToTemplate;
["vehiclesHelisAttack", _vehiclesHelisAttack] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", _vehiclesHelisLightAttack] call _fnc_saveToTemplate;

["vehiclesArtillery", _vehiclesArtillery] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray _magazines] call _fnc_saveToTemplate;

["uavsAttack", _uavsAttack] call _fnc_saveToTemplate;
["uavsPortable", _uavsPortable] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", _vehiclesMilitiaLightArmed] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", _vehiclesMilitiaTrucks] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", _vehiclesMilitiaCars] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", _vehiclesMilitiaAPCs] call _fnc_saveToTemplate;

["vehiclesPolice", _vehiclesPolice] call _fnc_saveToTemplate;

["staticMGs", _staticMGs] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["staticHowitzers", _staticHowitzers] call _fnc_saveToTemplate;

["vehicleRadar", _vehicleRadar] call _fnc_saveToTemplate;
["vehicleSam", _vehicleSAM] call _fnc_saveToTemplate;

["howitzerMagazineHE", _howitzerMagazineHE] call _fnc_saveToTemplate;
["mortarMagazineHE", _mortarMagazineHE] call _fnc_saveToTemplate;
["mortarMagazineSmoke", _mortarMagazineSmoke] call _fnc_saveToTemplate;
["mortarMagazineFlare", _mortarMagazineFlare] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["gm_minestatic_at_dm21", "gm_minestatic_at_dm1233"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["gm_minestatic_ap_dm31"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

private _facesASDF = [
    "GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06", "GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "GreekHead_A3_11",
    "GreekHead_A3_12", "GreekHead_A3_13", "GreekHead_A3_14", "Ioannou", "Mavros", "GreekHead_A3_10_l", "GreekHead_A3_10_sa", "GreekHead_A3_10_a"
];
["milFaces", _facesASDF] call _fnc_saveToTemplate;
["polFaces", _facesASDF] call _fnc_saveToTemplate;
["milVoices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;
["polVoices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

private _facesAFOR = [
    "gm_face_whiteHead_01","gm_face_whiteHead_02", "WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04", "WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
    "WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14", "WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"
];
["faces", _facesAFOR] call _fnc_saveToTemplate;
["eliteFaces", _facesAFOR] call _fnc_saveToTemplate;
["sfFaces", _facesAFOR] call _fnc_saveToTemplate;
["voices", ["gm_voice_male_deu_05","gm_voice_male_deu_06","gm_voice_male_deu_07", "gm_voice_male_deu_01","gm_voice_male_deu_02"]] call _fnc_saveToTemplate;
["eliteVoices", ["gm_voice_male_deu_05","gm_voice_male_deu_06","gm_voice_male_deu_07", "gm_voice_male_deu_01","gm_voice_male_deu_02"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;

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

_loadoutData set ["lightATLaunchers", ["gm_m72a3_oli"]];
_loadoutData set ["ATLaunchers", [
    ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""]
]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", [
    ["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["gm_mine_at_dm21", "gm_mine_at_dm1233"]];
_loadoutData set ["APMines", ["gm_mine_ap_dm31"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["gm_explosive_petn_charge"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["gm_handgrenade_frag_dm51", "gm_handgrenade_frag_dm51a1"]];
_loadoutData set ["smokeGrenades", ["gm_smokeshell_wht_dm25"]];
_loadoutData set ["signalsmokeGrenades", ["gm_smokeshell_grn_dm21", "gm_smokeshell_red_dm23", "gm_smokeshell_yel_dm26", "gm_smokeshell_org_dm32"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["gm_watch_kosei_80"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["gm_df7x40_blk", "gm_ferod16_des", "gm_ferod16_oli"]];
_loadoutData set ["rangefinders", ["gm_lp7_oli", "gm_lpr1_oli"]];

_loadoutData set ["traitorUniforms", ["acm_gm_aaf2028_clothes_1_5", "acm_gm_aaf2028_clothes_1_6"]];
_loadoutData set ["traitorVests", []];
_loadoutData set ["traitorHats", []];

_loadoutData set ["officerUniforms", ["acm_gm_aaf2028_clothes_1_4"]];
_loadoutData set ["officerVests", ["acm_gm_aaf2028_vest_msv_mk2_e_1"]];
_loadoutData set ["officerHats", ["acm_gm_aaf2028_Beret", "acm_gm_aaf2028_Beret_MP", "acm_gm_aaf2028_Beret_UN"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["medBackpacks", []];
_loadoutData set ["glBackpacks", []];
_loadoutData set ["mgBackpacks", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
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
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["gm_repairkit_01", "MineDetector"];
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

// * US Special Forces
private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["U_tweed_acu_summer_ocp_crye_trop", "U_tweed_acu_summer_ocp_crye_jedi", "U_tweed_acu_summer_ocp_crye_knee", "U_tweed_acu_summer_ocp_crye_knee_jedi", "U_tweed_acu_summer_ocp_crye_knee_trop"]];
_sfLoadoutData set ["vests", ["V_tweed_msv_mk2_cell_1", "V_tweed_msv_mk2_cell_2"]];
_sfLoadoutData set ["slVests", ["V_tweed_msv_mk2_45_2", "V_tweed_msv_mk2_cell_45_2", "V_tweed_msv_mk2_45_1", "V_tweed_msv_mk2_cell_45_1"]];
_sfLoadoutData set ["medVests", ["V_tweed_msv_mk2_2"]];
_sfLoadoutData set ["mgVests", ["V_tweed_msv_mk2_240", "V_tweed_msv_mk2_249"]];
_sfLoadoutData set ["glVests", ["V_tweed_msv_mk2_4cm_1", "V_tweed_msv_mk2_4cm_2", "V_tweed_msv_mk2_cell_4cm_1"]];
_sfLoadoutData set ["backpacks", ["B_simc_US_Molle_sturm_OCP", "B_simc_US_Molle_sturm_OCP_thermos_OCP", "B_simc_US_Molle_sturm_OCP_etool"]];
_sfLoadoutData set ["medBackpacks", ["B_simc_US_Molle_asspack_OCP"]];
_sfLoadoutData set ["atBackpacks", ["B_simc_US_Molle_asspack_OCP"]];
_sfLoadoutData set ["mgBackpacks", ["B_simc_US_Molle_asspack_OCP"]];
_sfLoadoutData set ["slBackpacks", ["B_simc_US_Molle_sturm_OCP_RTO", "B_simc_US_Molle_sturm_OCP_RTO_wasser"]];
_sfLoadoutData set ["longRangeRadios", ["B_simc_US_Molle_sturm_OCP_RTO", "B_simc_US_Molle_sturm_OCP_RTO_wasser"]];
_sfLoadoutData set ["helmets", ["H_tweed_ihps_tasc_scrim_rail", "H_tweed_ihps_g_tasc_rail"]];
_sfLoadoutData set ["binoculars", ["gm_lp7_oli", "gm_lpr1_oli"]];
_sfLoadoutData set ["glasses", ["G_LEN_TG1_blauw", "G_tweed_tacticool_blauw", "G_tweed_tacticool_blauw_comba", "G_tweed_tacticool_blauw_nomex", "G_tweed_tacticool_blauw_oak"]];
_sfLoadoutData set ["goggles", ["G_tweed_ESS_tan"]];
_sfLoadoutData set ["NVGs", ["psq42_od3"]];
_sfLoadoutData set ["binoculars", ["Laserdesignator"]];
_sfLoadoutData set ["rangefinders", ["Rangefinder"]];

_sfLoadoutData set ["SMGs", [
    ["SMG_01_F", "muzzle_snds_acp", "", "optic_Holosight", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Red"], [], ""],
    ["SMG_01_F", "muzzle_snds_acp", "", "optic_Aco_smg", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Red"], [], ""],
    ["SMG_03_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
    ["SMG_03C_camo", "muzzle_snds_570", "", "", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
    ["SMG_03_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
    ["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Holosight_blk_F", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
    ["SMG_03C_TR_camo", "muzzle_snds_570", "acc_pointer_IR", "optic_Aco_smg", ["50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03","50Rnd_570x28_SMG_03"], [], ""],
    ["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Red"], [], ""],
    ["SMG_02_F", "muzzle_snds_L", "acc_pointer_IR", "optic_Aco_smg", ["30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["srifle_GM6_F", "", "", "optic_SOS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
    ["srifle_GM6_F", "", "", "optic_LRPS", ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], ""],
    ["srifle_LRR_F", "", "", "optic_SOS", ["7Rnd_408_Mag","7Rnd_408_Mag"], [], ""],
    ["srifle_LRR_F", "", "", "optic_LRPS", ["7Rnd_408_Mag","7Rnd_408_Mag"], [], ""],
    ["srifle_LRR_camo_F", "", "", "optic_SOS", ["7Rnd_408_Mag","7Rnd_408_Mag"], [], ""],
    ["srifle_LRR_camo_F", "", "", "optic_LRPS", ["7Rnd_408_Mag","7Rnd_408_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["hgun_Pistol_heavy_01_F", "muzzle_snds_acp", "acc_flashlight_pistol", "optic_MRD", ["11Rnd_45ACP_Mag"], [], ""],
    ["hgun_ACPC2_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", ["9Rnd_45ACP_Mag"], [], ""]
]];
_sfLoadoutData set ["slRifles", [
    ["arifle_MX_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MX_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MX_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""],
    ["arifle_MX_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["UGL_FlareWhite_F", "UGL_FlareWhite_F", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["arifle_MX_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MX_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["arifle_MXC_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MXC_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["arifle_MX_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_MX_GL_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
    ["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_NVS", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
    ["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
    ["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
    ["LMG_Mk200_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
    ["arifle_MX_SW_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MX_SW_F", "muzzle_snds_H", "acc_pointer_IR", "optic_NVS", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MX_SW_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Holosight", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], ""],
    ["arifle_MX_SW_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["arifle_MXM_F", "muzzle_snds_H", "acc_pointer_IR", "optic_SOS", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
    ["arifle_MXM_F", "muzzle_snds_H", "acc_pointer_IR", "optic_NVS", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
    ["arifle_MXM_F", "muzzle_snds_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], [], "bipod_01_F_snd"],
    ["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_SOS", ["20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
    ["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_NVS", ["20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
    ["srifle_EBR_F", "muzzle_snds_B", "acc_pointer_IR", "optic_Hamr", ["20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"], [], "bipod_01_F_snd"]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
    ["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
    ["launch_MRAWS_sand_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
    ["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
    ["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
    ["launch_MRAWS_sand_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
    ["launch_NLAW_F","","","",["NLAW_F"],[],""]
]];
_sfLoadoutData set ["missileATLaunchers", [
    ["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
    ["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

// * German Forces
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["gm_ge_uniform_soldier_90_trp", "gm_ge_uniform_soldier_rolled_90_trp", "gm_ge_uniform_soldier_tshirt_90_trp", "gm_ge_army_uniform_crew_90_trp"]];
_eliteLoadoutData set ["vests", ["acm_gm_aaf2028_afor_ge_vest_CarrierRigKBT_01_light", "acm_gm_aaf2028_afor_ge_vest_CarrierRigKBT_01"]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_simc_US_Molle_asspack_OCP_thermos_od3", "gm_ge_army_backpack_90_trp"]];
_eliteLoadoutData set ["longRangeRadios", ["gm_ge_backpack_sem35_oli"]];
_eliteLoadoutData set ["helmets", ["gm_ge_headgear_m92_trp", "gm_ge_headgear_m92_glasses_trp"]];
_eliteLoadoutData set ["slHats", ["gm_ge_headgear_beret_crew_blk_armor"]];
_eliteLoadoutData set ["goggles", ["G_tweed_ESS_tan"]];
_eliteLoadoutData set ["glasses", ["G_tweed_peltor", "G_tweed_tacticool_oranje_peltor_oak", "G_tweed_tacticool_oranje_peltor"]];
_eliteLoadoutData set ["NVGs", ["NVGoggles"]];

_eliteLoadoutData set ["slRifles", [
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "optic_DMS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""],
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""],
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""],
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""],
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""],
    ["arifle_SPAR_02_snd_F", "", "acc_pointer_IR", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["arifle_SPAR_01_snd_F", "", "", "optic_Holosight", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""],
    ["arifle_SPAR_01_snd_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["arifle_SPAR_01_GL_snd_F", "", "acc_pointer_IR", "optic_Arco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["arifle_SPAR_01_GL_snd_F", "", "acc_pointer_IR", "optic_Holosight", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand_red"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["hgun_PDW2000_F", "", "", "optic_Holosight_smg_blk_F", ["30Rnd_9x21_Mag"], [], ""],
    ["hgun_PDW2000_F", "", "", "optic_Aco", ["30Rnd_9x21_Mag"], [], ""],
    ["hgun_PDW2000_F", "", "", "", ["30Rnd_9x21_Mag"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["LMG_Mk200_F", "", "", "optic_MRCO", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"],
    ["LMG_Mk200_F", "", "", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Red", "200Rnd_65x39_cased_Box_Tracer_Red"], [], "bipod_01_F_snd"]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["arifle_SPAR_03_snd_F", "", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"]
]];
_eliteLoadoutData set ["sidearms", [
    ["hgun_Pistol_heavy_01_F", "", "acc_flashlight_pistol", "optic_MRD", ["11Rnd_45ACP_Mag"], [], ""],
    ["hgun_P07_F", "muzzle_snds_L", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", [
    ["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm12_pzf3", "gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
    ["launch_NLAW_F","","","",["NLAW_F"],[],""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
    ["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

// * Danish Forces
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["acm_gm_aaf2028_afor_clothes_1_1"]];
_militaryLoadoutData set ["vests", ["acm_gm_aaf2028_afor_dk_vest_iotv_mk4_e_2", "acm_gm_aaf2028_afor_dk_vest_iotv_mk4_1", "acm_gm_aaf2028_afor_dk_vest_iotv_mk4_3", "acm_gm_aaf2028_afor_dk_vest_iotv_mk4_cell_1"]];
_militaryLoadoutData set ["slVests", ["acm_gm_aaf2028_afor_dk_vest_iotv_mk4_cell_45_2"]];
_militaryLoadoutData set ["medVests", ["acm_gm_aaf2028_afor_dk_vest_iotv_mk4_2"]];
_militaryLoadoutData set ["mgVests", ["acm_gm_aaf2028_afor_dk_vest_iotv_mk4_m249"]];
_militaryLoadoutData set ["glVests", ["acm_gm_aaf2028_afor_dk_vest_iotv_mk4_4cm_2"]];
_militaryLoadoutData set ["backpacks", ["B_Kitbag_rgr", "B_simc_US_Molle_asspack_OCP_thermos_od3", "gm_dk_army_backpack_73_oli"]];
_militaryLoadoutData set ["slBackpacks", ["gm_ge_backpack_sem35_oli"]];
_militaryLoadoutData set ["longRangeRadios", ["gm_ge_backpack_sem35_oli"]];
_militaryLoadoutData set ["medBackpacks", ["gm_ge_army_backpack_medic_80_base"]];
_militaryLoadoutData set ["helmets", ["acm_gm_aaf2028_afor_dk_m96", "acm_gm_aaf2028_Virtus_Helmet", "acm_gm_aaf2028_Virtus_Helmet"]];
_militaryLoadoutData set ["glasses", ["G_tweed_tacticool_blauw_peltor_oak", "G_tweed_peltor", "G_tweed_tacticool_weiss"]];
_militaryLoadoutData set ["NVGs", ["NVGoggles_OPFOR"]];

_militaryLoadoutData set ["slRifles", [
    ["gm_gvm95_blk", "", "", "optic_Hamr", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["gm_gvm95_blk", "", "", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["gm_gvm95_blk", "", "", "gm_c79a1_blk", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["arifle_SPAR_01_blk_F", "", "", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["arifle_SPAR_01_blk_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["arifle_SPAR_01_GL_blk_F", "", "", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["arifle_SPAR_01_GL_blk_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["hgun_PDW2000_F", "", "", "optic_Holosight_smg_blk_F", ["30Rnd_9x21_Mag"], [], ""],
    ["hgun_PDW2000_F", "", "", "optic_Aco", ["30Rnd_9x21_Mag"], [], ""],
    ["hgun_PDW2000_F", "", "", "", ["30Rnd_9x21_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn", "gm_120Rnd_762x51mm_B_T_DM21_mg3_grn"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["arifle_SPAR_03_blk_F", "", "acc_pointer_IR", "optic_DMS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_snd"],
    ["gm_msg90a1_blk", "", "", "gm_zf10x42_stanaghk_blk", ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk"], [], "gm_msg90_bipod_blk"],
    ["gm_g3sg1_blk", "", "", "gm_feroz24_stanagClaw_blk", ["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], "gm_g3_bipod_blk"]
]];
_militaryLoadoutData set ["sidearms", [
    ["hgun_Pistol_heavy_01_F", "", "", "", ["11Rnd_45ACP_Mag"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["gm_m72a3_oli"]];
_militaryLoadoutData set ["ATLaunchers", [
    ["launch_MRAWS_green_F", "", "", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""]
]];
_militaryLoadoutData set ["missileATLaunchers", [
    ["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_militaryLoadoutData set ["AALaunchers", [
    ["launch_B_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

// * Altis PD
private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["acm_gm_aaf2028_pol_clothes_1_1"]];
_policeLoadoutData set ["vests", ["gm_ge_vest_sov_armor_80_blk", "gm_ge_vest_sov_armor_80_blk", "gm_ge_vest_sov_80_blk", "V_Rangemaster_belt", "gm_ge_bgs_vest_80_rifleman"]];
_policeLoadoutData set ["helmets", ["H_MilCap_Blue", "H_HeadSet_black_F", "H_Cap_police"]];

_policeLoadoutData set ["SMGandShotguns", [
    ["gm_mp5n_surefire_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_mp5n_surefire_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""],
    ["gm_hk512_ris_wud", "", "", "optic_ACO_grn", ["gm_7rnd_12ga_hk512_pellet", "gm_7rnd_12ga_hk512_slug"], [], ""],
    ["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03"], [], ""]
]];
_policeLoadoutData set ["Rifles", [
    ["gm_m16a2_blk", "", "", "gm_colt4x20_ar15_blk", ["gm_30Rnd_556x45mm_B_M855_stanag_gry"], [], ""],
    ["gm_m16a2_blk", "", "", "gm_colt4x20_ar15_blk", ["gm_30Rnd_556x45mm_B_M855_stanag_gry"], [], ""],
    ["gm_psg1_blk", "", "", "gm_zf6x42_psg1_stanag_blk", ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["gm_m49_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk", "gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

// * Altis & Stratis Defense Forces
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["acm_gm_aaf2028_clothes_1_3", "acm_gm_aaf2028_clothes_1_1", "acm_gm_aaf2028_clothes_1_2"]];
_militiaLoadoutData set ["vests", ["acm_gm_aaf2028_vest_msv_mk2_1", "acm_gm_aaf2028_vest_msv_mk2_2", "acm_gm_aaf2028_vest_msv_mk2_cell_1", "acm_gm_aaf2028_vest_msv_mk2_3", "acm_gm_aaf2028_vest_msv_mk2_cell_2"]];
_militiaLoadoutData set ["slVests", ["acm_gm_aaf2028_vest_msv_mk2_cell_45_2", "acm_gm_aaf2028_vest_msv_mk2_45_1", "acm_gm_aaf2028_vest_msv_mk2_45_2"]];
_militiaLoadoutData set ["medVests", ["acm_gm_aaf2028_vest_msv_mk2_2"]];
_militiaLoadoutData set ["mgVests", ["acm_gm_aaf2028_vest_msv_mk2_240"]];
_militiaLoadoutData set ["glVests", ["acm_gm_aaf2028_vest_msv_mk2_4cm_1"]];
_militiaLoadoutData set ["backpacks", ["B_tweed_pack_camel_thermos_ocp", "acm_gm_aaf2028_backpack_Molle_Sturm", "acm_gm_aaf2028_backpack_90_1_1", "acm_gm_aaf2028_backpack_Molle_Sturm_thermos", "B_tweed_pack_wasser_molle_od7", "B_simc_US_Molle_asspack_OCP_thermos_OCP"]];
_militiaLoadoutData set ["slBackpacks", ["acm_gm_aaf2028_backpack_Molle_Sturm_RTO"]];
_militiaLoadoutData set ["longRangeRadios", ["acm_gm_aaf2028_backpack_Molle_Sturm_RTO"]];
_militiaLoadoutData set ["medBackpacks", ["B_simc_pack_56"]];
_militiaLoadoutData set ["helmets", ["acm_gm_aaf2028_pasgt_1_2", "acm_gm_aaf2028_pasgt_1_3", "acm_gm_aaf2028_pasgt_1_4"]];
_militiaLoadoutData set ["glasses", ["G_tweed_tacticool_peltor_oak", "G_tweed_tacticool_weiss_comba", "G_tweed_tacticool_oranje_peltor_comba", "G_tweed_tacticool_weiss_peltor_oak"]];
_militiaLoadoutData set ["NVGs", ["NVGoggles_OPFOR"]];

_militiaLoadoutData set ["slRifles", [
    ["gm_hk33a3_blk", "", "gm_colt4x20_stanagClaw_blk", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], "gm_g3_bipod_blk"]
]];
_militiaLoadoutData set ["rifles", [
    ["gm_hk33a2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], "gm_g3_bipod_blk"]
]];
_militiaLoadoutData set ["carbines", [
    ["gm_hk33ka3_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""],
    ["gm_hk33ka2_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["gm_mp5n_surefire_blk", "", "", "", ["gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM11_mp5a3_blk", "gm_30Rnd_9x19mm_B_DM51_mp5a3_blk"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["gm_mg8a2_blk", "", "", "", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21_mg8_oli", "gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["gm_g3a4a1_ris_blk", "", "acc_pointer_IR", "optic_DMS", ["gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk"], [], "bipod_03_F_blk"],
    ["gm_hk33sg1_blk", "", "", "gm_diavari_da_stanagClaw_blk", ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_T_DM21_hk33_blk"], [], "gm_g3_bipod_blk"]
]];
_militiaLoadoutData set ["sidearms", [
    ["hgun_ACPC2_F", "", "", "", ["9Rnd_45ACP_Mag"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", ["gm_m72a3_oli"]];
_militiaLoadoutData set ["ATLaunchers", [
    ["launch_MRAWS_green_rail_F", "", "", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""]
]];
_militiaLoadoutData set ["missileATLaunchers", [
    ["launch_B_Titan_short_F", "", "acc_pointer_IR", "", ["Titan_AT"], [], ""]
]];
_militiaLoadoutData set ["AALaunchers", [
    ["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["acm_gm_aaf2028_clothes_3_1", "acm_gm_aaf2028_clothes_3_2"]];
_crewLoadoutData set ["vests", ["acm_gm_aaf2028_afor_dk_vest_iotv_mk4_e_2"]];
_crewLoadoutData set ["helmets", ["H_Simc_CVC_G", "H_Simc_CVC"]];
_crewLoadoutData set ["backpacks", [""]];
_crewLoadoutData set ["carbines", [
	["hgun_PDW2000_F", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
    ["arifle_SPAR_01_blk_F", "", "", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["gm_ge_army_uniform_pilot_oli", "acm_gm_aaf2028_afor_ge_vest_CarrierRigKBT_01"]];
_pilotLoadoutData set ["vests", ["gm_ge_vest_sov_80_oli"]];
_pilotLoadoutData set ["helmets", ["gm_ge_headgear_sph4_oli"]];
_pilotLoadoutData set ["backpacks", ["B_LegStrapBag_olive_F", ""]];
_pilotLoadoutData set ["carbines", [
	["hgun_PDW2000_F", "", "", "", ["30Rnd_9x21_Mag"], [], ""],
    ["hgun_Pistol_heavy_01_F", "", "", "", ["11Rnd_45ACP_Mag"], [], ""]
]];	




/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["slBackpacks","backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

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
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
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
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["glBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


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
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["mgBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["radios"] call _fnc_addRadio;
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
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;;
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
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGandShotguns"] call _fnc_setPrimary;
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
    ["radios"] call _fnc_addRadio;
};

private _policeSLTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["Rifles"] call _fnc_setPrimary;
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
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
