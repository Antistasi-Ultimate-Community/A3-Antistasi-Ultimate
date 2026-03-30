//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", localize "STR_A3AP_setupFactionsTab_OPTRE_UNSC_name"] call _fnc_saveToTemplate;
["spawnMarkerName", localize "STR_supportcorridorUNSC"] call _fnc_saveToTemplate; ///yeah sure thing buddy

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_unsc"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesDropPod", ["OPTRE_HEV"]] call _fnc_saveToTemplate;

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["OPTRE_M274_ATV", "OPTRE_cart", "OPTRE_forklift", "OPTRE_M313_UNSC", "OPTRE_m1087_stallion_device_unsc", "OPTRE_M710E_Viper_UNSC"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["OPTRE_M12_FAV", "OPTRE_M813_TT", "OPTRE_M12_FAV_APC"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["OPTRE_M12_LRV", "OPTRE_M12A1_LRV", "OPTRE_M12G1_LRV"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["OPTRE_m1087_stallion_unsc", "OPTRE_m1087_stallion_cover_unsc"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_m1087_stallion_unsc","OPTRE_m1087_stallion_cover_unsc"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["OPTRE_m1087_stallion_unsc_resupply"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["OPTRE_m1087_stallion_unsc_repair","OPTRE_M808R_Engineer_UNSC","OPTRE_M914_RV"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["OPTRE_m1087_stallion_unsc_refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["OPTRE_m1087_stallion_unsc_medical","OPTRE_M12_FAV_APC_MED"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["OPTRE_M411_APC_UNSC","OPTRE_M493_M37","OPTRE_M493_AIE"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["OPTRE_M12_LRV", "OPTRE_M12A1_LRV", "OPTRE_M12G1_LRV"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["OPTRE_M412_IFV_UNSC"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["OPTRE_M493_AIE_RCWS","OPTRE_M493_M37_RCWS","OPTRE_M494"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_M413_MGS_UNSC"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["OPTRE_M700_Viper_UNSC","OPTRE_M700_Viper_UNSC_Black","OPTRE_M808B_UNSC","OPTRE_M808BM_UNSC","OPTRE_M808L","OPTRE_M808S","OPTRE_M850_UNSC"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_M808B2","OPTRE_M808B2A1","OPTRE_M12R_AA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["optre_catfish_unarmed_f"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["optre_catfish_aa_f","optre_catfish_atgm_f","optre_catfish_gauss_f","optre_catfish_mg_f"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["OPTRE_YSS_1000_A","OPTRE_YSS_1000_A_Single","OPTRE_YSS_1000_A_VTOL","OPTRE_YSS_1000_A_VTOL_Single"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_YSS_1000_A","OPTRE_YSS_1000_A_Single","OPTRE_YSS_1000_A_VTOL","OPTRE_YSS_1000_A_VTOL_Single"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["OPTRE_Pelican_unarmed","OPTRE_Pelican_unarmed_SOCOM"]] call _fnc_saveToTemplate; // I pray this works //works like ass though

["vehiclesPlanesGunship", ["OPTRE_Pelican_armed_70mm","OPTRE_Pelican_armed_SOCOM"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["a3a_OPTRE_UNSC_MH_144_Falcon_unarmed","a3a_OPTRE_UNSC_MH_144_Falcon_searchlight"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["OPTRE_UNSC_MH_144S_Falcon","OPTRE_UNSC_falcon_S","OPTRE_Pelican_unarmed","OPTRE_Pelican_unarmed_SOCOM"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["OPTRE_UNSC_falcon_armed","OPTRE_UNSC_hornet_CAP","OPTRE_UNSC_hornet_CAS","OPTRE_UNSC_MH_144_Falcon","OPTRE_UNSC_falcon","OPTRE_UNSC_falcon_armed","OPTRE_UNSC_falcon_black"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["OPTRE_AV22C_Sparrowhawk","OPTRE_AV22A_Sparrowhawk","OPTRE_AV22_Sparrowhawk","OPTRE_AV22B_Sparrowhawk","OPTRE_Pelican_armed","OPTRE_Pelican_armed_single_seater","OPTRE_Pelican_armed_SOCOM","OPTRE_UNSC_falcon_armed","OPTRE_UNSC_falcon_armed_S","OPTRE_UNSC_UH_144S_Falcon_DAP"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", [
    "OPTRE_UNSC_falcon_armed","OPTRE_UNSC_hornet_CAP","OPTRE_UNSC_hornet_CAS","OPTRE_UNSC_MH_144_Falcon","OPTRE_UNSC_falcon","OPTRE_UNSC_falcon_armed","OPTRE_UNSC_falcon_black",
    "OPTRE_AV22C_Sparrowhawk","OPTRE_AV22A_Sparrowhawk","OPTRE_AV22_Sparrowhawk","OPTRE_AV22B_Sparrowhawk","OPTRE_Pelican_armed","OPTRE_Pelican_armed_single_seater","OPTRE_Pelican_armed_SOCOM","OPTRE_UNSC_falcon_armed","OPTRE_UNSC_falcon_armed_S","OPTRE_UNSC_UH_144S_Falcon_DAP"
]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["OPTRE_M875_SPH"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["OPTRE_M875_SPH", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["OPTRE_Wombat_S","OPTRE_Wombat","OPTRE_Wombat_B"]] call _fnc_saveToTemplate; //check those for cas entry
["uavsPortable", ["OPTRE_OQ_38_Wren_Drone_UNSC_Jungle","OPTRE_OQ40_Minibee_UNSC"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["OPTRE_M12_LRV"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["OPTRE_m1087_stallion_unsc"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["OPTRE_M12_FAV"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["OPTRE_M12_FAV_APC","OPTRE_M411_APC_UNSC"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_Genet_Police","OPTRE_M12_FAV_APC_PD","OPTRE_M12_LRV_PD","OPTRE_M12_FAV_PD","OPTRE_M813_TT_Police","OPTRE_M914_RV_PD"]] call _fnc_saveToTemplate;

["staticMGs", ["OPTRE_AIE_486H_Static_HMG","OPTRE_AIE_486HS_Static_HMG","OPTRE_M247a1_Static_MMG","OPTRE_Static_M247H_Tripod","OPTRE_Static_M247H_Shielded_Tripod","OPTRE_M250_Static_HMG","OPTRE_M460AGL_Static_GMG"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_Gauss","OPTRE_Static_ATGM"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["OPTRE_AU_44_Mortar","OPTRE_AU_44_Mortar_Standalone"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", ["OPTRE_Scythe","OPTRE_Scythe_AA","OPTRE_Lance", "OPTRE_Corvette_M910_Turret"]] call _fnc_saveToTemplate; //OPTRE_Corvette_M910_Turret baaad idea

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "OPTRE_10Rnd_122mm_SABOT_81mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "OPTRE_10Rnd_122mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "OPTRE_10Rnd_122mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["OPTRE_Placed_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "OPTRE_Vehicle_Attributes.sqf"

["animations", [
    #include "OPTRE_vehicle_animations.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    #include "OPTRE_vehicle_variant\UNSC.sqf"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["insignia", [
    "OPTRE_Insignia_emblems_blackwidow", 
    "OPTRE_Insignia_emblems_bull", 
    "OPTRE_Insignia_emblems_cartridges", 
    "OPTRE_Insignia_emblems_cone", 
    "OPTRE_Insignia_emblems_crosshairs", 
    "OPTRE_Insignia_emblems_fox", 
    "OPTRE_Insignia_emblems_hazmat", 
    "OPTRE_Insignia_emblems_hornet", 
    "OPTRE_Insignia_emblems_jollyroger", 
    "OPTRE_Insignia_emblems_keepitclean", 
    "OPTRE_Insignia_emblems_king", 
    "OPTRE_Insignia_emblems_lightning", 
    "OPTRE_Insignia_emblems_radioactive", 
    "OPTRE_Insignia_emblems_rooster",
    "OPTRE_Insignia_emblems_skull",
    "OPTRE_Insignia_emblems_stallion",
    "OPTRE_Insignia_emblems_thehand",
    "OPTRE_Insignia_emblems_stare",
    "OPTRE_Insignia_emblems_unicorn",
    "OPTRE_Insignia_unsc_1st",
    "OPTRE_Insignia_emblems_valkyrie",
    "OPTRE_Insignia_emblems_wolf",
    "OPTRE_Insignia_emblems_yinyang",
    ""
]] call _fnc_saveToTemplate;
["eliteInsignia", ["OPTRE_Insignia_odst_13th", "OPTRE_Insignia_odst_19th", "OPTRE_Insignia_odst_7th",""]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG","Male01ENGFRE","Male02ENGFRE","Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;
["faces", [
    "GreekHead_A3_01","PersianHead_A3_01","GreekHead_A3_02","WhiteHead_01",
    "WhiteHead_02","WhiteHead_18","WhiteHead_05","GreekHead_A3_07",
    "WhiteHead_03","WhiteHead_04","GreekHead_A3_03","GreekHead_A3_04",
    "WhiteHead_06","WhiteHead_07","GreekHead_A3_05","GreekHead_A3_06",
    "WhiteHead_08","AfricanHead_02","PersianHead_A3_02","AsianHead_A3_02",
    "AfricanHead_03","WhiteHead_09","GreekHead_A3_08","WhiteHead_16",
    "WhiteHead_11","WhiteHead_10","WhiteHead_19","WhiteHead_17",
    "WhiteHead_21","WhiteHead_12","PersianHead_A3_03","WhiteHead_13",
    "GreekHead_A3_09","WhiteHead_14","WhiteHead_15","AsianHead_A3_03",
    "WhiteHead_20","AfricanHead_01","AsianHead_A3_01","TanoanHead_A3_02",
    "TanoanHead_A3_03","AsianHead_A3_05","TanoanHead_A3_04","AsianHead_A3_04",
    "TanoanHead_A3_05","TanoanHead_A3_07","TanoanHead_A3_09","TanoanHead_A3_01",
    "TanoanHead_A3_06","TanoanHead_A3_08","AsianHead_A3_07","AsianHead_A3_06",
    "WhiteHead_24","RussianHead_4","LivonianHead_5","WhiteHead_25",
    "LivonianHead_2","WhiteHead_26","RussianHead_1","LivonianHead_7",
    "LivonianHead_6","WhiteHead_27","WhiteHead_28","LivonianHead_3",
    "RussianHead_3","LivonianHead_1","RussianHead_2","LivonianHead_10",
    "WhiteHead_32","WhiteHead_29","WhiteHead_30","LivonianHead_8",
    "LivonianHead_4","WhiteHead_31","RussianHead_5","LivonianHead_9",
    "GreekHead_A3_13","GreekHead_A3_14","GreekHead_A3_11","GreekHead_A3_12",
    "WhiteHead_23","Barklem","Mavros","Sturrock",
    "Ioannou","PersianHead_A3_04_a","PersianHead_A3_04_l","PersianHead_A3_04_sa",
    "GreekHead_A3_10_a","GreekHead_A3_10_l","GreekHead_A3_10_sa","WhiteHead_22_a","WhiteHead_22_l","WhiteHead_22_sa"
]] call _fnc_saveToTemplate; //everyone is equial as long as you speak english

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
["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "OPTRE_M44_Lykoi_Laser", "", ["OPTRE_M44_Lykoi_HEAT_mag", "OPTRE_M44_Lykoi_HEAT_mag"], [], ""],
["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_HEAT_mag", "OPTRE_M44_Lykoi_HEAT_mag"], [], ""],
["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "OPTRE_M44_Lykoi_Laser", "", ["OPTRE_M44_Lykoi_HE_mag", "OPTRE_M44_Lykoi_HE_mag"], [], ""],
["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_HE_mag", "OPTRE_M44_Lykoi_HE_mag"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_G"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT","OPTRE_M41_Twin_HE","OPTRE_M41_Twin_HEAP","OPTRE_M41_Twin_HEAT_G","OPTRE_M41_Twin_HEAT_SACLOS","OPTRE_M41_Twin_HEAT_SALH"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_G_AA"], [], ""],
    ["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "OPTRE_M44_Lykoi_Laser", "", ["OPTRE_M44_Lykoi_AA_mag", "OPTRE_M44_Lykoi_AA_mag"], [], ""],
    ["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_AA_mag", "OPTRE_M44_Lykoi_AA_mag"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["UNSCMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["C7_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["C12_Remote_Mag","M168_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", ["OPTRE_c7_remote_throwable_sticky_mag"]];
_loadoutData set ["antiInfantryGrenades", ["OPTRE_M9_Frag"]];
_loadoutData set ["smokeGrenades", ["OPTRE_M2_Smoke"]];
_loadoutData set ["signalsmokeGrenades", [
    "OPTRE_M2_Smoke_Blue",
    "OPTRE_M2_Smoke_Green",
    "OPTRE_M2_Smoke_Orange",
    "OPTRE_M2_Smoke_Purple",
    "OPTRE_M2_Smoke_Red",
    "OPTRE_M2_Smoke_Yellow",
    "OPTRE_M8_Flare_Blue",
    "OPTRE_M8_Flare_Green",
    "OPTRE_M8_Flare",
    "OPTRE_M8_Flare_White",
    "OPTRE_M8_Flare_Yellow"
]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["OPTRE_NVG_UL","OPTRE_NVG_HURS_CNM","OPTRE_NVG_HURS_HUL","OPTRE_NVG_UA_CNM","OPTRE_NVG_UA_HUL","OPTRE_NVG_UA_HURS","OPTRE_NVG_UA_HURS_CNM","OPTRE_NVG_UA_HURS_HUL","OPTRE_NVG_UA_UL","OPTRE_NVG_UA_UL_CNM","OPTRE_NVG_UA","OPTRE_NVG_Visor"]];
_loadoutData set ["slNVGs", ["OPTRE_NVG_CNM","OPTRE_NVG_HUL3","OPTRE_NVG_HUL3_Gray","OPTRE_NVG_HURS","OPTRE_NVG_HUL_UAB_HURS","OPTRE_NVG_UAB_CNM","OPTRE_NVG_UAB_HUL","OPTRE_NVG_UAB_HURS","OPTRE_NVG_UAB_UL","OPTRE_NVG_UAB_UL_CNM","OPTRE_NVG_UAB_UL_HUL","OPTRE_NVG_UL_CNM","OPTRE_NVG_UL_HUL","OPTRE_NVG_UAB","OPTRE_NVG_Visor"]];
_loadoutData set ["sniNVGs", ["OPTRE_NVG_HUL_MVI_HURS","OPTRE_NVG_MVI","OPTRE_NVG_MVI_CNM","OPTRE_NVG_MVI_HUL","OPTRE_NVG_MVI_HURS","OPTRE_NVG_MVI_UL","OPTRE_NVG_MVI_UL_CNM","OPTRE_NVG_MVI_UL_HUL","OPTRE_NVG_Visor"]];
_loadoutData set ["binoculars", ["OPTRE_Binoculars"]];
_loadoutData set ["rangefinders", ["OPTRE_Smartfinder"]];

_loadoutData set ["traitorUniforms", ["OPTRE_UNSC_Army_Uniform_R_BLK"]];
_loadoutData set ["traitorVests", ["OPTRE_UNSC_M52A_Armor_Breacher_URB", "OPTRE_UNSC_M52A_Armor1_URB"]];
_loadoutData set ["traitorHats", ["OPTRE_UNSC_CH252_Helmet_URB"]];

_loadoutData set ["officerUniforms", ["OPTRE_UNSC_Army_Uniform_BLKURB"]];
_loadoutData set ["officerVests", ["OPTRE_UNSC_M52A_Armor_Sniper_URB", "V_Rangemaster_belt"]];
_loadoutData set ["officerHats", ["OPTRE_PatrolCap_Navy"]];

_loadoutData set ["unarmedUniforms", ["OPTRE_UNSC_Army_Uniform_T2_OLI", "OPTRE_UNSC_PT_ODST_Uniform", "OPTRE_UNSC_PT_Uniform"]];
_loadoutData set ["unarmedVests", ["OPTRE_UNSC_M52A_Armor_SoftD", 1, "OPTRE_UNSC_M52A_Armor_SoftDK", 1, "OPTRE_UNSC_M52A_Armor_Soft", 1, "", 4]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["sniUniforms", []];
_loadoutData set ["medUniforms", []];
_loadoutData set ["atVests", []];
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
_loadoutData set ["medBackpacks", []];
_loadoutData set ["mgBackpacks", []];
_loadoutData set ["sniBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["athelmets", []];
_loadoutData set ["enghelmets", []];
_loadoutData set ["glhelmets", []];
_loadoutData set ["medhelmets", []];
_loadoutData set ["mghelmets", []];
_loadoutData set ["slHat", ["OPTRE_UNSC_CH252_Helmet_Vacuum"]]; //?
_loadoutData set ["sniHats", ["OPTRE_UNSC_CH252_Helmet2_Vacuum"]];

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

_loadoutData set ["glasses", ["OPTRE_EyePiece","OPTRE_HUD_blk_Glasses","OPTRE_HUD_b_Glasses","OPTRE_HUD_g_Glasses","OPTRE_HUD_Glasses","OPTRE_HUD_p_Glasses","OPTRE_HUD_r_Glasses","OPTRE_HUD_w_Glasses","OPTRE_Glasses_Visor","OPTRE_Glasses_Visor_Blue",""]];
_loadoutData set ["goggles", ["OPTRE_Glasses_Cigar","OPTRE_Glasses_Cigarette"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["OPTRE_MJOLNIR_Undersuit"]];
_sfLoadoutData set ["slUniforms", ["OPTRE_FC_MJOLNIR_MKVI_Undersuit"]];
_sfLoadoutData set ["sniUniforms", ["OPTRE_FC_MJOLNIR_MKVI_Undersuit"]];
_sfLoadoutData set ["vests", [
    #include "MJOLNIR_variants\spartan_3.sqf",
    "OPTRE_MJOLNIR_Mk4Armor_Blue",0.01,
    "OPTRE_MJOLNIR_Mk4Armor_Red",0.01,
    "OPTRE_MJOLNIR_MkVBArmor_Default_Blue",0.01,
    "OPTRE_MJOLNIR_MkVBArmor_Default_Red",0.01,
    "OPTRE_MJOLNIR_MkVBArmor_Blue",0.01,
    "OPTRE_MJOLNIR_MkVBArmor_Red",0.01
]];
_sfLoadoutData set ["slVests", [
    #include "MJOLNIR_variants\spartan_2.sqf",
    "OPTRE_FC_MJOLNIR_MKV_Armor_Caboose",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Church",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Donut",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Simmons",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Night",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Grif",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Sarge",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Tucker",0.01
]];
_sfLoadoutData set ["sniVests", [
    #include "MJOLNIR_variants\spartan_2.sqf",
    "OPTRE_FC_MJOLNIR_MKV_Armor_Caboose",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Church",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Donut",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Simmons",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Night",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Grif",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Sarge",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Armor_Tucker",0.01
]];
_sfLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black_Spartan"]];
_sfLoadoutData set ["slBackpacks", ["OPTRE_ANPRC_515_Spartan","OPTRE_ANPRC_521_Black_Spartan","OPTRE_ANPRC_521_Green_Spartan","OPTRE_ANPRC_521_Tan_Spartan"]];
_sfLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy_Spartan"]];
_sfLoadoutData set ["medBackpacks", ["OPTRE_ILCS_Rucksack_Medical_Spartan"]];
_sfLoadoutData set ["mgBackpacks", ["OPTRE_ILCS_Rucksack_Heavy_Spartan"]];
_sfLoadoutData set ["sniBackpacks", ["OPTRE_ILCS_Rucksack_Black_Spartan"]];
_sfLoadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515_Spartan","OPTRE_ANPRC_521_Black_Spartan","OPTRE_ANPRC_521_Green_Spartan","OPTRE_ANPRC_521_Tan_Spartan"]];
_sfLoadoutData set ["helmets", [
    "OPTRE_MJOLNIR_EVAHelmet",1,
    "OPTRE_MJOLNIR_EVAHelmet_Emily",0.5,
    "OPTRE_MJOLNIR_Mk4Helmet",1,
    "OPTRE_MJOLNIR_CQB",1,
    "OPTRE_MJOLNIR_CQC",1,
    "OPTRE_MJOLNIR_EOD",1,
    "OPTRE_MJOLNIR_JFO",1,
    "OPTRE_MJOLNIR_Commando",1,
    "OPTRE_MJOLNIR_Commando_HUL3",1,
    "OPTRE_MJOLNIR_Commando_HUL3_UA",1,
    "OPTRE_MJOLNIR_Security",1,
    "OPTRE_MJOLNIR_Operator",1,
    "OPTRE_MJOLNIR_ODST",1,
    "OPTRE_MJOLNIR_Pilot",1,
    "OPTRE_MJOLNIR_Pilot_Haunted",0.01,
    "OPTRE_MJOLNIR_Pilot_UA",1,
    "OPTRE_MJOLNIR_Pilot_UA_HUL3",1,
    "OPTRE_MJOLNIR_MkVBHelmet",1,
    "OPTRE_MJOLNIR_MkVBHelmet_UA",1,
    "OPTRE_MJOLNIR_MkVBHelmet_UA_HUL",1,
    "OPTRE_MJOLNIR_MkVBHelmet_BLKV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_BLUV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_DefaultV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_SLVV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_Black",1,
    "OPTRE_MJOLNIR_MkVBHelmet_Black_BlackV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_Black_BlueV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_Black_DefaultV",1,
    "OPTRE_MJOLNIR_MkVBHelmet_Black_SLVV",1,
    "OPTRE_MJOLNIR_Commando_BlackV",1,
    "OPTRE_MJOLNIR_Commando_BlackV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_Black",1,
    "OPTRE_MJOLNIR_Commando_Black_BlackV",1,
    "OPTRE_MJOLNIR_Commando_Black_BlackV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_Black_BlueV",1,
    "OPTRE_MJOLNIR_Commando_Black_BlueV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_Black_DefaultV",1,
    "OPTRE_MJOLNIR_Commando_Black_DefaultV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_Black_HUL3",1,
    "OPTRE_MJOLNIR_Commando_Black_SilverV",1,
    "OPTRE_MJOLNIR_Commando_Black_SilverV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_BlueV",1,
    "OPTRE_MJOLNIR_Commando_BlueV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_DefaultV",1,
    "OPTRE_MJOLNIR_Commando_DefaultV_HUL3",1,
    "OPTRE_MJOLNIR_Commando_SilverV",1,
    "OPTRE_MJOLNIR_Commando_SilverV_HUL3",1,
    "OPTRE_MJOLNIR_MkVI_HR",1,
    "OPTRE_MJOLNIR_Scout",1,
    "OPTRE_MJOLNIR_MPHelmet",1,
    "OPTRE_MJOLNIR_ReconHelmet",1,
    "OPTRE_MJOLNIR_ODST",1,
    "OPTRE_MJOLNIR_Mk4Helmet_Blue",0.01,
    "OPTRE_MJOLNIR_Mk4Helmet_Red",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Blue",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Blue_BlackV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Blue_BlueV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Blue_SilverV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Blue_DefaultV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Red",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Red_BlackV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Red_BlueV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Red_SilverV",0.01,
    "OPTRE_MJOLNIR_MkVBHelmet_Red_DefaultV",0.01,
    "OPTRE_MJOLNIR_Commando_Blue",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_BlackV",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_BlackV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_BlueV",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_BlueV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_DefaultV",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_DefaultV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_SilverV",0.01,
    "OPTRE_MJOLNIR_Commando_Blue_SilverV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Red",0.01,
    "OPTRE_MJOLNIR_Commando_Red_BlackV",0.01,
    "OPTRE_MJOLNIR_Commando_Red_BlackV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Red_BlueV",0.01,
    "OPTRE_MJOLNIR_Commando_Red_BlueV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Red_DefaultV",0.01,
    "OPTRE_MJOLNIR_Commando_Red_DefaultV_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Red_HUL3",0.01,
    "OPTRE_MJOLNIR_Commando_Red_SilverV",0.01,
    "OPTRE_MJOLNIR_Commando_Red_SilverV_HUL3",0.01
]];
_sfLoadoutData set ["slHat", [
    "OPTRE_FC_MJOLNIR_MKV_Helmet",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Freeman",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_117",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Black",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Olive",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Lopez",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Olive",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Tex",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Tan",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Caboose",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Church",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Donut",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Simmons",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Night",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Grif",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Sarge",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Tucker",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Caboose",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Lopez",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Church",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Donut",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Simmons",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_North",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Grif",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Doc",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Sarge",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_South",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Tucker",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Washington",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Kaikaina",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_York",0.01
]];
_sfLoadoutData set ["sniHats", [
    "OPTRE_FC_MJOLNIR_MKV_Helmet",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Freeman",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_117",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Black",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Olive",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EOD_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_EVA_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Lopez",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Olive",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Tex",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Tan",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Rogue_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Scout_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Olive_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Black_Helmet",1,
    "OPTRE_FC_MJOLNIR_Mark_VI_Security_Tan_Helmet",1,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Caboose",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Church",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Donut",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Simmons",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Night",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Grif",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Sarge",0.01,
    "OPTRE_FC_MJOLNIR_MKV_Helmet_Tucker",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Caboose",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Lopez",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Church",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Donut",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Simmons",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_North",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Grif",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Doc",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Sarge",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_South",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Tucker",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Washington",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_Kaikaina",0.01,
    "OPTRE_FC_MJOLNIR_Mark_VI_Helmet_York",0.01
]];
_sfLoadoutData set ["sniNVGs", ["OPTRE_NVG_UA_Spartan","OPTRE_NVG_UAB_Spartan","OPTRE_FC_NVG","OPTRE_FC_NVG"]];
_sfLoadoutData set ["slNVGs", ["OPTRE_NVG_UA_Spartan","OPTRE_NVG_UAB_Spartan","OPTRE_FC_NVG","OPTRE_FC_NVG"]];
_sfLoadoutData set ["NVGs", ["OPTRE_NVG_UA_Spartan","OPTRE_NVG_UAB_Spartan","OPTRE_FC_NVG","OPTRE_FC_NVG"]];
_sfLoadoutData set ["glasses", ["OPTRE_CBRN_S2", 1, "", 3]];
_sfLoadoutData set ["goggles", []];

private _sfoptics = [
    "OPTRE_BR_Classic_Scope",
    "OPTRE_BR_Classic_Scope_Raised",
    "OPTRE_BR_Classic_Scope_UNSC_Raised",
    "OPTRE_BR_Classic_Scope_UNSC",
    "OPTRE_BR_Classic_Scope_SLS",
    "OPTRE_BR_Classic_Scope_SLS_UNSC",
    "OPTRE_BR_Classic_Scope_SLS_Raised",
    "OPTRE_BR_Classic_Scope_SLS_UNSC_Raised",
    "OPTRE_BR45_Scope",
    "OPTRE_BR55HB_Scope",
    "OPTRE_BR55HB_Scope_Grey",
    "OPTRE_M392_Scope",
    "OPTRE_M393_Scope",
    "OPTRE_M393_ACOG",
    "OPTRE_BMR_Scope",
    "OPTRE_M6C_Scope",
    "OPTRE_M739_SAW_Smartlink",
    "OPTRE_SRM_Sight"
];
private _sfopticsShort = [
    "Optre_Evo_Sight_Riser",
    "Optre_Evo_Sight_Riser_Spartan",
    "Optre_Evo_Sight",
    "Optre_Evo_Sight_Spartan",
    "OPTRE_M12_Optic",
    "OPTRE_M12_Optic_Green",
    "OPTRE_M12_Optic_Red",
    "OPTRE_M7_Sight",
    "OPTRE_MA5_BUIS",
    "Optre_Recon_Sight",
    "Optre_Recon_Sight_Green",
    "Optre_Recon_Sight_Red",
    "Optre_Recon_Sight_UNSC",
    "OPTRE_SLS_M_3B",
    "OPTRE_SLS_M_3B_UNSC",
    "OPTRE_M393_EOTECH"
];
private _sniperOptics = [];
private _sfrail = ["OPTRE_M12_Laser","OPTRE_M6C_Vis_Red_Laser","OPTRE_M6C_Laser","OPTRE_M6G_Laser","OPTRE_M6G_Vis_Red_Laser","OPTRE_M7_Laser","OPTRE_BMR_Laser"];
private _sfmuzzle = ["OPTRE_M12_Suppressor","OPTRE_M26_LMG_Suppressor","OPTRE_M393_Suppressor","OPTRE_M6_silencer","OPTRE_M6C_compensator","OPTRE_M7_silencer","OPTRE_MA37KSuppressor","OPTRE_MA5Suppressor"];
private _m26grip = ["OPTRE_M26_AFG_Bipod","OPTRE_M26_Grippod_Bipod",""];
_sfLoadoutData set ["slRifles", [
    ["OPTRE_BR37", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_AP", "OPTRE_10RND_338_VLD"], [], ""],
    ["OPTRE_BR45_Black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_M45TAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45E", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45ATAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M90A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_MA32", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Black", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Red", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Tan", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_M26_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], _m26grip],
    ["OPTRE_M26_Shotgun_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["OPTRE_12Rnd_12Gauge_Pellets","OPTRE_12Rnd_12Gauge_Smoke","OPTRE_12Rnd_12Gauge_HE"], ""],
    ["OPTRE_M295_BMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Desert", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Woodland", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M58S", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_42Rnd_95x40_Mag", "OPTRE_42Rnd_95x40_Mag_Tracer", "OPTRE_42Rnd_95x40_Mag_Tracer_Yellow"], [], ""],
    ["OPTRE_MA5B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5C", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    //GL 
    ["OPTRE_M319", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_BR45GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_M26_GL_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5CGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_FC_Railgun", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug"], [], ""]
]]; 
_sfLoadoutData set ["rifles", [
    ["OPTRE_BR37", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_AP", "OPTRE_10RND_338_VLD"], [], ""],
    ["OPTRE_BR45_Black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_M45TAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45E", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45ATAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M90A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_MA32", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Black", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Red", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Tan", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_M26_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], _m26grip],
    ["OPTRE_M26_Shotgun_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["OPTRE_12Rnd_12Gauge_Pellets","OPTRE_12Rnd_12Gauge_Smoke","OPTRE_12Rnd_12Gauge_HE"], ""],
    ["OPTRE_M295_BMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Desert", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Woodland", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M58S", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_42Rnd_95x40_Mag", "OPTRE_42Rnd_95x40_Mag_Tracer", "OPTRE_42Rnd_95x40_Mag_Tracer_Yellow"], [], ""],
    ["OPTRE_MA5B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5C", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""]
]];
private _sfm6Rail = ["OPTRE_M6D_Carbine_IR","OPTRE_M6D_Carbine_Vis_Red"];
_sfLoadoutData set ["carbines", [
    ["OPTRE_M6D_Carbine_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Black_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Black_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Desert_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Desert_Tracer", "OPTRE_26Rnd_127x40_Mag_Desert_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Desert_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Desert_Tracer", "OPTRE_26Rnd_127x40_Mag_Desert_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Jungle_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Jungle_Tracer", "OPTRE_26Rnd_127x40_Mag_Jungle_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Jungle_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Jungle_Tracer", "OPTRE_26Rnd_127x40_Mag_Jungle_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_MA37K", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5K", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer", "OPTRE_32Rnd_762x51_Mag_UW"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_M319", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_BR45GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_M26_GL_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5CGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_FC_Railgun", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["OPTRE_M7", "OPTRE_M7_silencer", _sfrail, _sfopticsShort, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""],
    ["OPTRE_M12_SOC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_64Rnd_57x31_Mag", "OPTRE_64Rnd_57x31_Mag_Tracer_Yellow", "OPTRE_64Rnd_57x31_Mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["OPTRE_M247A1", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box", "OPTRE_200Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],1,
    ["OPTRE_M247A1", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_400Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],1,
    ["OPTRE_M247", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_762x51_Box", "OPTRE_100Rnd_762x51_Box_Tracer_Yellow","OPTRE_100Rnd_762x51_Box_Tracer"], [], ""],1,
    ["OPTRE_M247", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_400Rnd_762x51_Box_Tracer"], [], ""],1,
    ["OPTRE_M250", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box"], [], "OPTRE_M250_Bipod"],1,
    ["OPTRE_M250_Gold", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box"], [], "OPTRE_M250_Bipod"],0.01,
    ["OPTRE_M73", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box_Tracer_Yellow", "OPTRE_100Rnd_95x40_Box_Tracer"], [], ""],1,
    ["OPTRE_M73", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_95x40_Box", "OPTRE_200Rnd_95x40_Box_Tracer_Yellow"], [], ""],1,
    ["OPTRE_AIE_486H_Minigun_MMG_Weapon", "OPTRE_M6C_Scope", _sfrail, "", ["OPTRE_AIE_1000Rnd_762x51_M118_Belt_Tracer_Red", "OPTRE_AIE_1000Rnd_762x51_M80_Belt_Tracer_Red", "OPTRE_AIE_1000Rnd_762x51_Mismatch1", "OPTRE_AIE_1000Rnd_762x51_Mismatch2"], [], ""],1,
    ["OPTRE_M247H_Etilka", "OPTRE_M6C_Scope", _sfrail, "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball", "OPTRE_200Rnd_127x99_M247H_Etilka"], [], ""],1,
    ["OPTRE_M247H_Shield_Etilka", "OPTRE_M6C_Scope", _sfrail, "", ["OPTRE_200Rnd_127x99_M247H_Etilka_Ball", "OPTRE_200Rnd_127x99_M247H_Etilka"], [], ""],1,
    ["OPTRE_M26_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_80Rnd_762x51_Mag", "OPTRE_80Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_80Rnd_762x51_Mag_Tracer"], [], _m26grip],1,
    ["OPTRE_M739_SAW_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_128rnd_Drum", "OPTRE_M739_SAW_128rnd_Drum"], [], ""],1,
    ["OPTRE_M739_SAW_Black_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_SLAP_72rnd_Drum", "OPTRE_M739_SAW_SLAP_72rnd_Drum", "OPTRE_M739_SAW_SLAP_72rnd_Drum"], [], ""],1,
    ["OPTRE_M739_SAW_Foregrip_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_192rnd_Box", "OPTRE_M739_SAW_192rnd_Box"], [], ""],1,
    ["OPTRE_M739_SAW_Foregrip_Black_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_Shredder_72rnd_Drum", "OPTRE_M739_SAW_Shredder_72rnd_Drum", "OPTRE_M739_SAW_Shredder_72rnd_Drum", "OPTRE_M739_SAW_HE_72rnd_Drum"], [], ""],1
]];
_sfLoadoutData set ["marksmanRifles", [
    ["OPTRE_M392_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393S_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Desert", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Woodland", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["OPTRE_SRM77_S1", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Green", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Red", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S2", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Green", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Red", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRS99C", _sfmuzzle, _sfrail, "OPTRE_SRS99C_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_HVAP_Mag","OPTRE_4Rnd_145x114_HEDP_Mag"], [], ""],
    ["OPTRE_SRS99D", "OPTRE_SRS99D_Suppressor", _sfrail, "OPTRE_SRS99_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_HVAP_Mag_D","OPTRE_4Rnd_145x114_HEDP_Mag_D"], [], ""],
    ["OPTRE_M99A2S3", "", "", "", ["OPTRE_7Rnd_20mm_APFSDS_Mag","OPTRE_7Rnd_20mm_APFSDS_Mag","OPTRE_7Rnd_20mm_APFSDS_Mag","OPTRE_7Rnd_20mm_HEDP_Mag"], [], ""]
]];
private _sfm6MScope = ["OPTRE_M6D_Scope","OPTRE_M6D_Scope_Black"];
private _sfm6MRail = ["OPTRE_M6D_IR_Laser","OPTRE_M6D_IR_Black","OPTRE_M6D_IR_Desert","OPTRE_M6D_IR_Jungle","OPTRE_M6D_Vis_Red_Laser","OPTRE_M6D_Vis_Red_Black","OPTRE_M6D_Vis_Red_Jungle","OPTRE_M6D_Vis_Red_Desert"];
_sfLoadoutData set ["sidearms", [
    ["OPTRE_M319M", "", "", "", ["M319_HE_Grenade_Shell","M319_Buckshot"], [], ""],
    ["OPTRE_M319s", "", "", "", ["OPTRE_3Rnd_Smoke_Grenade_shell","M319_Smoke","OPTRE_signalSmokeR"], [], ""],
    ["OPTRE_M6B", "OPTRE_M6_silencer", _sfrail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6C", "OPTRE_M6_silencer", _sfrail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6G", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Black", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Jungle", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Desert", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M7_Folded", "OPTRE_M7_silencer", _sfrail, _sfopticsShort, ["OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""],
    ["optre_hgun_comet_F", "OPTRE_MA5Suppressor", _sfrail, _sfopticsShort, ["4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull"], [], ""],
    ["optre_hgun_sas10_F", "OPTRE_M6_silencer", _sfrail, _sfopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""],
    ["optre_hgun_sas10_Jungle_F", "OPTRE_M6_silencer", _sfrail, _sfopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""],
    ["optre_hgun_sas10_desert_F", "OPTRE_M6_silencer", _sfrail, _sfopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""]
]];

_sfLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_sfLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
/* if (["MA_Armor"] call A3U_fnc_hasAddon) then {
    _eliteLoadoutData set ["uniforms", ["MA_M56S_BDU"]];
    _eliteLoadoutData set ["slUniforms", ["MA_M56S_BDU"]];
    _eliteLoadoutData set ["vests", ["MA_M56R_Vest"]];
    _eliteLoadoutData set ["mgVests", ["MA_M56R_CQB_Vest"]];
    _eliteLoadoutData set ["medVests", ["MA_M56S_Medic_Vest"]];
    _eliteLoadoutData set ["slVests", ["MA_M56S_Vest"]];
    _eliteLoadoutData set ["glVests", ["MA_M56_CustomVest_1"]];
    _eliteLoadoutData set ["engVests", ["MA_M56R_Vest_ODST_Radio"]];
    _eliteLoadoutData set ["backpacks", ["MA_M56S_Rucksack"]];
    _eliteLoadoutData set ["slBackpacks", ["MA_M56S_Rucksack_ODST_Radio"]];
    _eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
    _eliteLoadoutData set ["helmets", ["MA_M56SR_Helmet_Black_Visor", "MA_M56SH_Helmet_Black_Visor"]];
    _eliteLoadoutData set ["sniHats", ["MA_M56A_Helmet_Red_Visor"]];
} else {
    _eliteLoadoutData set ["uniforms", ["OPTRE_UNSC_ODST_Uniform"]];
    _eliteLoadoutData set ["slUniforms", ["OPTRE_UNSC_ODST_Uniform"]];
    _eliteLoadoutData set ["vests", ["OPTRE_UNSC_M52D_Armor"]];
    _eliteLoadoutData set ["mgVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["medVests", ["OPTRE_UNSC_M52D_Armor_Medic"]];
    _eliteLoadoutData set ["slVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["glVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["engVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
    _eliteLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black"]];
    _eliteLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Medical"]];
    _eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
    _eliteLoadoutData set ["helmets", ["OPTRE_UNSC_CH252D_Helmet"]];
    _eliteLoadoutData set ["sniHats", ["OPTRE_UNSC_CH252A_Black_Helmet"]]; 
}; */

_eliteLoadoutData set ["uniforms", ["OPTRE_UNSC_ODST_Uniform",2,"OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",2,"OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",2,"OPTRE_UNSC_Army_Uniform_T_BLK_SlimLeg",1,"OPTRE_UNSC_Army_Uniform_T2_BLK_SlimLeg",1]];
_eliteLoadoutData set ["sniUniforms", ["OPTRE_UNSC_ODST_Uniform",2,"OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",2,"OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",2,"OPTRE_UNSC_Army_Uniform_T_BLK_SlimLeg",1,"OPTRE_UNSC_Army_Uniform_T2_BLK_SlimLeg",1]];
_eliteLoadoutData set ["medUniforms", ["OPTRE_UNSC_ODST_Uniform",2,"OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",2,"OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",2,"OPTRE_UNSC_Army_Uniform_T_BLK_SlimLeg",1,"OPTRE_UNSC_Army_Uniform_T2_BLK_SlimLeg",1]];
_eliteLoadoutData set ["vests", ["OPTRE_UNSC_M52D_Armor","OPTRE_UNSC_M52D_Armor_Scout"]];
_eliteLoadoutData set ["mgVests", ["OPTRE_UNSC_M52D_Armor_Rifleman"]];
_eliteLoadoutData set ["medVests", ["OPTRE_UNSC_M52D_Armor_Medic"]];
_eliteLoadoutData set ["glVests", ["OPTRE_UNSC_M52D_Armor_Demolitions"]];
_eliteLoadoutData set ["engVests", ["OPTRE_UNSC_M52D_Armor_Demolitions"]];
_eliteLoadoutData set ["atVests", ["OPTRE_UNSC_M52D_Armor_Demolitions"]];
_eliteLoadoutData set ["sniVests", ["OPTRE_UNSC_M52D_Armor_Marksman","OPTRE_UNSC_M52D_Armor_Sniper"]];
_eliteLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black"]];
_eliteLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Black"]];
_eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["medBackpacks", ["OPTRE_ILCS_Rucksack_Medical"]];
_eliteLoadoutData set ["mgBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["sniBackpacks", ["OPTRE_ILCS_Rucksack_Black"]];
_eliteLoadoutData set ["helmets", ["OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_CH252D_Helmet_Stripes"]];
_eliteLoadoutData set ["sniHats", ["OPTRE_UNSC_Recon_Helmet"]];
_eliteLoadoutData set ["athelmets", ["OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_CH252D_Helmet_Stripes"]];
_eliteLoadoutData set ["enghelmets", ["OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_CH252D_Helmet_Stripes"]];
_eliteLoadoutData set ["glhelmets", ["OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_CH252D_Helmet_Stripes"]];
_eliteLoadoutData set ["medhelmets", ["OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_CH252D_Helmet_Stripes"]];
_eliteLoadoutData set ["mghelmets", ["OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_CH252D_Helmet_Stripes"]];

_eliteLoadoutData set ["slUniforms", ["OPTRE_MJOLNIR_Undersuit"]]; //noble 6 or what
_eliteLoadoutData set ["slVests", ["OPTRE_UNSC_M52D_Armor_Spartan", 1,"OPTRE_MJOLNIR_MkVBArmor_Default_Black", 3,"OPTRE_MJOLNIR_MkVBArmor_Black", 3]];
_eliteLoadoutData set ["slBackpacks", ["OPTRE_ANPRC_515_Spartan","OPTRE_ANPRC_521_Black_Spartan","OPTRE_ILCS_Rucksack_Black_Spartan","OPTRE_S12_SOLA_Jetpack_Spartan",""]];
_eliteLoadoutData set ["slHat", ["OPTRE_MJOLNIR_MkVBHelmet_Black","OPTRE_MJOLNIR_MkVBHelmet_Black_BlackV","OPTRE_MJOLNIR_MkVBHelmet_Black_BlueV","OPTRE_MJOLNIR_MkVBHelmet_Black_DefaultV","OPTRE_MJOLNIR_MkVBHelmet_Black_SLVV"]];

_eliteLoadoutData set ["slRifles", [
    ["OPTRE_BR45_Black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_M45TAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45E", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45ATAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M90A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_MA32", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Black", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Red", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Tan", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_M26_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], _m26grip],
    ["OPTRE_M26_Shotgun_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["OPTRE_12Rnd_12Gauge_Pellets","OPTRE_12Rnd_12Gauge_Smoke","OPTRE_12Rnd_12Gauge_HE"], ""],
    ["OPTRE_M295_BMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Desert", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Woodland", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M58S", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_42Rnd_95x40_Mag", "OPTRE_42Rnd_95x40_Mag_Tracer", "OPTRE_42Rnd_95x40_Mag_Tracer_Yellow"], [], ""],
    ["OPTRE_MA5B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5C", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    //GL
    ["OPTRE_M319", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_BR45GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_M26_GL_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5CGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_FC_Railgun", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug"], [], ""]
]]; 
_eliteLoadoutData set ["rifles", [
    ["OPTRE_BR45_Black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Desert", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Green", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_M45TAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45E", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45ATAC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M90A", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_MA32", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Black", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Red", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Tan", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_M26_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], _m26grip],
    ["OPTRE_M26_Shotgun_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["OPTRE_12Rnd_12Gauge_Pellets","OPTRE_12Rnd_12Gauge_Smoke","OPTRE_12Rnd_12Gauge_HE"], ""],
    ["OPTRE_M295_BMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Desert", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Woodland", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M58S", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_42Rnd_95x40_Mag", "OPTRE_42Rnd_95x40_Mag_Tracer", "OPTRE_42Rnd_95x40_Mag_Tracer_Yellow"], [], ""],
    ["OPTRE_MA5B", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5C", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["OPTRE_M6D_Carbine_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Black_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Black_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Jungle_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Jungle_Tracer", "OPTRE_26Rnd_127x40_Mag_Jungle_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Jungle_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Jungle_Tracer", "OPTRE_26Rnd_127x40_Mag_Jungle_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_MA37K", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5K", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer", "OPTRE_32Rnd_762x51_Mag_UW"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_M319", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_BR45GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_M26_GL_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_60Rnd_762x51_Mag", "OPTRE_60Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_60Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5CGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_FC_Railgun", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug", "OPTRE_FC_Railgun_Slug"], [], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["OPTRE_M7", "OPTRE_M7_silencer", _sfrail, _sfopticsShort, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""],
    ["OPTRE_M12_SOC", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_64Rnd_57x31_Mag", "OPTRE_64Rnd_57x31_Mag_Tracer_Yellow", "OPTRE_64Rnd_57x31_Mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["OPTRE_M247A1", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box", "OPTRE_200Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_400Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_762x51_Box", "OPTRE_100Rnd_762x51_Box_Tracer_Yellow","OPTRE_100Rnd_762x51_Box_Tracer"], [], ""],
    ["OPTRE_M247", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_400Rnd_762x51_Box_Tracer"], [], ""],
    ["OPTRE_M250", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box"], [], "OPTRE_M250_Bipod"],
    ["OPTRE_M73", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box_Tracer_Yellow", "OPTRE_100Rnd_95x40_Box_Tracer"], [], ""],
    ["OPTRE_M73", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_95x40_Box", "OPTRE_200Rnd_95x40_Box_Tracer_Yellow"], [], ""],
    ["OPTRE_M26_F", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_80Rnd_762x51_Mag", "OPTRE_80Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_80Rnd_762x51_Mag_Tracer"], [], _m26grip],
    ["OPTRE_M739_SAW_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_128rnd_Drum", "OPTRE_M739_SAW_128rnd_Drum"], [], ""],
    ["OPTRE_M739_SAW_Black_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_SLAP_72rnd_Drum", "OPTRE_M739_SAW_SLAP_72rnd_Drum", "OPTRE_M739_SAW_SLAP_72rnd_Drum"], [], ""],
    ["OPTRE_M739_SAW_Foregrip_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_192rnd_Box", "OPTRE_M739_SAW_192rnd_Box"], [], ""],
    ["OPTRE_M739_SAW_Foregrip_Black_F", "", _sfrail, _sfoptics, ["OPTRE_M739_SAW_Shredder_72rnd_Drum", "OPTRE_M739_SAW_Shredder_72rnd_Drum", "OPTRE_M739_SAW_Shredder_72rnd_Drum", "OPTRE_M739_SAW_HE_72rnd_Drum"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["OPTRE_M392_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393S_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Desert", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M295_BMR_Woodland", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_AP_Mag", "OPTRE_25Rnd_762x51_AP_Mag_Tracer", "OPTRE_25Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_25Rnd_762x51_Mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["OPTRE_SRM77_S1", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Green", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Red", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S2", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Green", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Red", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRS99C", _sfmuzzle, _sfrail, "OPTRE_SRS99C_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_HVAP_Mag","OPTRE_4Rnd_145x114_HEDP_Mag"], [], ""],
    ["OPTRE_SRS99D", "OPTRE_SRS99D_Suppressor", _sfrail, "OPTRE_SRS99_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_HVAP_Mag_D","OPTRE_4Rnd_145x114_HEDP_Mag_D"], [], ""],
    ["OPTRE_M99A2S3", "", "", "", ["OPTRE_7Rnd_20mm_APFSDS_Mag","OPTRE_7Rnd_20mm_APFSDS_Mag","OPTRE_7Rnd_20mm_APFSDS_Mag","OPTRE_7Rnd_20mm_HEDP_Mag"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["OPTRE_M319M", "", "", "", ["M319_HE_Grenade_Shell","M319_Buckshot"], [], ""],
    ["OPTRE_M319s", "", "", "", ["OPTRE_3Rnd_Smoke_Grenade_shell","M319_Smoke","OPTRE_signalSmokeR"], [], ""],
    ["OPTRE_M6B", "OPTRE_M6_silencer", _sfrail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6C", "OPTRE_M6_silencer", _sfrail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6G", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Black", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M7_Folded", "OPTRE_M7_silencer", _sfrail, _sfopticsShort, ["OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""],
    ["optre_hgun_comet_F", "OPTRE_MA5Suppressor", _sfrail, _sfopticsShort, ["4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull"], [], ""],
    ["optre_hgun_sas10_F", "OPTRE_M6_silencer", _sfrail, _sfopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""]
]];

_eliteLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_eliteLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", [
    "OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_BLK",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform_R",
    "OPTRE_UNSC_Marine_Uniform_R",
    "OPTRE_UNSC_Army_Uniform_R_OLI",
    "OPTRE_UNSC_Army_Uniform_S_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_S_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_S_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_BLK",
    "OPTRE_UNSC_Army_Uniform_S_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform_S",
    "OPTRE_UNSC_Marine_Uniform_S",
    "OPTRE_UNSC_Army_Uniform_S_OLI",
    "OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_OLI_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T3_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_T_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_T_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_T3_BLK_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T2_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T3",
    "OPTRE_UNSC_Army_Uniform_T_OLI",
    "OPTRE_UNSC_Army_Uniform_T_BLK",
    "OPTRE_UNSC_Army_Uniform_T3_BLK",
    "OPTRE_UNSC_Marine_Uniform_T2",
    "OPTRE_UNSC_Marine_Uniform_T",
    "OPTRE_UNSC_Army_Uniform_BLK",
    "OPTRE_UNSC_Army_Uniform_AFMAR",
    "OPTRE_UNSC_Marine_Uniform"
]];
_militaryLoadoutData set ["slUniforms", [
    "OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_BLK",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform_R",
    "OPTRE_UNSC_Marine_Uniform_R",
    "OPTRE_UNSC_Army_Uniform_R_OLI",
    "OPTRE_UNSC_Airforce_Uniform_S",
    "OPTRE_UNSC_Marine_Uniform_S",
    "OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_BLK",
    "OPTRE_UNSC_Army_Uniform_AFMAR",
    "OPTRE_UNSC_Marine_Uniform"
]];
_militaryLoadoutData set ["sniUniforms", [
    "OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_BLK",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform_R",
    "OPTRE_UNSC_Marine_Uniform_R",
    "OPTRE_UNSC_Army_Uniform_R_OLI",
    "OPTRE_UNSC_Airforce_Uniform_S",
    "OPTRE_UNSC_Marine_Uniform_S",
    "OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_BLK",
    "OPTRE_UNSC_Army_Uniform_AFMAR",
    "OPTRE_UNSC_Marine_Uniform"
]];
_militaryLoadoutData set ["vests", [
    "OPTRE_UNSC_M52A_Armor1_DES",
    "OPTRE_UNSC_M52A_Armor1_MAR",
    "OPTRE_UNSC_M52A_Armor1_OLI",
    "OPTRE_UNSC_M52A_Armor3_DES",
    "OPTRE_UNSC_M52A_Armor3_MAR",
    "OPTRE_UNSC_M52A_Armor3_OLI",
    "OPTRE_UNSC_M52A_Armor2_DES",
    "OPTRE_UNSC_M52A_Armor2_MAR",
    "OPTRE_UNSC_M52A_Armor2_OLI",
    "OPTRE_UNSC_M52A_Armor_Rifleman_DES",
    "OPTRE_UNSC_M52A_Armor_Rifleman_MAR",
    "OPTRE_UNSC_M52A_Armor_Rifleman_OLI",
    "OPTRE_UNSC_M52A_Armor4_DES",
    "OPTRE_UNSC_M52A_Armor4_MAR",
    "OPTRE_UNSC_M52A_Armor4_OLI"
]];
_militaryLoadoutData set ["slVests", ["OPTRE_UNSC_M52A_Armor_TL_DES","OPTRE_UNSC_M52A_Armor_TL_MAR","OPTRE_UNSC_M52A_Armor_TL_OLI"]];
_militaryLoadoutData set ["mgVests", ["OPTRE_UNSC_M52A_Armor_MG_DES","OPTRE_UNSC_M52A_Armor_MG_MAR","OPTRE_UNSC_M52A_Armor_MG_OLI","OPTRE_UNSC_M52A_Armor_MG_TRO"]];
_militaryLoadoutData set ["medVests", ["OPTRE_UNSC_M52A_Armor_Corpsman_MAR","OPTRE_UNSC_M52A_Armor_Medic_DES","OPTRE_UNSC_M52A_Armor_Medic_OLI"]];
_militaryLoadoutData set ["glVests", ["OPTRE_UNSC_M52A_Armor_Grenadier_DES","OPTRE_UNSC_M52A_Armor_Grenadier_MAR","OPTRE_UNSC_M52A_Armor_Grenadier_OLI"]];
_militaryLoadoutData set ["engVests", ["OPTRE_UNSC_M52A_Armor_Breacher_DES","OPTRE_UNSC_M52A_Armor_Breacher_MAR","OPTRE_UNSC_M52A_Armor_Breacher_OLI"]];
_militaryLoadoutData set ["atVests", ["OPTRE_UNSC_M52A_Armor_Grenadier_DES","OPTRE_UNSC_M52A_Armor_Grenadier_MAR","OPTRE_UNSC_M52A_Armor_Grenadier_OLI"]];
_militaryLoadoutData set ["sniVests", ["OPTRE_UNSC_M52A_Armor_Marksman_DES","OPTRE_UNSC_M52A_Armor_Marksman_MAR","OPTRE_UNSC_M52A_Armor_Marksman_OLI","OPTRE_UNSC_M52A_Armor_Sniper_DES","OPTRE_UNSC_M52A_Armor_Sniper_MAR","OPTRE_UNSC_M52A_Armor_Sniper_OLI"]];

_militaryLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_militaryLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militaryLoadoutData set ["atBackpacks", ["OPTRE_Turret_Bag_Black"]];
_militaryLoadoutData set ["medBackpacks", ["OPTRE_UNSC_Rucksack_Medic"]];
_militaryLoadoutData set ["mgBackpacks", ["OPTRE_UNSC_Rucksack_Heavy"]];
_militaryLoadoutData set ["sniBackpacks", ["OPTRE_UNSC_Rucksack"]];

_militaryLoadoutData set ["helmets", [
    "OPTRE_UNSC_Watchcap","OPTRE_PatrolCap_Navy","OPTRE_UNSC_PatrolCap_Army","OPTRE_UNSC_PatrolCap_Marines",
    "OPTRE_UNSC_CH252_Helmet2_DES",
    "OPTRE_UNSC_CH252_Helmet2_MAR",
    "OPTRE_UNSC_CH252_Helmet2_OLI",
    "OPTRE_UNSC_CH252_Helmet_DES",
    "OPTRE_UNSC_CH252_Helmet_MAR",
    "OPTRE_UNSC_CH252_Helmet_OLI",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_DES",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_OLI",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_DES",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_MAR",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_OLI"
]];
_militaryLoadoutData set ["slHat", [
    "OPTRE_UNSC_Watchcap","OPTRE_PatrolCap_Navy","OPTRE_UNSC_PatrolCap_Army","OPTRE_UNSC_PatrolCap_Marines",
    "OPTRE_UNSC_CH252_Helmet2_DES",
    "OPTRE_UNSC_CH252_Helmet2_MAR",
    "OPTRE_UNSC_CH252_Helmet2_OLI",
    "OPTRE_UNSC_CH252_Helmet_DES",
    "OPTRE_UNSC_CH252_Helmet_MAR",
    "OPTRE_UNSC_CH252_Helmet_OLI",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_DES",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_OLI",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_DES",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_MAR",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_OLI"
]];
_militaryLoadoutData set ["sniHats", [
    "OPTRE_UNSC_CH252_Helmet3_DES",
    "OPTRE_UNSC_CH252_Helmet3_OLI"
]];
_militaryLoadoutData set ["medhelmets", [
    "OPTRE_UNSC_CH252_Helmet2_DES_MED",
    "OPTRE_UNSC_CH252_Helmet2_MAR_MED",
    "OPTRE_UNSC_CH252_Helmet2_OLI_MED",
    "OPTRE_UNSC_CH252_Helmet_DES_MED",
    "OPTRE_UNSC_CH252_Helmet_MAR_MED",
    "OPTRE_UNSC_CH252_Helmet_OLI_MED",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_DES_MED",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR_MED",
    "OPTRE_UNSC_CH252_Helmet2_Vacuum_OLI_MED",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_DES_MED",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_MAR_MED",
    "OPTRE_UNSC_CH252_Helmet_Vacuum_OLI_MED"
]];

private _militaryoptics = [
    "OPTRE_BR_Classic_Scope",
    "OPTRE_BR_Classic_Scope_Raised",
    "OPTRE_BR_Classic_Scope_UNSC_Raised",
    "OPTRE_BR_Classic_Scope_UNSC",
    "OPTRE_BR_Classic_Scope_SLS",
    "OPTRE_BR_Classic_Scope_SLS_UNSC",
    "OPTRE_BR_Classic_Scope_SLS_Raised",
    "OPTRE_BR_Classic_Scope_SLS_UNSC_Raised",
    "OPTRE_BR45_Scope",
    "OPTRE_BR55HB_Scope",
    "OPTRE_BR55HB_Scope_Grey",
    "OPTRE_M392_Scope",
    "OPTRE_M393_Scope",
    "OPTRE_M393_ACOG",
    "OPTRE_BMR_Scope"
];
private _militaryopticsShort = [
    "Optre_Evo_Sight_Riser",
    "Optre_Evo_Sight_Riser_Spartan",
    "Optre_Evo_Sight",
    "Optre_Evo_Sight_Spartan",
    "OPTRE_M12_Optic",
    "OPTRE_M12_Optic_Green",
    "OPTRE_M12_Optic_Red",
    "OPTRE_M7_Sight",
    "OPTRE_MA5_BUIS",
    "Optre_Recon_Sight",
    "Optre_Recon_Sight_Green",
    "Optre_Recon_Sight_Red",
    "Optre_Recon_Sight_UNSC",
    "OPTRE_SLS_M_3B",
    "OPTRE_SLS_M_3B_UNSC",
    "OPTRE_M393_EOTECH"
];
private _militaryrail = ["OPTRE_M45_Flashlight","OPTRE_M6G_Flashlight","OPTRE_M7_Flashlight"];
private _militarymuzzle = ["OPTRE_M26_LMG_Comp", ""];

_militaryLoadoutData set ["slRifles", [
    ["OPTRE_BR45_Black", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_M319", "", _militaryrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _militaryrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_M45TAC", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_M45", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_M45ATAC", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_M90A", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_MA32", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando", _militarymuzzle, _militaryrail, _militaryoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Black", _militarymuzzle, _militaryrail, _militaryoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Red", _militarymuzzle, _militaryrail, _militaryoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    ["OPTRE_Commando_Tan", _militarymuzzle, _militaryrail, _militaryoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    //GL
    ["OPTRE_BR45GL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_BR45GL_black", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA32GL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA37GL", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA5AGL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA37BGL", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA32BGL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["OPTRE_BR45_Black", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_M319", _militarymuzzle, _militaryrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", _militarymuzzle, _militaryrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_M45TAC", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_M45", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_M45ATAC", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_M90A", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_MA32", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["OPTRE_MA37K", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5K", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer", "OPTRE_32Rnd_762x51_Mag_UW"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_M319", "", _militaryrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _militaryrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_BR45GL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_BR45GL_black", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA32GL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA37GL", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA5AGL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA37BGL", _militarymuzzle, _militaryrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
    ["OPTRE_MA32BGL", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["OPTRE_M7", _militarymuzzle, _militaryrail, _militaryopticsShort, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["OPTRE_M247A1", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M250", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box"], [], "OPTRE_M250_Bipod"],
    ["OPTRE_M73", _militarymuzzle, _militaryrail, "OPTRE_M73_SmartLink", ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["OPTRE_M392_DMR", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow"], [], ""],
    ["OPTRE_M393_DMR", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow"], [], ""],
    ["OPTRE_M393S_DMR", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["OPTRE_SRS99C", _militarymuzzle, _militaryrail, "OPTRE_SRS99C_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_APFSDS_Mag"], [], ""],
    ["OPTRE_SRS99D", "", _militaryrail, "OPTRE_SRS99_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_APFSDS_Mag_D"], [], ""]
]];
private _military6MRail = ["OPTRE_M6D_Flashlight","OPTRE_M6D_Flashlight_Black"];
_militaryLoadoutData set ["sidearms", [
    ["OPTRE_M6B", "", _militaryrail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6C", "", _militaryrail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6G", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Black", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""]
]];

_militaryLoadoutData set ["lightATLaunchers", [
    ["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "OPTRE_M44_Lykoi_Laser", "", ["OPTRE_M44_Lykoi_HEAT_mag", "OPTRE_M44_Lykoi_HEAT_mag"], [], ""],
    ["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_HEAT_mag", "OPTRE_M44_Lykoi_HEAT_mag"], [], ""],
    ["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "OPTRE_M44_Lykoi_Laser", "", ["OPTRE_M44_Lykoi_HE_mag", "OPTRE_M44_Lykoi_HE_mag"], [], ""],
    ["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_HE_mag", "OPTRE_M44_Lykoi_HE_mag"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["OPTRE_CPD_Uniform", "OPTRE_CPD_Uniform_Rolled"]];
_policeLoadoutData set ["vests", ["OPTRE_Vest_CPD_Light", "OPTRE_Vest_CPD_Heavy"]];
_policeLoadoutData set ["helmets", ["OPTRE_CPD_Cap", 2, "OPTRE_CPD_Beret", 2, "OPTRE_CPD_CH251_DME", 1, "OPTRE_CPD_CH251P", 1]];

_policeLoadoutData set ["SMGs", [
    ["OPTRE_Bulldog_Riot_Shield_Urban", "", "", "", [], [], ""], 1,
    ["OPTRE_Comet_Riot_Shield_Urban", "", "", "", [], [], ""], 1,
    ["OPTRE_M6B_Riot_Shield_Urban", "", "", "", [], [], ""], 1,
    ["OPTRE_M6C_Riot_Shield_Urban", "", "", "", [], [], ""], 1,
    ["OPTRE_M6G_Riot_Shield_Urban", "", "", "", [], [], ""], 1,
    ["OPTRE_MA5K", "", "", "", [], [], ""], 10,
    ["OPTRE_M7", "", "", "", [], [], ""], 10
]];
_policeLoadoutData set ["sidearms", [
    ["OPTRE_M6B", "", "", "", [], [], ""],
    ["OPTRE_M6C", "", "", "", [], [], ""],
    ["OPTRE_M6D", "", "", "", [], [], ""],
    ["OPTRE_M6G", "", "", "", [], [], ""],
    ["OPTRE_M6D_Black", "", "", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", [
    "OPTRE_FC_Marines_Uniform",
    "OPTRE_FC_Marines_Uniform_L",
    "OPTRE_FC_Marines_Uniform_BLK_L",
    "OPTRE_FC_Marines_Uniform_BRN_L",
    "OPTRE_FC_Marines_Uniform_DES_L",
    "OPTRE_FC_Marines_Uniform_GRN_L",
    "OPTRE_FC_Marines_Uniform_WDL_L",
    "OPTRE_FC_Marines_Uniform_BLK",
    "OPTRE_FC_Marines_Uniform_BRN",
    "OPTRE_FC_Marines_Uniform_DES",
    "OPTRE_FC_Marines_Uniform_GRN",
    "OPTRE_FC_Marines_Uniform_WDL"
]];
_militiaLoadoutData set ["slUniforms", [
    "OPTRE_FC_Marines_Uniform",
    "OPTRE_FC_Marines_Uniform_BLK",
    "OPTRE_FC_Marines_Uniform_BRN",
    "OPTRE_FC_Marines_Uniform_DES",
    "OPTRE_FC_Marines_Uniform_GRN",
    "OPTRE_FC_Marines_Uniform_WDL"
]];
_militiaLoadoutData set ["sniUniforms", [
    "OPTRE_FC_Marines_Uniform",
    "OPTRE_FC_Marines_Uniform_BLK",
    "OPTRE_FC_Marines_Uniform_BRN",
    "OPTRE_FC_Marines_Uniform_DES",
    "OPTRE_FC_Marines_Uniform_GRN",
    "OPTRE_FC_Marines_Uniform_WDL"
]];
_militiaLoadoutData set ["vests", [
    "OPTRE_FC_M52B_Armor_Vest_DES",
    "OPTRE_FC_M52B_Armor_Rifleman_DES",
    "OPTRE_FC_M52B_Armor_Vest_BRN",
    "OPTRE_FC_M52B_Armor_Rifleman_BRN",
    "OPTRE_FC_M52B_Armor_Vest",
    "OPTRE_FC_M52B_Armor_Rifleman"
]];
_militiaLoadoutData set ["slVests", ["OPTRE_FC_M52B_Armor_TeamLeader_DES","OPTRE_FC_M52B_Armor_TeamLeader_BRN","OPTRE_FC_M52B_Armor_TeamLeader"]];
_militiaLoadoutData set ["mgVests", ["OPTRE_FC_M52B_Armor_Light_DES","OPTRE_FC_M52B_Armor_Light_BRN","OPTRE_FC_M52B_Armor_Light"]];
_militiaLoadoutData set ["medVests", ["OPTRE_FC_M52B_Armor_Vest_DES","OPTRE_FC_M52B_Armor_Vest_BRN","OPTRE_FC_M52B_Armor_Vest"]];
_militiaLoadoutData set ["glVests", ["OPTRE_FC_M52B_Armor_Grenadier_DES","OPTRE_FC_M52B_Armor_Grenadier_BRN","OPTRE_FC_M52B_Armor_Grenadier"]];
_militiaLoadoutData set ["engVests", ["OPTRE_FC_M52B_Armor_Breacher_DES","OPTRE_FC_M52B_Armor_Breacher_BRN","OPTRE_FC_M52B_Armor_Breacher"]];
_militiaLoadoutData set ["atVests", ["OPTRE_FC_M52B_Armor_Grenadier_DES","OPTRE_FC_M52B_Armor_Grenadier_BRN","OPTRE_FC_M52B_Armor_Grenadier"]];
_militiaLoadoutData set ["sniVests", ["OPTRE_FC_M52B_Armor_Marksman_DES","OPTRE_FC_M52B_Armor_Sniper_DES","OPTRE_FC_M52B_Armor_Marksman_BRN","OPTRE_FC_M52B_Armor_Sniper_BRN","OPTRE_FC_M52B_Armor_Marksman","OPTRE_FC_M52B_Armor_Sniper"]];

_militiaLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militiaLoadoutData set ["atBackpacks", ["OPTRE_Tripod_Bag_Black"]];
_militiaLoadoutData set ["medBackpacks", ["OPTRE_UNSC_Rucksack_Medic"]];
_militiaLoadoutData set ["mgBackpacks", ["OPTRE_UNSC_Rucksack_Heavy"]];
_militiaLoadoutData set ["sniBackpacks", ["OPTRE_UNSC_Rucksack"]];

_militiaLoadoutData set ["helmets", ["OPTRE_UNSC_Watchcap","OPTRE_PatrolCap_Navy","OPTRE_UNSC_PatrolCap_Army","OPTRE_UNSC_PatrolCap_Marines","OPTRE_FC_CH255_Helmet","OPTRE_FC_CH255_Helmet_DES","OPTRE_FC_CH255_Helmet_BRN","OPTRE_FC_CH255_Helmet_Visor","OPTRE_FC_CH255_Helmet_DES_Visor","OPTRE_FC_CH255_Helmet_BRN_Visor","OPTRE_CH255_Security_Basic_Type_1_Helmet","OPTRE_CH255_Security_Basic_Type_1_Light_Helmet","OPTRE_CH255_Security_Basic_Type_2_Helmet"]];
_militiaLoadoutData set ["slHat", ["OPTRE_UNSC_Watchcap","OPTRE_PatrolCap_Navy","OPTRE_UNSC_PatrolCap_Army","OPTRE_UNSC_PatrolCap_Marines","OPTRE_FC_CH255_Helmet","OPTRE_FC_CH255_Helmet_DES","OPTRE_FC_CH255_Helmet_BRN","OPTRE_FC_CH255_Helmet_Visor","OPTRE_FC_CH255_Helmet_DES_Visor","OPTRE_FC_CH255_Helmet_BRN_Visor","OPTRE_CH255_Security_Basic_Type_1_Helmet","OPTRE_CH255_Security_Basic_Type_1_Light_Helmet","OPTRE_CH255_Security_Basic_Type_2_Helmet"]];
_militiaLoadoutData set ["medhelmets", ["OPTRE_UNSC_Watchcap","OPTRE_PatrolCap_Navy","OPTRE_UNSC_PatrolCap_Army","OPTRE_UNSC_PatrolCap_Marines","OPTRE_FC_CH255_Helmet_DES_Medic","OPTRE_FC_CH255_Helmet_Medic","OPTRE_FC_CH255_Helmet_BRN_Medic","OPTRE_FC_CH255_Helmet_DES_Visor_Medic","OPTRE_FC_CH255_Helmet_Visor_Medic","OPTRE_FC_CH255_Helmet_BRN_Visor_Medic"]];

_militiaLoadoutData set ["rifles", [
    ["OPTRE_BR45_Black", "", "", _militaryopticsShort, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", "", "", _militaryopticsShort, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_M45", "", "", _militaryopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
    ["OPTRE_MA32", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["OPTRE_MA5K", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer", "OPTRE_32Rnd_762x51_Mag_UW"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["OPTRE_M7", "", "", _militaryopticsShort, ["OPTRE_48Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["OPTRE_M73", "", "", _militaryopticsShort, ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["OPTRE_M295_BMR", "", "", "optre_m393_acog", ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_AP_Mag"], [], ""]
]];

_militiaLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_militiaLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", [
    "OPTRE_FC_Marines_Uniform_L",
    "OPTRE_FC_Marines_Uniform_BLK_L",
    "OPTRE_FC_Marines_Uniform_BRN_L",
    "OPTRE_FC_Marines_Uniform_DES_L",
    "OPTRE_FC_Marines_Uniform_GRN_L",
    "OPTRE_FC_Marines_Uniform_WDL_L",
    "OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_R_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_R_BLK",
    "OPTRE_UNSC_Army_Uniform_R_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform_R",
    "OPTRE_UNSC_Marine_Uniform_R",
    "OPTRE_UNSC_Army_Uniform_R_OLI",
    "OPTRE_UNSC_Army_Uniform_S_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_S_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_S_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_S_BLK",
    "OPTRE_UNSC_Army_Uniform_S_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform_S",
    "OPTRE_UNSC_Marine_Uniform_S",
    "OPTRE_UNSC_Army_Uniform_S_OLI",
    "OPTRE_UNSC_Marine_Uniform_T3_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_T_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_T_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_T3_BLK_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T2_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_T3",
    "OPTRE_UNSC_Army_Uniform_T_OLI",
    "OPTRE_UNSC_Army_Uniform_T_BLK",
    "OPTRE_UNSC_Army_Uniform_T3_BLK",
    "OPTRE_UNSC_Marine_Uniform_T2",
    "OPTRE_UNSC_Marine_Uniform_T"
]];
_crewLoadoutData set ["vests", ["OPTRE_FC_M52B_Armor_Vest","OPTRE_FC_M52B_Armor_Vest_DES","OPTRE_UNSC_M52A_Armor4_MAR","OPTRE_UNSC_M52A_Armor3_MAR"]];
_crewLoadoutData set ["helmets", [
    "OPTRE_CH255_Security_Advanced_Type_3_Helmet",
    "OPTRE_CH255_Security_Advanced_Type_4_Helmet",
    "OPTRE_CH255_Security_Basic_Type_2_Helmet",
    "OPTRE_CH255_Security_Basic_Type_3_Helmet",
    "OPTRE_CH255_Security_Type_1_Helmet",
    "OPTRE_CH255_Security_Type_2_Helmet",
    "OPTRE_CH255_Security_Type_3_Helmet",
    "OPTRE_CH255_Security_Type_4_Helmet"
]];
_crewLoadoutData set ["carbines", [
    ["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", [
    "OPTRE_UNSC_Army_Uniform_BLK_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_AFMAR_SlimLeg",
    "OPTRE_UNSC_Airforce_Uniform_SlimLeg",
    "OPTRE_UNSC_Marine_Uniform_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_OLI_SlimLeg",
    "OPTRE_UNSC_Army_Uniform_BLK",
    "OPTRE_UNSC_Army_Uniform_AFMAR",
    "OPTRE_UNSC_Airforce_Uniform",
    "OPTRE_UNSC_Marine_Uniform"
]];
_pilotLoadoutData set ["vests", ["OPTRE_FC_M52B_Armor_Vest","OPTRE_FC_M52B_Armor_Vest_DES","OPTRE_UNSC_M52A_Armor4_MAR","OPTRE_UNSC_M52A_Armor3_MAR","OPTRE_UNSC_M52A_Armor_Pilot_AF"]];
_pilotLoadoutData set ["helmets", [
    "OPTRE_UNSC_CH252A_Helmet",
    "OPTRE_UNSC_CH252A_Tropic_Helmet",
    "OPTRE_CH255_Security_Advanced_Type_1_Helmet_Tropic",
    "OPTRE_CH255_Security_Advanced_Type_2_Helmet_Tropic",
    "OPTRE_FC_VX19_Helmet_Jungle",
    "OPTRE_UNSC_VX16_Helmet_MaskV_oli",
    "OPTRE_UNSC_VX16_Helmet_Mask_oli",
    "OPTRE_UNSC_VX16_HelmetNV_oli",
    "OPTRE_UNSC_VX16_Helmet_MaskSV_oli",
    "OPTRE_UNSC_VX16_Helmet_MaskS_oli",
    "OPTRE_UNSC_VX16_HelmetV_oli",
    "OPTRE_UNSC_VX16_Helmet_oli"
]];
_pilotLoadoutData set ["carbines", [
    ["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""]
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
    [["slNVGs", "NVGs"] call _fnc_fallback] call _fnc_addNVGs;
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
    [["medUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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

    [["grenadeLaunchers", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    [["mgBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["sniUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;


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
    [["sniNVGs", "NVGs"] call _fnc_fallback] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["glasses"] call _fnc_setFacewear;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["sniUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["sniBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["sniNVGs", "NVGs"] call _fnc_fallback] call _fnc_addNVGs;
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
    ["unarmedVests"] call _fnc_setVest;
    ["unarmedUniforms"] call _fnc_setUniform;

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
    [["sniNVGs", "NVGs"] call _fnc_fallback] call _fnc_addNVGs;
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
private _spartanUnitSL = ["baseClass", "OPTRE_FC_Spartan_TeamLeader", false , true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit
private _spartanUnitRad = ["baseClass", "OPTRE_FC_Spartan_Scout", false , true];            //there is no function to this, just so they have different names(classes) in zeus
private _spartanUnitGrenadier = ["baseClass", "OPTRE_FC_Spartan_MkVI", false , true];
private _spartanUnitAT = ["baseClass", "OPTRE_FC_Spartan_Rifleman_AT", false , true];
private _spartanUnitSniper = ["baseClass", "OPTRE_FC_Spartan_Scout_Sniper", false , true];
private _spartanOrSpecialODSTmedic = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Deltagamer", true, true], 0.3],[["OPTRE_FC_Spartan_Corpsman", false , true], 0.7]]];
private _spartanOrSpecialODSTengineer = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Jedi", true, true], 0.3],[["OPTRE_FC_Spartan_Engineer", false , true], 0.7]]];
private _spartanOrSpecialODSTexplosives = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Nightovizard", true, true], 0.3],[["OPTRE_FC_Spartan_MkVI", false , true], 0.7]]];
private _spartanOrSpecialODSTrifleman = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Lumnuon", true, true], 0.3],[["OPTRE_FC_Spartan_Rifleman_BR", false , true], 0.7]]];
private _spartanOrSpecialODSTmachine = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Scorch", true, true], 0.3],[["OPTRE_FC_Spartan_Automatic_Rifleman", false , true], 0.7]]];
private _spartanOrSpecialODSTmarksman = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Scouter407", true, true], 0.3],[["OPTRE_FC_Spartan_Marksman", false , true], 0.7]]];

private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_spartanUnitSL], [_prefix]],
    ["Radioman", _radiomanTemplate, [_spartanUnitRad], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_spartanOrSpecialODSTrifleman], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _spartanOrSpecialODSTmedic], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _spartanOrSpecialODSTengineer], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _spartanOrSpecialODSTexplosives], [_prefix]],
    ["Grenadier", _grenadierTemplate, [_spartanUnitGrenadier], [_prefix]],
    ["LAT", _latTemplate, [_spartanUnitAT], [_prefix]],
    ["AT", _atTemplate, [_spartanUnitAT], [_prefix]],
    ["AA", _aaTemplate, [_spartanUnitAT], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_spartanOrSpecialODSTmachine], [_prefix]],
    ["Marksman", _marksmanTemplate, [_spartanOrSpecialODSTmarksman], [_prefix]],
    ["Sniper", _sniperTemplate, [_spartanUnitSniper], [_prefix]]
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
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
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
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [], [_prefix]],
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
private _spartanOrHumanUnit = ["baseClass", [[["OPTRE_Spartan3_Soldier_TeamLeader", false, true], 0.25],[["OPTRE_UNSC_ODST_Soldier_TeamLeader", true, false], 0.75]]];

private _SpecialOrNormalODSTmedic = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Deltagamer", true, true], 0.25],[["OPTRE_UNSC_ODST_Soldier_Paramedic", false, false], 0.75]]];
private _SpecialOrNormalODSTengineer = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Jedi", true, false], 0.25],[["OPTRE_UNSC_ODST_Soldier_Breacher", false, false], 0.75]]];
private _SpecialOrNormalODSTexplosives = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Nightovizard", true, false], 0.25],[["OPTRE_UNSC_ODST_Soldier_DemolitionsExpert", false, false], 0.75]]];
private _SpecialOrNormalODSTrifleman = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Lumnuon", true, false], 0.25],[["OPTRE_UNSC_ODST_Soldier_Scout", false, false], 0.75]]];
private _SpecialOrNormalODSTmachine = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Scorch", true, false], 0.25],[["OPTRE_UNSC_ODST_Soldier_Automatic_Rifleman", false, false], 0.75]]];
private _SpecialOrNormalODSTmarksman = ["baseClass", [[["OPTRE_UNSC_ODST_Soldier_Scouter407", true, false], 0.25],[["OPTRE_UNSC_ODST_Soldier_Marksman", false, false], 0.75]]];

private _prefix = "elite";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_spartanOrHumanUnit], [_prefix]],
    ["Radioman", _radiomanTemplate, [], [_prefix]],
    ["Rifleman", _riflemanTemplate, [_SpecialOrNormalODSTrifleman], [_prefix]],
    ["Medic", _medicTemplate, [["medic", true], _SpecialOrNormalODSTmedic], [_prefix]],
    ["Engineer", _engineerTemplate, [["engineer", true], _SpecialOrNormalODSTengineer], [_prefix]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true], _SpecialOrNormalODSTexplosives], [_prefix]],
    ["Grenadier", _grenadierTemplate, [], [_prefix]],
    ["LAT", _latTemplate, [], [_prefix]],
    ["AT", _atTemplate, [], [_prefix]],
    ["AA", _aaTemplate, [], [_prefix]],
    ["MachineGunner", _machineGunnerTemplate, [_SpecialOrNormalODSTmachine], [_prefix]],
    ["Marksman", _marksmanTemplate, [_SpecialOrNormalODSTmarksman], [_prefix]],
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
