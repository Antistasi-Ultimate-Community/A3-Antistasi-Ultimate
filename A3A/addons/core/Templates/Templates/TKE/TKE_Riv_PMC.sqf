#pragma hemtt ignore_variables ["_fnc_saveNames","_fnc_createLoadoutData","_fnc_copyLoadoutData","_fnc_generateAndSaveUnitsToTemplate","_fnc_saveToTemplate"]

/////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Meridian Frontier"] call _fnc_saveToTemplate;
["nameLeader", "Liam Hughes"] call _fnc_saveToTemplate;

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
private _vehiclesAPC = ["TKE_Ext_Bearcat_Autocannon_UCNFA"];
private _vehiclesTanks = ["TKE_Ext_Bearcat_Cannon_UCNFA"];
private _vehiclesHelis = ["TKE_Ext_Dragonfly_T_PMC"];
private _vehiclesUAV = [];
private _vehiclesTrucks = ["TKE_Ext_Bearcat_Unarmed_UCNFA"];
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
    ["TKE_ARX12", "", "", _opticsLight, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 1,
    ["TKE_MDStdRifleGrey", "", "", _opticsLight, ["TKE_MD30rnd_575x45_mag", "TKE_MD30rnd_575x45_magTR"], [], ""], 1,
    ["TKE_KMCSMGGrey", "", "", _opticsLight, ["TKE_45rnd_pdw_mag"], [], ""], 1,
    ["TKE_UCNRifle3", "", "", _opticsLight, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTR"], [], ""], 1,
    ["WRS_Weapon_AR_Black", "", "", "optic_Hamr", ["WRS_Ar_Magazine"], [], ""], 1
];
private _riflesTuned = [
    ["TKE_ARX12", "", "", _opticsHeavy, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 1,
    ["TKE_UCNRifle2", "", "", _opticsLight, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTR"], [], ""], 1,
    ["TKE_UCNBPRifle", "", "", _opticsLight, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTR"], [], ""], 1,
    ["TKE_BPRA5", "", "", _opticsLight, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 1,
    ["TKE_MDRifle", "", "", _opticsLight, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 1,
    ["WRS_Weapon_AUG", "", "", "optic_Hamr", ["WRS_Ar1_Magazine"], [], ""], 1
];
private _riflesEnforcer = _riflesTuned;
private _riflesCarbine = _riflesTuned;
private _riflesGrenadeLaunchers = [
    ["TKE_ARX12GL", "", "", _opticsHeavy, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareRed_F", "1Rnd_SmokeRed_Grenade_shell"], ""], 1,
    ["TKE_MDRifleV2", "", "", _opticsHeavy, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], ["1Rnd_HE_Grenade_shell", "UGL_FlareRed_F", "1Rnd_SmokeRed_Grenade_shell"], ""], 1
];
private _riflesMachineGuns = [
    ["TKE_UCNLMG", "", "", _opticsHeavy, ["TKE_150rnd_62x35_magUCN"], [], ""], 2,
    ["TKE_UCNMMG", "", "", _opticsHeavy, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1
];
private _riflesMarksman = [
    ["TKE_UCNDMR", "", "", "TKE_10xSight", ["TKE_20rnd_969x51_magUCN"], [], "bipod_03_F_blk"], 1
];

private _launchersLightAT = [
    ["TKE_ATRecoilless1", "", "", "", ["MRAWS_HE_F"], [], ""], 1
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

private _uniforms = ["TKE_MercOutfit_U_B", "TKE_CombatUniRolledV1Merc_U_B", "TKE_CombatUniRolledV2Merc_U_B", "TKE_FCFSweaterMerc_U_B"];
private _uniformsHeavy = ["TKE_CombatUniMerc_U_B", "TKE_CombatUniRolledV1Merc_U_B", "TKE_CombatUniRolledV2Merc_U_B"];
private _uniformsOfficer = ["TKE_CombatUniRolledV1Merc_U_B", "TKE_CombatUniRolledV2Merc_U_B"];

private _vests = ["TKE_FCFCombatRigGrey", "TKE_R35Harness", "TKE_R35VestP1NN", "TKE_R35VestP2NN", "TKE_FlakJacketPV1", "TKE_GenVest1PV1"];
private _vestsHeavy = ["TKE_KMCArmour1MediumMerc", "TKE_KMCArmour1HeavyMerc", "TKE_R35VestP1"];
private _vestsOfficer = ["TKE_GenVest1PV2", "TKE_KMCArmour1LightMerc", "TKE_R35VestP1"];

private _helmets = ["TKE_MercHelm_BASE", "TKE_MercHelmNVG2_BASE", "TKE_MercHelmV2"];
private _helmetsHeavy = ["TKE_MercHelmClosed_BASE", "TKE_MercHelmNVG1_BASE"];
private _helmetsOfficer = ["TKE_MercHelmNVG1_BASE"];

private _backpacks = ["TKE_AlicePackUCN", "TKE_CamelBakUCN", "TKE_BackPack1"];

///////////////////////////
//    Misc Loadouts     //
/////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["TKE_CombatUniRolledV1Merc_U_B", "TKE_CombatUniRolledV2Merc_U_B"]];
_crewLoadoutData set ["vests", ["TKE_R35Vest"]];
_crewLoadoutData set ["helmets", ["TKE_MercHelmClosed_BASE"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["TKE_VoidSuitMerc_U_B"]];
_pilotLoadoutData set ["vests", ["TKE_PilotVestMerc"]];
_pilotLoadoutData set ["helmets", ["TKE_MercHelmClosed_BASE"]];

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

#include "definitions\Riv_Definitions_Units_Core.sqf"
