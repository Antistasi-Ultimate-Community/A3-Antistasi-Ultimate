//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

// // Force the different groups
// missionNamespace setVariable ["A3U_setting_tierWarMilitia", 0, true];
// missionNamespace setVariable ["A3U_setting_tierWarElite", 1, true];

["name", "Vanguard Expeditionary"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Vanguard Portal"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", QPATHTOFOLDER(Templates\Templates\Android\images\flag_vanguard_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_ascension_vanguard"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["ssv_vanguard_vehicle_m12_black", "ssv_vanguard_vehicle_m813_black"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["ssv_vanguard_vehicle_m12_mg_black"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["OPTRE_m1015_mule_cma", "OPTRE_m1015_mule_cover_cma"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_m1015_mule_cma", "OPTRE_m1015_mule_cover_cma"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["OPTRE_m1015_mule_ammo_cma"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["OPTRE_m1015_mule_repair_cma"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["OPTRE_m1015_mule_fuel_cma"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SSV_Vehicle_Vanguard_Ifrit", "OPTRE_M12_FAV_APC_MED_CMA"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["ssv_vanguard_vehicle_m411_black", "ssv_vanguard_vehicle_m412_black"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["ssv_vanguard_vehicle_m413_black", "ssv_vanguard_vehicle_m494_black", "SSV_Vehicle_Vanguard_Futura_Tank"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["ssv_vanguard_vehicle_m413_black", "ssv_vanguard_vehicle_m494_black"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["ssv_vanguard_vehicle_m494_black"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_M808B_CMA"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SSV_Vehicle_Vanguard_Futura_Tank", "ssv_vanguard_vehicle_m808b_black"]] call _fnc_saveToTemplate;
["vehiclesAA", ["ssv_vanguard_vehicle_m808b2a1_black"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["ssv_vanguard_vehicle_catfish_black"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["ssv_vanguard_vehicle_catfish_mg_black", "ssv_vanguard_vehicle_catfish_aa_black"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["SSV_Vehicle_Vanguard_APC"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_YSS_1000_A"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["SSV_Vehicle_Vanguard_VTOL_Infantry"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["ssv_vanguard_vehicle_falcon_black"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["ssv_vanguard_vehicle_pelican_unarmed_black"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["ssv_vanguard_vehicle_hornet_CAS_black"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["ssv_vanguard_vehicle_hornet_CAS_black"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["ssv_vanguard_vehicle_m875_black"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["ssv_vanguard_vehicle_m875_black",["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["OPTRE_Wombat_B_CMA", "OPTRE_Wombat_CMA"]] call _fnc_saveToTemplate;
["uavsPortable", ["SSV_Drone_Cargo"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["OPTRE_M12_LRV_CMA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["OPTRE_m1015_mule_cover_cma"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SSV_Vehicle_Vanguard_Ifrit"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["SSV_Vehicle_Vanguard_APC", "OPTRE_M12_FAV_APC_CMA"]] call _fnc_saveToTemplate;

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
["voices", ["Male01ENGVR"]] call _fnc_saveToTemplate;

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

_loadoutData set ["traitorUniforms", ["SSV_Uniform_Vanguard_QRF"]];
_loadoutData set ["traitorVests", ["SSV_Vest_Vanguard_Stealth"]];
_loadoutData set ["traitorHats", ["JMSJEFF_Jeff_BeretRed_02"]];

_loadoutData set ["officerUniforms", ["SSV_Uniform_Vanguard_Stealth"]];
_loadoutData set ["officerVests", ["SSV_Vest_Vanguard_Marksman", "SSV_Vest_Vanguard_SL"]];
_loadoutData set ["officerHats", ["JMSJEFF_Jeff_BeretBlack_02"]];

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
_loadoutData set ["slHat", ["SSV_Helmet_Vanguard_QRF_Expeditionary"]];
_loadoutData set ["sniHats", ["SSV_Helmet_Vanguard_Pilot_Expeditionary"]];

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
_sfLoadoutData set ["uniforms", ["SSV_Uniform_Vanguard_J13_Expeditionary"]];
_sfLoadoutData set ["vests", ["SSV_Vest_Vanguard_QRF_Expeditionary"]];
_sfLoadoutData set ["mgVests", ["Hotoke_Do_Machinegunner_EPSM"]];
_sfLoadoutData set ["medVests", ["WX_PlateCarrier_LeaderGroup"]];
_sfLoadoutData set ["glVests", ["Hotoke_Do_Machinegunner_EPSM_Shoulders"]];
_sfLoadoutData set ["backpacks", ["Sinagami_Assault_Exo"]];
_sfLoadoutData set ["slBackpacks", ["WebNiX_AssaultJetpack_Exo"]];
_sfLoadoutData set ["atBackpacks", ["WebNiX_Assault_Exo"]];
_sfLoadoutData set ["helmets", ["SSV_Helmet_Vanguard_QRF_Expeditionary", "JMSJEFF_Jeff_R4_helmet"]];
_sfLoadoutData set ["slHat", ["SSV_Helmet_Vanguard_Pilot_Expeditionary", "JMSJEFF_Jeff_tac_grey_helmet"]];
_sfLoadoutData set ["sniHats", ["Sinagami_EPSM_Helmet_FULL"]];
_sfLoadoutData set ["NVGs", ["JMSJEFF_NVChip"]];
_sfLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_sfLoadoutData set ["slRifles", [
    ["AK15_EPSM_WEAPON", "", "OPTRE_BMR_Laser", "OPTRE_BMR_Scope", ["30rnd_762x39_AKEPSM"], [], ""],
    ["WBK_EPSM_Scar_1_Black_H", "", "", "OPTRE_M393_EOTECH", ["Magazine_30rnd_556Scar_Black"], [], ""],
    ["OPTRE_MA37BGL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["1Rnd_SmokeGreen_Grenade_shell", "OPTRE_signalSmokeG", "OPTRE_1Rnd_MasterKey_Slugs"], ""]
]];
_sfLoadoutData set ["rifles", [  
    ["OPTRE_MA37B", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_MA32B", "", "", "OPTRE_HMG38_CarryHandle", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_Commando_Black", "OPTRE_M6C_compensator", "", "OPTRE_BMR_Scope", ["Commando_20Rnd_65_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["OPTRE_MA37K", "", "", "Optre_Recon_Sight", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["WRS_Weapon_AUG_NoGlow", "", "", "OPTRE_M393_EOTECH", ["WRS_Ar1_Magazine"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_MA32GL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["UGL_FlareGreen_F", "1Rnd_HE_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["OPTRE_M7", "", "", "", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", "", "", "", ["OPTRE_12Rnd_12Gauge_Pellets"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["OPTRE_M247H_Shield_Etilka", "", "", "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball"], [], "bipod_03_F_blk"]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Vanguard_Pilum", "", "", "optic_Nightstalker", ["WRS_Sniper_Magazine"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["SSV_Weapon_Vanguard_Boomslang", "", "", "optic_ico_01_black_f", ["WRS_Boomslang_Magazine"], [], ""],
    ["SSV_Weapon_Vanguard_Rhino", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["SSV_Uniform_Vanguard_J13_Expeditionary"]];
_eliteLoadoutData set ["vests", ["SSV_Vest_Vanguard_QRF_Expeditionary"]];
_eliteLoadoutData set ["mgVests", ["Hotoke_Do_Machinegunner_EPSM"]];
_eliteLoadoutData set ["medVests", ["WX_PlateCarrier_LeaderGroup"]];
_eliteLoadoutData set ["glVests", ["Hotoke_Do_Machinegunner_EPSM_Shoulders"]];
_eliteLoadoutData set ["backpacks", ["Sinagami_Assault_Exo"]];
_eliteLoadoutData set ["slBackpacks", ["WebNiX_AssaultJetpack_Exo"]];
_eliteLoadoutData set ["atBackpacks", ["WebNiX_Assault_Exo"]];
_eliteLoadoutData set ["helmets", ["SSV_Helmet_Vanguard_QRF_Expeditionary", "JMSJEFF_Jeff_R4_helmet"]];
_eliteLoadoutData set ["slHat", ["SSV_Helmet_Vanguard_Pilot_Expeditionary", "JMSJEFF_Jeff_tac_grey_helmet"]];
_eliteLoadoutData set ["sniHats", ["Sinagami_EPSM_Helmet_FULL"]];
_eliteLoadoutData set ["NVGs", ["JMSJEFF_NVChip"]];
_eliteLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_eliteLoadoutData set ["slRifles", [
    ["AK15_EPSM_WEAPON", "", "OPTRE_BMR_Laser", "OPTRE_BMR_Scope", ["30rnd_762x39_AKEPSM"], [], ""],
    ["WBK_EPSM_Scar_1_Black_H", "", "", "OPTRE_M393_EOTECH", ["Magazine_30rnd_556Scar_Black"], [], ""],
    ["OPTRE_MA37BGL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["1Rnd_SmokeGreen_Grenade_shell", "OPTRE_signalSmokeG", "OPTRE_1Rnd_MasterKey_Slugs"], ""]
]];
_eliteLoadoutData set ["rifles", [  
    ["OPTRE_MA37B", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_MA32B", "", "", "OPTRE_HMG38_CarryHandle", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_Commando_Black", "OPTRE_M6C_compensator", "", "OPTRE_BMR_Scope", ["Commando_20Rnd_65_Mag"], [], ""]
]];
_eliteLoadoutData set ["carbines", [  
    ["OPTRE_MA37K", "", "", "Optre_Recon_Sight", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["WRS_Weapon_AUG_NoGlow", "", "", "OPTRE_M393_EOTECH", ["WRS_Ar1_Magazine"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_MA32GL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["UGL_FlareGreen_F", "1Rnd_HE_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["OPTRE_M7", "", "", "", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", "", "", "", ["OPTRE_12Rnd_12Gauge_Pellets"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["OPTRE_M247H_Shield_Etilka", "", "", "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball"], [], "bipod_03_F_blk"]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Vanguard_Pilum", "", "", "optic_Nightstalker", ["WRS_Sniper_Magazine"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["SSV_Weapon_Vanguard_Boomslang", "", "", "optic_ico_01_black_f", ["WRS_Boomslang_Magazine"], [], ""],
    ["SSV_Weapon_Vanguard_Rhino", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["SSV_Uniform_Vanguard_J13_Expeditionary"]];
_militaryLoadoutData set ["vests", ["SSV_Vest_Vanguard_QRF_Expeditionary"]];
_militaryLoadoutData set ["mgVests", ["Hotoke_Do_Machinegunner_EPSM"]];
_militaryLoadoutData set ["medVests", ["WX_PlateCarrier_LeaderGroup"]];
_militaryLoadoutData set ["glVests", ["Hotoke_Do_Machinegunner_EPSM_Shoulders"]];
_militaryLoadoutData set ["backpacks", ["Sinagami_Assault_Exo"]];
_militaryLoadoutData set ["slBackpacks", ["WebNiX_AssaultJetpack_Exo"]];
_militaryLoadoutData set ["atBackpacks", ["WebNiX_Assault_Exo"]];
_militaryLoadoutData set ["helmets", ["SSV_Helmet_Vanguard_QRF_Expeditionary", "JMSJEFF_Jeff_R4_helmet"]];
_militaryLoadoutData set ["slHat", ["SSV_Helmet_Vanguard_Pilot_Expeditionary", "JMSJEFF_Jeff_tac_grey_helmet"]];
_militaryLoadoutData set ["sniHats", ["Sinagami_EPSM_Helmet_FULL"]];
_militaryLoadoutData set ["NVGs", ["JMSJEFF_NVChip"]];
_militaryLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_militaryLoadoutData set ["slRifles", [
    ["AK15_EPSM_WEAPON", "", "OPTRE_BMR_Laser", "OPTRE_BMR_Scope", ["30rnd_762x39_AKEPSM"], [], ""],
    ["WBK_EPSM_Scar_1_Black_H", "", "", "OPTRE_M393_EOTECH", ["Magazine_30rnd_556Scar_Black"], [], ""],
    ["OPTRE_MA37BGL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["1Rnd_SmokeGreen_Grenade_shell", "OPTRE_signalSmokeG", "OPTRE_1Rnd_MasterKey_Slugs"], ""]
]];
_militaryLoadoutData set ["rifles", [  
    ["OPTRE_MA37B", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_MA32B", "", "", "OPTRE_HMG38_CarryHandle", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_Commando_Black", "OPTRE_M6C_compensator", "", "OPTRE_BMR_Scope", ["Commando_20Rnd_65_Mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [  
    ["OPTRE_MA37K", "", "", "Optre_Recon_Sight", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["WRS_Weapon_AUG_NoGlow", "", "", "OPTRE_M393_EOTECH", ["WRS_Ar1_Magazine"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_MA32GL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["UGL_FlareGreen_F", "1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["OPTRE_M7", "", "", "", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", "", "", "", ["OPTRE_12Rnd_12Gauge_Pellets"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["OPTRE_M247H_Shield_Etilka", "", "", "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball"], [], "bipod_03_F_blk"]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Vanguard_Pilum", "", "", "optic_Nightstalker", ["WRS_Sniper_Magazine"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["SSV_Weapon_Vanguard_Boomslang", "", "", "optic_ico_01_black_f", ["WRS_Boomslang_Magazine"], [], ""],
    ["SSV_Weapon_Vanguard_Rhino", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SSV_Uniform_Vanguard_J13_Expeditionary"]];
_policeLoadoutData set ["vests", ["SSV_Vest_Vanguard_SMG_Expeditionary", "SSV_Vest_Vanguard_QRF_Expeditionary"]];
_policeLoadoutData set ["helmets", ["JMSJEFF_Jeff_tac_grey_helmet", "SSV_Helmet_Vanguard_QRF_Expeditionary"]];

_policeLoadoutData set ["SMGs", [
    ["AK15_EPSM_WEAPON", "", "OPTRE_BMR_Laser", "OPTRE_BMR_Scope", ["30rnd_762x39_AKEPSM"], [], ""],
    ["WBK_EPSM_Scar_1_Black_H", "", "", "OPTRE_M393_EOTECH", ["Magazine_30rnd_556Scar_Black"], [], ""],
    ["OPTRE_MA37BGL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["1Rnd_SmokeGreen_Grenade_shell", "OPTRE_signalSmokeG", "OPTRE_1Rnd_MasterKey_Slugs"], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["SSV_Weapon_Vanguard_Constrictor", "", "", "", ["WRS_Revolver_Magazine"], [], ""],
    ["OPTRE_M6B", "", "", "", ["OPTRE_8Rnd_127x40_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["SSV_Uniform_Vanguard_J13_Expeditionary"]];
_militiaLoadoutData set ["vests", ["SSV_Vest_Vanguard_QRF_Expeditionary"]];
_militiaLoadoutData set ["mgVests", ["Hotoke_Do_Machinegunner_EPSM"]];
_militiaLoadoutData set ["medVests", ["WX_PlateCarrier_LeaderGroup"]];
_militiaLoadoutData set ["glVests", ["Hotoke_Do_Machinegunner_EPSM_Shoulders"]];
_militiaLoadoutData set ["backpacks", ["Sinagami_Assault_Exo"]];
_militiaLoadoutData set ["slBackpacks", ["WebNiX_AssaultJetpack_Exo"]];
_militiaLoadoutData set ["atBackpacks", ["WebNiX_Assault_Exo"]];
_militiaLoadoutData set ["helmets", ["SSV_Helmet_Vanguard_QRF_Expeditionary", "JMSJEFF_Jeff_R4_helmet"]];
_militiaLoadoutData set ["slHat", ["SSV_Helmet_Vanguard_Pilot_Expeditionary", "JMSJEFF_Jeff_tac_grey_helmet"]];
_militiaLoadoutData set ["sniHats", ["Sinagami_EPSM_Helmet_FULL"]];
_militiaLoadoutData set ["NVGs", ["JMSJEFF_NVChip"]];
_militiaLoadoutData set ["binoculars", ["OPTRE_Smartfinder"]];

_militiaLoadoutData set ["slRifles", [
    ["AK15_EPSM_WEAPON", "", "OPTRE_BMR_Laser", "OPTRE_BMR_Scope", ["30rnd_762x39_AKEPSM"], [], ""],
    ["WBK_EPSM_Scar_1_Black_H", "", "", "OPTRE_M393_EOTECH", ["Magazine_30rnd_556Scar_Black"], [], ""],
    ["OPTRE_MA37BGL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["1Rnd_SmokeGreen_Grenade_shell", "OPTRE_signalSmokeG", "OPTRE_1Rnd_MasterKey_Slugs"], ""]
]];
_militiaLoadoutData set ["rifles", [  
    ["OPTRE_MA37B", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_MA32B", "", "", "OPTRE_HMG38_CarryHandle", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["OPTRE_Commando_Black", "OPTRE_M6C_compensator", "", "OPTRE_BMR_Scope", ["Commando_20Rnd_65_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [  
    ["OPTRE_MA37K", "", "", "Optre_Recon_Sight", ["OPTRE_32Rnd_762x51_Mag"], [], ""],
    ["WRS_Weapon_AUG_NoGlow", "", "", "OPTRE_M393_EOTECH", ["WRS_Ar1_Magazine"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_MA32GL", "", "", "", ["OPTRE_32Rnd_762x51_Mag"], ["UGL_FlareGreen_F", "1Rnd_HE_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["OPTRE_M7", "", "", "", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", "", "", "", ["OPTRE_12Rnd_12Gauge_Pellets"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["OPTRE_M247H_Shield_Etilka", "", "", "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball"], [], "bipod_03_F_blk"]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Vanguard_Pilum", "", "", "optic_Nightstalker", ["WRS_Sniper_Magazine"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["SSV_Weapon_Vanguard_Boomslang", "", "", "optic_ico_01_black_f", ["WRS_Boomslang_Magazine"], [], ""],
    ["SSV_Weapon_Vanguard_Rhino", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["WRS_Weapon_Revolver", "", "", "", ["WRS_Revolver_Magazine"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["OPTRE_UNSC_Navy_Uniform_ONI"]];
_crewLoadoutData set ["vests", ["SSV_Vest_Vanguard_QRF_Expeditionary"]];
_crewLoadoutData set ["helmets", ["SSV_Helmet_Vanguard_Drone_Expeditionary"]];
_crewLoadoutData set ["carbines", [
    ["AK15U_EPSM_WEAPON", "", "", "OPTRE_M393_EOTECH", ["30rnd_762x39_AKEPSM"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SSV_Uniform_Vanguard_J13_Expeditionary"]];
_pilotLoadoutData set ["vests", ["SSV_Vest_Vanguard_QRF_Expeditionary"]];
_pilotLoadoutData set ["helmets", ["SSV_Helmet_Vanguard_Drone_Expeditionary"]];
_pilotLoadoutData set ["carbines", [
    ["AK15U_EPSM_WEAPON", "", "", "OPTRE_M393_EOTECH", ["30rnd_762x39_AKEPSM"], [], ""]
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