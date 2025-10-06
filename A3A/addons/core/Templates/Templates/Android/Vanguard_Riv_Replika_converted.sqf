////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Replika"] call _fnc_saveToTemplate;
["nameLeader", "Model 1"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", [
	"SSV_replika_face_01", 
	"SSV_replika_face_02", 
	"hal_synth_face_01"
]] call _fnc_saveToTemplate;
["voices", ["Male01ENGVR"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesLightArmed", ["OPTRE_M12_LRV_CMA"]];
_vehiclesData set ["vehiclesTrucks", ["OPTRE_m1015_mule_cma"]];
_vehiclesData set ["vehiclesLightUnarmed", ["SSV_Vehicle_Android_Strider_Ruined"]];
_vehiclesData set ["vehiclesAPCs", ["SSV_Vehicle_Android_APC_Ruined"]];
_vehiclesData set ["vehiclesTanks", ["SSV_Vehicle_Android_Tank_Ruined", "OPTRE_M12_TD_ins"]];
_vehiclesData set ["vehiclesHelis", ["SSV_Vehicle_Android_VTOL_Infantry_Ruined"]];			
_vehiclesData set ["vehiclesUavs", ["O_UAV_01_F"]];

_vehiclesData set ["staticLowWeapons", [
	"OPTRE_Static_FG75_CMA", 
	"ssv_vanguard_static_m247t"
]];
_vehiclesData set ["staticMortars", ["B_Mortar_01_F"]];

_vehiclesData set ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"];

["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["8Rnd_82mm_Mo_shells"]] call _fnc_saveToTemplate;

_vehiclesData set ["minefieldAT", ["ATMine"]];
_vehiclesData set ["minefieldAPERS", ["APERSMine"]];

["vehiclesData", [
    _vehiclesData
]] call _fnc_saveVehiclesToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["SSV_Vanguard_Mag_OrganicGrenade", "SSV_Vanguard_Mag_EMPGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellRed"]];

_loadoutData set ["facewear", []];

_loadoutData set ["fullmask", []];

_loadoutData set ["headgear", [
    "SSV_Helmet_Android_Military_Ruined",
    "SSV_Helmet_Android_Pilot_Ruined",
	"SSV_Helmet_Android_Miner_Ruined",
	"SSV_Helmet_Android_Assassin"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_1PN138"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["CUP_SOFLAM"]];

_loadoutData set ["uniforms", [
	"SSV_Uniform_Android_Military_Ruined"
]];

_loadoutData set ["offuniforms", ["SSV_Uniform_Android_Assassin_Stealth"]];
_loadoutData set ["offvests", ["SSV_Vest_Android_Military_Heavy_Ruined"]];
_loadoutData set ["offhelmets", ["SSV_Helmet_Android_Assault_Ruined"]];
_loadoutData set ["offfacewear", []];
_loadoutData set ["offbackpacks", ["JMSJEFF_d2_backpack"]];
_loadoutData set ["vests", ["SSV_Vest_Android_Military_Ruined"]];
_loadoutData set ["heavyVests", ["SSV_Vest_Android_Military_Heavy_Ruined"]];
_loadoutData set ["atBackpacks", ["WebNiX_Assault_Exo"]];
_loadoutData set ["backpacks", ["JMSJEFF_d2_backpack"]];
_loadoutData set ["helmets", ["SSV_Helmet_Android_Military_Ruined", "SSV_Helmet_Android_Pilot_Ruined"]];
_loadoutData set ["heavyHelmets", ["SSV_Helmet_Android_Miner_Ruined"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
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

_loadoutData set ["rifles", [
    ["SSV_Weapon_Android_ARX_Ruined", "", "", "", ["30Rnd_65x39_caseless_green"], [], ""],
	["SSV_Weapon_Android_MSBS_Ruined", "", "", "", ["30Rnd_65x39_caseless_msbs_mag"], [], ""],
	["SSV_Weapon_Android_AK_Ruined", "", "", "", ["30Rnd_762x39_AK12_Mag_F"], [], ""]
]];
_loadoutData set ["tunedRifles", [
    ["SSV_Weapon_Android_MXM_Ruined", "", "", "", ["100Rnd_65x39_caseless_black_mag"], [], ""],
    ["SSV_Weapon_Android_MX_SW_Ruined", "", "", "", ["100Rnd_65x39_caseless_black_mag"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
    ["SSV_Weapon_Android_MX_Ruined", "", "", "", ["30Rnd_65x39_caseless_black_mag"], [], ""],
    ["SSV_Weapon_Android_AK_Ruined", "", "", "", ["30Rnd_762x39_AK12_Mag_F"], [], ""]
]];
_loadoutData set ["carbines", [
    ["SSV_Weapon_Android_ARX_Ruined", "", "", "", ["30Rnd_65x39_caseless_green"], [], ""],
	["SSV_Weapon_Android_MSBS_Ruined", "", "", "", ["30Rnd_65x39_caseless_msbs_mag"], [], ""],
	["SSV_Weapon_Android_AK_Ruined", "", "", "", ["30Rnd_762x39_AK12_Mag_F"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
    ["SSV_Weapon_Vanguard_Rhino", "", "", "", ["WRS_Shockgun_Magazine"], [], ""]
]];
_loadoutData set ["machineGuns", [
    ["SSV_Weapon_Android_MX_SW_Ruined", "", "", "", ["100Rnd_65x39_caseless_black_mag"], [], "bipod_02_F_blk"]
]];
_loadoutData set ["marksmanRifles", [
    ["SSV_Weapon_Android_MXM_Ruined", "", "", "", ["30Rnd_65x39_caseless_black_mag"], [], "bipod_02_F_blk"]
]];
_loadoutData set ["lightATLaunchers", ["OPTRE_M41_SSR"]];
_loadoutData set ["ATLaunchers", [
	["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["lightHELaunchers", ["OPTRE_M41_SSR"]];
_loadoutData set ["AALaunchers", ["OPTRE_M41_SSR"]];

/*
_loadoutData set ["missileATLaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_Thermal"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["OPTRE_M41_SSR", "", "", "", ["OPTRE_M41_Twin_HEAT_SALH", "OPTRE_M41_Twin_HEAT"], [], ""]
]];
*/
_loadoutData set ["sidearms", [
	["UNSC_Knife_reversed", "", "", "", [], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["SSV_Uniform_Android_Military_Ruined"]];
_crewLoadoutData set ["vests", ["SSV_Vest_Android_Military_Ruined"]];
_crewLoadoutData set ["helmets", ["SSV_Helmet_Android_Pilot_Ruined"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["SSV_Uniform_Android_Military_Ruined"]];
_pilotLoadoutData set ["vests", ["SSV_Vest_Android_Military_Ruined"]];
_pilotLoadoutData set ["helmets", ["SSV_Helmet_Android_Pilot_Ruined"]];

// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################
// ^ Watch me

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	["offhelmets"] call _fnc_setHelmet;
	["offuniforms"] call _fnc_setUniform;
	["offvests"] call _fnc_setVest;
	["offbackpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	if (random 100 < 60) then {
		["heavyHelmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
	["NVGs"] call _fnc_addNVGs;
};

private _minutemanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["lightATLaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
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

private _saboteurTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 1] call _fnc_addMagazines;
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
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
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

private _atTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["ATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 4] call _fnc_addMagazines;

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
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
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
	["NVGs"] call _fnc_addNVGs;
};

private _oppressorTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
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
	["NVGs"] call _fnc_addNVGs;
};

private _sharpshooterTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
	} else {
		["headgear"] call _fnc_setHelmet;
	};
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
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["carbines"] call _fnc_setPrimary;
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

private _commanderTemplate = {
	["offhelmets"] call _fnc_setHelmet;
	["offuniforms"] call _fnc_setUniform;
	["offvests"] call _fnc_setVest;
	["offbackpacks"] call _fnc_setBackpack;

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

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

///////////////////////
//  Rivals Units     //
///////////////////////
private _baseClass = ["baseClass", "SSV_Unit_Android_Military_Ruined", false]; // If we don't do this, the androids are actually humans. Aka, you shoot them and there is blood. This fixes it.
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [_baseClass], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [_baseClass], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [_baseClass], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [_baseClass], [_prefix, true]],
	["Partisan", _partisanTemplate, [_baseClass], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [_baseClass], [_prefix, true]],
	["Medic", _medicTemplate, [_baseClass, ["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [_baseClass, ["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [_baseClass], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [_baseClass], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [_baseClass], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [_baseClass], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [_baseClass], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [_baseClass], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [_baseClass], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [_baseClass], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;