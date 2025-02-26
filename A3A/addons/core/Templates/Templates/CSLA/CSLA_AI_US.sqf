//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US85"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\Flag_us_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["US85_M1030","US85_M1008_S250","US85_M923a1_s280"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["US85_M1025_ua","US85_M1043_ua"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["US85_M1025_M2","US85_M1025_M60","US85_M1043_M2","US85_M1043_M60"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["US85_M923o","US85_M923c","US85_M923a1o","US85_M923a1om2","US85_M923a1c","US85_M923a1cm2"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["US85_M1008c","US85_M923cargo","US85_M923a1_cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["US85_M923a","US85_M923a1_a"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["US85_M923r","US85_M113_DTP","US85_M923a1_r"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["US85_M923f","US85_M923a1_f"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["US85_M113_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["US85_M113"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["US85_LAV25"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["US85_M113"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["US85_M1A1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["US85_M163"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["US85_M1IP"]] call _fnc_saveToTemplate;  
["vehiclesTransportBoats", ["US85_zodiac"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["US85_LAV25"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CSLA_CIV_An2_1"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["US85_UH60"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["US85_MH60M134","US85_UH60M240"]] call _fnc_saveToTemplate;

["vehiclesHelisLightAttack", ["US85_MH60FFAR"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["US85_AH1F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["US85_M270"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["US85_M270", ["US85_12Rnd_M26"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;                  
["vehicleSam", ""] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["US85_M998SFGT"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["US85_M923a1c"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["US85_M1008"]] call _fnc_saveToTemplate;

["vehiclesMilitiaAPCs", ["US85_M113"]] call _fnc_saveToTemplate; 

["vehiclesPolice", ["CSLA_CIV_ADA1600VB","CSLA_CIV_Sarka1200VB","CSLA_AZU_VB"]] call _fnc_saveToTemplate;

["staticMGs", ["US85_M2h"]] call _fnc_saveToTemplate;
["staticAT", ["US85_TOW_Stat"]] call _fnc_saveToTemplate;
["staticAA", []] call _fnc_saveToTemplate;
["staticMortars", ["US85_M252_Stat"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "US85_8Rnd_81mmHE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["US85_ATMine_ammo"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["US85_M14Mine_ammo"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
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

_loadoutData set ["lightATLaunchers", [
["US85_LAW72", "", "", "", ["US85_LAW72_Mag"], [], ""],
["US85_M136", "", "", "", ["US85_M136_Mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
["US85_SMAW", "", "", "", ["US85_SMAW_HEAA", "US85_SMAW_HEDP"], [], ""],
["US85_MAAWS", "", "", "", ["US85_MAAWS_HEAT", "US85_MAAWS_HEDP"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["US85_M47", "", "", "", ["US85_M47_Mag"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["US85_FIM92", "", "", "", ["US85_FIM92_Mag"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["US85_ATMine_mag"]];
_loadoutData set ["APMines", ["US85_M14Mine_mag"]];
_loadoutData set ["lightExplosives", ["CSLA_TNT0100g"]];
_loadoutData set ["heavyExplosives", ["US85_SatchelCharge_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["US85_M67"]];
_loadoutData set ["smokeGrenades", ["US85_dymB","US85_dymC","US85_dymZ","US85_dymZl"]];
_loadoutData set ["signalsmokeGrenades", []];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["US85_watch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", ["US85_ANPVS5_Goggles"]];
_loadoutData set ["binoculars", ["US85_bino"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", ["US85_uniBDU"]];
_loadoutData set ["vests", ["US85_grY_M16","US85_grY_MPV"]];
_loadoutData set ["SLvests", ["US85_grY_M9","US85_grV_ofc","US85_grV_M9"]];
_loadoutData set ["MGvests", ["US85_grY_MG","US85_grV_MG"]];
_loadoutData set ["SNIvests", ["US85_grY_M24","US85_grV_M24","US85_grY_snp"]];
_loadoutData set ["Hvests", ["US85_grV_M16","US85_grV_MPV"]];
_loadoutData set ["glVests", ["US85_grVm_M16GL","US85_grV_M16GL"]];
_loadoutData set ["backpacks", ["US85_bpAlice"]];
_loadoutData set ["MEDIbackpacks", ["US85_bpMedi"]];
_loadoutData set ["longRangeRadios", ["US85_bpPRC77"]];
_loadoutData set ["helmets", ["US85_helmetPASGT","US85_helmetPASGTr","US85_helmetPASGTG"]];
_loadoutData set ["slHat", ["US85_marineCap"]];
_loadoutData set ["sniHats", ["US85_hat"]];

_loadoutData set ["traitorUniforms", ["FIA_uniWoodlander","FIA_uniWoodlander2","FIA_uniWoodlander3","FIA_uniWoodlander4"]];
_loadoutData set ["traitorVests", ["FIA_gr85_Sa61"]];
_loadoutData set ["traitorHats", ["FIA_Usanka"]];

_loadoutData set ["officerUniforms", ["US85_uniBDU"]];
_loadoutData set ["officerVests", ["US85_grV_ofc"]];
_loadoutData set ["officerHats", ["US85_marineCap"]];

_loadoutData set ["cloakUniforms", ["US85_uniGhillie"]];
_loadoutData set ["cloakVests", ["US85_grY_MPV"]];

_loadoutData set ["slUniforms", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["US85_patrolCap","US85_ptCap"]];
_loadoutData set ["sniHats", []];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = [];
private _eeItems = ["US85_toolkit_S", "US85_anprs8_detector"];
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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["US85_uniSF"]];
_sfLoadoutData set ["vests", ["US85_grSF_M16","US85_grSF_MPV","US85_grSF_TLBV","US85_grSF_MG","US85_grSF_M9"]];
_sfLoadoutData set ["SNIvests", ["US85_grSF_M24"]];
_sfLoadoutData set ["backpacks", ["US85_bpSf"]];
_sfLoadoutData set ["MEDIbackpacks", ["US85_bpMedi"]];
_sfLoadoutData set ["helmets", ["US85_helmetSFL","US85_helmetSFLG","US85_helmetSFLG_on"]];
_sfLoadoutData set ["sniHats", ["US85_beanie"]];
_sfLoadoutData set ["NVGs", ["US85_ANPVS5_Goggles"]];
_sfLoadoutData set ["binoculars", ["US85_bino"]];

_sfLoadoutData set ["rifles", [
["US85_M16A2", "US85_M16tlm", "", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["US85_M16A2CAR", "US85_M16tlm", "", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""],
["US85_M16A2CAR", "US85_M16tlm", "US85_M16fl", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], ["US85_M406", "US85_M406", "US85_M406", "US85_M406"], ""]
]];
_sfLoadoutData set ["SMGs", [
["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger"], [], ""],
["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["US85_M249", "", "", "US85_sc2000M249", ["US85_200Rnd_556x45", "US85_200Rnd_556x45"], [], ""],
["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45", "US85_200Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["US85_M16A2CAR", "US85_M16tlm", "", "US85_sc4x20_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["US85_M21", "US85_M21tlm", "", "", ["US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51"], [], "US85_M14bpd"]
]];
_sfLoadoutData set ["sidearms", [
["US85_1911", "", "", "", ["US85_7Rnd_45ACP","US85_7Rnd_45ACP"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
private _eliteLoadoutData= _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["US85_uniSF"]];
_eliteLoadoutData set ["vests", ["US85_grSF_M16","US85_grSF_MPV","US85_grSF_TLBV","US85_grSF_M9","US85_grSF_MG"]];
_eliteLoadoutData set ["SNIvests", ["US85_grSF_M24"]];
_eliteLoadoutData set ["backpacks", ["US85_bpSf"]];
_eliteLoadoutData set ["MEDIbackpacks", ["US85_bpMedi"]];
_eliteLoadoutData set ["helmets", ["US85_helmetSFL","US85_helmetSFLG","US85_helmetSFLG_on"]];
_eliteLoadoutData set ["sniHats", ["US85_beanie"]];
_eliteLoadoutData set ["NVGs", ["US85_ANPVS5_Goggles"]];
_eliteLoadoutData set ["binoculars", ["US85_bino"]];

_eliteLoadoutData set ["rifles", [
["US85_M16A2", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["US85_M16A2CAR", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""],
["US85_M16A2CAR", "", "US85_M16fl", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], ["US85_M406", "US85_M406", "US85_M406", "US85_M406"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger"], [], ""],
["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["US85_M249", "", "", "US85_sc2000M249", ["US85_200Rnd_556x45", "US85_200Rnd_556x45"], [], ""],
["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45", "US85_200Rnd_556x45"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["US85_M16A2CAR", "", "", "US85_sc4x20_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["US85_M21", "US85_M21tlm", "", "", ["US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51"], [], "US85_M14bpd"]
]];
_eliteLoadoutData set ["sidearms", [
["US85_1911", "", "", "", ["US85_7Rnd_45ACP","US85_7Rnd_45ACP"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["US85_uniBDU"]];
_militaryLoadoutData set ["vests", ["US85_grY_M16","US85_grY_MPV","US85_grY_MG","US85_grV_MG","US85_grY_M9","US85_grV_M9","US85_grV_ofc"]];
_militaryLoadoutData set ["SNIvests", ["US85_grY_snp","US85_grV_M24"]];
_militaryLoadoutData set ["Hvests", ["US85_grV_M16","US85_grV_MPV"]];
_militaryLoadoutData set ["glVests", ["US85_grVm_M16GL","US85_grV_M16GL"]];
_militaryLoadoutData set ["backpacks", ["US85_bpAlice"]];
_militaryLoadoutData set ["MEDIbackpacks", ["US85_bpMedi"]];
_militaryLoadoutData set ["helmets", ["US85_helmetPASGT","US85_helmetPASGTr","US85_helmetPASGTG"]];
_militaryLoadoutData set ["binoculars", ["US85_bino"]];

_militaryLoadoutData set ["slRifles", [
["US85_M16A2", "", "", "", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
["US85_M16A2", "", "", "", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["US85_M16A2", "", "", "", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["US85_M16A2GL", "", "", "", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], ["US85_M406", "US85_M406", "US85_M406", "US85_M406"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["US85_M249", "", "", "", ["US85_200Rnd_556x45", "US85_200Rnd_556x45"], [], ""],
["US85_M60", "", "", "", ["US85_100Rnd_762x51", "US85_100Rnd_762x51", "US85_100Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["US85_M16A2", "", "", "US85_sc4x20_M16", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["US85_M14", "", "", "US85_scM21", ["US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51"], [], "US85_M14bpd"]
]];
_militaryLoadoutData set ["sidearms", [
["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger"], [], ""]
]];
///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["CSLA_uniPoliceman"]];
_policeLoadoutData set ["vests", []];
_policeLoadoutData set ["helmets", ["CSLA_policeCap"]];

_policeLoadoutData set ["SMGs", [
["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_policeLoadoutData set ["sidearms", [["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["US85_uniKHK"]];
_militiaLoadoutData set ["vests", ["US85_grVest"]];
_militiaLoadoutData set ["backpacks", []];
_militiaLoadoutData set ["helmets", ["US85_helmetM1g"]];

_militiaLoadoutData set ["rifles", [
["US85_M16A1", "", "", "", ["US85_20Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
//["", "", "", "", [], [], ""]
["US85_M16A1", "", "", "", ["US85_20Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
//["", "", "", "", [], [], ""]
["US85_M16A2GL", "", "", "", ["US85_30Rnd_556x45", "US85_30Rnd_556x45", "US85_30Rnd_556x45","US85_30Rnd_556x45"], ["US85_M406", "US85_M406", "US85_M406", "US85_M406"], ""]
]];
_militiaLoadoutData set ["SMGs", [
//["", "", "", "", [], [], ""]
["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger", "US85_MPV_30Rnd_9Luger"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
//["", "", "", "", [], [], ""]
["US85_M60", "", "", "", ["US85_100Rnd_762x51", "US85_100Rnd_762x51", "US85_100Rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
//["", "", "", "", [], [], ""]
["US85_M14", "", "", "US85_scM21", ["US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51", "US85_20Rnd_762x51"], [], "US85_M14bpd"]
]];
_militiaLoadoutData set ["sidearms", [["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger"], [], ""]]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["US85_uniCrew"]];
_crewLoadoutData set ["vests", ["US85_grY_snp"]];
_crewLoadoutData set ["helmets", ["US85_helmetDH132","US85_helmetDH132G","US85_helmetDH132G_on"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["US85_uniPlt"]];
_pilotLoadoutData set ["vests", ["US85_grY_snp"]];
_pilotLoadoutData set ["helmets", ["US85_helmetPlt","US85_helmetPltC"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
  //  [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["SLvests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

   // ["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["MEDIbackpacks"] call _fnc_setBackpack;
//    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;

    ["primary", 6] call _fnc_addMagazines;

   // ["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

   // ["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


    //["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

   // [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;

    ["primary", 6] call _fnc_addMagazines;

    //["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

   // ["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
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
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

   // ["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 1] call _fnc_addMagazines;

   // ["sidearms"] call _fnc_setHandgun;
   // ["handgun", 2] call _fnc_addMagazines;

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

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["MGvests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

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

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
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
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["SNIvests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

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

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

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

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    call _unarmedTemplate;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
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
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
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
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
  //  ["Engineer", _engineerTemplate, [["engineer", true]]],
  //  ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
  //  ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
  //  ["AT", _atTemplate],
  //  ["AA", _aaTemplate],
  //  ["MachineGunner", _machineGunnerTemplate],
  //  ["Sniper", _sniperTemplate],
    ["Marksman", _marksmanTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate; 