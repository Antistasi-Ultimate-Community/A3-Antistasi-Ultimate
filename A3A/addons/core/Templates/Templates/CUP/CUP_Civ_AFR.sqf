//////////////////////////
//       Vehicles       //
//////////////////////////    

["vehiclesCivCar", [
    "CUP_C_Volha_Gray_TKCIV", 4,
    "CUP_C_Volha_Blue_TKCIV", 4,
    "CUP_C_Volha_Limo_TKCIV", 4,
    "CUP_O_Hilux_unarmed_TK_CIV", 4,
    "CUP_C_LR_Transport_CTK", 4,
    "CUP_C_UAZ_Unarmed_TK_CIV", 4,
    "CUP_C_UAZ_Open_TK_CIV", 4,
    "CUP_C_Lada_TK_CIV", 4,
    "CUP_C_Lada_GreenTK_CIV", 4,
    "CUP_C_Datsun", 4,
    "CUP_C_Datsun_4seat", 4,
    "CUP_C_Pickup_unarmed_CIV", 4
]] call _fnc_saveToTemplate;

["vehiclesCivIndustrial", [
    "CUP_C_Ural_Open_Civ_01", 4,
    "CUP_C_Ural_Civ_02", 4,
    "CUP_C_Ural_Open_Civ_02", 4,
    "CUP_C_V3S_Open_TKC", 4,
    "CUP_C_V3S_Covered_TKC", 4,
    "C_Truck_02_box_F", 4
]] call _fnc_saveToTemplate;

["vehiclesCivBoat", [
    "CUP_C_Fishing_Boat_Chernarus", 1,
    "CUP_C_PBX_CIV", 1,
    "CUP_C_Zodiac_CIV", 1
]] call _fnc_saveToTemplate;

["vehiclesCivRepair", [
    "C_Offroad_01_repair_F", 4,
    "CUP_I_V3S_Refuel_TKG", 4
]] call _fnc_saveToTemplate;

["vehiclesCivMedical", [
    "CUP_B_LR_Ambulance_GB_D", 4,
    "C_IDAP_Van_02_medevac_F", 4
]] call _fnc_saveToTemplate;

["vehiclesCivFuel", [
    "C_Truck_02_fuel_F", 3,
    "CUP_I_V3S_Refuel_TKG", 3,
    "CUP_O_Ural_Refuel_SLA", 3
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "Barklem",
    "TanoanHead_A3_06","TanoanHead_A3_01","TanoanHead_A3_09","TanoanHead_A3_07",
    "TanoanHead_A3_05","TanoanHead_A3_04","TanoanHead_A3_03","TanoanHead_A3_02",
    "AfricanHead_01","AfricanHead_03","AfricanHead_02"
]] call _fnc_saveToTemplate;
"AfroMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_C_Man_Casual_1_F",
    "U_C_Man_Casual_2_F",
    "U_C_Man_Casual_3_F",
    "U_C_Man_Casual_4_F",
    "U_C_Man_Casual_5_F",
    "U_C_Man_Casual_6_F",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_redwhite",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Uniform_Farmer_01_F",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "CUP_U_C_Profiteer_01",
    "CUP_U_C_Profiteer_02",
    "CUP_U_C_Profiteer_03",
    "CUP_U_C_Profiteer_04",
    "CUP_U_C_Village_01",
    "CUP_U_C_Villager_04",
    "U_C_Poor_1",
    "U_C_Poor_2",
    "CUP_U_C_Worker_01",
    "CUP_U_C_Worker_02",
    "CUP_U_C_Worker_03",
    "CUP_U_C_Worker_04"
];

private _civUniformsAI = [
    "U_C_IDAP_Man_Cargo_F",
    "U_C_IDAP_Man_Jeans_F",
    "U_C_IDAP_Man_casual_F",
    "U_C_IDAP_Man_shorts_F",
    "U_C_IDAP_Man_Tee_F",
    "U_C_IDAP_Man_TeeShorts_F",
    "U_I_C_Soldier_Bandit_1_F",
    "U_I_C_Soldier_Bandit_2_F",
    "U_I_C_Soldier_Bandit_3_F",
    "U_I_C_Soldier_Bandit_4_F",
    "U_I_C_Soldier_Bandit_5_F",
    "U_C_Man_Casual_1_F",
    "U_C_Man_Casual_2_F",
    "U_C_Man_Casual_3_F",
    "U_C_Man_Casual_4_F",
    "U_C_Man_Casual_5_F",
    "U_C_Man_Casual_6_F",
    "U_C_ArtTShirt_01_v2_F",
    "U_C_ArtTShirt_01_v4_F",
    "U_C_ArtTShirt_01_v5_F",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_redwhite",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Uniform_Farmer_01_F",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "CUP_U_C_Profiteer_01",
    "CUP_U_C_Profiteer_02",
    "CUP_U_C_Profiteer_03",
    "CUP_U_C_Profiteer_04",
    "CUP_U_C_Village_01",
    "CUP_U_C_Villager_04",
    "U_C_Poor_1",
    "U_C_Poor_2",
    "CUP_U_C_Worker_01",
    "CUP_U_C_Worker_02",
    "CUP_U_C_Worker_03",
    "CUP_U_C_Worker_04"
];

private _pressUniforms = ["U_C_Journalist", "U_Marshal"];            //Uniforms given to Press/Journalists

private _workerUniforms = ["CUP_U_B_BDUv2_dirty_OD", "CUP_U_B_BDUv2_gloves_dirty_OD", "CUP_U_B_BDUv2_roll2_dirty_OD", "CUP_U_B_BDUv2_roll2_gloves_dirty_OD", "CUP_U_B_BDUv2_roll_dirty_OD", "CUP_U_B_BDUv2_roll_gloves_dirty_OD", "CUP_U_B_BDUv2_dirty_Winter", "CUP_U_B_BDUv2_gloves_dirty_Winter"];           //Uniforms given to Workers at Factories/Resources

["uniforms", _civUniforms + _civUniformsAI + _pressUniforms + _workerUniforms] call _fnc_saveToTemplate;          //Uniforms given to the Arsenal, Allowed for Undercover and given to Rebel Ai that go Undercover

_civHats = [
    "H_Bandanna_gry",
    "H_Bandanna_blu",
    "H_Bandanna_cbr",
    "H_Bandanna_khk",
    "H_Beret_blk",
    "H_Booniehat_mgrn",
    "H_Booniehat_khk",
    "H_Booniehat_oli",
    "H_Booniehat_tan",
    "CUP_H_PMC_Cap_Burberry",
    "CUP_H_PMC_Cap_Back_Burberry",
    "CUP_H_PMC_Cap_Grey",
    "CUP_H_PMC_Cap_Back_Grey",
    "CUP_H_PMC_Cap_Back_Tan",
    "H_Cap_blk",
    "H_Cap_blu",
    "H_Cap_grn",
    "H_Cap_red",
    "H_Cap_tan",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_grey",
    "H_Hat_checker",
    "H_Hat_tan",
    "H_StrawHat",
    "H_StrawHat_dark",
    "CUP_H_TKI_SkullCap_01",
    "CUP_H_TKI_SkullCap_02",
    "CUP_H_TKI_SkullCap_03",
    "CUP_H_TKI_SkullCap_04",
    "CUP_H_TKI_SkullCap_05",
    "CUP_H_TKI_SkullCap_06",
    "CUP_H_TKI_Lungee_Open_01",
    "CUP_H_TKI_Lungee_Open_02",
    "CUP_H_TKI_Lungee_Open_03",
    "CUP_H_TKI_Lungee_Open_04",
    "CUP_H_TKI_Lungee_Open_05",
    "CUP_H_TKI_Lungee_Open_06",
    "H_WirelessEarpiece_F"
];

["headgear", _civHats] call _fnc_saveToTemplate;            //Headgear given to Normal Civs, Workers, Undercover Rebels.


private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["uniforms", _civUniformsAI];
_loadoutData set ["pressUniforms", _pressUniforms];
_loadoutData set ["workerUniforms", _workerUniforms];
_loadoutData set ["pressVests", ["V_Press_F"]];
_loadoutData set ["helmets", _civHats];
_loadoutData set ["pressHelmets", ["H_Cap_press"]];
_loadoutData set ["facewear", ["CUP_Beard_Black", "None", "CUP_Beard_Brown", "CUP_TK_NeckScarf"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];


private _manTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _workerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["workerUniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};
private _pressTemplate = {
    ["pressHelmets"] call _fnc_setHelmet;
    ["pressVests"] call _fnc_setVest;
    ["pressUniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

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