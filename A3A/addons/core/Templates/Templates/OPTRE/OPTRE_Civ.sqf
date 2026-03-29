//////////////////////////////
//   Civilian Information   //
//////////////////////////////

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesCivCar", [
    "OPTRE_M12_CIV2", 0.2,
    "OPTRE_M12_CIV", 0.5,
    "OPTRE_Genet", 2.0,
    "C_Hatchback_01_sport_F", 0.2, //debatable, I think they fit...sort of
    "C_Hatchback_01_F", 1
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "OPTRE_cart", 0.5,
    "OPTRE_forklift", 0.5
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "C_Boat_Civil_01_F", 0.5,
    "C_Scooter_Transport_01_F", 0.5,
    "optre_catfish_civ_f", 1
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", ["C_Truck_02_box_F", 0.3]] call _fnc_saveToTemplate; //OPTRE_M914_RV //hmmmmmmmmmm

["vehiclesCivMedical", ["OPTRE_M12_FAV_APC_MED", 0.1]] call _fnc_saveToTemplate; //hmmmmmmmmmmmmm

["vehiclesCivFuel", [
    "C_Van_01_fuel_F", 0.2,
    "C_Truck_02_fuel_F", 0.1
]] call _fnc_saveToTemplate;

["vehiclesCivHeli", []] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

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
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_C_ArtTShirt_01_v6_F",
    "U_C_ArtTShirt_01_v1_F",
    "U_C_ArtTShirt_01_v2_F",
    "U_C_ArtTShirt_01_v4_F",
    "U_C_ArtTShirt_01_v5_F",
    "U_C_ArtTShirt_01_v3_F",
    "U_C_Poor_1",
    "U_OrestesBody",
    "U_C_HunterBody_grn",
    "U_I_L_Uniform_01_tshirt_black_F",
    "U_I_L_Uniform_01_tshirt_sport_F",
    "U_C_Uniform_Scientist_02_formal_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_01_F"
];

private _pressUniforms = [
    "U_C_Journalist",
    "U_Marshal"
];

private _workerUniforms = [
    "OPTRE_ONI_Researcher_Uniform_Light",
    "OPTRE_ONI_Researcher_Uniform"
];

private _dlcUniforms = [];

["uniforms", _civUniforms + _pressUniforms + _workerUniforms + _dlcUniforms] call _fnc_saveToTemplate;

private _civhats = [
    "H_EarProtectors_white_F",
    "H_EarProtectors_yellow_F",
    "H_EarProtectors_black_F",
    "H_EarProtectors_orange_F",
    "OPTRE_Cap_FinalDawn",
    "OPTRE_UNSC_Watchcap",
    "OPTRE_h_Booniehat_Grey",
    "H_Bandanna_blu",
    "H_Bandanna_cbr",
    "H_Bandanna_gry",
    "H_Bandanna_khk",
    "H_Bandanna_sand",
    "H_Bandanna_sgg",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
    "H_Cap_blk",
    "H_Cap_blu",
    "H_Cap_grn",
    "H_Cap_grn_BI",
    "H_Cap_oli",
    "H_Cap_red",
    "H_Cap_surfer",
    "H_Cap_tan",
    "H_StrawHat",
    "H_StrawHat_dark",
    "H_Hat_checker",
    "H_Hat_Safari_olive_F",
    "H_Hat_Safari_sand_F"
];

["headgear", _civHats] call _fnc_saveToTemplate;

private _workerHelmets = ["OPTRE_ONI_Researcher_Headgear","OPTRE_ONI_Researcher_Headgear_p"];

private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniforms];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["workerHelmets", _workerHelmets];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["pressVests", ["OPTRE_UNSC_M52A_Armor_SoftD","OPTRE_UNSC_M52A_Armor_SoftDK","OPTRE_UNSC_M52A_Armor_Soft"]];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];

private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["workerHelmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Press", _pressTemplate],
    ["Worker", _workerTemplate],
    ["Man", _manTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
