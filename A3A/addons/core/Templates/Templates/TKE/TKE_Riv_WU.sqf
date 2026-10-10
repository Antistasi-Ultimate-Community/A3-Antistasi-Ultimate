/////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Workers Union"] call _fnc_saveToTemplate;
["nameLeader", "John TKE"] call _fnc_saveToTemplate;

///////////////////////////////////////
//       	Identities    			//
/////////////////////////////////////

#include "identities.hpp"
private _faces = TKE_FACES;
private _voices = TKE_VOICES;

["faces", _faces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;

TKE_NAMES call _fnc_saveNames;

///////////////////////////
//       Vehicles       //
/////////////////////////

["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

private _vehiclesLightArmed = ["a3a_LSV_02_armed_black_F", "A3U_UCN_BL_Nomad_Armed", "A3U_UCN_BL_Nomad_Cabin_Armed", "A3U_UCN_BL_Nomad_Rollcage_Armed"];
private _vehiclesLightUnarmed = ["a3a_LSV_02_unarmed_black_F"];
private _vehiclesAPC = ["A3U_KMC_APC_A", "A3U_KMC_APC_AX"];
private _vehiclesTanks = ["A3U_KMC_APC_Art"];
private _vehiclesHelis = ["A3U_TKE_Ext_Dragonfly_T_KMC"];
private _vehiclesUAV = [];
private _vehiclesTrucks = ["A3U_KMC_APC_U"];
private _staticAT = ["I_static_AT_F"];
private _staticMG = ["I_G_HMG_02_high_F", "I_G_HMG_02_F"];
private _staticMortars = ["I_G_Mortar_01_F"];

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["handGrenadeAmmo", ["TKE_FRAG_mag","TKE_SMOKE_mag"]] call _fnc_saveToTemplate;
["mortarAmmo", ["8Rnd_82mm_Mo_shells"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", _vehiclesTrucks] call _fnc_saveToTemplate;
["vehiclesRivalsCars", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", _vehiclesAPC] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", _vehiclesTanks] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", _vehiclesHelis] call _fnc_saveToTemplate;
["vehiclesRivalsUavs", _vehiclesUAV] call _fnc_saveToTemplate;

["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticLowWeapons", _staticMG] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;

///////////////////////////
//       Loadouts       //
/////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

private _opticsLight = ["TKE_RedDotSight", "TKE_ReflexSight"];
private _opticsHeavy = ["TKE_MRCOSight", "TKE_4xSight"];

private _rifles = [
    ["TKE_ARX12KMC", "", "", _opticsLight, ["TKE_ARX12KMC_62x35_mag", "TKE_ARX12KMC_62x35_magTR"], [], ""], 1,
    ["TKE_KMCSMG", "", "", _opticsLight, ["TKE_45rnd_pdw_mag"], [], ""], 1,
    ["TKE_UCNRifle3", "", "", _opticsLight, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTR"], [], ""], 1,
    ["WRS_Weapon_AR_Black", "", "", "optic_Hamr", ["WRS_Ar_Magazine"], [], ""], 1
];
private _riflesTuned = [
    ["TKE_ARX12KMC", "", "", _opticsHeavy, ["TKE_ARX12KMC_62x35_mag", "TKE_ARX12KMC_62x35_magTR"], [], ""], 1,
    ["TKE_UCNRifle2", "", "", _opticsLight, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTR"], [], ""], 1,
    ["TKE_UCNBPRifle", "", "", _opticsLight, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTR"], [], ""], 1,
    ["TKE_BPRA5", "", "", _opticsLight, ["TKE_ARX12KMC_62x35_mag", "TKE_ARX12KMC_62x35_magTR"], [], ""], 1,
    ["WRS_Weapon_AUG", "", "", "optic_Hamr", ["WRS_Ar1_Magazine"], [], ""], 1
];
private _riflesEnforcer = _riflesTuned;
private _riflesCarbine = _riflesTuned;
private _riflesGrenadeLaunchers = [
    ["TKE_ARX12GLKMC", "", "", _opticsHeavy, ["TKE_ARX12KMC_62x35_mag", "TKE_ARX12KMC_62x35_magTR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareRed_F", "1Rnd_SmokeRed_Grenade_shell"], ""], 1
];
private _riflesMachineGuns = [
    ["TKE_UCNLMG", "", "", _opticsHeavy, ["TKE_150rnd_62x35_magUCN"], [], ""], 2,
    ["TKE_UCNMMG", "", "", _opticsHeavy, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1
];
private _riflesMarksman = [
    ["TKE_UCNDMR", "", "", "TKE_10xSight", ["TKE_20rnd_969x51_magUCN"], [], "bipod_03_F_blk"], 1
];

private _launchersLightAT = [
    ["TKE_ATRecoilless1KMC", "", "", "", ["MRAWS_HE_F"], [], ""], 1
];
private _launchersAA = [
    ["launch_B_Titan_olive_F", "", "", "", ["Titan_AA"], [], ""], 1
];
private _sidearms = [
    ["TKE_UCNPistol", "", "", "", ["TKE_UCNPistol_mag"], [], ""], 1,
    ["TKE_MDPistolBlack", "", "", "", ["TKE_MDPistol_mag"], [], ""], 1
];

_loadoutData set ["launchersLightAT", _launchersLightAT];
_loadoutData set ["launchersAA", _launchersAA];

_loadoutData set ["minesAT", ["ATMine_Range_Mag"]]; // Anti-tank
_loadoutData set ["minesAP", ["APERSMine_Range_Mag"]]; // Anti-personnel
_loadoutData set ["explosivesLight", ["DemoCharge_Remote_Mag"]]; // Found on explosive expert units
_loadoutData set ["explosivesHeavy", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["TKE_FRAG_mag", "TKE_IMPACT_mag"]];
_loadoutData set ["smokeGrenades", ["TKE_SMOKE_mag"]];
_loadoutData set ["signalSmokeGrenades", ["SmokeShellGreen"]]; // (Flare)

_loadoutData set ["rifles", _rifles];
_loadoutData set ["riflesTuned", _riflesTuned];
_loadoutData set ["riflesEnforcer", _riflesEnforcer];
_loadoutData set ["riflesCarbine", _riflesCarbine];
_loadoutData set ["riflesGrenadeLaunchers", _riflesGrenadeLaunchers];
_loadoutData set ["riflesMachineGuns", _riflesMachineGuns];
_loadoutData set ["riflesMarksman", _riflesMarksman];
_loadoutData set ["sidearms", _sidearms];

_loadoutData set ["facewear", ["TKE_MDWebbingGrey", "TKE_MDWebbingV1Grey", "TKE_MDWebbingV4Grey", "TKE_UCNFaceWear1"]];
_loadoutData set ["headgear", ["TKE_BoonieHatBlack", "TKE_BoonieHatHSBlack", "TKE_PatrolCapC_BASE", "TKE_HeadsetEPGrey"]]; // Note: NOT helmets; those are below

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["GPS", ["ItemGPS"]];
_loadoutData set ["NVG", ["TKE_IntegratedNVGs"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

private _uniforms = [
	"KMC_CombatShirt_U_B_WUGR",
	"KMC_CombatShirt_U_B_WUG",
	"KMC_CombatShirt_U_B_WUT",
	"KMC_CombatShirt_U_B_WU",
	"KMC_CombatUni_U_B_WUGR",
	"KMC_CombatUni_U_B_WUG",
	"KMC_CombatUni_U_B_WUT",
	"KMC_CombatUni_U_B_WU",
	"KMC_FCFSweater_U_B_WUGR",
	"KMC_FCFSweater_U_B_WUG",
	"KMC_FCFSweater_U_B_WUT",
	"KMC_FCFSweater_U_B_WU",
	"KMC_VoidSuit_U_B_WU"
];
private _uniformsHeavy = _uniforms;
private _uniformsOfficer = _uniforms;

private _vests = ["KMC_Webbing_1_1_wu","KMC_Webbing_2_1_wu","KMC_Webbing_3_wu","KMC_FCF_armor_2_wu", "TKE_R35VestP1NNKMC", "TKE_R35VestP2NNKMC"];
private _vestsHeavy = ["TKE_R35VestP1KMC", "TKE_R35VestP2KMC"];
private _vestsOfficer = ["TKE_R35VestP1KMC", "TKE_R35VestP2KMC"];

private _helmets = ["KMC_trooper_helmet_wu","KMC_mask_helmet_clear_wu"];
private _helmetsHeavy = _helmets;
private _helmetsOfficer = _helmets;

private _backpacks = ["KMC_Alicepack","KMC_Camelbak","KMC_FieldCamelbak","KMC_Lightpack"];

///////////////////////////
//    Misc Loadouts     //
/////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", _uniforms];
_crewLoadoutData set ["vests", ["TKE_R35VestP1KMC"]];
_crewLoadoutData set ["helmets", ["KMC_mask_helmet_clear_wu"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["KMC_VoidSuit_U_B_WU"]];
_pilotLoadoutData set ["vests", ["TKE_PilotVestMerc"]];
_pilotLoadoutData set ["helmets", ["KMC_mask_helmet_clear_wu"]];

_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["uniformsHeavy", _uniformsHeavy];
_loadoutData set ["uniformsOfficer", _uniformsOfficer];
_loadoutData set ["vests", _vests];
_loadoutData set ["vestsHeavy", _vestsHeavy];
_loadoutData set ["vestsOfficer", _vestsOfficer];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["helmetsHeavy", _helmetsHeavy];
_loadoutData set ["helmetsOfficer", _helmetsOfficer];
_loadoutData set ["backpacks", _backpacks];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

/* Unit type specific item sets. Feel free to add or remove data. */
private _coreItems = []; // Shared with every item set
private _slItems = ["Laserbatteries"];
private _expItems = ["ToolKit", "MineDetector"];
private _sniperItems = [];

if (A3A_hasACE) then {
    _coreItems append ["ACE_microDAGR", "ACE_DAGR"];
    _expItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _sniperItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _coreItems + _slItems];
_loadoutData set ["items_rifleman_extras", _coreItems];
_loadoutData set ["items_medic_extras", _coreItems];
_loadoutData set ["items_grenadier_extras", _coreItems];
_loadoutData set ["items_explosivesExpert_extras", _coreItems + _expItems];
_loadoutData set ["items_engineer_extras", _coreItems];
_loadoutData set ["items_lat_extras", _coreItems];
_loadoutData set ["items_at_extras", _coreItems];
_loadoutData set ["items_aa_extras", _coreItems];
_loadoutData set ["items_machineGunner_extras", _coreItems];
_loadoutData set ["items_marksman_extras", _coreItems + _sniperItems];
_loadoutData set ["items_sniper_extras", _coreItems + _sniperItems];
_loadoutData set ["items_police_extras", _coreItems];
_loadoutData set ["items_crew_extras", _coreItems];
_loadoutData set ["items_unarmed_extras", _coreItems];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "vestsHeavy"]] call _fnc_setVest;
	[["uniformsOfficer", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["riflesGrenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalSmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["GPS"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVG"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	["vestsHeavy"] call _fnc_setVest;
	[["uniformsHeavy", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["riflesGrenadeLaunchers", "rifles", "riflesTuned"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalSmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["GPS"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVG"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["riflesEnforcer", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalSmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["GPS"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVG"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["launchersLightAT"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
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
	["NVG"] call _fnc_addNVGs;
};

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	[selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
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
	["NVG"] call _fnc_addNVGs;
};

private _medicTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["riflesCarbine"] call _fnc_setPrimary;
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
	["NVG"] call _fnc_addNVGs;
};

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "vestsHeavy"]] call _fnc_setVest;
	[["uniformsHeavy", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["riflesGrenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["launchersLightAT"] call _fnc_setLauncher;
		["launcher", 2] call _fnc_addMagazines;
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
	["NVG"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vestsHeavy"] call _fnc_setVest;
	[["uniformsHeavy", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_explosivesExpert_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["explosivesLight", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["explosivesHeavy", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["minesAT", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["minesAP", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVG"] call _fnc_addNVGs;
};

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["launchersLightAT"] call _fnc_setLauncher;
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
	["NVG"] call _fnc_addNVGs;
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["launchersAA"] call _fnc_setLauncher;
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
	["NVG"] call _fnc_addNVGs;
};

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["riflesMachineGuns"] call _fnc_setPrimary;
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
	["NVG"] call _fnc_addNVGs;
};

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["riflesMarksman"] call _fnc_setPrimary;
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
	["NVG"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1.25, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["riflesCarbine"] call _fnc_setPrimary;
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
	["GPS"] call _fnc_addGPS;
	["NVG"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
	[["uniformsOfficer", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

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