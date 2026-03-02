//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"
["name", "Liberation Army"] call _fnc_saveToTemplate; 						
["spawnMarkerName", "Sahrani Liberation Army Support Corridor"] call _fnc_saveToTemplate; 			

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						
["flagTexture", "\PRACS_SLA_Core\Flags\flag_north_co.paa"] call _fnc_saveToTemplate;		
["flagMarkerType", "PRACS_SLA_Flag_mrk"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["PRACS_SLA_UAZ_open", "PRACS_SLA_UAZ", "PRACS_SLA_MTLB"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["PRACS_SLA_UAZ_DSHKM", "PRACS_SLA_Tigr", "PRACS_SLA_UAZ_A_AGS", "PRACS_SLA_UAZ_A_SPG9", "PRACS_SLA_UAZ_A_AT", "PRACS_SLA_BRDM"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["PRACS_SLA_MAZ_Transport", "PRACS_SLA_URAL", "rhs_kraz255b1_cargo_open_vdv", "rhs_zil131_open_msv", "rhs_zil131_msv"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["PRACS_SLA_MAZ_Transport", "PRACS_SLA_URAL","rhs_kraz255b1_cargo_open_vdv", "rhs_zil131_open_msv"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["PRACS_SLA_MTLB_AMMO", "PRACS_SLA_Ural_Ammo", "PRACS_SLA_MAZ_ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PRACS_SLA_URAL_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PRACS_SLA_URAL_Fuel", "rhs_kraz255b1_fuel_vdv"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PRACS_SLA_MTLB_AMB", "PRACS_SLA_Ural_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["PRACS_SLA_Type63_AT","PRACS_SLA_Type63", "PRACS_SLA_BRDM","PRACS_SLA_Type63_AGS", "PRACS_SLA_BTR60", "PRACS_SLA_BTR40_AGS"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["PRACS_SLA_BMD1", "PRACS_SLA_BMD2"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["PRACS_SLA_BTR80", "PRACS_SLA_BTR80A"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["PRACS_SLA_BMP1", "PRACS_SLA_BMP2", "PRACS_SLA_BMP3"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["PRACS_SLA_PT76", "PRACS_SLA_T72B"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["PRACS_SLA_T72BV", "PRACS_SLA_T80U", "PRACS_SLA_T90_SA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["PRACS_SLA_BTR40_AAM","PRACS_SLA_MTLB_S60","PRACS_SLA_MTLB_ZU23","PRACS_SLA_Type63_ADA", "PRACS_SLA_URAL_Zu23", "PRACS_SLA_2S6M_Tunguska", "PRACS_SLA_SA8", "PRACS_SLA_SA9", "PRACS_SLA_ZSU23","PRACS_SLA_Ural_ZPU4"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["PRACS_SLA_GoFast"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["PRACS_SLA_GoFast_gun"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["PRACS_SLA_BRDM", "PRACS_SLA_BTR60", "PRACS_SLA_PT76_NAVY"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["PRACS_SLA_SU22","PRACS_SLA_Su25", "PRACS_SLA_MiG27"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["PRACS_SLA_MiG21", "PRACS_SLA_MiG23", "PRACS_SLA_MiG29"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["PRACS_AN12B"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["PRACS_SLA_Mi8amt", "PRACS_SLA_Z11W_B2"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["PRACS_SLA_Mi17Sh_UPK", "PRACS_SLA_Mi17Sh"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["PRACS_SLA_Z11W_ATK", "PRACS_SLA_Mi17Sh_UPK", "PRACS_SLA_Mi17Sh","PRACS_SLA_Z11W_ATK2"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["PRACS_SLA_Mi24V_UPK", "PRACS_SLA_Mi24D"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["PRACS_SLA_2s1","PRACS_SLA_2S3"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
    ["PRACS_SLA_2s1", ["rhs_mag_bk13_5"]],
	["PRACS_SLA_2S3", ["rhs_mag_HE_2a33"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_CAS_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["PRACS_SLA_UAZ_DSHKM"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["PRACS_SLA_URAL_SPLF", "PRACS_SLA_URAL_Open_SPLF"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["PRACS_SLA_UAZ_open_SPLF"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["PRACS_SLA_BTR40_SPLF", "PRACS_SLA_BTR40_NSV", "PRACS_SLA_BTR40_AT"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["PRACS_SLA_URAL_BG", "PRACS_SLA_UAZ_open_Border_guard", "PRACS_SLA_BRDM_BG", "PRACS_SLA_BTR60_BG"]] call _fnc_saveToTemplate;

["staticMGs", ["PRACS_SLA_DShK"]] call _fnc_saveToTemplate;
["staticAT", ["PRACS_SLA_SPG9M_tripod", "PRACS_SLA_9k115"]] call _fnc_saveToTemplate;
["staticAA", ["PRACS_SLA_S60", "PRACS_SLA_ZU23", "PRACS_SLA_ZPU4", "rhs_Igla_AA_pod_msv"]] call _fnc_saveToTemplate;
["staticMortars", ["PRACS_SLA_2B14"]] call _fnc_saveToTemplate;
["staticHowitzers", ["PRACS_SLA_M46"]] call _fnc_saveToTemplate;

["vehicleRadar", "PRACS_SLA_1S91"] call _fnc_saveToTemplate;
["vehicleSam", "PRACS_SLA_SA6"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "PRACS_130mm_X32"] call _fnc_saveToTemplate;

["mortarMagazineHE", "rhs_mag_3vo18_10"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "rhs_mag_d832du_10"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "rhs_mag_3vs25m_10"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["WhiteHead_04","WhiteHead_05","WhiteHead_06", "Mavros"]] call _fnc_saveToTemplate;
["sfFaces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_22_sa"]] call _fnc_saveToTemplate;
["sfVoices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;

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
    ["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v2", ["rhs_rpg7_PG7VL_mag", "rhs_rpg7_PG7VR_mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["rhs_weap_igla", "", "", "", ["rhs_mag_9k38_rocket"], [], ""]
]];

_loadoutData set ["sidearms", []];
_loadoutData set ["glSidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["rhs_1PN138"]];
_loadoutData set ["binoculars", ["rhs_pdu4"]];
_loadoutData set ["rangefinders", ["rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["traitorUniforms", ["PRACS_M10_Commando_uniform"]];
_loadoutData set ["traitorVests", ["PRACS_O_CIRAS_GAL_rifleman", "PRACS_O_CIRAS_G3_rifleman"]];
_loadoutData set ["traitorHats", ["PRACS_Patrol_ASDPM_B_Cap", "PRACS_Patrol_SDPM_Cap", "PRACS_Patrol_SMAR_Cap"]];

_loadoutData set ["officerUniforms", ["PRACS_M10_SNG_D_PL_uniform", "PRACS_M10_1ID_PL_uniform"]];
_loadoutData set ["officerVests", ["PRACS_holster_vest", "V_Rangemaster_belt", "rhs_6sh92_digi_radio"]];
_loadoutData set ["officerHats", ["PRACS_Patrol_6TDes_Cap"]];

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
_loadoutData set ["longRangeRadios", ["B_RadioBag_01_wdl_F"]];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["PRACS_SLA_M88_Especas_uniform"]];
_sfLoadoutData set ["vests", ["PRACS_SLA_6sh92", "PRACS_SLA_6sh92_R"]];
_sfLoadoutData set ["mgVests", ["PRACS_SLA_6B23_6sh92"]];
_sfLoadoutData set ["medVests", ["PRACS_SLA_6B23_6sh92_L_Radio"]];
_sfLoadoutData set ["glVests", ["PRACS_SLA_6sh92_VOG", "PRACS_SLA_6sh92_VOG_SF"]];
_sfLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54"]];
_sfLoadoutData set ["slBackpacks", ["PRACS_SLA_RD54"]];
_sfLoadoutData set ["atBackpacks", ["PRACS_SLA_cammo_RD54"]];
_sfLoadoutData set ["helmets", ["PRACS_SLA_6B27M_ess"]];
_sfLoadoutData set ["slHat", ["PRACS_SLA_6B27M_ess"]];
_sfLoadoutData set ["sniHats", ["PRACS_SLA_Soft_Cap"]];
_sfLoadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_sfLoadoutData set ["binoculars", ["rhs_pdu4"]];

_sfLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_sfLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_sfLoadoutData set ["slRifles", [
    ["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["rhs_weap_ak105_zenitco01", "rhs_acc_pgs64", "", "rhs_acc_pkas", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], "rhs_acc_grip_rk6"],
    ["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk", "", "rhs_acc_ekp8_18", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer"], [], "rhs_acc_grip_ffg2"]
]];
_sfLoadoutData set ["rifles", [  
    ["rhs_weap_ak105_npz", "rhs_acc_pgs64", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_sfLoadoutData set ["carbines", [  
    ["rhs_weap_ak74m", "", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk", "", "rhs_acc_rakurspm", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["PRACS_UZI", "", "", "rhsusf_acc_rm05", ["PRACS_35rd_9mm_UZI"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR"], [], ""],
    ["rhs_weap_aks74n", "", "", "rhs_acc_ekp8_02", ["rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK", "rhs_45Rnd_545X39_7N10_AK"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp_wd_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [   
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["rhs_weap_pya", "", "", "", [], [], ""],
    ["rhs_weap_6p53", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["PRACS_SLA_M88_Paratrooper_uniform"]];
_eliteLoadoutData set ["slUniform", ["PRACS_SLA_M88_SL_uniform"]];
_eliteLoadoutData set ["vests", ["PRACS_SLA_6B23_6sh92_L_Radio"]];
_eliteLoadoutData set ["mgVests", ["PRACS_O_CIRAS_MG_SF"]];
_eliteLoadoutData set ["medVests", ["PRACS_SLA_6sh92_R_SF"]];
_eliteLoadoutData set ["slVests", ["PRACS_SLA_6B23_M"]];
_eliteLoadoutData set ["glVests", ["PRACS_SLA_6B23_6sh92_VOG"]];
_eliteLoadoutData set ["engVests", ["PRACS_SLA_6sh92"]];
_eliteLoadoutData set ["backpacks", ["PRACS_SLA_cammo_RD54"]];
_eliteLoadoutData set ["slBackpacks", ["PRACS_SLA_cammo_RD54"]];
_eliteLoadoutData set ["atBackpacks", ["PRACS_SLA_cammo_RD54"]];
_eliteLoadoutData set ["helmets", ["PRACS_SLA_6B27M"]];
_eliteLoadoutData set ["sniHats", ["PRACS_SLA_ssh68_cover"]];
_eliteLoadoutData set ["binoculars", ["rhs_pdu4"]];

_eliteLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_eliteLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_eliteLoadoutData set ["slRifles", [
    ["rhs_weap_ak105", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["rhs_weap_ak105", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["rhs_weap_ak105", "rhs_acc_pgs64", "", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["PRACS_UZI", "", "", "rhsusf_acc_rm05", ["PRACS_30rd_9mm_UZI"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["rhs_weap_svdp_wd_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["rhs_weap_pya", "", "", "", [], [], ""],
    ["rhs_weap_6p53", "", "", "", [], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["PRACS_SLA_M88_Guards_uniform"]];
_militaryLoadoutData set ["slUniform", ["PRACS_SLA_M88_Guards_SL_uniform"]];
_militaryLoadoutData set ["vests", ["PRACS_SLA_6b2_chicom"]];
_militaryLoadoutData set ["mgVests", ["PRACS_SLA_6B23_6sh92"]];
_militaryLoadoutData set ["medVests", ["PRACS_SLA_6B23_6sh92_L_Headset"]];
_militaryLoadoutData set ["slVests", ["PRACS_SLA_6B23_O"]];
_militaryLoadoutData set ["glVests", ["PRACS_SLA_6B23_6sh92_VOG"]];
_militaryLoadoutData set ["engVests", ["PRACS_SLA_6sh92_R"]];
_militaryLoadoutData set ["backpacks", ["PRACS_SLA_RD54"]];
_militaryLoadoutData set ["slBackpacks", ["PRACS_SLA_RD54"]];
_militaryLoadoutData set ["atBackpacks", ["PRACS_SLA_RD54"]];
_militaryLoadoutData set ["helmets", ["PRACS_SLA_6B27M_ess","PRACS_SLA_6B27M", "rhs_6b27m_green_bala","rhs_6b27m_green"]];
_militaryLoadoutData set ["slHat", ["PRACS_SLA_6B27M"]];
_militaryLoadoutData set ["sniHats", ["PRACS_SLA_6B27M_ess"]];
_militaryLoadoutData set ["binoculars", ["rhs_pdu4"]];

_militaryLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg26"]];
_militaryLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_militaryLoadoutData set ["slRifles", [
    ["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""],
    ["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""],
    ["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["rhs_weap_ak74m", "rhs_acc_dtk", "", "rhs_acc_okp7_dovetail", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""],
    ["rhs_weap_ak74m", "rhs_acc_dtk", "", "", ["rhs_30Rnd_545x39_7N22_AK", "rhs_30Rnd_545x39_7N6M_plum_AK"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_ak74m_gp25", "rhs_acc_dtk", "", "rhs_acc_rakurspm", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_AK"], ["rhs_VOG25"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["PRACS_HK33", "", "", "rhsusf_acc_rm05", ["PRACS_30rd_HK33_mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["PRACS_rpk74m_ACO", "rhs_acc_dtkrpk", "", "", ["rhs_60Rnd_545X39_7N22_AK", "rhs_60Rnd_545X39_7N22_AK", "rhs_60Rnd_545X39_7N22_AK"], [], ""],
    ["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["rhs_weap_vss", "", "", "rhs_acc_pso1m2", ["rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5", "rhs_20rnd_9x39mm_SP5"], [], ""],
    ["rhs_weap_svdp_pso1", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["rhs_weap_t5000", "", "", "rhs_acc_dh520x56", ["rhs_5Rnd_338lapua_t5000"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["rhs_weap_makarov_pm", "", "", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["PRACS_SLA_Border_Guard_uniform"]];
_policeLoadoutData set ["vests", ["rhs_belt_AK", "rhs_belt_AK_back"]];
_policeLoadoutData set ["helmets", ["PRACS_SLA_Border_Guard_Cap"]];

_policeLoadoutData set ["SMGs", [
    ["rhs_weap_aks74u", "", "", "rhs_acc_pgs64_74un", ["rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["rhs_weap_pp2000", "", "", "", ["rhs_mag_9x19mm_7n31_20"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["rhs_weap_type94_new", "", "", "", ["rhs_mag_6x8mm_mhp"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["rhs_uniform_afghanka_grey"]];
_militiaLoadoutData set ["vests", ["rhs_chicom_khk", "PRACS_SLA_6sh92", "rhs_lifchik_light"]];
_militiaLoadoutData set ["glVests", ["PRACS_SLA_6sh92_VOG", "rhs_lifchik_vog"]];
_militiaLoadoutData set ["sniVests", ["rhs_chicom_khk"]];
_militiaLoadoutData set ["backpacks", ["rhs_rd54", "rhs_sidor"]];
_militiaLoadoutData set ["slBackpacks", ["rhs_rd54"]];
_militiaLoadoutData set ["atBackpacks", ["rhs_rpg_2"]];
_militiaLoadoutData set ["helmets", ["PRACS_SLA_pilotka", "rhs_ssh60", "rhs_ssh68_2", "rhs_beanie_green", "rhs_fieldcap_early"]];
_militiaLoadoutData set ["slHat", ["PRACS_SLA_ssh68"]];
_militiaLoadoutData set ["sniHats", ["PRACS_SLA_pilotka"]];

_militiaLoadoutData set ["lightATLaunchers", ["rhs_weap_rpg18", "rhs_weap_rpg26"]];
_militiaLoadoutData set ["lightHELaunchers", ["rhs_weap_rshg2"]];

_militiaLoadoutData set ["rifles", [
    ["rhs_weap_ak74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["rhs_weap_aks74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""],
    ["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm"], [], ""],
    ["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm"], [], ""],
    ["rhs_weap_savz58p", "", "", "", ["rhs_30Rnd_762x39mm_Savz58"], [], ""]	
]];
_militiaLoadoutData set ["carbines", [
    ["rhs_weap_aks74", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["rhs_weap_akm_gp25", "", "", "rhs_acc_dtkakm", ["rhs_30Rnd_762x39mm_bakelite"], ["rhs_VOG25", "rhs_VOG25", "rhs_VOG25"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["PRACS_UZI", "", "", "rhsusf_acc_eotech_xps3", ["PRACS_30rd_9mm_UZI"], [], ""],
    ["rhs_weap_aks74u", "", "", "rhs_acc_pgs64_74u", ["rhs_30Rnd_545x39_7N6_AK"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR"], [], ""],
    ["rhs_weap_mg42", "", "", "", ["rhsgref_50Rnd_792x57_SmE_drum"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["rhs_weap_m38_rail", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsgref_5Rnd_762x54_m38", "rhsgref_5Rnd_762x54_m38"], [], ""],
    ["rhs_weap_svdp_pso1", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["rhs_weap_svdp_pso1", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N1"], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["rhs_weap_makarov_pm", "rhs_weap_tt33"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["PRACS_SLA_M88_Tanker_uniform"]];
_crewLoadoutData set ["vests", ["rhs_6sh46"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_ess"]];
_crewLoadoutData set ["carbines", [
    ["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI"], [], ""],
    ["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PRACS_SLA_M88_O_uniform"]];
_pilotLoadoutData set ["vests", ["rhs_vest_pistol_holster", "rhs_6sh46"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];
_pilotLoadoutData set ["carbines", [
    ["rhs_weap_aks74u", "rhs_acc_pgs64_74u", "", "", ["rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_7N6_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
    ["PRACS_UZI", "", "", "", ["PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI", "PRACS_35rd_9mm_UZI"], [], ""]
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
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

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
    ["glasses"] call _fnc_setFacewear;
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
    ["glasses"] call _fnc_setFacewear;
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
