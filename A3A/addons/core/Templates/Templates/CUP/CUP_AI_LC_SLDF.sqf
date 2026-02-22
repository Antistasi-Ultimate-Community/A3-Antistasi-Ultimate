//////////////////////////
//   Side Information   //
//////////////////////////

["name", "SLDF"] call _fnc_saveToTemplate;
["spawnMarkerName", "South Lombakka Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "Flex_CUP_SLDF_Faction\Data\Flag\SLOM_Flag_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "CUP_LC_SLDF"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["Flex_CUP_SLDF_LR_Transport"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["Flex_CUP_SLDF_RG31_M2", "Flex_CUP_SLDF_RG31E_M2"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["Flex_CUP_SLDF_MTVR"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["Flex_CUP_SLDF_MTVR"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["Flex_CUP_SLDF_MTVR_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["Flex_CUP_SLDF_MTVR_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["Flex_CUP_SLDF_MTVR_Refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["Flex_CUP_SLDF_LR_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["Flex_CUP_SLDF_BTR80A"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["Flex_CUP_SLDF_BTR80A"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["Flex_CUP_SLDF_T72"]] call _fnc_saveToTemplate;
["vehiclesAA", []] call _fnc_saveToTemplate;
["vehiclesAirborne", ["Flex_CUP_SLDF_BTR80A"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  []] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["Flex_CUP_SLDF_Boat_Transport", "Flex_CUP_SLDF_RHIB_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["Flex_CUP_SLDF_RHIB"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["Flex_CUP_SLDF_BTR80A"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["Flex_CUP_SLDF_CESSNA_T41_ARMED"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", []] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["Flex_CUP_SLDF_C47", "Flex_CUP_SLDF_CESSNA_T41_UNARMED"]] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", ["Flex_CUP_SLDF_AC47_Spooky"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["Flex_CUP_SLDF_AH9_Transport"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["Flex_CUP_SLDF_Lynx_Transport", "Flex_CUP_SLDF_SA330_Transport"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["Flex_CUP_SLDF_AH9"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["Flex_CUP_SLDF_Lynx_dynamicLoadout"]] call _fnc_saveToTemplate;

["vehiclesAirPatrol", ["Flex_CUP_SLDF_AH9_Transport", "Flex_CUP_SLDF_AH9"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["Flex_CUP_SLDF_Hilux_MLRS"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["Flex_CUP_SLDF_Hilux_MLRS", ["CUP_10Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", ["Flex_CUP_SLDF_UAV_06", "Flex_CUP_SLDF_UAV_01", "Flex_CUP_SLDF_UAV_06_antimine"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["Flex_CUP_SLDF_Hilux_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["Flex_CUP_SLDF_MTVR"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["Flex_CUP_SLDF_Hilux_unarmed"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", []] call _fnc_saveToTemplate;

["vehiclesPolice", ["CUP_O_Hilux_unarmed_TK_CIV_White"]] call _fnc_saveToTemplate;

["staticMGs", ["Flex_CUP_SLDF_HMG_high"]] call _fnc_saveToTemplate;
["staticAT", ["Flex_CUP_SLDF_TOW2_TriPod"]] call _fnc_saveToTemplate;
["staticAA", ["Flex_CUP_SLDF_ZU23"]] call _fnc_saveToTemplate;
["staticMortars", ["Flex_CUP_SLDF_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", ["Flex_CUP_SLDF_M119"]] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;
["vehicleSam", ""] call _fnc_saveToTemplate;

["howitzerMagazineHE", "CUP_30Rnd_105mmHE_M119_M"] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
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

_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""]
]];
_loadoutData set ["lightATLaunchers", ["CUP_launch_M72A6"]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
    ["CUP_launch_RPG7V", "", "", "CUP_optic_PGO7V3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]];
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

_loadoutData set ["traitorUniforms", ["Flex_CUP_SLOM_Pullover_Uniform"]];
_loadoutData set ["traitorVests", ["CUP_V_B_MTV"]];
_loadoutData set ["traitorHats", ["CUP_H_PMC_Beanie_Khaki"]];

_loadoutData set ["officerUniforms", ["Flex_CUP_SLOM_BDU_Wood_Light_Gloves"]];
_loadoutData set ["officerVests", ["CUP_V_B_MTV_noCB"]];
_loadoutData set ["officerHats", ["Flex_CUP_SLOM_Army_Beret"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", ["Flex_CUP_SLOM_BDU_Wood_Light", "Flex_CUP_SLOM_BDU_Wood_Light_Gloves", "Flex_CUP_SLOM_BDU_Wood_Light_Rolled", "Flex_CUP_SLOM_BDU_Wood_Light_Rolled_Gloves"]];
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
_loadoutData set ["helmets", ["Flex_CUP_SLOM_Mk6_Wood", "Flex_CUP_SLOM_Mk6_PRR_Wood"]];
_loadoutData set ["slHat", ["Flex_CUP_SLOM_Army_Beret"]];
_loadoutData set ["sniHats", ["Flex_CUP_SLOM_Boonie_Wood"]];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = ["CUP_optic_AN_PVS_10_black"];

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
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["CUP_I_B_PARA_Unit_5", "CUP_I_B_PARA_Unit_13", "CUP_I_B_PARA_Unit_12", "CUP_I_B_PARA_Unit_14"]];
_sfLoadoutData set ["vests", ["CUP_V_MBSS_PACA_CB", "CUP_V_MBSS_PACA2_CB"]];
_sfLoadoutData set ["glVests", ["CUP_V_B_RRV_DA2_CB"]];
_sfLoadoutData set ["slVests", ["CUP_V_B_RRV_DA1_CB"]];
_sfLoadoutData set ["backpacks", ["B_AssaultPack_cbr", "B_Carryall_cbr"]];
_sfLoadoutData set ["slBackpacks", ["B_Kitbag_cbr"]];
_sfLoadoutData set ["atBackpacks", ["CUP_B_ACRPara_dpm"]];
_sfLoadoutData set ["NVGs", ["CUP_NVG_PVS14_WP"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

private _sfRifleSupp = ["", "CUP_muzzle_snds_XM8"];
private _sfOpticsClose = ["CUP_optic_MARS", "CUP_optic_TrijiconRx01_black", "CUP_optic_MEPRO_tri_clear"];
private _sfOpticsCloseXM8 = ["CUP_optic_RCO_PCAP_green", 4, "CUP_optic_ISM_PCAP_green", 6];
private _sfOpticsMid = ["CUP_optic_HensoldtZ0_low", "CUP_optic_HensoldtZ0_low_RDS", "optic_MRCO"];
private _sfOpticsMidXM8 = ["CUP_optic_AMO_PCAP_green", 4, "CUP_optic_ISM_PCAP_green", 6];
private _sfOpticsLong = ["CUP_optic_AN_PVS_10_black", "CUP_optic_LeupoldMk4_20x40_LRT", "CUP_optic_LeupoldMk4", "CUP_optic_LeupoldM3LR"];

_sfLoadoutData set ["slRifles", [
    ["arifle_TRG21_F", "muzzle_snds_M", "", _sfOpticsMid, ["CUP_30Rnd_556x45_EMAG_Olive", "CUP_30Rnd_556x45_EMAG_Tracer_Red"], [], ""], 4,
    ["CUP_arifle_XM8_Carbine_GL_Rail_Green", "CUP_muzzle_snds_XM8", "", _sfOpticsMid,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 2,
	["CUP_arifle_XM8_Carbine_GL_Rail", "CUP_muzzle_snds_XM8", "", _sfOpticsMid,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 2,
    ["CUP_arifle_XM8_Carbine_GL_Green", "CUP_muzzle_snds_XM8", "", _sfOpticsMidXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1,
	["CUP_arifle_XM8_Carbine_GL", "CUP_muzzle_snds_XM8", "",_sfOpticsMidXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_StarFlare_Red_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_FlareRed_M203","CUP_1Rnd_SmokeRed_M203"], ""], 1
]];

_sfLoadoutData set ["rifles", [
    ["arifle_TRG21_F", "muzzle_snds_M", "", _sfOpticsClose, ["CUP_30Rnd_556x45_EMAG_Olive", "CUP_30Rnd_556x45_EMAG_Tracer_Red"], [], ""], 8,
    ["CUP_arifle_XM8_Sharpshooter_FG_Rail_Green", "CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Sharpshooter_FG_Rail", "CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Sharpshooter_Rail_Green", "CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Sharpshooter_Rail", "CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_Sharpshooter_FG_Green", "CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Sharpshooter_FG", "CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Sharpshooter_Green", "CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Sharpshooter", "CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1
]];
_sfLoadoutData set ["carbines", [
    ["arifle_TRG20_F", "muzzle_snds_M", "", _sfOpticsClose, ["CUP_30Rnd_556x45_EMAG_Olive", "CUP_30Rnd_556x45_EMAG_Tracer_Red"], [], ""], 8,
    ["CUP_arifle_XM8_Carbine_FG_Rail_Green","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Carbine_FG_Rail","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Carbine_Rail_Green","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Railed","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_Carbine_FG_Green","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Carbine_FG","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Carbine_Green","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_Carbine","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 1
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["arifle_TRG21_GL_F", "muzzle_snds_M", "", _sfOpticsMid, ["CUP_30Rnd_556x45_EMAG_Olive", "CUP_30Rnd_556x45_EMAG_Tracer_Red"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""], 4,
    ["CUP_arifle_XM8_Carbine_GL_Rail_Green", "CUP_muzzle_snds_XM8","",_sfOpticsMid,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,
	["CUP_arifle_XM8_Carbine_GL_Rail", "CUP_muzzle_snds_XM8","",_sfOpticsMid,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 2,

	["CUP_arifle_XM8_Carbine_GL_Green", "CUP_muzzle_snds_XM8","",_sfOpticsMidXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1,
	["CUP_arifle_XM8_Carbine_GL", "CUP_muzzle_snds_XM8","",_sfOpticsMidXM8 ,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], ["CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_HE_M203"], ""], 1
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_arifle_X95", "muzzle_snds_M", "", _sfOpticsClose, ["CUP_30Rnd_556x45_EMAG_Olive", "CUP_30Rnd_556x45_EMAG_Tracer_Red"], [], ""], 4,
    ["CUP_arifle_X95_Grippod", "muzzle_snds_M", "", _sfOpticsClose, ["CUP_30Rnd_556x45_EMAG_Olive", "CUP_30Rnd_556x45_EMAG_Tracer_Red"], [], ""], 4,
    ["CUP_arifle_XM8_Compact_FG_Rail_Green","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Compact_FG_Rail","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 2,
	["CUP_arifle_XM8_Compact_Rail_Green","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_Compact_Rail","CUP_muzzle_snds_XM8","",_sfOpticsClose,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_Compact_FG_Green","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 1.25,
	["CUP_arifle_XM8_Compact_FG","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], ""], 1.25,
	["CUP_arifle_XM8_Compact_Green","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.75,
	["CUP_arifle_XM8_Compact","CUP_muzzle_snds_XM8","",_sfOpticsCloseXM8,["CUP_30Rnd_TE1_Green_Tracer_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8","CUP_30Rnd_556x45_XM8"], [], "CUP_bipod_VLTOR_Modpod_od"], 0.75
]];
_sfLoadoutData set ["machineGuns", [
    ["LMG_Zafir_F", "", "", _sfOpticsMid, ["150Rnd_762x54_Box_Tracer"], [], ""], 8,
    ["CUP_arifle_XM8_SAW_FG_Rail_Green", "CUP_muzzle_snds_XM8","",_sfOpticsMid,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_FG_Rail", "CUP_muzzle_snds_XM8","",_sfOpticsMid,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_Rail_Green", "CUP_muzzle_snds_XM8","",_sfOpticsMid,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,
	["CUP_arifle_XM8_SAW_Rail", "CUP_muzzle_snds_XM8","",_sfOpticsMid,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 2,

	["CUP_arifle_XM8_SAW_FG_Green", "CUP_muzzle_snds_XM8","",_sfOpticsMidXM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW_Green", "CUP_muzzle_snds_XM8","",_sfOpticsMidXM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW_FG", "CUP_muzzle_snds_XM8","",_sfOpticsMidXM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1,
	["CUP_arifle_XM8_SAW", "CUP_muzzle_snds_XM8","",_sfOpticsMidXM8,["CUP_100Rnd_556x45_BetaCMag","CUP_100Rnd_556x45_BetaCMag"], [], "CUP_bipod_VLTOR_Modpod_od"], 1
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk","CUP_muzzle_snds_AWM","",_sfOpticsLong,["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,
	["CUP_srifle_AWM_wdl","CUP_muzzle_snds_AWM","",_sfOpticsLong,["CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1","CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"], 2,

	["CUP_srifle_G22_blk","CUP_muzzle_snds_AWM","",_sfOpticsLong,["CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22", "CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"], 1,
	["CUP_srifle_G22_wdl","CUP_muzzle_snds_AWM","",_sfOpticsLong,["CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22", "CUP_5Rnd_762x67_G22","CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"], 1
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""],
    ["CUP_launch_M136", "", "", "", [""], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "CUP_muzzle_snds_M9", "", "", ["CUP_15Rnd_9x19_M9"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["vests", ["CUP_V_B_MTV_LegPouch", "CUP_V_B_MTV_Patrol"]];
_eliteLoadoutData set ["mgVests", ["CUP_V_B_MTV_Pouches", "CUP_V_B_MTV_MG"]];
_eliteLoadoutData set ["medVests", ["CUP_V_B_MTV_Pouches", "CUP_V_B_MTV_noCB"]];
_eliteLoadoutData set ["slVests", ["CUP_V_B_MTV_PistolBlack", "CUP_V_B_MTV_TL"]];
_eliteLoadoutData set ["glVests", ["CUP_V_PMC_CIRAS_Khaki_Grenadier"]];
_eliteLoadoutData set ["engVests", ["CUP_V_B_MTV_Mine"]];
_eliteLoadoutData set ["sniVests", ["CUP_V_B_MTV_Marksman"]];
_eliteLoadoutData set ["backpacks", ["B_AssaultPack_cbr"]];
_eliteLoadoutData set ["atBackpacks", ["B_Carryall_khk"]];
_eliteLoadoutData set ["engBackpacks", ["B_Kitbag_cbr"]];
_eliteLoadoutData set ["goggles", ["CUP_G_ESS_RGR"]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_Mk17_CQC", "", "", "", ["CUP_20Rnd_762x51_B_SCAR"], [], ""], 1,
    ["CUP_arifle_Mk17_CQC_FG", "", "", "", ["CUP_20Rnd_762x51_B_SCAR"], [], ""], 2
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_Mk17_CQC", "", "", "", ["CUP_20Rnd_762x51_B_SCAR"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_Galil_SAR_black", "", "", "", ["CUP_35Rnd_556x45_Galil_Mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_glaunch_M32", "", "", "", ["CUP_6Rnd_HE_M203", "CUP_6Rnd_Smoke_M203"], [], ""], 1,
    ["CUP_arifle_Mk17_CQC_EGLM", "", "", "", ["CUP_20Rnd_762x51_B_SCAR"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], ""], 3
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimipara", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_Mk17_STD_FG", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_SCAR"], [], "CUP_bipod_Harris_1A2_L"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_CZ750", "", "", "optic_LRPS", ["CUP_10Rnd_762x51_CZ750", "CUP_10Rnd_762x51_CZ750_Tracer"], [], "CUP_bipod_Harris_1A2_L_BLK"]
]];
_eliteLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["vests", ["CUP_V_B_RRV_Scout_CB", "CUP_V_B_RRV_Scout3"]];
_militaryLoadoutData set ["mgVests", ["CUP_V_B_RRV_MG"]];
_militaryLoadoutData set ["medVests", ["CUP_V_B_RRV_Medic_CB"]];
_militaryLoadoutData set ["slVests", ["CUP_V_B_RRV_Officer_CB", "CUP_V_B_RRV_TL_CB"]];
_militaryLoadoutData set ["glVests", ["CUP_V_B_RRV_Scout2_CB"]];
_militaryLoadoutData set ["engVests", ["CUP_V_B_RRV_DA2_CB", "CUP_V_B_Delta_2"]];
_militaryLoadoutData set ["sniVests", ["CUP_V_B_RRV_Light_CB"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_cbr"]];
_militaryLoadoutData set ["atBackpacks", ["B_Carryall_khk"]];
_militaryLoadoutData set ["engBackpacks", ["B_Kitbag_cbr"]];
_militaryLoadoutData set ["goggles", ["CUP_G_ESS_RGR"]];

_militaryLoadoutData set ["slRifles", [
    
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_Famas_F1_Rail", "", "", "", ["CUP_25Rnd_556x45_Famas"], [], ""], 1,
    ["CUP_Famas_F1_Rail_Arid", "", "", "", ["CUP_25Rnd_556x45_Famas_Arid"], [], ""], 1,
    ["CUP_Famas_F1_Rail_Wood", "", "", "", ["CUP_25Rnd_556x45_Famas_Wood"], [], ""], 1,
    ["CUP_arifle_Galil_556_black", "", "", "", ["CUP_35Rnd_556x45_Galil_Mag"], [], ""], 3
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_sgun_SPAS12", "", "", "", ["CUP_8Rnd_12Gauge_Pellets_No00_Buck", "CUP_8Rnd_12Gauge_Slug"], [], ""],
    ["CUP_arifle_Galil_SAR_black", "", "", "", ["CUP_35Rnd_556x45_Galil_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_glaunch_Mk13", "", "", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], [], ""], 2,
    ["CUP_glaunch_M79", "", "", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], [], ""], 1
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "", ["CUP_32Rnd_9x19_UZI_M"], [], ""], 2,
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5"], [], ""], 1
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_arifle_Galil_556_black", "", "", "", ["CUP_50Rnd_556x45_Red_Tracer_Galil_Mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_Galil_black", "", "", "CUP_optic_SUSAT", ["CUP_25Rnd_762x51_Galil_Mag", "CUP_25Rnd_762x51_Red_Tracers_Galil_Mag"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"],
    ["CUP_srifle_M24_des", "", "", "CUP_optic_LeupoldMk4_10x40_LRT_Desert", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_Harris_1A2_L"]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_M9", "", "", "", ["CUP_15Rnd_9x19_M9"], [], ""],
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_M1014", "", "", "", ["CUP_8Rnd_12Gauge_Slug"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", [
    "CUP_U_B_BDUv2_roll_gloves_dirty_DPM_OD", "CUP_U_B_BDUv2_roll_gloves_DPM_OD", "CUP_U_B_BDUv2_roll_dirty_DPM_OD", "CUP_U_B_BDUv2_roll_DPM_OD",
    "CUP_U_B_BDUv2_roll2_gloves_dirty_DPM_OD", "CUP_U_B_BDUv2_roll2_gloves_DPM_OD", "CUP_U_B_BDUv2_roll2_dirty_DPM_OD", "CUP_U_B_BDUv2_roll2_DPM_OD",
    "CUP_U_B_BAF_DPM_UBACSTSHIRT_Gloves", "CUP_U_B_BAF_DPM_UBACSTSHIRT"
]];
_militiaLoadoutData set ["vests", ["V_HarnessO_brn", "V_Chestrig_khk"]];
_militiaLoadoutData set ["glVests", ["V_HarnessOGL_brn"]];
_militiaLoadoutData set ["sniVests", ["V_TacChestrig_cbr_F"]];
_militiaLoadoutData set ["engVests", ["V_TacVest_khk"]];
_militiaLoadoutData set ["backpacks", ["CUP_B_AssaultPack_Coyote", "B_LegStrapBag_coyote_F"]];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_FNFAL5061_wooden", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""], 2,
    ["CUP_arifle_IMI_Romat", "", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""], 2,
    ["CUP_srifle_LeeEnfield", "", "", "", ["CUP_10x_303_M"], [], ""], 1
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_glaunch_M79", "", "", "", ["CUP_1Rnd_HE_M203", "CUP_1Rnd_Smoke_M203", "CUP_1Rnd_StarCluster_Red_M203"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_Gewehr1", "", "", "", ["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"], [], "CUP_bipod_FNFAL"]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_06_hunter_F", "", "", "optic_KHS_old", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""],
    ["srifle_DMR_06_camo_F", "", "", "optic_KHS_old", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""],
    ["srifle_DMR_06_olive_F", "", "", "optic_KHS_old", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_LeeEnfield", "", "", "CUP_optic_no23mk2", ["CUP_10x_303_M"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911",7], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["Flex_CUP_SLOM_BDU_Wood_Light_Gloves"]];
_crewLoadoutData set ["vests", ["CUP_V_B_MTV"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_MTV"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];

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

    [["carbines", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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

    [["carbines", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
	["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
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


    [["marksmanRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
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
