//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Android"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Higher Society Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\Android\images\flag_android_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_ascension_android"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SSV_Vehicle_Android_Ifrit", "OPTRE_M411_APC_UNSC"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["OPTRE_M12_LRV_CMA", "OPTRE_M12_LRV_DME"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["OPTRE_m1015_mule_cma", "OPTRE_m1015_mule_cover_cma"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_m1015_mule_cma", "OPTRE_m1015_mule_cover_cma"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["OPTRE_m1015_mule_ammo_cma"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["OPTRE_m1015_mule_repair_cma"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["OPTRE_m1015_mule_fuel_cma"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SSV_Vehicle_Android_Ifrit", "OPTRE_M12_FAV_APC_MED_CMA"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["OPTRE_M12_TD_CMA", "OPTRE_M12_FAV_APC_CMA"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["SSV_Vehicle_Android_APC", "SSV_Vehicle_Android_Tank"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SSV_Vehicle_Android_APC"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["OPTRE_M413_MGS_UNSC", "OPTRE_M412_IFV_UNSC"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_M808B_CMA"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SSV_Vehicle_Android_Tank", "OPTRE_M808BM_CMA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_M12R_AA_CMA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["optre_catfish_cma_unarmed_f"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["optre_catfish_cma_mg_f"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["SSV_Vehicle_Android_APC_Ruined"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["SSV_Vehicle_Android_VTOL_Infantry"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["OPTRE_UNSC_falcon_PD"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["OPTRE_Pelican_unarmed_PD"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["OPTRE_CMA_hornet", "OPTRE_CMA_falcon"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["OPTRE_Pelican_armed_CMA"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["OPTRE_M875_SPH_CMA"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["OPTRE_M875_SPH_CMA",["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["OPTRE_Wombat_B_CMA", "OPTRE_Wombat_CMA"]] call _fnc_saveToTemplate;
["uavsPortable", ["SSV_Drone_Cargo_Metro"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["OPTRE_M12_LRV_PD"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["OPTRE_m1015_mule_cover_cma"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SSV_Vehicle_Android_Ifrit"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SSV_Vehicle_Android_APC", "OPTRE_M12_FAV_APC_PD"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_M12_FAV_PD"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_Static_M247H_Tripod"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_FG75_CMA"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;
["staticHowitzers", [""]] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["SSV_android_face_01","SSV_android_face_02","SSV_android_face_03"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGB","Male02ENGB","Male03ENGB","Male04ENGB","Male05ENGB"]] call _fnc_saveToTemplate;

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
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_Thermal"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_SALH", "OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["OPTRE_M9_Frag"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["JMSJEFF_NVChip"]];
_loadoutData set ["binoculars", ["OPTRE_Binoculars"]];
_loadoutData set ["rangefinders", ["OPTRE_Smartfinder"]];

_loadoutData set ["traitorUniforms", ["JMSJEFF_uniformJ3_S_black1_F_CombatUniform"]];
_loadoutData set ["traitorVests", ["SSV_Vest_Android_Military", "V_RebreatherB"]];
_loadoutData set ["traitorHats", ["SSV_Helmet_Android_Assassin"]];

_loadoutData set ["officerUniforms", ["JMSJEFF_uniformJ3_base_F_CombatUniform", "JMSJEFF_uniformJ13_black_F_CombatUniform"]];
_loadoutData set ["officerVests", ["SSV_Vest_Android_Military", "SSV_Vest_Android_Military_Heavy"]];
_loadoutData set ["officerHats", ["SSV_Helmet_Android_Miner"]];

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
_loadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["JMSJEFF_Mariner_F_black_helmet", "JMSJEFF_Jeff_R4_helmet"]];
_loadoutData set ["sniHats", ["JMSJEFF_Jeff_spec_helmet"]];

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
_sfLoadoutData set ["uniforms", ["G3Gorka_Black_CombatUniform_EPSM", "WAR_Combat_Uniform_Gloft_Black"]];
_sfLoadoutData set ["vests", ["WX_PlateCarrier_Light", "WX_PlateCarrier_Assault"]];
_sfLoadoutData set ["mgVests", ["Hotoke_Do_Machinegunner_EPSM_Shoulders"]];
_sfLoadoutData set ["medVests", ["Sunrise_Recon_GEC_Black"]];
_sfLoadoutData set ["glVests", ["Sunrise_TeamLeader_GEC_Black"]];
_sfLoadoutData set ["backpacks", ["JMSJEFF_d2_backpack"]];
_sfLoadoutData set ["slBackpacks", ["JMSJEFF_d2_backpack"]];
_sfLoadoutData set ["atBackpacks", ["JMSJEFF_d2_backpack"]];
_sfLoadoutData set ["helmets", ["JMSJEFF_Jeff_R4_helmet"]];
_sfLoadoutData set ["slHat", ["JMSJEFF_Jeff_spec_helmet"]];
_sfLoadoutData set ["sniHats", ["Sinagami_EPSM_Helmet_FULL"]];
_sfLoadoutData set ["NVGs", ["JMSJEFF_NVChip"]];
_sfLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_sfLoadoutData set ["slRifles", [
    ["AK15_EPSM_WEAPON", "OPTRE_M6C_compensator", "OPTRE_BMR_Laser", "OPTRE_BR45_Scope", ["30rnd_762x39_AKEPSM"], [], ""],
    ["WBK_EPSM_Scar_1_Black_H", "", "", "OPTRE_M392_Scope", ["Magazine_30rnd_556Scar_Black"], [], ""],
    ["JMSJEFF_IMRRifle", "", "OPTRE_BMR_Laser", "optic_Hamr", ["JMSJEFF_30Rnd_IMR_mag"], [], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["JMSJEFF_arx160Rifle_black", "", "", "optic_Hamr", ["JMSJEFF_30Rnd_ARX160_mag"], [], ""],
    ["OPTRE_M58S", "", "", "optic_MRCO", ["OPTRE_42Rnd_95x40_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["AK15U_EPSM_WEAPON", "", "", "OPTRE_HMG38_CarryHandle", ["30rnd_762x39_AKEPSM"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic", "", "", "optic_MRCO", ["OPTRE_12Rnd_12Gauge_Pellets"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_MA37BGL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["JMSJEFF_yash1", "", "", "", ["JMSJEFF_30Rnd_Yash_magJMSJEFF_30Rnd_Yash_mag"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", "", "", "", ["OPTRE_12Rnd_12Gauge_Pellets"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["OPTRE_HMG38", "", "", "OPTRE_HMG38_CarryHandle", ["OPTRE_100Rnd_30x06_Mag"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["WRS_Weapon_Sniper_Bolt_NoGlow", "", "", "OPTRE_SRS99C_Scope", ["WRS_Boomslang_Magazine"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["WRS_Weapon_Sniper_Bolt_NoGlow", "", "", "OPTRE_SRS99C_Scope", ["WRS_Boomslang_Magazine"], [], ""],
    ["WRS_Weapon_ShockGun", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["JMSJEFF_uniformJ13_black_F_CombatUniform", "JMSJEFF_LDF_black_Shortsleeve"]];
_eliteLoadoutData set ["slUniform", ["JMSJEFF_uniformJ3_S_black1_F_CombatUniform"]];
_eliteLoadoutData set ["vests", ["JMSJEFF_ChestVestTroop_armor_black", "WX_PlateCarrier_Assault"]];
_eliteLoadoutData set ["mgVests", ["WX_PlateCarrier_Machinegunner"]];
_eliteLoadoutData set ["medVests", ["SSV_Vest_Android_Military"]];
_eliteLoadoutData set ["slVests", ["JMSJEFF_ChestVestS_armor_black"]];
_eliteLoadoutData set ["glVests", ["SSV_Vest_Android_Military_Heavy"]];
_eliteLoadoutData set ["engVests", ["Hotoke_Do_EPSM_Shoulders"]];
_eliteLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black", "B_ViperHarness_blk_F"]];
_eliteLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["helmets", ["SSV_Helmet_Android_Military", "JMSJEFF_Jeff_tac_helmet"]];
_eliteLoadoutData set ["sniHats", ["JMSJEFF_Jeff_R4_helmet"]];
_eliteLoadoutData set ["binoculars", ["OPTRE_Binoculars"]];

_eliteLoadoutData set ["slRifles", [
    ["OPTRE_MA37K", "", "", "OPTRE_M12_Optic", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_MA37B", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["SSV_Weapon_Android_MSBS", "muzzle_snds_65_TI_blk_F", "", "OPTRE_M393_EOTECH", ["30Rnd_65x39_caseless_msbs_mag"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["SSV_Weapon_Android_Greyhound", "", "", "optic_Holosight_blk_F", ["WRS_Ar_Magazine"], [], ""],
    ["SSV_Weapon_Android_Bulldog", "", "", "optic_ERCO_blk_F", ["WRS_Ar1_Magazine"], [], ""],
    ["SSV_Weapon_Android_MX_SW", "", "", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["JMSJEFF_IMRRifle_white", "", "", "", ["JMSJEFF_30Rnd_IMR_mag"], [], ""],
    ["JMSJEFF_arx160Rifle", "", "", "", ["JMSJEFF_30Rnd_ARX160_mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["SSV_Weapon_Android_ARX", "", "", "OPTRE_HMG38_CarryHandle", ["30Rnd_65x39_caseless_green"], ["10Rnd_50BW_Mag_F"], "bipod_01_F_blk"],
    ["JMSJEFF_arx160GLRifle", "", "", "optic_Hamr", ["JMSJEFF_30Rnd_ARX160_mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["JMSJEFF_bal27Rifle", "", "", "", ["JMSJEFF_30Rnd_BAL_mag"], [], ""],
    ["SSV_Weapon_Android_Raptor", "", "", "optic_ACO_grn", ["WRS_Ar2_Magazine"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["SSV_Weapon_Android_MX_SW", "", "", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag"], [], "bipod_01_F_blk"],
    ["OPTRE_M73", "", "", "", ["OPTRE_100Rnd_95x40_Box"], [], ""],
    ["OPTRE_HMG38", "", "", "", ["OPTRE_40Rnd_30x06_Mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Android_MXM", "", "", "OPTRE_HMG38_CarryHandle", ["30Rnd_65x39_caseless_black_mag"], [], "bipod_01_F_blk"],
    ["OPTRE_Commando_Snow", "", "", "OPTRE_HMG38_CarryHandle", ["Commando_20Rnd_65_Mag"], [], "bipod_01_F_blk"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["SSV_Weapon_Android_Boomslang", "", "", "OPTRE_SRS99C_Scope", ["WRS_Boomslang_Magazine"], [], ""],
    ["WRS_Weapon_Sniper", "", "", "OPTRE_SRS99_Scope", ["WRS_Sniper_Magazine"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_AP_Mag"], [], ""],
    ["SSV_Weapon_Android_Constrictor", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["JMSJEFF_uniformJ13_black_F_CombatUniform", "SSV_Uniform_Android_Military"]];
_militaryLoadoutData set ["slUniform", ["JMSJEFF_uniformJ3_S_black1_F_CombatUniform"]];
_militaryLoadoutData set ["vests", ["JMSJEFF_ChestVestTroop_armor_black", "WX_PlateCarrier_Assault"]];
_militaryLoadoutData set ["mgVests", ["WX_PlateCarrier_Machinegunner"]];
_militaryLoadoutData set ["medVests", ["SSV_Vest_Android_Military"]];
_militaryLoadoutData set ["slVests", ["JMSJEFF_ChestVestS_armor_black"]];
_militaryLoadoutData set ["glVests", ["SSV_Vest_Android_Military_Heavy"]];
_militaryLoadoutData set ["engVests", ["Hotoke_Do_EPSM_Shoulders"]];
_militaryLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black", "B_ViperHarness_blk_F"]];
_militaryLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_militaryLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_militaryLoadoutData set ["helmets", ["SSV_Helmet_Android_Military", "JMSJEFF_Jeff_tac_helmet"]];
_militaryLoadoutData set ["sniHats", ["JMSJEFF_Jeff_R4_helmet"]];
_militaryLoadoutData set ["binoculars", ["OPTRE_Binoculars"]];

_militaryLoadoutData set ["slRifles", [
    ["OPTRE_MA37K", "", "", "OPTRE_M12_Optic", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_MA37B", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["SSV_Weapon_Android_MSBS", "muzzle_snds_65_TI_blk_F", "", "OPTRE_M393_EOTECH", ["30Rnd_65x39_caseless_msbs_mag"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["SSV_Weapon_Android_Greyhound", "", "", "optic_Holosight_blk_F", ["WRS_Ar_Magazine"], [], ""],
    ["SSV_Weapon_Android_Bulldog", "", "", "optic_ERCO_blk_F", ["WRS_Ar1_Magazine"], [], ""],
    ["SSV_Weapon_Android_MX_SW", "", "", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["JMSJEFF_IMRRifle_white", "", "", "", ["JMSJEFF_30Rnd_IMR_mag"], [], ""],
    ["JMSJEFF_arx160Rifle", "", "", "", ["JMSJEFF_30Rnd_ARX160_mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["SSV_Weapon_Android_ARX", "", "", "OPTRE_HMG38_CarryHandle", ["30Rnd_65x39_caseless_green"], ["10Rnd_50BW_Mag_F"], "bipod_01_F_blk"],
    ["JMSJEFF_arx160GLRifle", "", "", "optic_Hamr", ["JMSJEFF_30Rnd_ARX160_mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["JMSJEFF_bal27Rifle", "", "", "", ["JMSJEFF_30Rnd_BAL_mag"], [], ""],
    ["SSV_Weapon_Android_Raptor", "", "", "optic_ACO_grn", ["WRS_Ar2_Magazine"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["SSV_Weapon_Android_MX_SW", "", "", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag"], [], "bipod_01_F_blk"],
    ["OPTRE_M73", "", "", "", ["OPTRE_100Rnd_95x40_Box"], [], ""],
    ["OPTRE_HMG38", "", "", "", ["OPTRE_40Rnd_30x06_Mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Android_MXM", "", "", "OPTRE_HMG38_CarryHandle", ["30Rnd_65x39_caseless_black_mag"], [], "bipod_01_F_blk"],
    ["OPTRE_Commando_Snow", "", "", "OPTRE_HMG38_CarryHandle", ["Commando_20Rnd_65_Mag"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["SSV_Weapon_Android_Boomslang", "", "", "OPTRE_SRS99C_Scope", ["WRS_Boomslang_Magazine"], [], ""],
    ["WRS_Weapon_Sniper", "", "", "OPTRE_SRS99_Scope", ["WRS_Sniper_Magazine"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_AP_Mag"], [], ""],
    ["SSV_Weapon_Android_Constrictor", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SSV_Uniform_Android_Military"]];
_policeLoadoutData set ["vests", ["JMSJEFF_ChestVest_armor_black", "JMSJEFF_ChestVestSL_armor_black"]];
_policeLoadoutData set ["helmets", ["SSV_Helmet_Android_Military"]];

_policeLoadoutData set ["SMGs", [
    ["SSV_Weapon_Android_P90", "", "", "", ["50Rnd_570x28_SMG_03"], [], ""],
    ["JMSJEFF_arx160Rifle", "", "", "optic_Hamr", ["JMSJEFF_30Rnd_ARX160_mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["SSV_Weapon_Android_Constrictor", "", "", "", ["WRS_Revolver_Magazine"], [], ""],
    ["OPTRE_M6B", "", "", "", ["OPTRE_8Rnd_127x40_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["SSV_Uniform_Android_Military"]];
_militiaLoadoutData set ["vests", ["SSV_Vest_Android_Military", "SSV_Vest_Android_Military", "SSV_Vest_Android_Military", "Vest_Thor_Assault_Black"]];
_militiaLoadoutData set ["sniVests", ["WX_PlateCarrier_Assault"]];
_militiaLoadoutData set ["backpacks", ["B_ViperHarness_blk_F"]];
_militiaLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack_Heavy"]];
_militiaLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_militiaLoadoutData set ["helmets", []];
_militiaLoadoutData set ["slHat", []];
_militiaLoadoutData set ["sniHats", []];

_militiaLoadoutData set ["rifles", [
    ["SSV_Weapon_Android_MX_SW", "", "", "", ["30Rnd_65x39_caseless_black_mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["SSV_Weapon_Android_ARX", "", "", "", ["30Rnd_65x39_caseless_green"], [], ""],
    ["SSV_Weapon_Android_MX", "", "", "", ["30Rnd_65x39_caseless_black_mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["JMSJEFF_arx160GLRifle", "", "", "", ["JMSJEFF_30Rnd_ARX160_mag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["SSV_Weapon_Android_P90", "", "", "", ["50Rnd_570x28_SMG_03"], [], ""],
    ["SSV_Weapon_Android_Raptor", "", "", "", ["WRS_Ar2_Magazine"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["OPTRE_M73", "", "", "", ["OPTRE_100Rnd_95x40_Box"], [], ""],
    ["OPTRE_HMG38", "", "", "", ["OPTRE_40Rnd_30x06_Mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Android_MXM", "", "", "OPTRE_HMG38_CarryHandle", ["30Rnd_65x39_caseless_black_mag"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["sidearms", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_AP_Mag"], [], ""],
    ["SSV_Weapon_Android_Constrictor", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["SSV_Uniform_Android_Worker"]];
_crewLoadoutData set ["vests", ["SSV_Vest_Android_Military_Heavy"]];
_crewLoadoutData set ["helmets", ["SSV_Helmet_Android_Pilot"]];
_crewLoadoutData set ["carbines", [
    ["SSV_Weapon_Android_MSBS", "", "", "OPTRE_M393_EOTECH", ["30Rnd_65x39_caseless_msbs_mag"], [], ""],
    ["SSV_Weapon_Android_Katiba", "", "", "OPTRE_M12_Optic", ["30Rnd_65x39_caseless_green"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SSV_Uniform_Android_Pilot"]];
_pilotLoadoutData set ["vests", ["SSV_Vest_Android_Military"]];
_pilotLoadoutData set ["helmets", ["SSV_Helmet_Android_Pilot"]];
_pilotLoadoutData set ["carbines", [
    ["SSV_Weapon_Android_P90", "", "", "", ["50Rnd_570x28_SMG_03"], [], ""],
    ["SSV_Weapon_Android_MX", "", "", "OPTRE_HMG38_CarryHandle", ["30Rnd_65x39_caseless_black_mag"], [], ""],
    ["SSV_Weapon_Android_MX", "", "", "OPTRE_SRM_Sight", ["30Rnd_65x39_caseless_black_mag"], [], ""]
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

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
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

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
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

    [selectRandom ["rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
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

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _baseClass = ["baseClass", "SSV_Unit_Android_Military", false]; // If we don't do this, the androids are actually humans. Aka, you shoot them and there is blood. This fixes it.
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [_baseClass], [_prefix]],
	["Rifleman", _riflemanTemplate, [_baseClass], [_prefix]],
	["Radioman", _radiomanTemplate, [_baseClass], [_prefix]],
	["Medic", _medicTemplate, [["medic", true], _baseClass], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true], _baseClass], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _baseClass], [_prefix]],
	["Grenadier", _grenadierTemplate, [_baseClass], [_prefix]],
	["LAT", _latTemplate, [_baseClass], [_prefix]],
	["AT", _atTemplate, [_baseClass], [_prefix]],
	["AA", _aaTemplate, [_baseClass], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [_baseClass], [_prefix]],
	["Marksman", _marksmanTemplate, [_baseClass], [_prefix]],
	["Sniper", _sniperTemplate, [_baseClass], [_prefix]]
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
	["SquadLeader", _squadLeaderTemplate, [_baseClass], [_prefix]],
	["Rifleman", _riflemanTemplate, [_baseClass], [_prefix]],
	["Radioman", _radiomanTemplate, [_baseClass], [_prefix]],
	["Medic", _medicTemplate, [["medic", true], _baseClass], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true], _baseClass], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _baseClass], [_prefix]],
	["Grenadier", _grenadierTemplate, [_baseClass], [_prefix]],
	["LAT", _latTemplate, [_baseClass], [_prefix]],
	["AT", _atTemplate, [_baseClass], [_prefix]],
	["AA", _aaTemplate, [_baseClass], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [_baseClass], [_prefix]],
	["Marksman", _marksmanTemplate, [_baseClass], [_prefix]],
	["Sniper", _sniperTemplate, [_baseClass], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [_baseClass], [_prefix]],
	["Standard", _policeTemplate, [_baseClass], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [_baseClass], [_prefix]],
	["Rifleman", _riflemanTemplate, [_baseClass], [_prefix]],
	["Radioman", _radiomanTemplate, [_baseClass], [_prefix]],
	["Medic", _medicTemplate, [["medic", true], _baseClass], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true], _baseClass], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _baseClass], [_prefix]],
	["Grenadier", _grenadierTemplate, [_baseClass], [_prefix]],
	["LAT", _latTemplate, [_baseClass], [_prefix]],
	["AT", _atTemplate, [_baseClass], [_prefix]],
	["AA", _aaTemplate, [_baseClass], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [_baseClass], [_prefix]],
	["Marksman", _marksmanTemplate, [_baseClass], [_prefix]],
	["Sniper", _sniperTemplate, [_baseClass], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [_baseClass], [_prefix]],
	["Rifleman", _riflemanTemplate, [_baseClass], [_prefix]],
	["Radioman", _radiomanTemplate, [_baseClass], [_prefix]],
	["Medic", _medicTemplate, [["medic", true], _baseClass], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true], _baseClass], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _baseClass], [_prefix]],
	["Grenadier", _grenadierTemplate, [_baseClass], [_prefix]],
	["LAT", _latTemplate, [_baseClass], [_prefix]],
	["AT", _atTemplate, [_baseClass], [_prefix]],
	["AA", _aaTemplate, [_baseClass], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [_baseClass], [_prefix]],
	["Marksman", _marksmanTemplate, [_baseClass], [_prefix]],
	["Sniper", _sniperTemplate, [_baseClass], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [_baseClass]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate, [_baseClass]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate, [_baseClass]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [_baseClass]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [_baseClass]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;