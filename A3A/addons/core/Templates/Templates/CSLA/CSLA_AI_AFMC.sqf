//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AFMC"] call _fnc_saveToTemplate;
["spawnMarkerName", "AFMC"] call _fnc_saveToTemplate;

["flag", "Flag_AFMC"] call _fnc_saveToTemplate;
["flagTexture", "\csla_misc\signs\flags\flag_afmc_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_NATO"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["AFMC_M1008_S250"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["AFMC_M1008"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["US85_M998SFGT"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["AFMC_M923o","AFMC_M923c"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["AFMC_M1008c","AFMC_M923cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["AFMC_M923a"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["AFMC_M113A2_DTP","AFMC_M923r"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["AFMC_M923f"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["AFMC_M113A2_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["AFMC_LAV25"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["AFMC_M113A1","AFMC_M113A2ext"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["AFMC_M1A1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["AFMC_M163"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", ["AFMC_M1IP"]] call _fnc_saveToTemplate;  
["vehiclesTransportBoats", ["US85_zodiac"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["AFMC_LAV25"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["B_Plane_CAS_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CSLA_CIV_An2_1"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["AFMC_UH60"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["AFMC_UH60M240","AFMC_UH60"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["AFMC_AH1F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["AFMC_M270"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["AFMC_M270", ["US85_12Rnd_M26"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehicleRadar", ""] call _fnc_saveToTemplate;                  
["vehicleSam", ""] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["US85_M998SFGT"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["AFMC_M923o","AFMC_M923c"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["AFMC_M1008"]] call _fnc_saveToTemplate;

["vehiclesMilitiaAPCs", ["AFMC_M113A1"]] call _fnc_saveToTemplate; 

["vehiclesPolice", ["CSLA_CIV_ADA1600VB","CSLA_CIV_Sarka1200VB","CSLA_AZU_VB"]] call _fnc_saveToTemplate;

["staticMGs", ["AFMC_M2h"]] call _fnc_saveToTemplate;
["staticAT", ["AFMC_TOW_Stat"]] call _fnc_saveToTemplate;
["staticAA", []] call _fnc_saveToTemplate;
["staticMortars", ["AFMC_M252_Stat"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "US85_8Rnd_81mmHE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["US85_ATMine_ammo"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["US85_M14Mine_ammo"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
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
_loadoutData set ["rangefinders", ["US85_bino"]];

_loadoutData set ["uniforms", ["AFMC_uniWLD"]]; ///AFMC_uniSF
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", ["US85_bpAlice"]];
_loadoutData set ["longRangeRadios", ["US85_bpPRC77"]];
_loadoutData set ["helmets", ["AFMC_helmetM1c"]];

_loadoutData set ["traitorUniforms", ["FIA_uniWoodlander","FIA_uniWoodlander2","FIA_uniWoodlander3","FIA_uniWoodlander4"]];
_loadoutData set ["traitorVests", ["FIA_gr85_Sa61"]];
_loadoutData set ["traitorHats", ["FIA_Usanka"]];

_loadoutData set ["officerUniforms", ["AFMC_uniWLD"]];
_loadoutData set ["officerVests", ["AFMC_grV_ofc"]];
_loadoutData set ["officerHats", ["AFMC_beretRd"]];

_loadoutData set ["cloakUniforms", ["AFMC_uniGhillie"]];
_loadoutData set ["cloakVests", ["AFMC_grY_MG"]];

_loadoutData set ["slUniforms", ["AFMC_uniWLD"]];
_loadoutData set ["sniVests", ["AFMC_grY_MG"]];
_loadoutData set ["atBackpacks", ["FIA_bpPack"]];
_loadoutData set ["slHat", ["AFMC_beretBk","AFMC_beretBe","AFMC_beretGn","AFMC_beretCo"]];
_loadoutData set ["sniHats", ["AFMC_booniehatLizard"]];

_loadoutData set ["glasses", ["CSLA_glsPlscSpring"]];
_loadoutData set ["goggles", ["CSLA_glsPlscSpring"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["AFMC_uniSF"]];
_sfLoadoutData set ["vests", ["AFMC_grVest","AFMC_grV_M16","AFMC_grV_M24","AFMC_grV_MG","AFMC_grV_ofc"]];
_sfLoadoutData set ["backpacks", ["US85_bpSf"]];
_sfLoadoutData set ["helmets", ["US85_helmetSFL","US85_helmetSFLG","US85_helmetSFLG_on"]];
_sfLoadoutData set ["binoculars", ["US85_bino"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
    ["US85_FAL", "", "", "US85_scFAL", ["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61"], [], "US85_FALbpd"]
]];
_sfLoadoutData set ["carbines", [
    ["US85_FALf", "", "", "US85_scFAL", ["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61"], [], "US85_FALbpd"]
]];
_sfLoadoutData set ["grenadeLaunchers", []];
_sfLoadoutData set ["SMGs", [
    ["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45","US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["US85_M14", "", "", "US85_scM21", ["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61"], [], "US85_M14bpd"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CSLA_HuntingRifle", "", "", "", ["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["US85_M9", "US85_M9tlm", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["AFMC_uniSF"]];
_sfLoadoutData set ["vests", ["AFMC_grVest","AFMC_grV_M16","AFMC_grV_M24","AFMC_grV_MG","AFMC_grV_ofc"]];
_sfLoadoutData set ["backpacks", ["US85_bpSf"]];
_sfLoadoutData set ["helmets", ["US85_helmetSFL","US85_helmetSFLG","US85_helmetSFLG_on"]];
_sfLoadoutData set ["binoculars", ["US85_bino"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_eliteLoadoutData set ["rifles", [
    ["US85_FAL", "", "", "US85_scFAL", ["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61"], [], "US85_FALbpd"]
]];
_eliteLoadoutData set ["carbines", [
    ["US85_FALf", "", "", "US85_scFAL", ["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61"], [], "US85_FALbpd"]
]];
_eliteLoadoutData set ["grenadeLaunchers", []];
_eliteLoadoutData set ["SMGs", [
    ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45","US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["US85_M14", "", "", "US85_scM21", ["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762M61"], [], "US85_M14bpd"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CSLA_HuntingRifle", "", "", "", ["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["AFMC_uniWLD"]];
_militaryLoadoutData set ["vests", ["AFMC_grVest","AFMC_grY_MG"]];
_militaryLoadoutData set ["backpacks", ["US85_bpAlice"]];
_militaryLoadoutData set ["helmets", ["AFMC_helmetMk6","AFMC_helmetMk6para","AFMC_helmetMk6r"]];
_militaryLoadoutData set ["binoculars", ["US85_bino"]];

_militaryLoadoutData set ["rifles", [
    ["US85_FAL", "", "", "", ["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51"], [], "US85_FALbpd"]
]];
_militaryLoadoutData set ["carbines", [
    ["US85_FALf", "", "", "", ["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51"], [], "US85_FALbpd"]
]];
_militaryLoadoutData set ["grenadeLaunchers", []];
_militaryLoadoutData set ["SMGs", [
    ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["US85_M249", "", "", "", ["US85_200Rnd_556x45","US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["US85_M14", "", "", "", ["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51"], [], "US85_M14bpd"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CSLA_HuntingRifle", "", "", "", ["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["CSLA_uniPoliceman"]];
_policeLoadoutData set ["vests", ["CSLA_grUah61"]];
_policeLoadoutData set ["helmets", ["CSLA_policeCap"]];

_policeLoadoutData set ["SMGs", [
    ["CSLA_Sa24", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52","CSLA_Sa24_32rnd_7_62Pi52","CSLA_Sa24_32rnd_7_62Pi52"], [], ""],
    ["CSLA_Sa26", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52","CSLA_Sa24_32rnd_7_62Pi52","CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["AFMC_uniSF"]];
_militiaLoadoutData set ["vests", ["AFMC_grY_MG","AFMC_grY_FAL"]];
_militiaLoadoutData set ["backpacks", ["US85_bpAlice"]];
_militiaLoadoutData set ["helmets", ["AFMC_helmetM1c"]];

_militiaLoadoutData set ["rifles", [
    ["US85_FAL", "", "", "", ["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51"], [], "US85_FALbpd"]
]];
_militiaLoadoutData set ["carbines", [
    ["US85_FAL", "", "", "", ["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51"], [], "US85_FALbpd"]
]];
_militiaLoadoutData set ["grenadeLaunchers", []];
_militiaLoadoutData set ["SMGs", [
    ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["US85_M249", "", "", "", ["US85_200Rnd_556x45","US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["US85_M14", "", "", "", ["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762x51"], [], "US85_M14bpd"]
]];
_militiaLoadoutData set ["sidearms", [
    ["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["US85_uniCrew"]];
_crewLoadoutData set ["vests", ["AFMC_grY_FAL"]];
_crewLoadoutData set ["helmets", ["US85_helmetDH132","US85_helmetDH132G","US85_helmetDH132G"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["US85_uniPlt"]];
_pilotLoadoutData set ["vests", ["AFMC_grY_FAL"]];
_pilotLoadoutData set ["helmets", ["US85_helmetDH132","US85_helmetDH132G","US85_helmetDH132G"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
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

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
