//////////////////////////
//   Side Information   //
//////////////////////////

["name", "NLAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "North Lombakka Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "Flex_CUP_NLAF_Faction\Data\Flag\NLOM_Flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "CUP_LC_NLAF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["O_Quadbike_01_F", "Flex_CUP_NLAF_Ural_Empty"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["Flex_CUP_NLAF_Hilux_unarmed", "Flex_CUP_NLAF_UAZ_Unarmed", "Flex_CUP_NLAF_UAZ_Open"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["Flex_CUP_NLAF_Hilux_M2", "Flex_CUP_NLAF_Hilux_SPG9", "Flex_CUP_NLAF_UAZ_SPG9"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["Flex_CUP_NLAF_Ural"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["Flex_CUP_NLAF_Ural_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["Flex_CUP_NLAF_Ural_Reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["Flex_CUP_NLAF_Ural_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["Flex_CUP_NLAF_Ural_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", []] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["Flex_CUP_NLAF_BTR80"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["Flex_CUP_NLAF_BTR80"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["Flex_CUP_NLAF_BTR80"]] call _fnc_saveToTemplate;
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesLightTanks",  []] call _fnc_saveToTemplate;
["vehiclesTanks", ["Flex_CUP_NLAF_T72"]] call _fnc_saveToTemplate;
["vehiclesAA", ["Flex_CUP_NLAF_Ural_ZU23", "Flex_CUP_NLAF_Hilux_zu23"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["Flex_CUP_NLAF_Boat_Transport", "Flex_CUP_NLAF_RHIB_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", []] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["Flex_CUP_NLAF_BTR80"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", []] call _fnc_saveToTemplate;
["vehiclesPlanesAA", []] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["Flex_CUP_NLAF_C47"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["Flex_CUP_NLAF_UH1H", "Flex_CUP_NLAF_UH1H_slick"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["Flex_CUP_NLAF_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["Flex_CUP_NLAF_UH1H", "Flex_CUP_NLAF_Mi8"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Flex_CUP_NLAF_UH1H_armed"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", ["Flex_CUP_NLAF_UH1H", "Flex_CUP_NLAF_Mi8"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["Flex_CUP_NLAF_Ural_BM21"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["Flex_CUP_NLAF_Ural_BM21", ["CUP_40Rnd_GRAD_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["Flex_CUP_NLAF_UAV_06_antimine", "Flex_CUP_NLAF_UAV_06", "Flex_CUP_NLAF_UAV_01"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["Flex_CUP_UN_nM1151_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["Flex_CUP_UN_Truck_01_transport", "Flex_CUP_UN_Truck_01_covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Flex_CUP_UN_nM1151_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["Flex_CUP_UN_M113A3", "Flex_CUP_UN_M113A3_HQ"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["Flex_CUP_UN_SUV"]] call _fnc_saveToTemplate;

["staticMGs", ["Flex_CUP_NLAF_HMG_high"]] call _fnc_saveToTemplate;
["staticAT", ["Flex_CUP_NLAF_SPG9"]] call _fnc_saveToTemplate;
["staticAA", ["Flex_CUP_NLAF_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["Flex_CUP_NLAF_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", ["Flex_CUP_NLAF_D30"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "CUP_30Rnd_122mmHE_D30_M"] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "CUP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "Barklem",
    "TanoanHead_A3_06","TanoanHead_A3_01","TanoanHead_A3_09","TanoanHead_A3_07",
    "TanoanHead_A3_05","TanoanHead_A3_04","TanoanHead_A3_03","TanoanHead_A3_02",
    "AfricanHead_01","AfricanHead_03","AfricanHead_02"
]] call _fnc_saveToTemplate;
["voices", ["Male01FRE", "Male02FRE", "Male03FRE", "Male01ENGFRE", "Male02ENGFRE"]] call _fnc_saveToTemplate;
"AfroMen" call _fnc_saveNames;

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

_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["lightATLaunchers", ["CUP_launch_RPG26"]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [""], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_PVS7"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["traitorUniforms", ["Flex_CUP_NLOM_Pullover_Uniform"]];
_loadoutData set ["traitorVests", [""]];
_loadoutData set ["traitorHats", ["CUP_H_PMC_Beanie_Khaki"]];

_loadoutData set ["officerUniforms", ["Flex_CUP_NLOM_BDU_Wood_Light_Rolled_Gloves"]];
_loadoutData set ["officerVests", ["Flex_CUP_LOM_Vest_RFL"]];
_loadoutData set ["officerHats", ["H_Beret_blk"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

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
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["CUP_H_SLA_BeretRed"]];
_loadoutData set ["sniHats", []];

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

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["Flex_CUP_NLOM_BDU_Wood_Light", "Flex_CUP_NLOM_BDU_Wood_Light_Rolled", "Flex_CUP_NLOM_BDU_Wood_Light_Rolled_Gloves"]];
_eliteLoadoutData set ["vests", ["Flex_CUP_LOM_Vest_RFL"]];
_eliteLoadoutData set ["slVests", ["Flex_CUP_LOM_Vest_TL"]];
_eliteLoadoutData set ["mgVests", ["Flex_CUP_LOM__Vest_MG"]];
_eliteLoadoutData set ["medVests", ["Flex_CUP_LOM_Vest_Med"]];
_eliteLoadoutData set ["engVests", ["V_EOD_olive_F"]];
_eliteLoadoutData set ["engBackpacks", ["B_LegStrapBag_coyote_F"]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_khk"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_cbr"]];
_eliteLoadoutData set ["helmets", ["CUP_H_Ger_M92", "CUP_H_Ger_M92_GG", "CUP_H_Ger_M92_GG_CB", "CUP_H_Ger_M92_GG_CF"]];
_eliteLoadoutData set ["goggles", ["CUP_G_ESS_RGR"]];


_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_TYPE_56_2_top_rail", "", "", "CUP_optic_PechenegScope", ["CUP_30Rnd_762x39_AK47_M"], [], ""],
    ["CUP_arifle_TYPE_56_2_top_rail", "", "", "CUP_optic_PSO_1_AK_open", ["CUP_30Rnd_762x39_AK47_M"], [], ""]
]];

_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_TYPE_56_2", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], [], ""],
    ["CUP_arifle_TYPE_56_2_Early", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], [], ""],
    ["CUP_arifle_TYPE_56_2_top_rail", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], [], ""]
]];

_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_AKS", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], [], ""]
]];

_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "", ["CUP_32Rnd_9x19_UZI_M"], [], ""]
]];

_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A4_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], ""], 2,
    ["CUP_arifle_AK47_GL", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""], 1
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_FNMAG_RIS_modern", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_G3"], [], "CUP_bipod_G3SG1"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_CZ550", "", "", "", ["CUP_5x_22_LR_17_HMR_M"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
	["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["Flex_CUP_NLOM_BDU_Militia_Light_Rolled", "Flex_CUP_NLOM_BDU_Militia_Alt_Light_Rolled"]];
_militaryLoadoutData set ["vests", ["Flex_CUP_LOM_Carrier_Vest_2_od", "Flex_CUP_LOM_Carrier_Vest_2", "V_TacChestrig_oli_F"]];
_militaryLoadoutData set ["slVests", ["Flex_CUP_LOM_Carrier_Vest_od", "Flex_CUP_LOM_Carrier_Vest"]];
_militaryLoadoutData set ["medVests", ["CUP_V_O_SLA_M23_1_OD"]];
_militaryLoadoutData set ["mgVests", ["V_Pocketed_coyote_F"]];
_militaryLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_Khaki_Grenadier"]];
_militaryLoadoutData set ["engVests", ["V_TacChestrig_cbr_F"]];
_militaryLoadoutData set ["backpacks", ["B_TacticalPack_blk", "B_FieldPack_khk"]];
_militaryLoadoutData set ["engBackpacks", ["CUP_B_RUS_Backpack"]];
_militaryLoadoutData set ["atBackpacks", ["CUP_B_RPGPack_Khaki"]];
_militaryLoadoutData set ["helmets", ["CUP_H_USArmy_Helmet_M1_plain_Olive", "CUP_H_USArmy_Helmet_M1_Olive", "H_Shemag_olive", "H_ShemagOpen_tan", "H_Cap_blk"]];
_militaryLoadoutData set ["slHat", ["H_Cap_blk", "CUP_H_PMC_Cap_Back_Tan"]];
_militaryLoadoutData set ["sniHats", ["H_Booniehat_khk", "H_Hat_Safari_olive_F"]];
_militaryLoadoutData set ["glasses", ["G_Sport_Blackred"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_FNFAL5061", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""], 3,
    ["CUP_arifle_FNFAL5060_woodland", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""], 1
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_FNFAL5060", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""], 3,
    ["CUP_arifle_G3A3_ris", "", "", "", ["CUP_20Rnd_762x51_G3"], [], ""], 2,
    ["CUP_arifle_M16A2", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""], 2
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_FNFAL", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""], 2,
    ["CUP_arifle_AKS", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], [], ""], 1
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_glaunch_M79", "", "", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], [], ""], 3,
    ["CUP_arifle_AK47_GL", "", "", "", ["CUP_30Rnd_762x39_AK47_M"], ["CUP_1Rnd_HE_GP25_M", "CUP_1Rnd_SmokeRed_GP25_M"], ""], 1
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "", ["CUP_32Rnd_9x19_UZI_M"], [], ""], 1,
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""], 2
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_FNMAG", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_M16A2", "", "", "optic_KHS_old", ["CUP_20Rnd_556x45_Stanag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_CZ550", "", "", "", ["CUP_5x_22_LR_17_HMR_M"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", ["CUP_launch_RPG18"]];


private _opticsClose = ["CUP_optic_CompM2_low", 1, "CUP_optic_CompM4", 3, "CUP_optic_MicroT1", 2, "", 1];
private _opticsCloseLow = ["CUP_optic_MicroT1_low", 2, "CUP_optic_AC11704_Black", 1, "CUP_optic_ZeissZPoint", 2, "", 1];
private _opticsMid = ["CUP_optic_AIMM_COMPM4_BLK", "CUP_optic_AIMM_MICROT1_BLK", "CUP_optic_Elcan_SpecterDR_black", "CUP_optic_Elcan_SpecterDR_RMR_black"];
private _opticsMG = ["CUP_optic_AN_PAS_13c1", "CUP_optic_AIMM_COMPM4_BLK", "CUP_optic_Elcan_SpecterDR_RMR_black"];
private _opticsLong = ["CUP_optic_SB_11_4x20_PM", "CUP_optic_Elcan_SpecterDR_RMR_black"];
private _accDevices = ["CUP_acc_ANPEQ_15_Black", 3, "CUP_acc_ANPEQ_15_Flashlight_Black_L", 2, "", 1];


///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["Flex_CUP_POR_G3_UN"]];
_policeLoadoutData set ["vests", ["CUP_V_CPC_light_coy", "CUP_V_CPC_medical_coy"]];
_policeLoadoutData set ["helmets", ["CUP_H_CDF_PASGT_UN"]];
_policeLoadoutData set ["slHat", ["Flex_CUP_UN_Beret"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_VFG", "", "", _opticsClose, ["CUP_30Rnd_9x19_MP5"], [], ""], 1,
    ["CUP_smg_MP5A5_Rail_AFG", "", "", _opticsClose, ["CUP_30Rnd_9x19_MP5"], [], ""], 1,
    ["CUP_smg_MP5A5_Rail", "", "", _opticsClose, ["CUP_30Rnd_9x19_MP5"], [], ""], 1,
    ["CUP_smg_p90_black", "", "", _opticsCloseLow, ["50Rnd_570x28_SMG_03"], [], ""], 3,
    ["CUP_sgun_M1014", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""], 1,
    ["CUP_sgun_M1014_vfg", "", "", _opticsClose, ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""], 1,
    ["CUP_sgun_M1014_solidstock", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""], 1
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Glock17_tan", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["Flex_CUP_POR_G3_UN"]];
_militiaLoadoutData set ["vests", ["CUP_V_CPC_Fastbelt_coy"]];
_militiaLoadoutData set ["sniVests", ["CUP_V_CPC_lightbelt_coy"]];
_militiaLoadoutData set ["slVests", ["CUP_V_CPC_communicationsbelt_coy", "CUP_V_CPC_tlbelt_coy"]];
_militiaLoadoutData set ["engVests", ["CUP_V_CPC_weaponsbelt_coy"]];
_militiaLoadoutData set ["glVests", ["CUP_V_CPC_weaponsbelt_coy"]];
_militiaLoadoutData set ["medVests", ["CUP_V_CPC_medicalbelt_coy"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_cbr"]];
_militiaLoadoutData set ["engBackpacks", ["B_Carryall_cbr"]];
_militiaLoadoutData set ["longRangeRadios", ["Flex_CUP_POR_Radio_Backpack"]];
_militiaLoadoutData set ["helmets", ["Flex_CUP_POR_Opscore_UN_No_Headset", "Flex_CUP_POR_Opscore_UN_SF", "Flex_CUP_POR_Opscore_UN"]];
_militiaLoadoutData set ["sniHats", ["Flex_CUP_POR_Boonie"]];
_militiaLoadoutData set ["NVGs", ["CUP_NVG_PVS15_black"]];

_militiaLoadoutData set ["slRifles", [
    ["CUP_arifle_Mk16_STD", "", _accDevices, _opticsMid, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_STD_AFG", "", _accDevices, _opticsMid, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_STD_FG", "", _accDevices, _opticsMid, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_SV", "", _accDevices, _opticsMid, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""]
]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_Mk16_STD", "", _accDevices, _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_STD_AFG", "", _accDevices, _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_STD_FG", "", _accDevices, _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Mk16_CQC", "", _accDevices, _opticsCloseLow, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_CQC_AFG", "", _accDevices, _opticsCloseLow, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""],
    ["CUP_arifle_Mk16_CQC_FG", "", _accDevices, _opticsCloseLow, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_Mk16_STD_EGLM", "", _accDevices, _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], ""],
    ["CUP_arifle_Mk16_CQC_EGLM", "", _accDevices, _opticsClose, ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Green"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail_VFG", "", _accDevices, _opticsClose, ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "", _accDevices, _opticsClose, ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail", "", _accDevices, _opticsClose, ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimi_railed", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_minimi_railed", "", "", _opticsMG, ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_Mk48_nohg_tan", "", "", _opticsMG, ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "", _accDevices, _opticsLong, ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_Harris_1A2_L_BLK"], 3,
    ["CUP_arifle_HK417_20_Desert", "", _accDevices, _opticsLong, ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_Harris_1A2_L_BLK"], 3,
    ["CUP_arifle_HK417_12", "", _accDevices, _opticsLong, ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_Harris_1A2_L_BLK"], 1,
    ["CUP_arifle_HK417_12_Desert", "", _accDevices, _opticsLong, ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_Harris_1A2_L_BLK"], 1
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_wdl", "", "", ["CUP_optic_LeupoldMk4", "CUP_optic_LeupoldMk4_20x40_LRT"], ["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_Harris_1A2_L_BLK"],
    ["CUP_srifle_AWM_des", "", "", ["CUP_optic_LeupoldMk4", "CUP_optic_LeupoldMk4_20x40_LRT"], ["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Glock17_tan", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

_militiaLoadoutData set ["missileATLaunchers", []];

_militiaLoadoutData set ["lightATLaunchers", ["CUP_launch_M72A6"]];

_militiaLoadoutData set ["ATLaunchers", [
    ["CUP_launch_MAAWS", "", "", ["CUP_optic_MAAWS_Scope", ""], ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];

_militiaLoadoutData set ["AALaunchers", []];


///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

// there's not really a good option for SF when doing this with making UN police and militia. so we'll just make UN the SF as well XD they are the best-equipped anyway
private _sfLoadoutData = _militiaLoadoutData call _fnc_copyLoadoutData;


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];
_crewLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""], 2,
    ["CUP_hgun_FlareGun", "", "", "", ["CUP_FlareRed_265_M", "CUP_FlareGreen_265_M", "CUP_FlareWhite_265_M"], [], ""], 1
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["Flex_CUP_NLOM_Pullover_Uniform"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O"]];
_pilotLoadoutData set ["vests", ["V_TacChestrig_oli_F"]];
_pilotLoadoutData set ["sidearms", [
    ["CUP_hgun_Browning_HP", "", "", "", ["CUP_13Rnd_9x19_Browning_HP"], [], ""], 2,
    ["CUP_hgun_FlareGun", "", "", "", ["CUP_FlareRed_265_M", "CUP_FlareGreen_265_M", "CUP_FlareWhite_265_M"], [], ""], 1
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
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

private _policeSLTemplate = {
    ["slHat"] call _fnc_setHelmet;
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
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
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

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
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
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
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
	["SquadLeader", _policeSLTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
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
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
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
