//////////////////////////
//   Side Information   //
//////////////////////////

["name", "USMC"] call _fnc_saveToTemplate;
["spawnMarkerName", "USMC support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesBasic", ["cwr3_b_usmc_m151"]];
_vehiclesData set ["vehiclesLightUnarmed", ["cwr3_b_usmc_hmmwv","cwr3_b_usmc_hmmwv_transport"]];
_vehiclesData set ["vehiclesLightArmed", ["cwr3_b_usmc_hmmwv_m2"]];
_vehiclesData set ["vehiclesTrucks", ["cwr3_b_usmc_m939"]];
_vehiclesData set ["vehiclesCargoTrucks", ["cwr3_b_usmc_m939_open"]];
_vehiclesData set ["vehiclesAmmoTrucks", ["cwr3_b_usmc_m939_reammo"]];
_vehiclesData set ["vehiclesRepairTrucks", ["cwr3_b_usmc_m939_repair"]];
_vehiclesData set ["vehiclesFuelTrucks", ["cwr3_b_usmc_m939_refuel"]];
_vehiclesData set ["vehiclesMedical", ["cwr3_b_usmc_hmmwv_mev"]];
_vehiclesData set ["vehiclesLightAPCs", ["cwr3_b_usmc_lav25_hq", "cwr3_b_usmc_aav"]];
_vehiclesData set ["vehiclesAPCs", ["cwr3_b_usmc_lav25m240", "cwr3_b_usmc_lav25m240"]];            // mortar carrier: "CUP_B_M1129_MC_MK19_Woodland"
_vehiclesData set ["vehiclesIFVs", ["cwr3_b_m2a2", "cwr3_b_usmc_lav25m240"]];
_vehiclesData set ["vehiclesTanks", ["cwr3_b_usmc_m60a3", "cwr3_b_usmc_m1"]];
_vehiclesData set ["vehiclesAA", ["cwr3_b_usmc_m163"]];
_vehiclesData set ["vehiclesAirborne", ["cwr3_b_usmc_lav25_hq", "cwr3_b_usmc_lav25m240"]];
_vehiclesData set ["vehiclesLightTanks",  ["cwr3_b_usmc_aav", "cwr3_b_usmc_lav25m240"]];

_vehiclesData set ["vehiclesTransportBoats", ["cwr3_b_zodiac"]];
_vehiclesData set ["vehiclesGunBoats", ["cwr3_b_boat"]];
_vehiclesData set ["vehiclesAmphibious", []];

_vehiclesData set ["vehiclesPlanesCAS", ["cwr3_b_usmc_av8b"]];
_vehiclesData set ["vehiclesPlanesAA", ["cwr3_b_usmc_f4s"]];
_vehiclesData set ["vehiclesPlanesTransport", ["cwr3_b_usmc_c130"]];

_vehiclesData set ["vehiclesHelisLight", ["cwr3_b_usmc_uh1"]];
_vehiclesData set ["vehiclesHelisTransport", ["cwr3_b_usmc_ch53e", "cwr3_b_usmc_ch53e_viv"]];
_vehiclesData set ["vehiclesHelisLightAttack", ["cwr3_b_usmc_uh1_armed", "cwr3_b_usmc_uh1_gunship"]];
_vehiclesData set ["vehiclesHelisAttack", ["cwr3_b_usmc_ah1f"]];

_vehiclesData set ["vehiclesArtillery", ["cwr3_b_m270_he"]];
["magazines", createHashMapFromArray [["cwr3_b_m270_he", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

_vehiclesData set ["uavsAttack", []];
_vehiclesData set ["uavsPortable", []];



_vehiclesData set ["vehiclesPolice", ["cwr3_c_cj5_police"]];

_vehiclesData set ["staticMGs", ["CUP_B_M2StaticMG_US"]];
_vehiclesData set ["staticAT", ["cwr3_b_tow"]];
_vehiclesData set ["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]];
_vehiclesData set ["staticMortars", ["cwr3_b_m252"]];
_vehiclesData set ["staticHowitzers", ["cwr3_b_m119"]];

_vehiclesData set ["vehicleRadar", "B_Radar_System_01_F"];
_vehiclesData set ["vehicleSam", "B_SAM_System_03_F"];

_vehiclesData set ["howitzerMagazineHE", "CUP_30Rnd_105mmHE_M119_M"];

_vehiclesData set ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"];
_vehiclesData set ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"];
_vehiclesData set ["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"];

_vehiclesData set ["minefieldAT", ["CUP_Mine"]];
_vehiclesData set ["minefieldAPERS", ["APERSMine"]];

private _eliteVehiclesData = _vehiclesData call _fnc_copyLoadoutData;
private _militaryVehiclesData = _vehiclesData call _fnc_copyLoadoutData;
private _militiaVehiclesData = _vehiclesData call _fnc_copyLoadoutData;

_militiaVehiclesData set ["vehiclesLightArmed", ["cwr3_b_usmc_m151_m2"]];
_militiaVehiclesData set ["vehiclesTrucks", ["cwr3_b_usmc_m939_open"]];
_militiaVehiclesData set ["vehiclesLightUnarmed", ["cwr3_b_usmc_m151"]];
_militiaVehiclesData set ["vehiclesAPCs", ["cwr3_b_m113a1"]];

["vehiclesData", [
    _militiaVehiclesData,
    _militaryVehiclesData,
    _eliteVehiclesData
]] call _fnc_saveVehiclesToTemplate;


#include "CWR_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["Barklem","GreekHead_A3_05","GreekHead_A3_06",
"GreekHead_A3_09","Sturrock","WhiteHead_02","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_09","WhiteHead_10",
"WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;

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
_loadoutData set ["lightATLaunchers", [
	["cwr3_launch_m72a3", "", "", "",[], [], ""], 
	["cwr3_launch_at4", "", "", "",["cwr3_at4_heat_m"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["cwr3_launch_redeye", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["cwr3_launch_carlgustaf", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M", "CUP_MAAWS_HEAT_M"], [], ""],
	["cwr3_launch_m67_rcl", "", "", "", ["cwr3_m67_rcl_heat_m"], [], ""]
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
_loadoutData set ["NVGs", ["CUP_NVG_PVS7"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Binocular"]];

_loadoutData set ["traitorUniforms", ["cwr3_b_uniform_m81_woodland_early"]];
_loadoutData set ["traitorVests", ["cwr3_b_vest_alice_officer"]];
_loadoutData set ["traitorHats", ["cwr3_b_headgear_cap_m81_woodland_early"]];

_loadoutData set ["officerUniforms", ["cwr3_b_uniform_m81_woodland"]];
_loadoutData set ["officerVests", ["cwr3_b_vest_pasgt_alice_woodland_officer"]];
_loadoutData set ["officerHats", ["cwr3_b_headgear_cap_m81_woodland"]];

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
_loadoutData set ["longRangeRadios", ["cwr3_b_backpack_radio"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["cwr3_b_headgear_cap_m81_woodland"]];
_loadoutData set ["sniHats", ["cwr3_b_headgear_cap_m81_woodland"]];
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
private _sfmmItems = ["CUP_NVG_PVS7"];

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
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["cwr3_b_uniform_pilot_black"]];
_sfLoadoutData set ["vests", ["cwr3_b_vest_pasgt_lbv_black"]];
_sfLoadoutData set ["mgVests", ["cwr3_b_vest_pasgt_lbv_alice_black"]];
_sfLoadoutData set ["medVests", ["cwr3_b_vest_pasgt_lbv_alice_black"]];
_sfLoadoutData set ["glVests", ["cwr3_b_vest_pasgt_lbv_alice_black"]];
_sfLoadoutData set ["backpacks", ["cwr3_b_backpack_alice_black", "cwr3_b_backpack_alice_specop_black"]];
_sfLoadoutData set ["slBackpacks", ["cwr3_b_backpack_alice_specop_black"]];
_sfLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice_specop_black"]];
_sfLoadoutData set ["helmets", ["cwr3_b_headgear_pasgt_m81_woodland_scrim"]];
_sfLoadoutData set ["slHat", ["cwr3_b_headgear_cap_m81_woodland"]];
_sfLoadoutData set ["sniHats", ["cwr3_b_headgear_boonie_m81_woodland"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_PVS7"]];
_sfLoadoutData set ["binoculars", ["Binocular"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["cwr3_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["cwr3_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["cwr3_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_Colt727_M203", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_M249_E1", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["cwr3_launch_m72a3", "", "", "",[], [], ""], 
	["cwr3_launch_at4", "", "", "",["cwr3_at4_heat_m"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["cwr3_b_uniform_m81_woodland", "cwr3_b_uniform_m81_woodland_rolled_gloves"]];
_eliteLoadoutData set ["slUniforms", ["cwr3_b_uniform_m81_woodland_rolled"]];
_eliteLoadoutData set ["vests", ["cwr3_b_vest_pasgt_alice_rifleman_mc"]];
_eliteLoadoutData set ["mgVests", ["cwr3_b_vest_pasgt_alice_mg_mc", "cwr3_b_vest_pasgt_alice_ar_mc"]];
_eliteLoadoutData set ["medVests", ["cwr3_b_vest_pasgt_alice_medic_mc"]];
_eliteLoadoutData set ["slVests", ["cwr3_b_vest_pasgt_alice_officer_mc"]];
_eliteLoadoutData set ["glVests", ["cwr3_b_vest_pasgt_alice_grenadier_mc"]];
_eliteLoadoutData set ["engVests", ["cwr3_b_vest_pasgt_alice_etool_mc"]];
_eliteLoadoutData set ["backpacks", ["cwr3_b_backpack_alice"]];
_eliteLoadoutData set ["slBackpacks", ["cwr3_o_backpack_harness_roll"]];
_eliteLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice"]];
_eliteLoadoutData set ["helmets", ["cwr3_b_headgear_pasgt_m81_woodland_usmc", "cwr3_b_headgear_pasgt_m81_woodland_usmc_goggles"]];
_eliteLoadoutData set ["binoculars", ["Binocular"]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
	["cwr3_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
	["cwr3_arifle_xms", "", "", "cwr3_optic_xms_cross", ["CUP_30Rnd_556x45_Stanag"], [], ""],
	["cwr3_arifle_xms", "", "", "cwr3_optic_xms_dot", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A2_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Colt727_M203", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
	["cwr3_arifle_xms_m203", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_M249_E1", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_762x51_DMR"], [], ""],
    ["CUP_srifle_M14", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_eliteLoadoutData set ["lightATLaunchers", [
    ["cwr3_launch_m72a3", "", "", "",[], [], ""], 
	["cwr3_launch_at4", "", "", "",["cwr3_at4_heat_m"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["cwr3_b_uniform_rdf_usmc", "cwr3_b_uniform_rdf_rolled_usmc"]];
_militaryLoadoutData set ["slUniforms", ["cwr3_b_uniform_rdf_usmc"]];
_militaryLoadoutData set ["vests", ["cwr3_b_vest_flak_alice_rifleman_mc"]];
_militaryLoadoutData set ["mgVests", ["cwr3_b_vest_flak_alice_mg_mc"]];
_militaryLoadoutData set ["medVests", ["cwr3_b_vest_flak_alice_light_mc"]];
_militaryLoadoutData set ["slVests", ["cwr3_b_vest_flak_alice_officer_mc"]];
_militaryLoadoutData set ["glVests", ["cwr3_b_vest_flak_alice_grenadier_mc"]];
_militaryLoadoutData set ["engVests", ["cwr3_b_vest_flak_alice_etool_mc"]];
_militaryLoadoutData set ["backpacks", ["cwr3_b_backpack_alice"]];
_militaryLoadoutData set ["slBackpacks", ["cwr3_o_backpack_harness_roll"]];
_militaryLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice"]];
_militaryLoadoutData set ["helmets", ["cwr3_b_headgear_m1_m81_woodland_usmc", "cwr3_b_headgear_m1_goggles_m81_woodland_usmc"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["cwr3_arifle_xms", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
	["cwr3_arifle_xms", "", "", "cwr3_optic_xms_cross", ["CUP_30Rnd_556x45_Stanag"], [], ""],
	["cwr3_arifle_xms", "", "", "cwr3_optic_xms_dot", ["CUP_30Rnd_556x45_Stanag"], [], ""],
	["cwr3_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A2_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_Colt727_M203", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
	["cwr3_arifle_xms_m203", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1", "", "", "", ["CUP_30Rnd_45ACP_M3A1_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_M249_E1", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_762x51_DMR"], [], ""],
    ["CUP_srifle_M14", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["cwr3_launch_m72a3", "", "", "",[], [], ""], 
	["cwr3_launch_at4", "", "", "",["cwr3_at4_heat_m"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["cwr3_b_uniform_og107_usmc"]];
_policeLoadoutData set ["vests", ["cwr3_b_vest_alice_crew"]];
_policeLoadoutData set ["helmets", ["cwr3_b_headgear_cap_m81_usmc_olive"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_smg_M3A1", "", "", "", ["CUP_30Rnd_45ACP_M3A1_M"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
	["CUP_smg_M3A1", "", "", "", ["CUP_30Rnd_45ACP_M3A1_M"], [], ""],
    ["cwr3_arifle_xms", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""],
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["cwr3_b_uniform_og107_usmc"]];
_militiaLoadoutData set ["vests", ["cwr3_b_vest_alice", "cwr3_b_vest_alice_medic", "cwr3_b_vest_alice_etool"]];
_militiaLoadoutData set ["sniVests", ["cwr3_b_vest_alice_light"]];
_militiaLoadoutData set ["backpacks", ["cwr3_b_backpack_alice"]];
_militiaLoadoutData set ["slBackpacks", ["cwr3_o_backpack_harness_roll"]];
_militiaLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice"]];
_militiaLoadoutData set ["helmets", ["cwr3_b_headgear_cap_m81_usmc_olive", "cwr3_b_headgear_m1_mitchell_usmc", "cwr3_b_headgear_cap_m81_usmc_olive", "cwr3_b_headgear_m1_mitchell_usmc", "cwr3_b_headgear_m1_goggles_mitchell_usmc"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M16A1", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""],
	["CUP_arifle_XM16E1", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""],
    ["CUP_arifle_M16A1E1", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["cwr3_arifle_xms", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""],
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_20Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A1GL", "", "", "", ["CUP_20Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M16A1E1GL", "", "", "", ["CUP_20Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1", "", "", "", ["CUP_30Rnd_45ACP_M3A1_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M60", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
	["cwr3_lmg_m60e3", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M60E4_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M14", "", "", "", ["CUP_20Rnd_762x51_DMR"], [], ""],
	["CUP_srifle_M21", "", "", "", ["CUP_20Rnd_762x51_DMR"], [], ""],
	["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_762x51_DMR"], [], ""],
    ["CUP_srifle_M14", "", "", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["cwr3_launch_m72a3", "", "", "",[], [], ""], 
	["cwr3_launch_at4", "", "", "",["cwr3_at4_heat_m"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911",7], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["cwr3_b_uniform_m81_woodland_usmc"]];
_crewLoadoutData set ["vests", ["cwr3_b_vest_flak_alice_crew_mc"]];
_crewLoadoutData set ["helmets", ["cwr3_b_headgear_cvc","cwr3_b_headgear_cvc_goggles"]];
_crewLoadoutData set ["carbines", [
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["cwr3_b_uniform_pilot"]];
_pilotLoadoutData set ["vests", ["cwr3_b_vest_pilot"]];
_pilotLoadoutData set ["helmets", ["cwr3_b_headgear_pilot"]];
_pilotLoadoutData set ["carbines", [
    ["cwr3_arifle_xm177e2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
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