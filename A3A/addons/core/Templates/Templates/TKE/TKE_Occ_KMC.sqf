/////////////////////////////////
//   Side Information - Occ   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

["name", "KMC"] call _fnc_saveToTemplate; // Name of our faction, in game. NOT for the selection screen.
["spawnMarkerName", "KMC Carrier"] call _fnc_saveToTemplate; // Name of the spawn corridor.

["flag", DEFAULT_FLAG] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\TKE\images\flag_kmc_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", "a3u_flag_tke_kmc"] call _fnc_saveToTemplate; // Marker from CfgMarkers.

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
private _vehiclesLightUnarmed = ["A3U_KMC_APC_U", "A3U_UCN_BL_Nomad_Rollcage"]; // Fundamental vehicle. Think an unarmoured humvee.
private _vehiclesLightArmed = ["A3U_UCN_BL_Nomad_Armed", "A3U_UCN_BL_Nomad_Cabin_Armed", "A3U_UCN_BL_Nomad_Rollcage_Armed"]; // Fundamental vehicle. Think a lightly armoured humvee with an M240.

private _vehiclesTrucks = ["A3U_KMC_APC_U", "A3U_TKE_Ext_Bearcat_Unarmed_KMC"]; // Used for troop carrying.
private _vehiclesCargoTrucks = _vehiclesTrucks; // Used for cargo carrying. Must have logistics nodes.
private _vehiclesAmmoTrucks = ["A3U_UCNFA_BL_APC_U_Ammo"];
private _vehiclesRepairTrucks = ["A3U_UCNFA_BL_APC_U_Repair"];
private _vehiclesFuelTrucks = ["A3U_UCNFA_BL_APC_U_Fuel"];
private _vehiclesMedicalTrucks = ["A3U_KMC_APC_U"];

private _vehiclesLightAPCs = ["A3U_KMC_APC_U", "A3U_TKE_Ext_Bearcat_Autocannon_KMC"]; // A light APC is an Armoured Personnel Carrier. Generally, light armoured vehicle + light gun.
private _vehiclesAPCs = ["A3U_KMC_APC_A", "A3U_TKE_Ext_Bearcat_Autocannon_KMC"]; // An APC is a light APC but bigger. Generally, armoured vehicle + medium gun.
private _vehiclesIFVs = ["A3U_KMC_APC_AX", "A3U_TKE_Ext_Bearcat_Autocannon_KMC"]; // An IFV is an Infantry Fighting Vehicle. Generally, armoured vehicle + big gun.
private _vehiclesAirborne = ["A3U_KMC_APC_AX", "A3U_TKE_Ext_Bearcat_Cannon_KMC", "a3a_MBT_02_cannon_grey_F"]; // Vehicles that can be "paradropped". Not *too* strict, but use common sense.
private _vehiclesAA = ["A3U_KMC_APC_AA", "A3U_TKE_Ext_Bearcat_AA_KMC"]; // Vehicles that AI crew can use to shoot down aircraft. If they can, it's an AA vehicle!

private _vehiclesLightTanks = ["A3U_KMC_APC_AX", "A3U_TKE_Ext_Bearcat_Cannon_KMC"]; // A light tank is a tank that is light... Think an american M60 (the tank).
private _vehiclesTanks = ["A3U_KMC_APC_Art", "a3a_MBT_02_cannon_grey_F"]; // A tank is a tank. Shocker. Think an M1 Abrams.

/* Sea Vehicles */
private _vehiclesTransportBoats = ["I_C_Boat_Transport_02_F"];
private _vehiclesGunBoats = ["B_T_Boat_Armed_01_minigun_F"];

/* Air Vehicles */
private _vehiclesPlanesCAS = ["A3U_TKE_Ext_GUSA_KMC"]; // CAS = Close Air Support, CfgPlaneLoadouts >> CAS and CASDIVE
private _vehiclesPlanesAA = ["A3U_TKE_Ext_GUSM_KMC"]; // AA = Anti-Air, CfgPlaneLoadouts >> AA
private _vehiclesPlanesTransport = ["A3U_TKE_Ext_GUSM_KMC", "VVE_VTOL_03_unarmed_QAV"]; // Troop carriers for paradrop OR VTOL landing
private _vehiclesPlanesGunship = ["TKE_Ext_Destroyer_BLU"]; // Self explanatory
private _vehiclesPlanesLargeCAS = ["TKE_Ext_Destroyer_BLU"]; // Used for planes that need to spawn on the runway.
private _vehiclesPlanesLargeAA = ["TKE_Ext_Frigate_BLU"]; // Used for planes that need to spawn on the runway.

private _vehiclesHelisLight = ["A3U_TKE_Ext_Dragonfly_T_KMC"]; // A light transport helicopter.
private _vehiclesHelisTransport = ["A3U_TKE_Ext_Dragonfly_T_KMC", "VVE_VTOL_03_unarmed_QAV"]; // A transport helicopter.
private _vehiclesHelisLightAttack = ["A3U_TKE_Ext_Dragonfly_S_KMC"]; // A light attack helicopter.
private _vehiclesHelisAttack = ["A3U_TKE_Ext_Dragonfly_A_KMC"]; // An attack helicopter.
private _vehiclesAirPatrol = _vehiclesHelisLightAttack + _vehiclesHelisAttack; // A helicopter that is used to patrol areas.

/* Special Vehicles */
private _vehiclesArtillery = ["A3U_KMC_APC_Art"]; // If it has an artillery computer and moves, it's probably vehicular artillery.
["magazines", createHashMapFromArray [
    ["A3U_KMC_APC_Art", ["8Rnd_82mm_Mo_shells"]] // ["vehicle", ["magazine1", "magazine2"]]. You can add multiple vehicles.
]] call _fnc_saveToTemplate;

/* Militia Vehicles */
private _vehiclesMilitiaLightArmed = ["A3U_UCN_BL_Nomad_Rollcage_Armed"]; // Think: What would a hastily formed militia use?
private _vehiclesMilitiaTrucks = ["A3U_KMC_APC_U"];
private _vehiclesMilitiaCars = ["A3U_UCN_BL_Nomad_Rollcage"];
private _vehiclesMilitiaAPCs = ["A3U_KMC_APC_A"];

/* Police Vehicles */
private _vehiclesPolice = ["A3U_UCN_BL_Nomad_Rollcage"];

/* Radar and SAM */
private _vehiclesRadar = "B_Radar_System_01_F";
private _vehiclesSam = "PHEN_TurretPack_B_Turret_02";

/* Statics */
private _staticMG = ["TKE_Turret_M2A9"]; // Must fit in a standard Altis defensive tower.
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

#include "KMC_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

// These are the "Military" identities by default. 
// They also encompass any tier you *don't* define, so these are "fallback" entries too.
#include "identities.hpp"
private _faces = TKE_FACES;
private _voices = TKE_VOICES;
private _insignia = [];

["faces", _faces] call _fnc_saveToTemplate;
["voices", _voices] call _fnc_saveToTemplate;
["insignia", _insignia] call _fnc_saveToTemplate;

TKE_NAMES call _fnc_saveNames;

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

private _opticsShared = ["TKE_MRCOSight", 0.4, "TKE_4xSight", 0.4, "TKE_RedDotSight", 0.2];
private _opticsSharedSL = ["TKE_MRCOSight", 0.5, "TKE_4xSight", 0.5];
private _mountsShared = ["acc_flashlight", 0.2, "acc_pointer_IR", 0.2, "", 0.6];
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", [
    ["TKE_ARX12KMC", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTY"], [], ""], 1
]];
_loadoutData set ["riflesSL", [
    ["TKE_ARX12KMC", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTY"], [], ""], 3,
    ["WRS_Weapon_AR", "", _mountsShared, _opticsShared, ["WRS_Ar_Magazine"], [], ""], 1
]]; // Rifle given to Squad Leaders
_loadoutData set ["riflesAuto", [
    ["TKE_UCNLMG", "", _mountsShared, _opticsShared, ["TKE_150rnd_62x35_magUCN"], [], ""], 2,
    ["TKE_UCNMMG", "", _mountsShared, _opticsShared, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1
]]; // An LMG or machine gun
_loadoutData set ["riflesMarksman", [
    ["TKE_UCNDMR", "", _mountsShared, "TKE_10xSight", ["TKE_20rnd_969x51_magUCN"], [], "bipod_03_F_blk"], 1
]]; // Accurate long barrel rifle
_loadoutData set ["riflesSniper", [
    ["TKE_UCNSniper", "", "", ["TKE_10xSight", 0.7, "TKE_ThermScope", 0.3], ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], "bipod_01_F_blk"], 2,
    ["WRS_Weapon_Sniper_Bolt", "", "", ["optic_LRPS", 0.7, "TKE_ThermScope", 0.3], ["WRS_Boomslang_Magazine"], [], ""], 1
]]; // Designated sniper rifle
_loadoutData set ["riflesCarbine", [
    ["TKE_ARX12KMC", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTY"], [], ""], 3,
    ["TKE_KMCSMG", "", _mountsShared, "TKE_ReflexSight", ["TKE_45rnd_pdw_mag"], [], ""], 1 // It's an SMG. Do I care? No
]]; // A rifle with a shorter barrel length
_loadoutData set ["launchersGrenade", [
    ["TKE_ARX12GLKMC", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTY"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 1
]]; // A (usually) rifle mounted grenade launcher
_loadoutData set ["launchersGrenadeDesignated", [
    ["WRS_Weapon_ShockGun_Black", "", "", "", ["WRS_Shockgun_Magazine"], [], ""], 1
]]; // A standalone grenade launcher

_loadoutData set ["launchersLightAT", [
    ["TKE_ATRecoilless1KMC", "", "", "", ["MRAWS_HE_F"], [], ""], 1
]]; // Light launcher that fires a non-missile projectile
_loadoutData set ["launchersAT", [
    ["TKE_ATRecoilless1KMC", "", "", "", ["MRAWS_HEAT55_F"], [], ""], 1
]]; // Launcher that fires a non-missile projectile
_loadoutData set ["launchersMissileAT", [
    ["TKE_ATRecoilless1KMC", "", "", "", ["MRAWS_HEAT_F"], [], ""], 1
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
_loadoutData set ["NVG", ["TKE_IntegratedNVGs"]]; // NVG's given to all units PROVIDED they have no tier-specific overwrites
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["TKE_BinoUCN"]];

/* Traitor: A rebel traitor who has defected to *this* faction. */
_loadoutData set ["uniformsTraitor", ["TKE_CombatUniRolledV2KMC_U_B", 0.5, "TKE_CombatUniRolledV1KMC_U_B", 0.5]];
_loadoutData set ["vestsTraitor", ["TKE_TacCrewVest", 0.33, "TKE_GenVest1PV2", 0.33, "TKE_FlakJacket", 0.33]];
_loadoutData set ["helmetsTraitor", ["TKE_PatrolCapC_BASE", 1]];

/* Officer: An official who is present at places like Military Administration. */
_loadoutData set ["uniformsOfficer", ["TKE_CombatUniRolledV2KMC_U_B", 0.5, "TKE_CombatUniRolledV1KMC_U_B", 0.5]];
_loadoutData set ["vestsOfficer", ["TKE_TacCrewVest", 0.33, "TKE_GenVest1PV2", 0.33, "TKE_FlakJacket", 0.33]];
_loadoutData set ["helmetsOfficer", ["KMC_MilCap_y", 0.5, "KMC_beret", 0.5]];

/* Cloak: Basically a small patrol sniper team. */
_loadoutData set ["uniformsCloak", ["TKE_CombatUniRolledV2KMC_U_B", 0.5, "TKE_CombatUniRolledV1KMC_U_B", 0.5]];
_loadoutData set ["vestsCloak", ["TKE_KMCArmour1Light", 1]];
_loadoutData set ["helmetsCloak", ["TKE_MercHelmNVG2KMC", 0.5, "TKE_MercHelmNVG1KMC", 0.5]];

/* Core: Shared loadout data. If not overwritten by _tierLoadoutData, it uses these instead. */
#define KMC_UNIFORMS "TKE_CombatUniKMC_U_B", "TKE_CombatUniRolledV1KMC_U_B", "TKE_CombatUniRolledV2KMC_U_B"
_loadoutData set ["uniforms", [KMC_UNIFORMS]];
_loadoutData set ["uniformsSL", [KMC_UNIFORMS]];
_loadoutData set ["uniformsHeavy", [KMC_UNIFORMS]];
_loadoutData set ["uniformsSniper", [KMC_UNIFORMS]];
_loadoutData set ["uniformsMedic", [KMC_UNIFORMS]];
_loadoutData set ["uniformsGrenadier", [KMC_UNIFORMS]];
_loadoutData set ["uniformsMachineGunner", [KMC_UNIFORMS]];

#define KMC_VESTS_LIGHT "TKE_KMCArmour1Light", "TKE_KMCArmour1Medium", "TKE_R35VestP1KMC", "TKE_R35VestP1NNKMC"
_loadoutData set ["vests", [KMC_VESTS_LIGHT]];
_loadoutData set ["vestsSL", [KMC_VESTS_LIGHT]];
_loadoutData set ["vestsHeavy", ["TKE_KMCArmour1"]];
_loadoutData set ["vestsSniper", [KMC_VESTS_LIGHT]];
_loadoutData set ["vestsMedic", [KMC_VESTS_LIGHT]];
_loadoutData set ["vestsGrenadier", ["TKE_KMCArmour1"]];
_loadoutData set ["vestsMachineGunner", ["TKE_KMCArmour1"]];

_loadoutData set ["backpacks", ["TKE_AlicePackUCN", "TKE_BackPack1", "TKE_CamelBakV2UCN", "TKE_RuckSack"]];
_loadoutData set ["backpacksRadio", ["TKE_RadioPackUCN"]];
_loadoutData set ["backpacksAT", ["TKE_AlicePackUCN"]];

#define KMC_HELMETS "TKE_MercHelmClosedKMC"
#define KMC_HELMETS_SL "TKE_MercHelmNVG1_BASE"
_loadoutData set ["helmets", [KMC_HELMETS]];
_loadoutData set ["helmetsSL", [KMC_HELMETS_SL]];
_loadoutData set ["helmetsHeavy", ["TKE_KMCHelm"]];
_loadoutData set ["helmetsSniper", ["TKE_MercHelmNVG1KMC"]];
_loadoutData set ["helmetsMedic", [KMC_HELMETS]];
_loadoutData set ["helmetsGrenadier", ["TKE_KMCHelm"]];
_loadoutData set ["helmetsMachineGunner", ["TKE_KMCHelm"]];

_loadoutData set ["facewear", [
    "TKE_UCNFaceWear1", 0.3,
    "TKE_UCNFaceWear2", 0.3,
    "TKE_FaceCoverGrey", 0.4
]];

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
_crewLoadoutData set ["uniforms", ["TKE_CombatUniRolledV2KMC_U_B"]];
_crewLoadoutData set ["vests", ["TKE_GenVest1", "TKE_FlakJacket"]];
_crewLoadoutData set ["helmets", ["TKE_MercHelmClosedKMC"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["TKE_VoidSuitKMC_U_B"]];
_pilotLoadoutData set ["vests", ["KMC_PilotVest"]];
_pilotLoadoutData set ["helmets", ["TKE_MercHelmClosedKMC"]];

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["TKE_CombatUniRolledV1KMC_U_B", "TKE_CombatUniRolledV2KMC_U_B"]];
_policeLoadoutData set ["vests", ["TKE_R35VestNNKMC", "TKE_R35VestP1KMC", "TKE_R35VestP2KMC", "TKE_R35VestP1NNKMC"]];
_policeLoadoutData set ["helmets", ["TKE_PatrolCapC_BASE"]];
_policeLoadoutData set ["facewear", ["KMC_MPSleeve"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

/* Unit Gear */
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["vests", [
    "KMC_FCF_armor_2_w", 0.25,
    "KMC_FCF_armor_1_w", 0.25,
    "KMC_trooper_armor_3_w", 0.25,
    "KMC_trooper_armor_1_w", 0.25
]];
_militiaLoadoutData set ["vestsSL", ["KMC_FCF_armor_1_w", 1]];
_militiaLoadoutData set ["vestsHeavy", ["KMC_FCF_armor_3_w", 1]];
_militiaLoadoutData set ["vestsSniper", ["KMC_trooper_armor_1_w", 1]];
_militiaLoadoutData set ["vestsMedic", ["KMC_FCF_armor_1_w", 1]];
_militiaLoadoutData set ["vestsGrenadier", ["KMC_FCF_armor_3_w", 1]];
_militiaLoadoutData set ["vestsMachineGunner", ["KMC_FCF_armor_3_w", 1]];
_militiaLoadoutData set ["helmets", ["KMC_MilCap_y", 0.33, "KMC_MilCap", 0.33, "KMC_MilCap_sw", 0.33]];
_militiaLoadoutData set ["helmetsSL", ["KMC_FCF_helm_W2", 1]];
_militiaLoadoutData set ["helmetsHeavy", ["KMC_trooper_helmet_w", 1]];
_militiaLoadoutData set ["helmetsSniper", ["KMC_trooper_helmet_w", 1]];
_militiaLoadoutData set ["helmetsMedic", ["KMC_trooper_helmet_w", 1]];
_militiaLoadoutData set ["helmetsGrenadier", ["KMC_trooper_helmet_w", 1]];
_militiaLoadoutData set ["helmetsMachineGunner", ["KMC_trooper_helmet_w", 1]];

_militiaLoadoutData set ["facewear", [
    "TKE_UCNFaceWear1", 0.5,
    "TKE_UCNFaceWear2", 0.5
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

/* Unit Gear */
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["vests", [
    "KMC_FCF_armor_3_w", 0.25,
    "KMC_trooper_armor_4_W", 0.25,
    "KMC_trooper_armor_3_w", 0.25,
    "KMC_trooper_armor_1_w", 0.25
]];
_militaryLoadoutData set ["vestsSL", ["KMC_FCF_armor_3_w", 1]];
_militaryLoadoutData set ["vestsHeavy", ["KMC_trooper_armor_4_W", 1]];
_militaryLoadoutData set ["vestsSniper", ["KMC_trooper_armor_1_w", 1]];
_militaryLoadoutData set ["vestsMedic", ["KMC_FCF_armor_3_w", 1]];
_militaryLoadoutData set ["vestsGrenadier", ["KMC_trooper_armor_4_W", 1]];
_militaryLoadoutData set ["vestsMachineGunner", ["KMC_trooper_armor_4_W", 1]];
_militaryLoadoutData set ["helmets", ["KMC_trooper_helmet_w", 0.33, "KMC_MercHelmV2_white", 0.33, "KMC_MercHelmV2Visor_white", 0.33]];
_militaryLoadoutData set ["helmetsSL", ["KMC_FCF_helm_W2", 1]];
_militaryLoadoutData set ["helmetsHeavy", ["KMC_trooper_helmet_closed_w", 1]];
_militaryLoadoutData set ["helmetsSniper", ["KMC_mask_helmet_clear_w2", 1]];
_militaryLoadoutData set ["helmetsMedic", ["KMC_trooper_helmet_closed_w", 1]];
_militaryLoadoutData set ["helmetsGrenadier", ["KMC_trooper_helmet_w", 0.5, "KMC_trooper_helmet_closed_w", 0.5]];
_militaryLoadoutData set ["helmetsMachineGunner", ["KMC_trooper_helmet_w", 0.5, "KMC_trooper_helmet_closed_w", 0.5]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

/* Unit Gear */
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;

////////////////////////////////////////
//    Special Forces Loadout Data    //
//////////////////////////////////////

#define GEAR_SF_VEST "TKE_KMCArmour1", "TKE_KMCArmour1Medium"
#define GEAR_SF_HELM "TKE_KMCHelm"

/* Unit Gear */
private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["uniformsSL", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["uniformsSniper", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["uniformsMedic", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["uniformsGrenadier", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["uniformsMachineGunner", ["TKE_VoidSuitKMC_U_B"]];
_sfLoadoutData set ["vests", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsSL", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsHeavy", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsSniper", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsMedic", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsGrenadier", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsMachineGunner", [GEAR_SF_VEST]];
_sfLoadoutData set ["backpacks", ["TKE_EVAPackKMC", "TKE_AlicePackUCN"]];
_sfLoadoutData set ["helmets", [GEAR_SF_HELM]];
_sfLoadoutData set ["helmetsSL", ["TKE_KMCHelmTeeth"]];
_sfLoadoutData set ["helmetsHeavy", [GEAR_SF_HELM]];
_sfLoadoutData set ["helmetsSniper", [GEAR_SF_HELM]];
_sfLoadoutData set ["helmetsMedic", [GEAR_SF_HELM]];
_sfLoadoutData set ["helmetsGrenadier", [GEAR_SF_HELM]];
_sfLoadoutData set ["helmetsMachineGunner", [GEAR_SF_HELM]];

_sfLoadoutData set ["NVG", ["TKE_KMCESA"]];

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
    [["backpacksAT", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["backpacksAT", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [["backpacksAT", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    ["facewear"] call _fnc_setFacewear;
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