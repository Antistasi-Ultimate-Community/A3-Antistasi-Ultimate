//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", localize "STR_A3AP_setupFactionsTab_OPTRE_Ins_name"] call _fnc_saveToTemplate;
["spawnMarkerName", localize "STR_supportcorridorInsurrection"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa)] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_optre_insurrection"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["OPTRE_M274_ATV_Ins","OPTRE_M12_VBIED_Big","OPTRE_M12_VBIED"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["OPTRE_M12_FAV_ins"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["OPTRE_M12_LRV_ins","OPTRE_M12A1_LRV_ins","OPTRE_M12_TD_ins"]] call _fnc_saveToTemplate; //this line determines light and armed vehicles -- Example: ["vehiclesLightArmed", ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["OPTRE_m1015_mule_ins", "OPTRE_m1015_mule_cover_ins","OPTRE_M12_ins_APC"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["OPTRE_m1015_mule_ins", "OPTRE_m1015_mule_cover_ins"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["OPTRE_m1015_mule_ammo_ins"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["OPTRE_m1015_mule_repair_ins","OPTRE_M914_RV_ins", "OPTRE_M808R_Engineer_INS"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["OPTRE_m1015_mule_fuel_ins"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["OPTRE_m1015_mule_medical_ins","OPTRE_M12_ins_MED"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["a3a_OPTRE_M411_APC_INS","OPTRE_M493_M37_Ins"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["OPTRE_M413_MGS_INS", "OPTRE_M412_IFV_INS", "OPTRE_M494_INS", "OPTRE_M12_LRV_ins"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["OPTRE_M412_IFV_INS"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["OPTRE_M494_INS","OPTRE_M493_M37_RCWS_Ins"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["OPTRE_M413_MGS_INS"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["OPTRE_M808B_INS"]] call _fnc_saveToTemplate;
["vehiclesAA", ["OPTRE_M12R_AA_ins"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["optre_catfish_ins_unarmed_f"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["optre_catfish_ins_mg_f"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["OPTRE_M412_IFV_INS"]] call _fnc_saveToTemplate; //?

["vehiclesPlanesCAS", ["OPTRE_YSS_1000_A","OPTRE_YSS_1000_A_Single","OPTRE_YSS_1000_A_VTOL","OPTRE_YSS_1000_A_VTOL_Single"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["OPTRE_YSS_1000_A","OPTRE_YSS_1000_A_Single","OPTRE_YSS_1000_A_VTOL","OPTRE_YSS_1000_A_VTOL_Single"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["OPTRE_Pelican_unarmed_ins"]] call _fnc_saveToTemplate;

["vehiclesPlanesGunship", ["OPTRE_Pelican_armed_70mm_ins"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["a3a_OPTRE_INS_MH_144_Falcon_unarmed", "a3a_OPTRE_INS_MH_144_Falcon_searchlight"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["OPTRE_Pelican_unarmed_ins","OPTRE_INS_MHS_144_Falcon","OPTRE_UNSC_falcon_S_ins"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["OPTRE_UNSC_hornet_ins","OPTRE_INS_MH_144_Falcon", "OPTRE_ins_falcon_unarmed"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["OPTRE_ins_falcon","OPTRE_INS_UH_144S_Falcon_DAP"]] call _fnc_saveToTemplate; //need more armed falcon variants

["vehiclesAirPatrol", ["OPTRE_UNSC_hornet_ins","OPTRE_INS_MH_144_Falcon","OPTRE_ins_falcon_unarmed","OPTRE_ins_falcon","OPTRE_INS_UH_144S_Falcon_DAP"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["OPTRE_m1015_mule_mlr_ins"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["OPTRE_m1015_mule_mlr_ins", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["OPTRE_mako_drone_CAS_ins"]] call _fnc_saveToTemplate;
["uavsPortable", ["OPTRE_OQ40_Minibee_Black_UNSC","OPTRE_OQ_38_Wren_Drone_UNSC"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["OPTRE_M12_TD_ins"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["OPTRE_M12_ins_APC"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["OPTRE_M12_FAV_ins"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["a3a_OPTRE_M411_APC_INS","a3a_OPTRE_M411_APC_INS"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["OPTRE_M12_FAV_ins"]] call _fnc_saveToTemplate; //hmm

["staticMGs", ["OPTRE_AIE_486H_Static_HMG_Innie","OPTRE_M247a1_Static_Innie_MMG"]] call _fnc_saveToTemplate;
["staticAT", ["OPTRE_Static_FG75","OPTRE_Static_ATGM_Ins","OPTRE_M460AGL_Static_GMG_innie"]] call _fnc_saveToTemplate;
["staticAA", ["OPTRE_Static_AA_Ins","OPTRE_Static_M41_Ins"]] call _fnc_saveToTemplate;
["staticMortars", ["OPTRE_AU_44_INS_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;
["vehicleSam", ["OPTRE_Scythe_INS","OPTRE_Scythe_AA_INS","OPTRE_Lance_INS"]] call _fnc_saveToTemplate;

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
    #include "OPTRE_vehicle_variant\Insurrection.sqf"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["insignia", ["OPTRE_Insignia_emblems_uprising", "OPTRE_Insignia_ins",""]] call _fnc_saveToTemplate;
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
]] call _fnc_saveToTemplate;
//["sfVoices", ["Male01ENGB", "Male02ENG", "Male03ENGB", "Male04ENG", "Male05ENGB"]] call _fnc_saveToTemplate;

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
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
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

_loadoutData set ["ATMines", ["UNSCMine_Range_Mag","M41_IED_C_Remote_Mag","M41_IED_Remote_Mag","M41_IED_B_Remote_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["C7_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["C12_Remote_Mag","M168_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", ["OPTRE_c7_remote_throwable_sticky_mag","OPTRE_AU44_122mm_Throwable"]];
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
_loadoutData set ["NVGs", ["OPTRE_NVG"]];
_loadoutData set ["binoculars", ["OPTRE_Binoculars"]];
_loadoutData set ["rangefinders", ["OPTRE_Smartfinder"]];

_loadoutData set ["traitorUniforms", ["OPTRE_Ins_ER_jacket_brown_surplus"]];
_loadoutData set ["traitorVests", ["OPTRE_Vest_CMA_Light", "V_Chestrig_blk"]];
_loadoutData set ["traitorHats", ["OPTRE_CPD_Cap"]];

_loadoutData set ["officerUniforms", ["OPTRE_Ins_BJ_Undersuit_Snw"]];
_loadoutData set ["officerVests", ["OPTRE_Ins_BJ_Armor"]];
_loadoutData set ["officerHats", ["OPTRE_ONI_Researcher_Headgear_p"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", ["OPTRE_UNSC_M52A_Armor_Sniper_OLI","OPTRE_FC_M52B_Armor_Sniper_URB"]];

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
_loadoutData set ["longRangeRadios", ["OPTRE_ANPRC_521_URF", "OPTRE_ANPRC_515"]];
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
_loadoutData set ["slHat", ["OPTRE_Ins_URF_Helmet1", "OPTRE_CPD_CH251_URF"]];
_loadoutData set ["sniHats", ["OPTRE_h_Booniehat_Grey"]];

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

_loadoutData set ["glasses", ["OPTRE_EyePiece","OPTRE_HUD_blk_Glasses","OPTRE_HUD_b_Glasses","OPTRE_HUD_g_Glasses","OPTRE_HUD_Glasses","OPTRE_HUD_p_Glasses","OPTRE_HUD_r_Glasses","OPTRE_HUD_w_Glasses",""]];
_loadoutData set ["goggles", ["OPTRE_Glasses_Cigar","OPTRE_Glasses_Cigarette"]];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["OPTRE_Ins_BJ_Undersuit","OPTRE_Ins_BJ_Undersuit_Wdl"]];

_sfLoadoutData set ["vests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_sfLoadoutData set ["mgVests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_sfLoadoutData set ["medVests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_sfLoadoutData set ["glVests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_sfLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black"]];
_sfLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_sfLoadoutData set ["mgBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_sfLoadoutData set ["medBackpacks", ["OPTRE_ILCS_Rucksack_Medical","OPTRE_UNSC_Rucksack_Medic"]];
_sfLoadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515"]];
_sfLoadoutData set ["helmets", ["OPTRE_Ins_BJ_Helmet", "OPTRE_Ins_BJ_Helmet_Wdl"]];
_sfLoadoutData set ["slHat", ["OPTRE_Ins_BJ_Helmet_Spartan"]];
_sfLoadoutData set ["slVests", ["OPTRE_Ins_BJ_Armor_Spartan"]];
_sfLoadoutData set ["slUniforms", ["OPTRE_Ins_BJ_Undersuit_Spartan"]];
_sfLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack_Heavy_Spartan"]];
_sfLoadoutData set ["sniUniforms", ["OPTRE_Ins_BJ_Undersuit_Spartan"]];
_sfLoadoutData set ["sniVests", ["OPTRE_Ins_BJ_Armor_Spartan"]];
_sfLoadoutData set ["sniHats", ["OPTRE_Ins_BJ_Helmet_Spartan"]];
_sfLoadoutData set ["sniBackpacks", ["OPTRE_UNSC_Rucksack_Heavy_Spartan"]];

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
private _sfrail = ["OPTRE_M12_Laser","OPTRE_M6C_Vis_Red_Laser","OPTRE_M6C_Laser","OPTRE_M6G_Laser","OPTRE_M6G_Vis_Red_Laser","OPTRE_M7_Laser","OPTRE_BMR_Laser"];
private _sfmuzzle = ["OPTRE_M12_Suppressor","OPTRE_M26_LMG_Suppressor","OPTRE_M393_Suppressor","OPTRE_M6_silencer","OPTRE_M6C_compensator","OPTRE_M7_silencer","OPTRE_MA37KSuppressor","OPTRE_MA5Suppressor"];
_sfLoadoutData set ["slRifles", [
    ["OPTRE_BR37", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_AP", "OPTRE_10RND_338_VLD"], [], ""],
    ["OPTRE_BR45_Black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Innie", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Innie", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_HMG38", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_HMG38_Rifle", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], [], ""],
    ["OPTRE_M319", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _sfrail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
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
    ["OPTRE_Commando_Red", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    //GL
    ["OPTRE_BR45GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _sfmuzzle, _sfrail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["OPTRE_BR45_Black", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Innie", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Innie", _sfmuzzle, _sfrail, _sfopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_HMG38", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_HMG38_Rifle", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], [], ""],
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
    ["OPTRE_Commando_Red", _sfmuzzle, _sfrail, _sfoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""]
]];
private _sfm6Rail = ["OPTRE_M6D_Carbine_IR","OPTRE_M6D_Carbine_Vis_Red"];
_sfLoadoutData set ["carbines", [
    ["OPTRE_M6D_Carbine_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Black_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Black_F", "OPTRE_M6D_Carbine_Suppressor", _sfm6Rail, _sfoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
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
    ["OPTRE_MA32BGL", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["OPTRE_M7", "OPTRE_M7_silencer", _sfrail, _sfopticsShort, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["OPTRE_HMG38_Rifle", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], [], ""],
    ["OPTRE_M247A1", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box", "OPTRE_200Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_400Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1_Stripped", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box", "OPTRE_200Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1_Stripped", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_400Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M250", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box"], [], "OPTRE_M250_Bipod"],
    ["OPTRE_M73", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box_Tracer_Yellow", "OPTRE_100Rnd_95x40_Box_Tracer"], [], ""],
    ["OPTRE_M73", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_200Rnd_95x40_Box", "OPTRE_200Rnd_95x40_Box_Tracer_Yellow"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["OPTRE_M392_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393S_DMR", _sfmuzzle, _sfrail, _sfoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["OPTRE_SRM77_S1", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Green", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Red", _sfmuzzle, _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S2", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Green", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Red", "", _sfrail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRS99C", _sfmuzzle, _sfrail, "OPTRE_SRS99C_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_HVAP_Mag","OPTRE_4Rnd_145x114_HEDP_Mag"], [], ""],
    ["OPTRE_SRS99D", "OPTRE_SRS99D_Suppressor", _sfrail, "OPTRE_SRS99_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_HVAP_Mag_D","OPTRE_4Rnd_145x114_HEDP_Mag_D"], [], ""]
]];
private _sfm6MScope = ["OPTRE_M6D_Scope","OPTRE_M6D_Scope_Black","OPTRE_M6D_Scope_Jungle"];
private _sfm6MRail = ["OPTRE_M6D_IR_Laser","OPTRE_M6D_IR_Black","OPTRE_M6D_IR_Jungle","OPTRE_M6D_Vis_Red_Laser","OPTRE_M6D_Vis_Red_Black","OPTRE_M6D_Vis_Red_Jungle"];
_sfLoadoutData set ["sidearms", [
    ["OPTRE_M319M", "", "", "", ["M319_HE_Grenade_Shell","M319_Buckshot"], [], ""],
    ["OPTRE_M319s", "", "", "", ["OPTRE_3Rnd_Smoke_Grenade_shell","M319_Smoke","OPTRE_signalSmokeR"], [], ""],
    ["OPTRE_M6B", "OPTRE_M6_silencer", _sfrail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6C", "OPTRE_M6_silencer", _sfrail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6G", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Black", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Jungle", "OPTRE_M6_silencer", _sfm6MRail, _sfm6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M7_Folded", "OPTRE_M7_silencer", _sfrail, _sfopticsShort, ["OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""],
    ["optre_hgun_comet_F", "OPTRE_MA5Suppressor", _sfrail, _sfopticsShort, ["4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull"], [], ""],
    ["optre_hgun_sas10_F", "OPTRE_M6_silencer", _sfrail, _sfopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""],
    ["optre_hgun_sas10_jungle_F", "OPTRE_M6_silencer", _sfrail, _sfopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""]
]];

_sfLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_sfLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["OPTRE_Ins_BJ_Undersuit","OPTRE_Ins_BJ_Undersuit_Wdl"]];
_eliteLoadoutData set ["vests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_eliteLoadoutData set ["mgVests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_eliteLoadoutData set ["medVests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_eliteLoadoutData set ["glVests", ["OPTRE_Ins_BJ_Armor","OPTRE_Ins_BJ_Armor_Wdl"]];
_eliteLoadoutData set ["backpacks", ["OPTRE_ILCS_Rucksack_Black"]];
_eliteLoadoutData set ["slBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["atBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["medBackpacks", ["OPTRE_ILCS_Rucksack_Medical","OPTRE_UNSC_Rucksack_Medic"]];
_eliteLoadoutData set ["mgBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_eliteLoadoutData set ["longRangeRadios", ["OPTRE_ANPRC_515"]];
_eliteLoadoutData set ["helmets", ["OPTRE_Ins_BJ_Helmet", "OPTRE_Ins_BJ_Helmet_Wdl"]];
_eliteLoadoutData set ["slHat", ["OPTRE_Ins_BJ_Helmet", "OPTRE_Ins_BJ_Helmet_Wdl"]];
_eliteLoadoutData set ["sniHats", ["OPTRE_Ins_BJ_Helmet", "OPTRE_Ins_BJ_Helmet_Wdl"]];

private _eliteoptics = [
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
private _eliteopticsShort = [
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
private _eliterail = ["OPTRE_M12_Laser","OPTRE_M6C_Vis_Red_Laser","OPTRE_M6C_Laser","OPTRE_M6G_Laser","OPTRE_M6G_Vis_Red_Laser","OPTRE_M7_Laser","OPTRE_BMR_Laser"];
private _elitemuzzle = ["OPTRE_M247a1_Flashhider","OPTRE_M26_LMG_Comp"];
_eliteLoadoutData set ["slRifles", [
    ["OPTRE_BR37", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_SP", "OPTRE_10RND_338_AP", "OPTRE_10RND_338_VLD"], [], ""],
    ["OPTRE_BR45_Black", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Innie", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Innie", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_HMG38", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_HMG38_Rifle", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], [], ""],
    ["OPTRE_M319", "", _eliterail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _eliterail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_M45TAC", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45E", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45A", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45ATAC", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M90A", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_MA32", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando_Red", _elitemuzzle, _eliterail, _eliteoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
    //GL
    ["OPTRE_BR45GL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["OPTRE_BR45_Black", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR45", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
    ["OPTRE_BR55", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55_Grey", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_BR55HB_Grey", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], ""],
    ["OPTRE_CQS48_Bulldog_Automatic_Innie", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_CQS48S_Chihuahua_Automatic_Innie", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_12Gauge_Pellets", "OPTRE_12Rnd_12Gauge_Pellets_Tracer", "OPTRE_12Rnd_12Gauge_Smoke", "OPTRE_12Rnd_12Gauge_Smoke_Tracer", "OPTRE_12Rnd_12Gauge_HE", "OPTRE_12Rnd_12Gauge_HE_Tracer"], [], ""],
    ["OPTRE_HMG38", _elitemuzzle, _eliterail, "OPTRE_HMG38_CarryHandle", ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_HMG38_Rifle", _elitemuzzle, _eliterail, "OPTRE_HMG38_CarryHandle", ["OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], [], ""],
    ["OPTRE_M319", "", _eliterail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _eliterail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_M45TAC", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45E", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45A", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M45ATAC", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_M90A", _elitemuzzle, _eliterail, _eliteopticsShort, ["OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Pellets", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_Slugs", "OPTRE_12Rnd_8Gauge_HEDP"], [], ""],
    ["OPTRE_MA32", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5A", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA37B", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA32B", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_Commando_Red", _elitemuzzle, _eliterail, _eliteoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""]
]];
private _elitem6Rail = ["OPTRE_M6D_Carbine_IR","OPTRE_M6D_Carbine_Vis_Red"];
_eliteLoadoutData set ["carbines", [
    ["OPTRE_M6D_Carbine_F", "OPTRE_M6D_Carbine_Brake", _elitem6Rail, _eliteoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_F", "OPTRE_M6D_Carbine_Brake", _elitem6Rail, _eliteoptics, ["OPTRE_M6D_Carbine_F", "OPTRE_26Rnd_127x40_Mag_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Black_F", "OPTRE_M6D_Carbine_Brake", _elitem6Rail, _eliteoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Black_F", "OPTRE_M6D_Carbine_Brake", _elitem6Rail, _eliteoptics, ["OPTRE_40Rnd_127x40_Drum_Black_Tracer", "OPTRE_26Rnd_127x40_Mag_Black_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6D_Carbine_Jungle_F", "OPTRE_M6D_Carbine_Brake", _elitem6Rail, _eliteoptics, ["OPTRE_40Rnd_127x40_Drum_Jungle_Tracer", "OPTRE_26Rnd_127x40_Mag_Jungle_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_M6DS_Carbine_Foregrip_Jungle_F", "OPTRE_M6D_Carbine_Brake", _elitem6Rail, _eliteoptics, ["OPTRE_40Rnd_127x40_Drum_Jungle_Tracer", "OPTRE_26Rnd_127x40_Mag_Jungle_Tracer", "OPTRE_16Rnd_127x40_Mag"], [], ""],
    ["OPTRE_MA37K", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_MA5K", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer", "OPTRE_32Rnd_762x51_Mag_UW"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["OPTRE_M319", "", _eliterail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""], //gl
    ["OPTRE_M319N", "", _eliterail, "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell","M319_HEDPC_Grenade_Shell","M319_Smoke","M319_Buckshot","OPTRE_1Rnd_MasterKey_Pellets","OPTRE_1Rnd_MasterKey_Slugs"], [], ""],
    ["OPTRE_BR45GL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_BR45GL_black", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32GL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37GL", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA5AGL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA37BGL", _elitemuzzle, _eliterail, "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""],
    ["OPTRE_MA32BGL", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["3Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","OPTRE_3Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["OPTRE_M7", "OPTRE_M7_silencer", _eliterail, _eliteopticsShort, ["OPTRE_60Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["OPTRE_HMG38_Rifle", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_100Rnd_30x06_Mag", "OPTRE_100Rnd_30x06_Mag", "OPTRE_40Rnd_30x06_Mag_Tracer"], [], ""],
    ["OPTRE_M247A1", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box", "OPTRE_200Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_400Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1_Stripped", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box", "OPTRE_200Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M247A1_Stripped", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_400Rnd_762x51_M80_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
    ["OPTRE_M250", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box","OPTRE_50Rnd_127x99_M250_Box"], [], "OPTRE_M250_Bipod"],
    ["OPTRE_M73", _elitemuzzle, _eliterail, "OPTRE_M73_SmartLink", ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box_Tracer_Yellow", "OPTRE_100Rnd_95x40_Box_Tracer"], [], ""],
    ["OPTRE_M73", _elitemuzzle, _eliterail, "OPTRE_M73_SmartLink", ["OPTRE_200Rnd_95x40_Box", "OPTRE_200Rnd_95x40_Box_Tracer_Yellow"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["OPTRE_M392_DMR", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393_DMR", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""],
    ["OPTRE_M393S_DMR", _elitemuzzle, _eliterail, _eliteoptics, ["OPTRE_15Rnd_762x51_Mag", "OPTRE_15Rnd_762x51_AP_Mag", "OPTRE_15Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_15Rnd_762x51_Mag_Tracer"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["OPTRE_SRM77_S1", _elitemuzzle, _eliterail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Green", _elitemuzzle, _eliterail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S1_Red", _elitemuzzle, _eliterail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
    ["OPTRE_SRM77_S2", "", _eliterail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Green", "", _eliterail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRM77_S2_Red", "", _eliterail, "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
    ["OPTRE_SRS99C", _elitemuzzle, _eliterail, "OPTRE_SRS99C_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_APFSDS_Mag","OPTRE_4Rnd_145x114_HVAP_Mag","OPTRE_4Rnd_145x114_HEDP_Mag"], [], ""],
    ["OPTRE_SRS99D", "", _eliterail, "OPTRE_SRS99_Scope", ["OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_APFSDS_Mag_D","OPTRE_4Rnd_145x114_HVAP_Mag_D","OPTRE_4Rnd_145x114_HEDP_Mag_D"], [], ""]
]];
private _elitem6MScope = ["OPTRE_M6D_Scope","OPTRE_M6D_Scope_Black","OPTRE_M6D_Scope_Jungle"];
private _elitem6MRail = ["OPTRE_M6D_IR_Laser","OPTRE_M6D_IR_Black","OPTRE_M6D_IR_Jungle","OPTRE_M6D_Vis_Red_Laser","OPTRE_M6D_Vis_Red_Black","OPTRE_M6D_Vis_Red_Jungle"];
_eliteLoadoutData set ["sidearms", [
    ["OPTRE_M319M", "", "", "", ["M319_HE_Grenade_Shell","M319_Buckshot"], [], ""],
    ["OPTRE_M319s", "", "", "", ["OPTRE_3Rnd_Smoke_Grenade_shell","M319_Smoke","OPTRE_signalSmokeR"], [], ""],
    ["OPTRE_M6B", "", _eliterail, _elitem6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6C", "", _eliterail, _elitem6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D", "", _elitem6MRail, _elitem6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6G", "", _elitem6MRail, _elitem6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Black", "", _elitem6MRail, _elitem6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Jungle", "", _elitem6MRail, _elitem6MScope, ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M7_Folded", "", _eliterail, _eliteopticsShort, ["OPTRE_48Rnd_5x23mm_FMJ_Mag", "OPTRE_48Rnd_5x23mm_JHP_Mag", "OPTRE_60Rnd_5x23mm_Mag_tracer_yellow"], [], ""],
    ["optre_hgun_comet_F", "", _eliterail, _eliteopticsShort, ["4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull", "4Rnd_454Casull"], [], ""],
    ["optre_hgun_sas10_F", "", _eliterail, _eliteopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""],
    ["optre_hgun_sas10_jungle_F", "", _eliterail, _eliteopticsShort, ["32Rnd_10mm_Ball", "16Rnd_10mm_AP", "16Rnd_10mm_Ball"], [], ""]
]];

_eliteLoadoutData set ["lightATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];
_eliteLoadoutData set ["ATLaunchers", [["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["OPTRE_Ins_URF_Combat_Uniform","OPTRE_Ins_URF_Combat_Flat_Uniform","OPTRE_Ins_URF_Combat_Jungle_Uniform","OPTRE_Ins_URF_Combat_Jungle_Flat_Uniform","OPTRE_Ins_URF_Combat_Woodland_Uniform","OPTRE_Ins_URF_Combat_Woodland_Flat_Uniform"]];
_militaryLoadoutData set ["vests", ["OPTRE_Ins_URF_Armor1","OPTRE_Ins_URF_Armor1_Flat","OPTRE_Ins_URF_Jungle_Armor1","OPTRE_Ins_URF_Jungle_Armor1_Flat","OPTRE_Ins_URF_Woodland_Armor1","OPTRE_Ins_URF_Woodland_Armor1_Flat"]];
_militaryLoadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_militaryLoadoutData set ["slBackpacks", ["OPTRE_UNSC_Rucksack"]];
_militaryLoadoutData set ["atBackpacks", ["OPTRE_Turret_Bag_Black","OPTRE_Turret_Bag_Green","OPTRE_Turret_Bag_Woodland1","OPTRE_Turret_Bag_Woodland2"]];
_militaryLoadoutData set ["mgBackpacks", ["OPTRE_ILCS_Rucksack_Heavy"]];
_militaryLoadoutData set ["helmets", ["OPTRE_Ins_URF_Helmet1", "OPTRE_Ins_URF_Helmet4","OPTRE_Ins_URF_Helmet4_Brown","OPTRE_Ins_URF_Helmet3","OPTRE_Ins_URF_Helmet3_Brown","OPTRE_Ins_URF_Helmet2","OPTRE_Ins_URF_Helmet2_Brown","OPTRE_Ins_URF_Helmet1_Brown"]];
_militaryLoadoutData set ["sniHats", ["OPTRE_Ins_URF_Helmet1", "OPTRE_Ins_URF_Helmet4","OPTRE_Ins_URF_Helmet4_Brown","OPTRE_Ins_URF_Helmet3","OPTRE_Ins_URF_Helmet3_Brown","OPTRE_Ins_URF_Helmet2","OPTRE_Ins_URF_Helmet2_Brown","OPTRE_Ins_URF_Helmet1_Brown"]];

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
    ["OPTRE_Commando_Red", _militarymuzzle, _militaryrail, _militaryoptics, ["Commando_20Rnd_65_Mag", "Commando_20Rnd_65_Mag", "Commando_20Rnd_65_ReloadY_Mag", "Commando_20Rnd_65_TracerY_Mag"], [], ""],
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
    ["OPTRE_M247A1_Stripped", _militarymuzzle, _militaryrail, _militaryoptics, ["OPTRE_200Rnd_762x51_M118_M247A1_Box"], [], "OPTRE_M247A1_Bipod"],
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
private _military6MRail = ["OPTRE_M6D_Flashlight","OPTRE_M6D_Flashlight_Black","OPTRE_M6D_Flashlight_Jungle"];
_militaryLoadoutData set ["sidearms", [
    ["OPTRE_M319M", "", "", "", ["M319_Buckshot"], [], ""],
    ["OPTRE_M319s", "", "", "", ["M319_Smoke","OPTRE_signalSmokeR"], [], ""],
    ["OPTRE_M6B", "", _militaryrail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6C", "", _militaryrail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6G", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Black", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
    ["OPTRE_M6D_Jungle", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""]
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
    ["OPTRE_M6D_Black", "", "", "", [], [], ""],
    ["OPTRE_M6D_Jungle", "", "", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", [
    "OPTRE_Ins_ER_jacket_brown_surplus", "OPTRE_Ins_ER_uniform_GAgreen", "OPTRE_Ins_ER_uniform_GAtan", "OPTRE_Ins_ER_uniform_GGgrey", "OPTRE_Ins_ER_uniform_GGod", 
    "OPTRE_Ins_ER_jacket_od_surplus", "OPTRE_Ins_ER_rolled_jean_orca", "OPTRE_Ins_ER_rolled_OD_blknblu", "OPTRE_Ins_ER_rolled_OD_blknred", "OPTRE_Ins_ER_rolled_OD_crimson",
    "OPTRE_Ins_ER_rolled_surplus_black", "OPTRE_Ins_ER_rolled_surplus_crimson", "OPTRE_Ins_ER_jacket_surplus_brown", "OPTRE_Ins_ER_jacket_surplus_OD", "OPTRE_Ins_ER_jacket_surplus_redshirt"
]];
_militiaLoadoutData set ["medUniforms", ["OPTRE_Ins_ER_jacket_surgeon1","OPTRE_Ins_ER_jacket_surgeon2"]];
_militiaLoadoutData set ["slUniforms", ["OPTRE_Ins_URF_Combat_Uniform","OPTRE_Ins_URF_Combat_Flat_Uniform","OPTRE_Ins_URF_Combat_Jungle_Uniform","OPTRE_Ins_URF_Combat_Jungle_Flat_Uniform","OPTRE_Ins_URF_Combat_Woodland_Uniform","OPTRE_Ins_URF_Combat_Woodland_Flat_Uniform"]];
_militiaLoadoutData set ["vests", ["V_BandollierB_blk", "V_BandollierB_rgr", "V_Chestrig_blk", "V_Chestrig_rgr"]];
_militiaLoadoutData set ["slVests", ["OPTRE_Ins_URF_Armor1","OPTRE_Ins_URF_Armor1_Flat","OPTRE_Ins_URF_Jungle_Armor1","OPTRE_Ins_URF_Jungle_Armor1_Flat","OPTRE_Ins_URF_Woodland_Armor1","OPTRE_Ins_URF_Woodland_Armor1_Flat"]];
_militiaLoadoutData set ["sniVests", ["V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_oli", "B_TacticalPack_blk"]];
_militiaLoadoutData set ["slBackpacks", ["B_Kitbag_rgr", "B_TacticalPack_rgr"]];
_militiaLoadoutData set ["atBackpacks", ["OPTRE_Tripod_Bag_Black","OPTRE_Tripod_Bag_Innie_Green","OPTRE_Tripod_Bag_Innie_Wdl1","OPTRE_Tripod_Bag_Innie_Wdl2"]];
_militiaLoadoutData set ["slHat", ["OPTRE_Ins_URF_Helmet1", "OPTRE_Ins_URF_Helmet4","OPTRE_Ins_URF_Helmet4_Brown","OPTRE_Ins_URF_Helmet3","OPTRE_Ins_URF_Helmet3_Brown","OPTRE_Ins_URF_Helmet2","OPTRE_Ins_URF_Helmet2_Brown","OPTRE_Ins_URF_Helmet1_Brown"]];
_militiaLoadoutData set ["helmets", ["H_Shemag_olive", "H_Shemag_olive_hs", "H_Bandanna_sgg", "H_Bandanna_camo", "H_Watchcap_khk"]];

_militiaLoadoutData set ["sniHats", ["H_Booniehat_khk_hs", "H_Booniehat_oli", "H_Cap_blk", "H_Cap_oli_hs"]];

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

_militiaLoadoutData set ["lightATLaunchers", [["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_HE_mag"], [], ""]]];
_militiaLoadoutData set ["ATLaunchers", [["OPTRE_M44_Lykoi_Semi_Disposable_AT", "", "", "", ["OPTRE_M44_Lykoi_HEAT_mag"], [], ""]]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["OPTRE_Ins_BJ_Undersuit","OPTRE_Ins_BJ_Undersuit_Wdl"]];
_crewLoadoutData set ["vests", ["OPTRE_Ins_URF_Armor1"]];
_crewLoadoutData set ["helmets", [
    "OPTRE_CH255_Security_Type_4_Helmet",
    "OPTRE_CH255_Security_Type_3_Helmet",
    "OPTRE_CH255_Security_Type_2_Helmet",
    "OPTRE_CH255_Security_Type_1_Helmet",
    "OPTRE_CH255_Security_Basic_Type_3_Helmet_Black",
    "OPTRE_CH255_Security_Basic_Type_3_Helmet",
    "OPTRE_CH255_Security_Basic_Type_2_Helmet",
    "OPTRE_CH255_Security_Basic_Type_1_Light_Helmet",
    "OPTRE_CH255_Security_Basic_Type_1_Helmet"
]];
_crewLoadoutData set ["carbines", [
    ["OPTRE_M7", "", "", "optre_m12_optic", ["OPTRE_60Rnd_5x23mm_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["OPTRE_Ins_BJ_Undersuit","OPTRE_Ins_BJ_Undersuit_Wdl"]];
_pilotLoadoutData set ["vests", ["OPTRE_Ins_URF_Armor1"]];
_pilotLoadoutData set ["helmets", [
    "OPTRE_CH255_Security_Advanced_Type_4_Helmet",
    "OPTRE_CH255_Security_Advanced_Type_3_Helmet",
    "OPTRE_CH255_Security_Advanced_Type_2_Helmet_Tropic",
    "OPTRE_CH255_Security_Advanced_Type_2_Helmet_Black",
    "OPTRE_CH255_Security_Advanced_Type_2_Helmet",
    "OPTRE_CH255_Security_Advanced_Type_1_Helmet_Tropic",
    "OPTRE_CH255_Security_Advanced_Type_1_Helmet_Black",
    "OPTRE_CH255_Security_Advanced_Type_1_Helmet"
]];
_pilotLoadoutData set ["carbines", [
    ["OPTRE_M6G", "", "", "", ["OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""]
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
    ["NVGs"] call _fnc_addNVGs;
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

private _spartanUnit = ["baseClass", "OPTRE_FC_Spartan_TeamLeader", false , true]; //true = skip antistasi loadout, second true = skip setIdentity in fnc_createUnit

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate, [_spartanUnitSL], [_prefix]],
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
    ["Marksman", _marksmanTemplate, [_spartanUnit], [_prefix]],
    ["Sniper", _sniperTemplate, [_spartanUnit], [_prefix]]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

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
private _prefix = "elite";
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
