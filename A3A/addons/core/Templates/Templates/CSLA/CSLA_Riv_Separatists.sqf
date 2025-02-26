private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasKart = "kart" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Separatists"] call _fnc_saveToTemplate;
["nameLeader", "Alexander Akhanteros"] call _fnc_saveToTemplate; ////NEEDS CHANGING

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", [
	"GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
	"GreekHead_A3_10_l",
	"GreekHead_A3_10_sa",
	"GreekHead_A3_10_a",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros",
	"RussianHead_1",
	"RussianHead_2",
	"RussianHead_3",
	"RussianHead_4",
	"RussianHead_5"
]] call _fnc_saveToTemplate; 
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE",
"Male05GRE","Male06GRE","Male01ENGFRE","Male02ENGFRE",
"male01rus","male02rus","male03rus"]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_Syndicate_Wps_F"] call _fnc_saveToTemplate;

private _lightArmedVehicles = ["US85_M1025_M2","US85_M1025_M60","US85_M1043_M2","US85_M1043_M60","US85_M998SFGT","FIA_AZU_DSKM","FIA_AZU_T21"];
private _lightUnarmedVehicles = ["US85_M1008c","US85_M1008","US85_M1025_ua","US85_M1043_ua","FIA_AZU_para","CSLA_AZU_R2","CSLA_AZU"];
private _apc = ["AFMC_LAV25","AFMC_M113A1","AFMC_M113A2ext","CSLA_BVP1","CSLA_MU90","CSLA_OT62","CSLA_OT64C","CSLA_OT65A","FIA_BTR40","FIA_BTR40_DSKM"];
private _tanks = ["US85_M1A1","US85_M1IP","CSLA_T72","CSLA_T72M","CSLA_T72M1"];
private _helis = ["US85_MH60M134","US85_UH60M240","CSLA_Mi17","CSLA_Mi17mg"];
private _uav = [];
private _trucks = ["CSLA_V3So","CSLA_V3S"];

private _staticLowWeapons = ["AFMC_infFALf", "AFMC_M2l","CSLA_UK59L_Stat","CSLA_UK59T_Stat"];
private _staticAT = ["AFMC_TOW_Stat", "CSLA_rT21","CSLA_9K113_Stat"];
private _staticMortars = ["US85_M252_Stat","CSLA_M52_Stat"];

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

["staticLowWeapons", _staticLowWeapons] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["vehiclesRivalsLightArmed", _lightArmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", _trucks] call _fnc_saveToTemplate;
["vehiclesRivalsCars", _lightUnarmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", _apc] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", _helis] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", _uav] call _fnc_saveToTemplate;			

["animations", []] call _fnc_saveToTemplate;

["variants", []] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
private _rifles = [
["US85_FAL", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
		["US85_FALf", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
		["US85_M14", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
		["US85_M16A1", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["US85_M16A2", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["CSLA_Sa58P", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], ""],
		["CSLA_Sa58V", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
];
private _tunedRifles = [
["US85_FAL", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
        ["US85_FALf", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
		["US85_M16A2CAR", "US85_M16tlm","US85_M16fl","US85_sc4x20_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
        ["US85_M16A1", "US85_M16tlm", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["US85_M16A2", "US85_M16tlm", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["CSLA_Sa58P", "","","CSLA_ZD4x8",["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
];
private _enforcerRifles = [
["US85_FAL", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
        ["US85_FALf", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
		["US85_M16A2CAR", "","US85_M16fl","US85_sc4x20_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
        ["US85_M16A1", "", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["US85_M16A2", "", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
		["CSLA_Sa58P", "","","CSLA_ZD4x8",["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"],
		["CSLA_Sa58V", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
];
private _carbines = [
 ["US85_M16A2CAR", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
        ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""],
		["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""],
        ["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_10rnd_7_65Pi27"], [], ""],
		["CSLA_Sa24", "", "", "",  ["CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52"], [], ""],
		["CSLA_Sa26", "", "", "",  ["CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
];
private _gls = [
["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], ["US85_M406","US85_M406","US85_M406"], ""],
		["US85_M16A2GL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], ["US85_M406","US85_M406","US85_M406"], ""],
		["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5sigZl1a"], "CSLA_Sa58bnt"]
];
private _mgs = [
 ["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""],
		["US85_M60", "", "", "", ["US85_100Rnd_762x51","US85_100Rnd_762x51"], [], ""],
        ["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62vz59","CSLA_UK59_50rnd_7_62Sv59","CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62Tz59","CSLA_UK59_50rnd_7_62TzSv59"], [], ""]
];
private _marksmanRifles = [
        ["CSLA_HuntingRifle","","","",["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt", "CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"], [], "gm_msg90_bipod_blk"],
        ["US85_M14","","","US85_scM21",["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_M14bpd"],
		["US85_M21","","","US85_scM21",["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_M14bpd"],
		["CSLA_OP63","","","CSLA_PSO1_OP63",["CSLA_OP63_10rnd_7_62Odst59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62Odst59","CSLA_OP63_10rnd_7_62PZ59"], [], ""]
];

private _rpgs = [
 ["US85_M136", "", "", "", ["US85_M136_Mag"], [], ""],
        ["US85_M47", "", "", "", ["US85_M47_Mag"], [], ""],
        ["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CSLA_PG7M110V"], [], ""],
		["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag", "CSLA_RPG75_Mag"], [], ""],
		["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CSLA_PG7M110V"], [], ""]
];

private _pistols = [
["US85_1911", "", "", "", ["US85_1911_7Rnd_045ACP","US85_1911_7Rnd_045ACP","US85_1911_7Rnd_045ACP"], [], ""],
        ["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""],
        ["CSLA_Pi52", "", "", "", ["CSLA_Pi52_8rnd_7_62Pi52","CSLA_Pi52_8rnd_7_62Pi52","CSLA_Pi52_8rnd_7_62Pi52"], [], ""],
        ["CSLA_Pi75lr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger"], [], ""],
        ["CSLA_Pi75sr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger"], [], ""],
        ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82"], [], ""],
        ["CSLA_Sa61", "", "", "", ["CSLA_Sa61_10rnd_7_65Pi27","CSLA_Sa61_10rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
];

_loadoutData set ["lightHELaunchers", [
["US85_LAW72", "", "", "", ["US85_LAW72_Mag", "US85_LAW72_Mag"], [], ""],
        ["US85_MAAWS", "", "", "", ["US85_MAAWS_HEDP","US85_MAAWS_HEDP","US85_MAAWS_HEAT"], [], ""],
		["US85_SMAW", "", "", "", ["US85_SMAW_HEAA","US85_SMAW_HEAA","US85_SMAW_HEDP"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["CSLA_9K32", "", "", "", ["CSLA_9M32M","CSLA_9M32M"], [], ""],
		["US85_FIM92", "", "", "", ["US85_FIM92_Mag","US85_FIM92_Mag"], [], ""]
]];

_loadoutData set ["ATMines", [
"CSLA_PtMiBa3_mag"
]];
_loadoutData set ["APMines", [
"CSLA_F1m_mag","US85_M67m_mag","CSLA_NO2","CSLA_RG4m_mag","CSLA_URG86m_mag","CSLA_PPMiNa_mag"
]];
_loadoutData set ["lightExplosives", [
 "CSLA_TNT0100g"
]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", [
 "CSLA_F1","CSLA_RG4o","CSLA_RG4u","CSLA_URG86u","CSLA_URG86o"
]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData set ["rifles", _rifles];
_loadoutData set ["tunedRifles", _tunedRifles];
_loadoutData set ["enforcerRifles", _enforcerRifles];
_loadoutData set ["carbines", _carbines];
_loadoutData set ["grenadeLaunchers", _gls];
_loadoutData set ["machineGuns", _mgs];
_loadoutData set ["marksmanRifles", _marksmanRifles];
_loadoutData set ["lightATLaunchers", _rpgs];
_loadoutData set ["sidearms", _pistols];


_loadoutData set ["facewear", [
	"CSLA_glsPlscSpring"
]];

_loadoutData set ["fullmask", []];

_loadoutData set ["headgear", [
    "US85_beanie",
    "CSLA_beretM",
    "CSLA_beretR",
    "AFMC_booniehatLizard",
	"US85_hat",
	"FIA_hat85Gn",
	"FIA_hat85bGn",
	"FIA_hat85Mlok",
	"FIA_hat85bMlok",
	"FIA_capBk",
	"FIA_capGn",
	"FIA_capMlok",
	"CSLA_BudajkaBk",
	"CSLA_BudajkaGy",
	"FIA_Budajka"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["CSLA_Prim_enl"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", ["CSLA_nokto"]];
_loadoutData set ["binoculars", ["CSLA_bino"]];
_loadoutData set ["Rangefinder", ["CSLA_bino"]];

/////Vests
private _vests = [
	"CSLA_gr60brr", 
	"CSLA_gr60base", 
	"CSLA_gr60drv", 
	"CSLA_gr60crw", 
	"CSLA_gr60svc", 
	"CSLA_gr60medic" ,
	"CSLA_gr60ofc1",
	"CSLA_gr60OP63",
	"CSLA_gr60rfl",
	"CSLA_gr60RPG7",
	"CSLA_gr60RPG7r",
	"CSLA_gr60sgt",
	"CSLA_gr85ptMdc",
	"CSLA_gr85ptOP63",
	"CSLA_gr85ptBase",
	"CSLA_gr85lrrOP63",
	"CSLA_gr85lrrBase",
	"CSLA_gr85ptSgt",
	"CSLA_gr85Uah61",
	"AFMC_grY_FAL",
	"US85_grY_M16",
	"US85_grY_M24",
	"US85_grY_M9",
	"AFMC_grY_MG",
	"FIA_grY_MG",
	"US85_grY_MG",
	"FIA_grY_MPV",
	"US85_grY_MPV",
	"US85_grY_snp"
];

private _heavyVests = [
	"AFMC_grVest", 
	"AFMC_grV_M16", 
	"AFMC_grV_M24",
	"AFMC_grV_MG",
	"AFMC_grV_ofc",
	"US85_grVest",
	"US85_grV_M16GL",
	"US85_grVm_M16GL",
	"US85_grV_M16",
	"US85_grV_M24",
	"US85_grV_M9",
	"US85_grV_MG",
	"US85_grV_MPV",
	"US85_grV_ofc",
	"US85_grSF_M16GL",
	"US85_grSF_M9",
	"US85_grSF_MG",
	"US85_grSF_TLBV",
	"US85_grSF_M16",
	"US85_grSF_M24"
];

/////Uniforms
_loadoutData set ["uniforms", [
    "FIA_uniwld11",
    "FIA_uniwld",
    "FIA_uniwld1",
    "FIA_uniwld10",
	"FIA_uniwld3",
	"FIA_uniwld4",
	"FIA_uniwld6",
	"FIA_uniwld7",
	"FIA_uniwld9"
]];

_loadoutData set ["heavyUniforms", []]; ///don't know why it's here but could be useful in the future

/////Helmets
private _helmets = [        
		"US85_helmetM1g",
        "AFMC_helmetM1c",
        "US85_helmetM1c",
        "AFMC_helmetMk6",
        "AFMC_helmetMk6para",
        "AFMC_helmetMk6r",
        "US85_helmetPASGT",
		"US85_helmetPASGTr",
		"US85_helmetPASGTG",
		"US85_helmetSFL",
		"US85_helmetSFLG",
		"US85_helmetSFLG_on",
		"CSLA_helmet53",
		"CSLA_helmet53j",
		"CSLA_helmet53m",
		"CSLA_helmet53G",
		"CSLA_helmet53G_on"
];

private _crewhelmets = ["US85_helmetDH132", "US85_helmetDH132G", "US85_helmetDH132G_on"];

/////
private _offuniforms = ["U_I_C_Soldier_Camo_F"];
private _backpacks = ["US85_bpSf","FIA_bpPack", "US85_bpAlice"];

_loadoutData set ["offuniforms", _offuniforms]; ///check offuniforms later.
_loadoutData set ["vests", _vests];
_loadoutData set ["heavyVests", _heavyVests];
_loadoutData set ["backpacks", _backpacks]; ///check for backpacks later.
_loadoutData set ["helmets", _helmets];
_loadoutData set ["crewHelmets", _crewhelmets];

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


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", _vests];
_crewLoadoutData set ["crewHelmets", _crewhelmets];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_Marshal","U_C_WorkerCoveralls","U_Rangemaster"]];
_pilotLoadoutData set ["vests", _vests];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O", "H_CrewHelmetHeli_O", "H_PilotHelmetHeli_B", "H_CrewHelmetHeli_B"]];

// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	if (random 100 > 60) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

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

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
	["heavyVests"] call _fnc_setVest;
	[["heavyUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

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

private _partisanTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	[["heavyUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
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
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["heavyVests"] call _fnc_setVest;
	[["heavyUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
	};
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
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
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	if (random 100 < 30) then {
		["helmets"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
		[selectRandomWeighted [[], 1.5, "fullmask", 1]] call _fnc_setFacewear;
	} else {
		["headgear"] call _fnc_setHelmet;
		[selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
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
	["crewHelmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1.5, "fullmask", 1.25, "facewear", 1]] call _fnc_setFacewear;
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
	[selectRandomWeighted [[], 1.5, "facewear", 1, "fullmask", 1]] call _fnc_setFacewear;
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
	[["offuniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
