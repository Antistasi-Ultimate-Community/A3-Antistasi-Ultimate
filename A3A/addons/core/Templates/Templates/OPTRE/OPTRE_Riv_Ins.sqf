////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", localize "STR_A3AP_setupFactionsTab_OPTRE_Riv_name"] call _fnc_saveToTemplate;
["nameLeader", "Robert Watts"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
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
    "Ioannou"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["OPTRE_M12A1_LRV_ins","OPTRE_M12_TD_ins","OPTRE_M12_LRV_ins"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["OPTRE_m1015_mule_ins","OPTRE_m1015_mule_cover_ins","OPTRE_M12_ins_APC"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["OPTRE_M12_FAV_ins"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["a3a_OPTRE_M411_APC_INS","OPTRE_M412_IFV_INS","OPTRE_M413_MGS_INS","OPTRE_M493_M37_RCWS_Ins","OPTRE_M493_M37_Ins"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", ["OPTRE_M494_INS","OPTRE_M808B_INS"]] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["OPTRE_UNSC_falcon_armed_S_ins","OPTRE_UNSC_hornet_ins","OPTRE_Pelican_unarmed_ins","OPTRE_Pelican_armed_ins","OPTRE_Pelican_armed_70mm_ins",
"OPTRE_INS_MH_144_Falcon",
"OPTRE_ins_falcon",
"OPTRE_INS_MHS_144_Falcon",
"OPTRE_ins_falcon_unarmed",
"OPTRE_INS_UH_144_Falcon_DAP",
"OPTRE_UNSC_falcon_S_ins",
"OPTRE_INS_UH_144S_Falcon_DAP"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["OPTRE_OQ_38_Wren_Drone_UNSC","OPTRE_OQ40_Minibee_Black_UNSC"]] call _fnc_saveToTemplate;			

["staticLowWeapons", [
	"OPTRE_AIE_486H_Low_Static_HMG_Innie",
    "OPTRE_AIE_486H_Static_HMG_Innie",
    "OPTRE_Static_M41_CMA",
    "OPTRE_M247a1_Low_Static_Innie_MMG",
    "OPTRE_M247a1_Static_Innie_MMG",
    "OPTRE_M37_Static_HMG_innie",
    "OPTRE_Static_M41_Ins",
	"OPTRE_M460AGL_Low_Static_GMG_innie",
    "OPTRE_M460AGL_Static_GMG_innie"
]] call _fnc_saveToTemplate;
["staticMortars", ["OPTRE_AU_44_INS_Mortar"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "OPTRE_10Rnd_122mm_SABOT_81mm_Mo_shells"] call _fnc_saveToTemplate;

["handGrenadeAmmo", []] call _fnc_saveToTemplate;
["mortarAmmo", []] call _fnc_saveToTemplate;

["minefieldAT", ["OPTRE_Placed_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

["animations", [
    #include "OPTRE_vehicle_animations.sqf"
]] call _fnc_saveToTemplate;

["variants", [
    #include "OPTRE_vehicle_variant\Insurrection.sqf"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["UNSCMine_Range_Mag","M41_IED_C_Remote_Mag","M41_IED_Remote_Mag","M41_IED_B_Remote_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["C7_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["C12_Remote_Mag","M168_Remote_Mag"]];

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

_loadoutData set ["facewear", [
	"G_Balaclava_blk", 
	"OPTRE_HUD_r_Glasses"
]];
_loadoutData set ["fullmask", ["G_Balaclava_TI_blk_F"]];

_loadoutData set ["headgear", [
    "OPTRE_Ins_URF_Helmet1",
	"OPTRE_Ins_URF_Helmet2",
	"OPTRE_Ins_URF_Helmet2_Brown",
	"OPTRE_Ins_URF_Helmet1_Brown"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["OPTRE_NVG"]];
_loadoutData set ["binoculars", ["OPTRE_Binoculars"]];
_loadoutData set ["Rangefinder", ["OPTRE_Smartfinder"]];

_loadoutData set ["uniforms", [
	"OPTRE_Ins_ER_jacket_brown_surplus", "OPTRE_Ins_ER_uniform_GAgreen", "OPTRE_Ins_ER_uniform_GAtan", "OPTRE_Ins_ER_uniform_GGgrey", "OPTRE_Ins_ER_uniform_GGod", 
    "OPTRE_Ins_ER_jacket_od_surplus", "OPTRE_Ins_ER_rolled_jean_orca", "OPTRE_Ins_ER_rolled_OD_blknblu", "OPTRE_Ins_ER_rolled_OD_blknred", "OPTRE_Ins_ER_rolled_OD_crimson",
    "OPTRE_Ins_ER_rolled_surplus_black", "OPTRE_Ins_ER_rolled_surplus_crimson", "OPTRE_Ins_ER_jacket_surplus_brown", "OPTRE_Ins_ER_jacket_surplus_OD", "OPTRE_Ins_ER_jacket_surplus_redshirt"
]];

_loadoutData set ["offuniforms", ["OPTRE_Ins_URF_Combat_Uniform","OPTRE_Ins_URF_Combat_Flat_Uniform","OPTRE_Ins_URF_Combat_Jungle_Uniform","OPTRE_Ins_URF_Combat_Jungle_Flat_Uniform","OPTRE_Ins_URF_Combat_Woodland_Uniform","OPTRE_Ins_URF_Combat_Woodland_Flat_Uniform"]];
_loadoutData set ["vests", ["OPTRE_Ins_URF_Armor1","OPTRE_Ins_URF_Armor1_Flat","OPTRE_Ins_URF_Jungle_Armor1","OPTRE_Ins_URF_Jungle_Armor1_Flat","OPTRE_Ins_URF_Woodland_Armor1","OPTRE_Ins_URF_Woodland_Armor1_Flat"]];
_loadoutData set ["heavyVests", ["OPTRE_Ins_URF_Armor1","OPTRE_Ins_URF_Armor1_Flat","OPTRE_Ins_URF_Jungle_Armor1","OPTRE_Ins_URF_Jungle_Armor1_Flat","OPTRE_Ins_URF_Woodland_Armor1","OPTRE_Ins_URF_Woodland_Armor1_Flat"]];
_loadoutData set ["atBackpacks", ["OPTRE_UNSC_Rucksack_Heavy"]];
_loadoutData set ["backpacks", ["OPTRE_UNSC_Rucksack"]];
_loadoutData set ["helmets", ["OPTRE_Ins_URF_Helmet4", "OPTRE_Ins_URF_Helmet4_Brown", "OPTRE_Ins_URF_Helmet3", "OPTRE_Ins_URF_Helmet3_Brown"]];
_loadoutData set ["heavyHelmets", ["OPTRE_Ins_URF_Helmet4", "OPTRE_Ins_URF_Helmet4_Brown", "OPTRE_Ins_URF_Helmet3", "OPTRE_Ins_URF_Helmet3_Brown"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
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
private _militarymuzzle = ["OPTRE_M26_LMG_Comp", ""];

_loadoutData set ["rifles", [
["OPTRE_BR45_Black", "", "", "", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
["OPTRE_BR45", "", "", "", ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
["OPTRE_M45", "", "", "", ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
["OPTRE_MA32", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA37", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA5A", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA37B", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA32B", "", "", "", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""]
]];
_loadoutData set ["tunedRifles", [
["OPTRE_BR45_Black", "", "", _militaryopticsShort, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"],
["OPTRE_BR45", "", "", _militaryopticsShort, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], [], "OPTRE_BR45Grip"]
]];
_loadoutData set ["enforcerRifles", [
["OPTRE_M45", "", "", _militaryopticsShort, ["OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Pellets", "OPTRE_6Rnd_8Gauge_Slugs", "OPTRE_6Rnd_8Gauge_Slugs"], [], ""],
["OPTRE_MA32", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA37", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA5A", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA37B", "", "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""],
["OPTRE_MA32B", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], [], ""]
]];
_loadoutData set ["carbines", [
["OPTRE_MA5K", "", "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer", "OPTRE_32Rnd_762x51_Mag_UW"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
["OPTRE_M319", "", "", "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell"], [], ""],
["OPTRE_M319N", "", "", "", ["M319_HE_Grenade_Shell", "M319_HEAT_Grenade_Shell", "M319_HEDP_Grenade_Shell"], [], ""],
["OPTRE_BR45GL", _militarymuzzle, "", _militaryopticsShort, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
["OPTRE_BR45GL_black", _militarymuzzle, "", _militaryopticsShort, ["OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag", "OPTRE_36Rnd_95x40_Mag_Tracer_Yellow", "OPTRE_36Rnd_95x40_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
["OPTRE_MA32GL", _militarymuzzle, "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
["OPTRE_MA37GL", _militarymuzzle, "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
["OPTRE_MA5AGL", _militarymuzzle, "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
["OPTRE_MA37BGL", _militarymuzzle, "", "OPTRE_MA37_Smartlink_Scope", ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""],
["OPTRE_MA32BGL", _militarymuzzle, "", _militaryopticsShort, ["OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag", "OPTRE_32Rnd_762x51_Mag_Tracer_Yellow", "OPTRE_32Rnd_762x51_Mag_Tracer"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell","OPTRE_signalSmokeY"], ""]
]];
_loadoutData set ["SMGs", [
["OPTRE_M7", "", "optre_m7_laser", "optre_m7_sight", ["OPTRE_48Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_Mag", "OPTRE_48Rnd_5x23mm_Mag"], [], ""],
]];
_loadoutData set ["machineGuns", [
["OPTRE_M73", "", "", _militaryopticsShort, ["OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box", "OPTRE_100Rnd_95x40_Box"], [], "bipod_01_F_blk"]
]];
_loadoutData set ["marksmanRifles", [
["OPTRE_M295_BMR", "", "", "optre_m393_acog", ["OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag", "OPTRE_25Rnd_762x51_Mag"], [], ""]
]];
_loadoutData set ["sniperRifles", [
["OPTRE_SRM77_S1", "", "", "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
["OPTRE_SRM77_S1_Green", "", "", "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
["OPTRE_SRM77_S1_Red", "", "", "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_noTracer","OPTRE_10Rnd_127x99","OPTRE_5Rnd_127x99_noTracer","OPTRE_5Rnd_127x99"], [], ""],
["OPTRE_SRM77_S2", "", "", "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
["OPTRE_SRM77_S2_Green", "", "", "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""],
["OPTRE_SRM77_S2_Red", "", "", "OPTRE_SRM_Sight", ["OPTRE_10Rnd_127x99_Subsonic_noTracer","OPTRE_10Rnd_127x99_Subsonic","OPTRE_5Rnd_127x99_Subsonic_noTracer","OPTRE_5Rnd_127x99_Subsonic"], [], ""]
]];
private _military6MRail = ["OPTRE_M6D_Flashlight","OPTRE_M6D_Flashlight_Black","OPTRE_M6D_Flashlight_Jungle"];
_loadoutData set ["sidearms", [
["OPTRE_M319M", "", "", "", ["M319_Buckshot"], [], ""],
["OPTRE_M319s", "", "", "", ["M319_Smoke","OPTRE_signalSmokeR"], [], ""],
["OPTRE_M6B", "", _militaryrail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
["OPTRE_M6C", "", _militaryrail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
["OPTRE_M6D", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
["OPTRE_M6G", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
["OPTRE_M6D_Black", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""],
["OPTRE_M6D_Jungle", "", _military6MRail, "", ["OPTRE_8Rnd_127x40_AP_Mag","OPTRE_8Rnd_127x40_Mag","OPTRE_8Rnd_127x40_Mag_Tracer"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
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

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
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


// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	if (random 100 > 60) then {
		["heavyHelmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
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

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

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

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["ATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 4] call _fnc_addMagazines;

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
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
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

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
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
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "fullmask", 1.25, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["carbines"] call _fnc_setPrimary;
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
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["vests"] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;