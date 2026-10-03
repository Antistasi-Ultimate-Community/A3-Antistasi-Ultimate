/////////////////////////////////
//   Side Information - Occ   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

// Reference LLSTRING in example_faction\stringtable.xml
["name", "UCN"] call _fnc_saveToTemplate; // Name of our faction, in game. NOT for the selection screen.
["spawnMarkerName", "UCN Carrier"] call _fnc_saveToTemplate; // Name of the spawn corridor.

["flag", DEFAULT_FLAG] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ucn_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", "a3u_flag_tke_ucn"] call _fnc_saveToTemplate; // Marker from CfgMarkers.

// Maybe swap ammobox/surrender crate/equipment box

///////////////////////////
//       Vehicles       //
/////////////////////////

/* 
    Reference script_template_common.hpp for these. Change the classes here if you want to use different classes.
    Always ensure that whatever classname you use for these has an A3A_logistics_Cargo entry, otherwise they will not be loadable.
*/
["ammobox", DEFAULT_AMMOBOX] call _fnc_saveToTemplate;
["surrenderCrate", DEFAULT_SURRENDERCRATE] call _fnc_saveToTemplate;
["equipmentBox", DEFAULT_EQUIPMENTBOX] call _fnc_saveToTemplate;

/* Ground Vehicles */
private _vehiclesBasic = ["A3U_UCN_BL_Nomad_Rollcage"]; // Absolute basic vehicle. Quadbike, LSV, etc.
private _vehiclesLightUnarmed = ["UCNFA_G_APC_U", "A3U_UCN_BL_Nomad_Rollcage"]; // Fundamental vehicle. Think an unarmoured humvee.
private _vehiclesLightArmed = ["UCNFA_G_APC_A"]; // Fundamental vehicle. Think a lightly armoured humvee with an M240.

private _vehiclesTrucks = ["UCNFA_G_APC_U", "TKE_Ext_Bearcat_Unarmed_UCNFA"]; // Used for troop carrying.
private _vehiclesCargoTrucks = _vehiclesTrucks; // Used for cargo carrying. Must have logistics nodes.
private _vehiclesAmmoTrucks = ["A3U_UCNFA_BL_APC_U_Ammo"];
private _vehiclesRepairTrucks = ["A3U_UCNFA_BL_APC_U_Repair"];
private _vehiclesFuelTrucks = ["A3U_UCNFA_BL_APC_U_Fuel"];
private _vehiclesMedicalTrucks = ["FEDRA_APC_U"];

private _vehiclesLightAPCs = ["UCNFA_G_APC_U", "TKE_Ext_Bearcat_Autocannon_UCNFA"]; // A light APC is an Armoured Personnel Carrier. Generally, light armoured vehicle + light gun.
private _vehiclesAPCs = ["UCNFA_G_APC_A", "TKE_Ext_Bearcat_Autocannon_UCNFA"]; // An APC is a light APC but bigger. Generally, armoured vehicle + medium gun.
private _vehiclesIFVs = ["UCNFA_G_APC_AX", "TKE_Ext_Bearcat_Autocannon_UCNFA"]; // An IFV is an Infantry Fighting Vehicle. Generally, armoured vehicle + big gun.
private _vehiclesAirborne = ["UCNFA_G_APC_AX", "TKE_Ext_Bearcat_Cannon_UCNFA", "a3a_MBT_02_cannon_grey_F"]; // Vehicles that can be "paradropped". Not *too* strict, but use common sense.
private _vehiclesAA = ["UCNFA_G_APC_AA", "TKE_Ext_Bearcat_AA_UCNFA"]; // Vehicles that AI crew can use to shoot down aircraft. If they can, it's an AA vehicle!

private _vehiclesLightTanks = ["UCNFA_G_APC_AX", "TKE_Ext_Bearcat_Cannon_UCNFA"]; // A light tank is a tank that is light... Think an american M60 (the tank).
private _vehiclesTanks = ["UCNFA_G_APC_Art", "a3a_MBT_02_cannon_grey_F"]; // A tank is a tank. Shocker. Think an M1 Abrams.

/* Sea Vehicles */
private _vehiclesTransportBoats = ["I_C_Boat_Transport_02_F"];
private _vehiclesGunBoats = ["B_T_Boat_Armed_01_minigun_F"];

/* Air Vehicles */
private _vehiclesPlanesCAS = ["TKE_Ext_GUSA_UCMC"]; // CAS = Close Air Support, CfgPlaneLoadouts >> CAS and CASDIVE
private _vehiclesPlanesAA = ["TKE_Ext_GUSM_UCMC"]; // AA = Anti-Air, CfgPlaneLoadouts >> AA
private _vehiclesPlanesTransport = ["TKE_Ext_GUSM_UCNFA", "VVE_VTOL_03_unarmed_QAV"]; // Troop carriers for paradrop OR VTOL landing
private _vehiclesPlanesGunship = ["TKE_Ext_Destroyer_BLU"]; // Self explanatory
private _vehiclesPlanesLargeCAS = ["TKE_Ext_Destroyer_BLU"]; // Used for planes that need to spawn on the runway.
private _vehiclesPlanesLargeAA = ["TKE_Ext_Frigate_BLU"]; // Used for planes that need to spawn on the runway.

private _vehiclesHelisLight = ["TKE_Ext_Dragonfly_T_UCNFA"]; // A light transport helicopter.
private _vehiclesHelisTransport = ["TKE_Ext_Dragonfly_T_UCNFA", "VVE_VTOL_03_unarmed_QAV"]; // A transport helicopter.
private _vehiclesHelisLightAttack = ["TKE_Ext_Dragonfly_S_UCNFA"]; // A light attack helicopter.
private _vehiclesHelisAttack = ["TKE_Ext_Dragonfly_A_UCNFA"]; // An attack helicopter.
private _vehiclesAirPatrol = _vehiclesHelisLightAttack + _vehiclesHelisAttack; // A helicopter that is used to patrol areas.

/* Special Vehicles */
private _vehiclesArtillery = ["UCNFA_G_APC_Art"]; // If it has an artillery computer and moves, it's probably vehicular artillery.
["magazines", createHashMapFromArray [
    ["UCNFA_G_APC_Art", ["8Rnd_82mm_Mo_shells"]] // ["vehicle", ["magazine1", "magazine2"]]. You can add multiple vehicles.
]] call _fnc_saveToTemplate;

/* Militia Vehicles */
private _vehiclesMilitiaLightArmed = ["TKE_Ext_Bearcat_Autocannon_UCMC"]; // Think: What would a hastily formed militia use?
private _vehiclesMilitiaTrucks = ["FEDRA_APC_U"];
private _vehiclesMilitiaCars = ["A3U_UCN_BL_Nomad_Rollcage"];
private _vehiclesMilitiaAPCs = ["FEDRA_APC_A"];

/* Police Vehicles */
private _vehiclesPolice = ["UCPD_APC_U"];

/* Radar and SAM */
private _vehiclesRadar = "B_Radar_System_01_F";
private _vehiclesSam = "PHEN_TurretPack_B_Turret_02";

/* Statics */
private _staticMG = ["I_G_HMG_02_high_F"]; // Must fit in a standard Altis defensive tower.
private _staticAT = ["PHEN_TurretPack_B_Turret_06_cannon", "PHEN_TurretPack_B_Turret_05_AT"]; // Must fit in a standard Altis defensive tower.
private _staticAA = ["PHEN_TurretPack_B_Turret_03", "PHEN_TurretPack_B_Turret_05"]; // Must fit on a standard Altis HQ military building.

private _staticMortars = ["UCNFA_TRT_82"]; // Must fit in a ~2x2 sandbag emplacement.
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your mortar.
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

private _staticHowitzers = ["PHEN_TurretPack_B_Turret_06"];
["howitzerMagazineHE", "magazine_ShipCannon_120mm_HE_shells_x32"] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your howitzer.

/* UAV's */
private _uavsPortable = []; // A UAV that is packable into a backpack.
private _uavsAttack = []; // A UAV that is capable of attacking. Think a reaper drone.

/* Mines */
private _minefieldAT = ["ATMine"]; // Mine used for Anti Tank fields.
private _minefieldAPERS = ["APERSMine"]; // Mine used for Anti Personnel fields.

#include "UCN_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

// These are the "Military" identities by default. 
// They also encompass any tier you *don't* define, so these are "fallback" entries too.
private _faces = [
    "WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
    "WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
    "WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
    "WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25","WhiteHead_26", 
    "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31",
    "TanoanHead_A3_02","TanoanHead_A3_04","TanoanHead_A3_03","TanoanHead_A3_05",
    "TanoanHead_A3_07","TanoanHead_A3_01","TanoanHead_A3_06","TanoanHead_A3_09",
    "LivonianHead_5","LivonianHead_2","LivonianHead_9","LivonianHead_6","LivonianHead_3",
    "LivonianHead_1","LivonianHead_10","LivonianHead_8","LivonianHead_4","LivonianHead_7"
];
private _voices = [
    "Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG",
    "Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"
];
private _insignia = [];

["faces", _faces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;
["insignia", _insignia] call _fnc_saveToTemplate;

/* Police identities | Falls back to the default if not uncommented. */

private _polFaces = [];
private _polVoices = [];
private _polInsignia = [];

/*
["polFaces", _polFaces] call _fnc_saveToTemplate;
["polVoices", _polVoices] call _fnc_saveToTemplate;
["polInsignia", _polInsignia] call _fnc_saveToTemplate;
*/

/* Militia identities | Falls back to the default if not uncommented. */

private _milFaces = [];
private _milVoices = [];
private _milInsignia = [];

/*
["milFaces", _milFaces] call _fnc_saveToTemplate;
["milVoices", _milVoices] call _fnc_saveToTemplate;
["milInsignia", _milInsignia] call _fnc_saveToTemplate;
*/

/* Elite identities | Falls back to the default if not uncommented. */

private _eliteFaces = [];
private _eliteVoices = [];
private _eliteInsignia = [];

/*
["eliteFaces", _eliteFaces] call _fnc_saveToTemplate;
["eliteVoices", _eliteVoices] call _fnc_saveToTemplate;
["eliteInsignia", _eliteInsignia] call _fnc_saveToTemplate;
*/

/* Special Forces identities | Falls back to the default if not uncommented. */
private _sfFaces = [];
private _sfVoices = ["Male01ENGVR"];
private _sfInsignia = [];

["sfVoices", _sfVoices] call _fnc_saveToTemplate;

/*
["sfFaces", _sfFaces] call _fnc_saveToTemplate;
["sfInsignia", _sfInsignia] call _fnc_saveToTemplate;
*/

//////////////////////////
//       Loadouts       //
//////////////////////////

/* 
    Example Weapon:

    ["Weapon", "muzzle", "side mount", "optic", ["ammo"], ["GL ammo"], "bipod"], weight

    OR

    ["Weapon", ["muzzle", weight], ["side mount", weight], ["optic", weight], ["ammo"], ["GL ammo"], ["bipod", weight]], weight

    If a given loadoutData variable has a weighted array (like the above), make sure all additive statements also have a weighted array.

    Fun fact: Everything under _loadoutData can be overwritten by a specific tier. 
    E.g if you want every tier to have a map EXCEPT militia, put maps in _loadoutData.
    However, under _militiaLoadoutData, add a new entry: _militiaLoadoutData set ["maps", []];
    Militia will no longer get maps!
*/

private _opticsShared = ["TKE_MRCOSight", 0.2, "TKE_4xSight", 0.2, "TKE_RedDotSight", 0.4, "", 0.2];
private _opticsSharedSL = ["TKE_MRCOSight", 0.4, "TKE_4xSight", 0.4, "TKE_RedDotSight", 0.2];
private _mountsShared = ["acc_flashlight", 0.2, "acc_pointer_IR", 0.2, "", 0.6];
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", [
    ["TKE_BPRA5", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 2,
    ["TKE_UCNRifle2", "", _mountsShared, _opticsShared, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 3
]];
_loadoutData set ["riflesSL", [
    ["TKE_UCNBPRifle", "", _mountsShared, _opticsSharedSL, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTG"], [], ""], 2,
    ["TKE_BPRA5", "", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 3,
    ["TKE_UCNRifle2", "", _mountsShared, _opticsSharedSL, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 4,
    ["TKE_UCNRifle", "", _mountsShared, _opticsSharedSL, ["TKE_25rnd_762x51_mag"], [], ""], 1,
    ["WRS_Weapon_AR", "", _mountsShared, _opticsShared, ["WRS_Ar_Magazine"], [], ""], 1
]]; // Rifle given to Squad Leaders
_loadoutData set ["riflesAuto", [
    ["TKE_UCNLMG", "", _mountsShared, _opticsShared, ["TKE_150rnd_62x35_magUCN"], [], ""], 2,
    ["TKE_UCNMMG", "", _mountsShared, _opticsShared, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1,
    ["WRS_Weapon_LMG", "", "", "", ["200Rnd_556x45_Box_Tracer_F"], [], ""], 0.5
]]; // An LMG or machine gun
_loadoutData set ["riflesMarksman", [
    ["TKE_UCNDMR", "", _mountsShared, "TKE_10xSight", ["TKE_20rnd_969x51_magUCN"], [], "bipod_03_F_blk"], 1
]]; // Accurate long barrel rifle
_loadoutData set ["riflesSniper", [
    ["TKE_UCNSniper", "", "", ["TKE_10xSight", 0.7, "TKE_ThermScope", 0.3], ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], "bipod_01_F_blk"], 2,
    ["WRS_Weapon_Sniper_Bolt", "", "", ["optic_LRPS", 0.7, "TKE_ThermScope", 0.3], ["WRS_Boomslang_Magazine"], [], ""], 1
]]; // Designated sniper rifle
_loadoutData set ["riflesCarbine", [
    ["TKE_BPRA5", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 2,
    ["TKE_UCNRifle3", "", _mountsShared, "TKE_ReflexSight", ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 1 // It's an SMG. Do I care? No
]]; // A rifle with a shorter barrel length
_loadoutData set ["launchersGrenade", [
    ["TKE_UCNRifle4", "", _mountsShared, _opticsShared, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 2,
    ["TKE_UCNBPRifleV2", "", _mountsShared, _opticsShared, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTG"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 1,
    ["TKE_BPRA5GL", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 0.5
]]; // A (usually) rifle mounted grenade launcher
_loadoutData set ["launchersGrenadeDesignated", [
    ["WRS_Weapon_ShockGun_Black", "", "", "", ["WRS_Shockgun_Magazine"], [], ""], 1
]]; // A standalone grenade launcher

_loadoutData set ["launchersLightAT", [
    ["TKE_ATRecoilless1", "", "", "", ["MRAWS_HE_F"], [], ""], 1
]]; // Light launcher that fires a non-missile projectile
_loadoutData set ["launchersAT", [
    ["TKE_ATRecoilless1", "", "", "", ["MRAWS_HEAT55_F"], [], ""], 1
]]; // Launcher that fires a non-missile projectile
_loadoutData set ["launchersMissileAT", [
    ["TKE_ATRecoilless1", "", "", "", ["MRAWS_HEAT_F"], [], ""], 1
]]; // Launcher that fires a missile projectile
_loadoutData set ["launchersAA", [
    ["launch_B_Titan_olive_F", "", "", "", ["Titan_AA"], [], ""], 1
]]; // Launcher that fires an AA guided missile projectile
_loadoutData set ["sidearms", [
    ["TKE_UCNPistol", "", "", "", ["TKE_UCNPistol_mag"], [], ""], 1
]];

_loadoutData set ["minesAT", ["ATMine_Range_Mag"]]; // Anti-tank
_loadoutData set ["minesAP", ["APERSMine_Range_Mag"]]; // Anti-personnel
_loadoutData set ["explosivesLight", ["DemoCharge_Remote_Mag"]]; // Found on explosive expert units
_loadoutData set ["explosivesHeavy", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["TKE_FRAG_mag", "TKE_IMPACT_mag"]];
_loadoutData set ["smokeGrenades", ["TKE_SMOKE_mag"]];
_loadoutData set ["signalSmokeGrenades", ["SmokeShellGreen"]]; // (Flare)

/* Basic equipment. Shouldn't need touching most of the time. */
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["GPS", ["ItemGPS"]];
_loadoutData set ["NVG", ["TKE_IntegratedNVGs", "TKE_UCMCHUD"]]; // NVG's given to all units PROVIDED they have no tier-specific overwrites
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["TKE_BinoUCN"]];

/* Traitor: A rebel traitor who has defected to *this* faction. */
_loadoutData set ["uniformsTraitor", ["TKE_CombatUniNARolledFEDRA_U_B", 0.33, "TKE_CombatUniRolledV1FEDRA_U_B", 0.33, "TKE_CombatUniRolledV2FEDRA_U_B", 0.33]];
_loadoutData set ["vestsTraitor", ["TKE_GenVest1FEDRA", 0.2, "TKE_GenVest1PV1FEDRA", 0.3, "TKE_GenVest1PV2FEDRA", 0.3, "TKE_FlakJacketPV1FEDRA", 0.2]];
_loadoutData set ["helmetsTraitor", ["TKE_MercHelmV2FEDRA", 0.5, "TKE_MercHelmClosedFEDRA", 0.3, "TKE_UCMCHelmClosedFEDRAV2", 0.2]];

/* Officer: An official who is present at places like Military Administration. */
_loadoutData set ["uniformsOfficer", ["TKE_CombatShirtFEDRA_U_B", 0.5, "TKE_CombatUniRolledV2FEDRA_U_B", 0.5]];
_loadoutData set ["vestsOfficer", ["TKE_FlakJacketFEDRA", 0.33, "TKE_GenVest1FEDRA", 0.33, "TKE_GenVest1PV2FEDRA", 0.33]];
_loadoutData set ["helmetsOfficer", ["TKE_PatrolCapCFEDRA", 0.5, "TKE_Beret_UCFA", 0.5]];

/* Cloak: Basically a small patrol sniper team. */
_loadoutData set ["uniformsCloak", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniNARolledArmyV2_U_B", 0.5]];
_loadoutData set ["vestsCloak", ["TKE_UCMCArmour6_1Army", 0.33, "TKE_UCMCArmour6_3Army", 0.33, "TKE_UCMCArmour2_2Army", 0.33]];
_loadoutData set ["helmetsCloak", ["TKE_BoonieHatScrimArmy2", 0.5, "TKE_BoonieHatScrimHSArmy2", 0.5]];

/* Core: Shared loadout data. If not overwritten by _tierLoadoutData, it uses these instead. */
_loadoutData set ["uniforms", []];
_loadoutData set ["uniformsSL", []];
_loadoutData set ["uniformsHeavy", []];
_loadoutData set ["uniformsSniper", []];
_loadoutData set ["uniformsMedic", []];
_loadoutData set ["uniformsGrenadier", []];
_loadoutData set ["uniformsMachineGunner", []];

_loadoutData set ["vests", []];
_loadoutData set ["vestsSL", []];
_loadoutData set ["vestsHeavy", []];
_loadoutData set ["vestsSniper", []];
_loadoutData set ["vestsMedic", []];
_loadoutData set ["vestsGrenadier", []];
_loadoutData set ["vestsMachineGunner", []];

_loadoutData set ["backpacks", ["TKE_LightPackUCN", "TKE_BackPack1", "TKE_RuckSack", "TKE_CamelBakV2UCN", "TKE_AlicePackUCN"]];
_loadoutData set ["backpacksRadio", ["TKE_RadioPackUCN"]];
_loadoutData set ["backpacksAT", ["TKE_AlicePackUCN"]];

_loadoutData set ["helmets", []];
_loadoutData set ["helmetsSL", []];
_loadoutData set ["helmetsHeavy", []];
_loadoutData set ["helmetsSniper", []];
_loadoutData set ["helmetsMedic", []];
_loadoutData set ["helmetsGrenadier", []];
_loadoutData set ["helmetsMachineGunner", []];

_loadoutData set ["facewear", []];

/* Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied. */
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; // Basic medical items
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; // Standard medical items
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; // Medic items
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

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["TKE_CombatUniNARolledArmyV2_U_B"]];
_crewLoadoutData set ["vests", ["TKE_GenVest1PV1", "TKE_FlakJacket"]];
_crewLoadoutData set ["helmets", ["TKE_FCrewHelm_BASE"]];
_crewLoadoutData set ["rifles", [
    ["TKE_BPRA5", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 2,
    ["TKE_UCNRifle3Camo4", "", _mountsShared, "TKE_ReflexSight", ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 1
]];
// _crewLoadoutData set ["sidearms", []];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["TKE_VoidSuit_U_B"]];
_pilotLoadoutData set ["vests", ["TKE_PilotVest"]];
_pilotLoadoutData set ["helmets", ["TKE_UCNPilotHelmRV"]];
_pilotLoadoutData set ["rifles", [
    ["TKE_UCNRifle3", "", _mountsShared, "TKE_ReflexSight", ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 1
]];
// _pilotLoadoutData set ["sidearms", []];

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["TKE_CombatUniRolledV1Police_U_B", "TKE_CombatUniRolledV2Police_U_B", "TKE_CombatUniNARolledPolice_U_B"]];
_policeLoadoutData set ["vests", ["TKE_GenVest1Police", "TKE_GenVest1PV1Police", "TKE_FlakJacketPV1Police", "TKE_FlakJacketPolice"]];
_policeLoadoutData set ["helmets", ["TKE_PatrolCapCPolice", "TKE_MercHelmV2Police", "TKE_MercHelmV2VisorPolice"]];
_policeLoadoutData set ["rifles", [
    ["TKE_BPRA5", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 1,
    ["TKE_UCNRifle3Camo4", "", _mountsShared, "TKE_ReflexSight", ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 2,
    ["TKE_KMCSMGGrey", "", _mountsShared, "TKE_ReflexSight", ["TKE_45rnd_pdw_mag"], [], ""], 1
]];
// _policeLoadoutData set ["sidearms", []];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

/* Unit Gear */
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", [
    "TKE_CombatUniFEDRA_U_B", 0.2, 
    "TKE_CombatUniRolledV1FEDRA_U_B", 0.2, 
    "TKE_CombatUniRolledV2FEDRA_U_B", 0.2, 
    "TKE_CombatShirtFEDRA_U_B", 0.2, 
    "TKE_CombatUniNARolledFEDRA_U_B", 0.2
]];
_militiaLoadoutData set ["uniformsSL", ["TKE_CombatUniRolledV1MercV2_U_B", 0.5, "TKE_CombatUniRolledV2MercV2_U_B", 0.5]];
_militiaLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitFEDRA_U_B", 1]];
_militiaLoadoutData set ["uniformsSniper", ["TKE_CombatShirtFEDRA_U_B", 1]];
_militiaLoadoutData set ["uniformsMedic", ["TKE_CombatUniFEDRA_U_B", 0.5, "TKE_CombatUniRolledV1FEDRA_U_B", 0.5]];
_militiaLoadoutData set ["uniformsGrenadier", ["TKE_CombatUniFEDRA_U_B", 0.5, "TKE_CombatUniRolledV2FEDRA_U_B", 0.5]];
_militiaLoadoutData set ["uniformsMachineGunner", ["TKE_CombatUniFEDRA_U_B", 0.5, "TKE_CombatUniRolledV2FEDRA_U_B", 0.5]];
_militiaLoadoutData set ["vests", [
    "TKE_GenVest1PV1FEDRA", 0.25,
    "TKE_GenVest1FEDRA", 0.25,
    "TKE_FlakJacketPV1FEDRA", 0.25,
    "TKE_FlakJacketFEDRA", 0.25
]];
_militiaLoadoutData set ["vestsSL", ["TKE_GenVest1PV2FEDRA", 1]];
_militiaLoadoutData set ["vestsHeavy", ["TKE_FedraArmour_Camo", 0.5, "TKE_FedraArmour2_Camo", 0.5]];
_militiaLoadoutData set ["vestsSniper", ["TKE_FlakJacketFEDRA", 1]];
_militiaLoadoutData set ["vestsMedic", ["TKE_FlakJacketFEDRA", 1]];
_militiaLoadoutData set ["vestsGrenadier", ["TKE_FlakJacketPV1FEDRA", 0.5, "TKE_FedraArmour2_Camo", 0.5]];
_militiaLoadoutData set ["vestsMachineGunner", ["TKE_FedraArmour_Camo", 0.5, "TKE_FedraArmour2_Camo", 0.5]];
_militiaLoadoutData set ["backpacks", ["TKE_CamelBakV2UCN", 0.33, "TKE_UCNFaceWear1FW", 0.33, "TKE_BackPack1", 0.33]];
_militiaLoadoutData set ["helmets", ["TKE_PatrolCapCFEDRA", 0.33, "TKE_MercHelmV2FEDRA", 0.33, "TKE_MercHelmV2VisorFEDRA", 0.33]];
_militiaLoadoutData set ["helmetsSL", ["TKE_UCMCHelmClosedFEDRA", 1]];
_militiaLoadoutData set ["helmetsHeavy", ["TKE_UCMCHelmFEDRA", 0.33, "TKE_UCMCHelmClosedFEDRAV2", 0.33, "TKE_MercHelmClosedFEDRA", 0.33]];
_militiaLoadoutData set ["helmetsSniper", ["TKE_MercHelmClosedFEDRA", 0.33, "TKE_MercHelmNVG1FEDRA", 0.33, "TKE_FaceCoverEPGrey", 0.33]];
_militiaLoadoutData set ["helmetsMedic", ["TKE_MercHelmV2VisorFEDRA", 0.5, "TKE_MercHelmClosedFEDRA", 0.5]];
_militiaLoadoutData set ["helmetsGrenadier", ["TKE_UCMCHelmFEDRA", 0.5, "TKE_UCMCHelmClosedFEDRAV2", 0.5]];
_militiaLoadoutData set ["helmetsMachineGunner", ["TKE_MercHelmClosedFEDRA", 0.5, "TKE_UCMCHelmFEDRA", 0.5]];

/* Unit Misc Gear */
_militiaLoadoutData set ["facewear", [
    "TKE_UCMCLegPouch", 0.2,
    "TKE_UCNFaceWear1", 0.2,
    "TKE_UCMCGogglesDown", 0.2,
    "TKE_FaceCoverGrey", 0.4
]];

/* Unit Weapons */
_militiaLoadoutData set ["rifles", [
    ["TKE_ARX12FEDRA", "", "", _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 5
    // ["TKE_UCNRifle2", "", "", _opticsShared, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 2,
    // ["WRS_Weapon_AR", "", "", _opticsShared, ["WRS_Ar_Magazine"], [], ""], 1
]];
_militiaLoadoutData set ["riflesSL", [
    ["TKE_ARX12FEDRA", "", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 6,
    ["TKE_UCNBPRifle", "", _mountsShared, _opticsSharedSL, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTG"], [], ""], 1,
    ["TKE_BPRA5", "", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 3,
    ["TKE_UCNRifle2", "", _mountsShared, _opticsSharedSL, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 2,
    ["TKE_UCNRifle", "", _mountsShared, _opticsSharedSL, ["TKE_25rnd_762x51_mag"], [], ""], 1
]];
_militiaLoadoutData set ["riflesAuto", [
    ["TKE_UCNLMG", "", _mountsShared, _opticsShared, ["TKE_150rnd_62x35_magUCN"], [], ""], 1
]];

// We're going to let the default _loadoutData handle weapons from here, militia has like... 2 unique guns?
// _militiaLoadoutData set ["riflesMarksman", []];
// _militiaLoadoutData set ["riflesSniper", []];
// _militiaLoadoutData set ["riflesCarbine", []];
// _militiaLoadoutData set ["launchersGrenade", []];
// _militiaLoadoutData set ["sidearms", []];
// _militiaLoadoutData set ["binoculars", []];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

/* Unit Gear */
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", [
    "TKE_CombatUniArmyV2_U_B", 0.2, 
    "TKE_CombatUniRolledV1ArmyV2_U_B", 0.2, 
    "TKE_CombatUniRolledV2ArmyV2_U_B", 0.2, 
    "TKE_CombatUniNARolledArmyV2_U_B", 0.2
]];
_militaryLoadoutData set ["uniformsSL", ["TKE_CombatUniRolledV1ArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_militaryLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitArmyV2_U_B", 1]];
_militaryLoadoutData set ["uniformsSniper", ["TKE_CombatShirtArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_militaryLoadoutData set ["uniformsMedic", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniRolledV1ArmyV2_U_B", 0.5]];
_militaryLoadoutData set ["uniformsGrenadier", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_militaryLoadoutData set ["uniformsMachineGunner", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_militaryLoadoutData set ["vests", [
    "TKE_UCMCArmour6_1Army", 0.25,
    "TKE_UCMCArmour6_2Army", 0.25,
    "TKE_UCMCArmour2_2Army", 0.25,
    "TKE_UCMCArmour3_1Army", 0.25
]];
_militaryLoadoutData set ["vestsSL", ["TKE_UCMCArmour4_2Army", 0.5, "TKE_UCMCArmour6_3Army", 0.5]];
_militaryLoadoutData set ["vestsHeavy", ["TKE_UCMCArmour6_2Army", 0.5, "TKE_UCMCArmour3_2Army", 0.5]];
_militaryLoadoutData set ["vestsSniper", ["TKE_UCMCArmour2_2Army", 1]];
_militaryLoadoutData set ["vestsMedic", ["TKE_UCMCArmour3_1Army", 1]];
_militaryLoadoutData set ["vestsGrenadier", ["TKE_UCMCArmour6_2Army", 0.5, "TKE_UCMCArmour3_2Army", 0.5]];
_militaryLoadoutData set ["vestsMachineGunner", ["TKE_UCMCArmour6_4Army", 0.5, "TKE_UCMCArmour5_1Army", 0.5]];
_militaryLoadoutData set ["backpacks", ["TKE_CamelBakV2UCNCamo2", 0.33, "TKE_UCMCLegPouchFWCamo2V2", 0.33, "TKE_BackPack1UCN2", 0.33]];
_militaryLoadoutData set ["helmets", ["TKE_UCMCHelm_Army", 0.33, "TKE_UCMCHelmClosedArmyV2", 0.33, "TKE_UCMRHelmOpen_ArmyV2", 0.33]];
_militaryLoadoutData set ["helmetsSL", ["TKE_UCMCHelmClosedArmy", 1]];
_militaryLoadoutData set ["helmetsHeavy", ["TKE_UCMCHelm_Army", 0.33, "TKE_UCMCHelmClosedArmyV2", 0.33, "TKE_UCMCHelmClosedArmyV2", 0.33]];
_militaryLoadoutData set ["helmetsSniper", ["TKE_UCMCHelmScrim_Army", 0.33, "TKE_UCMRHelmOpenScrim_ArmyV2", 0.33, "TKE_UCMCHelmClosedArmyV2", 0.33]];
_militaryLoadoutData set ["helmetsMedic", ["TKE_UCMCHelmMaskV2_Army", 0.5, "TKE_UCMCHelm_Army", 0.5]];
_militaryLoadoutData set ["helmetsGrenadier", ["TKE_UCMCHelm_Army", 0.5, "TKE_UCMCHelmClosedArmyV2", 0.5]];
_militaryLoadoutData set ["helmetsMachineGunner", ["TKE_UCMCHelm_Army", 0.5, "TKE_UCMCHelmClosedArmyV2", 0.5]];

/* Unit Misc Gear */
_militaryLoadoutData set ["facewear", [
    "TKE_FaceCoverGrey", 0.33,
    "TKE_UCNFaceWear1", 0.33,
    "", 0.33
]];

_militaryLoadoutData set ["NVGs", ["TKE_UCMCNvgArmy"]];

/* Unit Weapons */

_militaryLoadoutData set ["rifles", [
    ["WRS_Weapon_AR", "", _mountsShared, _opticsShared, ["WRS_Ar_Magazine"], [], ""], 1,
    ["TKE_BPRA5", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 1,
    ["TKE_UCNBPRifle", "", _mountsShared, _opticsShared, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTG"], [], ""], 2,
    ["TKE_UCNRifle2", "", _mountsShared, _opticsShared, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 3
]];
_militaryLoadoutData set ["riflesCarbine", [
    ["TKE_UCNBPRifle", "", _mountsShared, _opticsShared, ["TKE_30rnd_575x45_mag", "TKE_30rnd_575x45_magTG"], [], ""], 1,
    ["TKE_UCNRifle3", "", _mountsShared, "TKE_ReflexSight", ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTG"], [], ""], 1
]];

// We're going to let the default _loadoutData handle weapons from here (we could use the green camo weapons but...)
// _militaryLoadoutData set ["rifles", []];
// _militaryLoadoutData set ["riflesSL", []];
// _militaryLoadoutData set ["riflesAuto", []];
// _militaryLoadoutData set ["riflesMarksman", []];
// _militaryLoadoutData set ["riflesSniper", []];
// _militaryLoadoutData set ["riflesCarbine", []];
// _militaryLoadoutData set ["launchersGrenade", []];
// _militaryLoadoutData set ["sidearms", []];
// _militaryLoadoutData set ["binoculars", []];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

/* Unit Gear */
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", [
    "TKE_CombatUniArmyV2_U_B", 0.2, 
    "TKE_CombatUniRolledV1ArmyV2_U_B", 0.2, 
    "TKE_CombatUniRolledV2ArmyV2_U_B", 0.2, 
    "TKE_CombatUniNARolledArmyV2_U_B", 0.2, 
    "TKE_CombatUniNARolledArmyV2_U_B", 0.2
]];
_eliteLoadoutData set ["uniformsSL", ["TKE_CombatUniRolledV1ArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_eliteLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitArmyV2_U_B", 1]];
_eliteLoadoutData set ["uniformsSniper", ["TKE_CombatShirtArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_eliteLoadoutData set ["uniformsMedic", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniRolledV1ArmyV2_U_B", 0.5]];
_eliteLoadoutData set ["uniformsGrenadier", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_eliteLoadoutData set ["uniformsMachineGunner", ["TKE_CombatUniArmyV2_U_B", 0.5, "TKE_CombatUniRolledV2ArmyV2_U_B", 0.5]];
_eliteLoadoutData set ["vests", [
    "TKE_UCMCArmour6_1Army", 0.25,
    "TKE_UCMCArmour6_2Army", 0.25,
    "TKE_UCMCArmour2_1Army", 0.25,
    "TKE_UCMCArmour3_2Army", 0.25
]];
_eliteLoadoutData set ["vestsSL", ["TKE_UCMCArmour6_3Army", 0.5, "TKE_UCMCArmour4_1Army", 0.5]];
_eliteLoadoutData set ["vestsHeavy", ["TKE_UCMCArmour6_2Army", 0.5, "TKE_UCMCArmour3_2Army", 0.5]];
_eliteLoadoutData set ["vestsSniper", ["TKE_UCMCArmour6_1Army", 1]];
_eliteLoadoutData set ["vestsMedic", ["TKE_UCMCArmour6_2Army", 1]];
_eliteLoadoutData set ["vestsGrenadier", ["TKE_UCMCArmour6_2Army", 0.5, "TKE_UCMCArmour3_2Army", 0.5]];
_eliteLoadoutData set ["vestsMachineGunner", ["TKE_UCMCArmour6_4Army", 0.5, "TKE_UCMCArmour5_1Army", 0.5]];
_eliteLoadoutData set ["backpacks", ["TKE_CamelBakV2UCNCamo2", 0.5, "TKE_BackPack1UCN2", 0.5]];
_eliteLoadoutData set ["helmets", ["TKE_UCMCHelmClosedArmy", 0.5, "TKE_UCMRHelmOpenScrim_ArmyV2", 0.5]];
_eliteLoadoutData set ["helmetsSL", ["TKE_UCMCHelmClosedArmy", 1]];
_eliteLoadoutData set ["helmetsHeavy", ["TKE_UCMCHelmClosedArmy", 1]];
_eliteLoadoutData set ["helmetsSniper", ["TKE_UCMCHelmScrim_Army", 0.33, "TKE_UCMRHelmOpenScrim_ArmyV2", 0.33, "TKE_UCMCHelmClosedArmy", 0.33]];
_eliteLoadoutData set ["helmetsMedic", ["TKE_UCMCHelmClosedArmy", 1]];
_eliteLoadoutData set ["helmetsGrenadier", ["TKE_UCMCHelmClosedArmy", 1]];
_eliteLoadoutData set ["helmetsMachineGunner", ["TKE_UCMCHelmClosedArmy", 1]];

/* Unit Misc Gear */
_eliteLoadoutData set ["facewear", [
    "TKE_FaceCoverGrey", 0.33,
    "TKE_UCNChestPouches1Camo2V2", 0.33,
    "TKE_UCNFaceWear2Camo2V2", 0.33
]];

/* Unit Weapons */

// We're going to let the default _loadoutData handle weapons from here
// _eliteLoadoutData set ["rifles", []];
// _eliteLoadoutData set ["riflesSL", []];
// _eliteLoadoutData set ["riflesAuto", []];
// _eliteLoadoutData set ["riflesMarksman", []];
// _eliteLoadoutData set ["riflesSniper", []];
// _eliteLoadoutData set ["riflesCarbine", []];
// _eliteLoadoutData set ["launchersGrenade", []];
// _eliteLoadoutData set ["sidearms", []];
// _eliteLoadoutData set ["binoculars", []];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

#define GEAR_SF_VEST "TKE_CSTRArmour", "TKE_CSTRArmourNP"

/* Unit Gear */
private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["uniformsSL", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["uniformsHeavy", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["uniformsSniper", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["uniformsMedic", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["uniformsGrenadier", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["uniformsMachineGunner", ["TKE_CSTRUni_U_B"]];
_sfLoadoutData set ["vests", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsSL", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsHeavy", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsSniper", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsMedic", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsGrenadier", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsMachineGunner", [GEAR_SF_VEST]];
_sfLoadoutData set ["backpacks", ["TKE_EVAPack", "TKE_JammerPackUCN"]];
_sfLoadoutData set ["helmets", ["TKE_CSTRHelm"]];
_sfLoadoutData set ["helmetsSL", ["TKE_CSTRHelmVD"]];
_sfLoadoutData set ["helmetsHeavy", ["TKE_CSTRHelmVD"]];
_sfLoadoutData set ["helmetsSniper", ["TKE_CSTRHelm"]];
_sfLoadoutData set ["helmetsMedic", ["TKE_CSTRHelmVU"]];
_sfLoadoutData set ["helmetsGrenadier", ["TKE_CSTRHelmVU"]];
_sfLoadoutData set ["helmetsMachineGunner", ["TKE_CSTRHelmVU"]];

/* Unit Misc Gear */
_sfLoadoutData set ["facewear", []];
_sfLoadoutData set ["NVGs", ["TKE_ReconNVGUCN"]];

/* Unit Weapons */
_sfLoadoutData set ["rifles", [
    ["TKE_BPRA5", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 1
]];
_sfLoadoutData set ["riflesSL", [
    ["TKE_BPRA5", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 1
]]; // Rifle given to Squad Leaders
_sfLoadoutData set ["riflesAuto", [
    ["TKE_UCNLMG", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_150rnd_62x35_magUCN"], [], ""], 1,
    ["TKE_UCNMMG", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_100rnd_ucnmmg_mag"], [], ""], 2
]]; // An LMG or machine gun
_sfLoadoutData set ["riflesMarksman", [
    ["TKE_UCNDMR", "muzzle_snds_65_TI_blk_F", _mountsShared, "TKE_10xSight", ["TKE_20rnd_969x51_magUCN"], [], "bipod_03_F_blk"], 1
]]; // Accurate long barrel rifle
_sfLoadoutData set ["riflesSniper", [
    ["TKE_UCNSniper", "muzzle_snds_65_TI_blk_F", "", ["TKE_10xSight", 0.7, "TKE_ThermScope", 0.3], ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], "bipod_01_F_blk"], 1
]]; // Designated sniper rifle
_sfLoadoutData set ["riflesCarbine", [
    ["TKE_BPRA5", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 21
]]; // A rifle with a shorter barrel length
_sfLoadoutData set ["launchersGrenade", [
    ["TKE_UCNRifle4", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_35rnd_62x35_mag", "TKE_35rnd_62x35_magTR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareRed_F"], ""], 0.5,
    ["TKE_BPRA5GL", "muzzle_snds_65_TI_blk_F", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], ["1Rnd_HE_Grenade_shell", "UGL_FlareRed_F"], ""], 0.5
]]; // A (usually) rifle mounted grenade launcher

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "helmetsSL", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    [selectRandomWeighted ["vestsSL", 2, "vests", 1]] call _fnc_setVest;
    [selectRandomWeighted ["uniformsSL", 2, "uniforms", 1]] call _fnc_setUniform;

    [["riflesSL", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["GPS"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVG"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacksRadio"] call _fnc_setBackpack;

    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

private _medicTemplate = {
    [["helmetsMedic", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    [["vestsMedic", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsMedic", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
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

private _grenadierTemplate = {
    [["helmetsGrenadier", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    [["vestsGrenadier", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsGrenadier", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["launchersGrenadeDesignated", "launchersGrenade"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["launchersGrenade"] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    [["helmetsHeavy", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    [["vestsHeavy", "vests"] call _fnc_fallback] call _fnc_setVest;
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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["explosivesLight", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVG"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["launchersLightAT", "launchersAT"] call _fnc_fallback] call _fnc_setLauncher;
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
    ["NVG"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["launchersAT", "launchersMissileAT"]] call _fnc_setLauncher;
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
    ["NVG"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "riflesCarbine"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["launchersAA"] call _fnc_setLauncher;
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
    ["NVG"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    [["helmetsMachineGunner", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    [["vestsMachineGunner", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsMachineGunner", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["riflesAuto"] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [["helmetsSniper", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1, "facewear", 1]] call _fnc_setFacewear;
    [["vestsSniper", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsSniper", "uniforms"] call _fnc_fallback] call _fnc_setUniform;


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
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVG"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    [["helmetsSniper", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1, "facewear", 1]] call _fnc_setFacewear;
    [["vestsSniper","vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsSniper","uniforms"] call _fnc_fallback] call _fnc_setUniform;


    [["riflesSniper", "riflesMarksman"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["riflesCarbine"] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["riflesCarbine", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["helmetsTraitor"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vestsTraitor"] call _fnc_setVest;
    ["uniformsTraitor"] call _fnc_setUniform;

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
    ["helmetsOfficer"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "facewear", 1]] call _fnc_setFacewear;
    ["vestsOfficer"] call _fnc_setVest;
    ["uniformsOfficer"] call _fnc_setUniform;

    [["riflesCarbine", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    [["helmetsSniper", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1, "facewear", 1]] call _fnc_setFacewear;
    [["vestsCloak","vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsCloak","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["riflesSniper", "riflesMarksman"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    [["helmetsSniper", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1, "facewear", 1]] call _fnc_setFacewear;
    [["vestsCloak","vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsCloak","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "riflesCarbine", "riflesMarksman"]] call _fnc_setPrimary;
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
    ["NVG"] call _fnc_addNVGs;
};

////////////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.     //
//  Things below here can and will break the gamemode if improperly changed.                //
/////////////////////////////////////////////////////////////////////////////////////////////

#include "definitions\Main_Definitions.sqf"