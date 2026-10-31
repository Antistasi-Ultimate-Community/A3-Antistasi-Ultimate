#pragma hemtt ignore_variables ["_fnc_saveNames","_fnc_createLoadoutData","_fnc_copyLoadoutData","_fnc_generateAndSaveUnitsToTemplate","_fnc_saveToTemplate"]

/////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "MAWS"] call _fnc_saveToTemplate;
["nameLeader", "Thomas Smith"] call _fnc_saveToTemplate;

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

private _vehiclesLightArmed = ["MDTF_V_APC_IFV"];
private _vehiclesLightUnarmed = ["MAWS_A_APC_U"];
private _vehiclesAPC = ["MDTF_V_APC_IFV"];
private _vehiclesTanks = ["MDTF_V_APC_MGS"];
private _vehiclesHelis = ["TKE_Ext_Dragonfly_A_MDTF_V"];
private _vehiclesUAV = [];
private _vehiclesTrucks = ["MAWS_A_APC_U"];
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
    ["TKE_MDRifle", "", "", _opticsLight, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 2,
    ["TKE_MDRifle2Camo", "", "", _opticsLight, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTR"], [], ""], 0.5
];
private _riflesTuned = [
    ["TKE_MDRifle", "", "", _opticsHeavy, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 5,
    ["TKE_ARX12", "", "", _opticsHeavy, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 3
];
private _riflesEnforcer = _riflesTuned;
private _riflesCarbine = _riflesTuned;
private _riflesGrenadeLaunchers = [
	["TKE_MDRifleV2", "", "", _opticsHeavy, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 1
];
private _riflesMachineGuns = [
    ["TKE_MDLMG", "", "", _opticsHeavy, ["TKE_150rnd_62x35_magMD"], [], ""], 3,
    ["TKE_UCNMMGMD", "", "", _opticsHeavy, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1.5
];
private _riflesMarksman = [
    ["TKE_MDDMR", "", "", "TKE_10xSight", ["TKE_20rnd_969x51_magMD"], [], "bipod_03_F_blk"], 1
];

private _launchersLightAT = [
    ["TKE_ATRecoilless1MDTFBrown", "", "", "", ["MRAWS_HE_F"], [], ""], 1
];
private _launchersAA = [
    ["launch_B_Titan_olive_F", "", "", "", ["Titan_AA"], [], ""], 1
];
private _sidearms = [
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
_loadoutData set ["headgear", ["TKE_BoonieHatBlack", "TKE_BoonieHatHSBlack", "MAWS_PatCap_1", "MAWS_headset_1"]]; // Note: NOT helmets; those are below

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["GPS", ["ItemGPS"]];
_loadoutData set ["NVG", ["TKE_IntegratedNVGs"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

private _uniforms = ["MAWS_CombatUniform_3", "MAWS_CombatUniform_U3"];
private _uniformsHeavy = ["MAWS_CombatBot_1"];
private _uniformsOfficer = _uniforms;

private _vests = ["MAWS_Vest_L", "MAWS_Vest_M"];
private _vestsHeavy = ["MAWS_BotVest_1"];
private _vestsOfficer = _vests;

private _helmets = ["MAWS_CopHelm_1", "MAWS_CopHelm_V1", "MAWS_MD_Helm_1"];
private _helmetsHeavy = ["MAWS_MD_BotHead"];
private _helmetsOfficer = ["MAWS_MD_HvyHelm_1"];

private _backpacks = ["TKE_AlicePackUCN", "TKE_CamelBakUCN", "TKE_BackPack1"];

///////////////////////////
//    Misc Loadouts     //
/////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", _uniforms];
_crewLoadoutData set ["vests", _vests];
_crewLoadoutData set ["helmets", ["MAWS_MD_HvyHelm_1"]];

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
