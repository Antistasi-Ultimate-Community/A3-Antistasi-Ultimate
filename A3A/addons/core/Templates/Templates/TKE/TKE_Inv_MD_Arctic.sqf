/////////////////////////////////
//   Side Information - Occ   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

["name", "MD"] call _fnc_saveToTemplate; // Name of our faction, in game. NOT for the selection screen.
["spawnMarkerName", "MD Carrier"] call _fnc_saveToTemplate; // Name of the spawn corridor.

["flag", DEFAULT_FLAG] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\TKE\images\flag_md_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", "a3u_flag_tke_md"] call _fnc_saveToTemplate; // Marker from CfgMarkers.

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
private _vehiclesLightUnarmed = ["MDTF_S_APC_U", "A3U_UCN_BL_Nomad_Light"]; // Fundamental vehicle. Think an unarmoured humvee.
private _vehiclesLightArmed = ["MDTF_S_APC_IFV"]; // Fundamental vehicle. Think a lightly armoured humvee with an M240.

private _vehiclesTrucks = ["MDTF_S_APC_U", "TKE_Ext_Bearcat_Unarmed_MDTF_S"]; // Used for troop carrying.
private _vehiclesCargoTrucks = _vehiclesTrucks; // Used for cargo carrying. Must have logistics nodes.
private _vehiclesAmmoTrucks = ["A3U_MDMC_APC_U_Ammo"];
private _vehiclesRepairTrucks = ["A3U_MDMC_APC_U_Repair"];
private _vehiclesFuelTrucks = ["A3U_MDMC_APC_U_Fuel"];
private _vehiclesMedicalTrucks = ["MDTF_S_APC_U"];

private _vehiclesLightAPCs = ["MDTF_S_APC_U", "TKE_Ext_Bearcat_Autocannon_MDTF_S"]; // A light APC is an Armoured Personnel Carrier. Generally, light armoured vehicle + light gun.
private _vehiclesAPCs = ["MDTF_S_APC_IFV", "TKE_Ext_Bearcat_Autocannon_MDTF_S"]; // An APC is a light APC but bigger. Generally, armoured vehicle + medium gun.
private _vehiclesIFVs = ["MDTF_S_APC_IFV", "TKE_Ext_Bearcat_Autocannon_MDTF_S"]; // An IFV is an Infantry Fighting Vehicle. Generally, armoured vehicle + big gun.
private _vehiclesAirborne = ["MDTF_S_APC_IFV", "TKE_Ext_Bearcat_Cannon_MDTF_S"]; // Vehicles that can be "paradropped". Not *too* strict, but use common sense.
private _vehiclesAA = ["MDTF_S_APC_AA", "TKE_Ext_Bearcat_AA_MDTF_S"]; // Vehicles that AI crew can use to shoot down aircraft. If they can, it's an AA vehicle!

private _vehiclesLightTanks = ["MDTF_S_APC_IFV", "MDTF_S_APC_MGS", "TKE_Ext_Bearcat_Cannon_MDTF_S"]; // A light tank is a tank that is light... Think an american M60 (the tank).
private _vehiclesTanks = ["MDTF_S_APC_MGS"]; // A tank is a tank. Shocker. Think an M1 Abrams.

/* Sea Vehicles */
private _vehiclesTransportBoats = ["I_C_Boat_Transport_02_F"];
private _vehiclesGunBoats = ["B_T_Boat_Armed_01_minigun_F"];

/* Air Vehicles */
private _vehiclesPlanesCAS = ["TKE_Ext_GUSA_MDTF_S"]; // CAS = Close Air Support, CfgPlaneLoadouts >> CAS and CASDIVE
private _vehiclesPlanesAA = ["TKE_Ext_GUSM_MDTF_S"]; // AA = Anti-Air, CfgPlaneLoadouts >> AA
private _vehiclesPlanesTransport = ["TKE_Ext_GUSM_MDTF_S"]; // Troop carriers for paradrop OR VTOL landing
private _vehiclesPlanesGunship = ["TKE_Ext_Gunship_OPF"]; // Self explanatory
private _vehiclesPlanesLargeCAS = ["TKE_Ext_Gunship_OPF"]; // Used for planes that need to spawn on the runway.
private _vehiclesPlanesLargeAA = ["TKE_Ext_Corvette_OPF"]; // Used for planes that need to spawn on the runway.

private _vehiclesHelisLight = ["TKE_Ext_Dragonfly_T_MDTF_S"]; // A light transport helicopter.
private _vehiclesHelisTransport = ["TKE_Ext_Dragonfly_T_MDTF_S"]; // A transport helicopter.
private _vehiclesHelisLightAttack = ["TKE_Ext_Dragonfly_S_MDTF_S"]; // A light attack helicopter.
private _vehiclesHelisAttack = ["TKE_Ext_Dragonfly_A_MDTF_S"]; // An attack helicopter.
private _vehiclesAirPatrol = _vehiclesHelisLightAttack + _vehiclesHelisAttack; // A helicopter that is used to patrol areas.

/* Special Vehicles */
private _vehiclesArtillery = ["MDTF_S_APC_MGS"]; // If it has an artillery computer and moves, it's probably vehicular artillery.
["magazines", createHashMapFromArray [
    ["MDTF_S_APC_MGS", ["TKE_105mm_16Rnd_HE"]] // ["vehicle", ["magazine1", "magazine2"]]. You can add multiple vehicles.
]] call _fnc_saveToTemplate;

/* Militia Vehicles */
private _vehiclesMilitiaLightArmed = ["TKE_Ext_Bearcat_Autocannon_MDTF_S"]; // Think: What would a hastily formed militia use?
private _vehiclesMilitiaTrucks = ["MDTF_S_APC_U"];
private _vehiclesMilitiaCars = ["A3U_UCN_BL_Nomad"];
private _vehiclesMilitiaAPCs = ["MDTF_S_APC_IFV"];

/* Police Vehicles */
private _vehiclesPolice = ["A3U_UCN_BL_Nomad_Rollcage"];

/* Radar and SAM */
private _vehiclesRadar = "B_Radar_System_01_F";
private _vehiclesSam = "PHEN_TurretPack_B_Turret_02_Black_OPFOR";

/* Statics */
private _staticMG = ["TKE_Turret_M2A9"]; // Must fit in a standard Altis defensive tower.
private _staticAT = ["PHEN_TurretPack_B_Turret_06_cannon_Black_OPFOR", "PHEN_TurretPack_B_Turret_05_AT_Black_OPFOR"]; // Must fit in a standard Altis defensive tower.
private _staticAA = ["PHEN_TurretPack_B_Turret_03_Black_OPFOR", "PHEN_TurretPack_B_Turret_05_Black_OPFOR"]; // Must fit on a standard Altis HQ military building.

private _staticMortars = ["UCNFA_TRT_82"]; // Must fit in a ~2x2 sandbag emplacement.
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your mortar.
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

private _staticHowitzers = ["PHEN_TurretPack_B_Turret_06_Black_OPFOR"];
["howitzerMagazineHE", "magazine_ShipCannon_120mm_HE_shells_x32"] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your howitzer.

/* UAV's */
private _uavsPortable = []; // A UAV that is packable into a backpack.
private _uavsAttack = []; // A UAV that is capable of attacking. Think a reaper drone.

/* Mines */
private _minefieldAT = ["ATMine"]; // Mine used for Anti Tank fields.
private _minefieldAPERS = ["APERSMine"]; // Mine used for Anti Personnel fields.

#include "MD_Vehicle_Attributes.sqf"

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

private _opticsShared = ["TKE_MRCOSight", 0.2, "TKE_4xSight", 0.2, "TKE_RedDotSight", 0.4, "", 0.2];
private _opticsSharedSL = ["TKE_MRCOSight", 0.4, "TKE_4xSight", 0.4, "TKE_RedDotSight", 0.2];
private _mountsShared = ["acc_flashlight", 0.2, "acc_pointer_IR", 0.2, "", 0.6];
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", [
    ["TKE_MDRifle", "", _mountsShared, _opticsShared, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 1
]];
_loadoutData set ["riflesSL", [
    ["TKE_MDRifle", "", _mountsShared, _opticsSharedSL, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 5,
    ["TKE_ARX12", "", _mountsShared, _opticsSharedSL, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 3
]]; // Rifle given to Squad Leaders
_loadoutData set ["riflesAuto", [
    ["TKE_MDLMG", "", _mountsShared, _opticsShared, ["TKE_150rnd_62x35_magMD"], [], ""], 3,
    ["TKE_UCNMMGMD", "", _mountsShared, _opticsShared, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1.5
]]; // An LMG or machine gun
_loadoutData set ["riflesAutoWarbot", [
    ["WRS_Weapon_LMG", "", "", "", ["200Rnd_556x45_Box_Tracer_F"], [], ""], 1
]];
_loadoutData set ["riflesMarksman", [
    ["TKE_MDDMR", "", _mountsShared, "TKE_10xSight", ["TKE_20rnd_969x51_magMD"], [], "bipod_03_F_blk"], 1
]]; // Accurate long barrel rifle
_loadoutData set ["riflesSniper", [
    ["TKE_MDSniperGrey", "", "", ["TKE_10xSight", 0.7, "TKE_ThermScope", 0.3], ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], "bipod_01_F_blk"], 2,
    ["WRS_Weapon_Sniper_Bolt", "", "", ["optic_LRPS", 0.7, "TKE_ThermScope", 0.3], ["WRS_Boomslang_Magazine"], [], ""], 0.5
]]; // Designated sniper rifle
_loadoutData set ["riflesCarbine", [
    ["TKE_MDStdRifleGrey", "", _mountsShared, _opticsShared, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTG"], [], ""], 1
]]; // A rifle with a shorter barrel length
_loadoutData set ["launchersGrenade", [
    ["TKE_MDRifleV2", "", _mountsShared, _opticsSharedSL, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 1
]]; // A (usually) rifle mounted grenade launcher
_loadoutData set ["launchersGrenadeDesignated", []]; // A standalone grenade launcher

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
    ["TKE_MDPistolBlack", "", "", "", ["TKE_MDPistol_mag"], [], ""], 1
]];

_loadoutData set ["minesAT", ["ATMine_Range_Mag"]]; // Anti-tank
_loadoutData set ["minesAP", ["APERSMine_Range_Mag"]]; // Anti-personnel
_loadoutData set ["explosivesLight", ["DemoCharge_Remote_Mag"]]; // Found on explosive expert units
_loadoutData set ["explosivesHeavy", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["TKE_FRAG_mag", "TKE_IMPACT_mag"]];
_loadoutData set ["smokeGrenades", ["TKE_SMOKE_mag"]];
_loadoutData set ["signalSmokeGrenades", ["SmokeShellRed"]]; // (Flare)

/* Basic equipment. Shouldn't need touching most of the time. */
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["GPS", ["ItemGPS"]];
_loadoutData set ["NVG", ["TKE_IntegratedNVGs"]]; // NVG's given to all units PROVIDED they have no tier-specific overwrites
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["TKE_BinoMDTF"]];

/* Traitor: A rebel traitor who has defected to *this* faction. */
_loadoutData set ["uniformsTraitor", ["TKEJAM_U_B_IHWCU_combat_MDTFSnow_F"]];
_loadoutData set ["vestsTraitor", ["TKE_MDTFArmour1Snow"]];
_loadoutData set ["helmetsTraitor", ["H_Watchcap_blk"]];
_loadoutData set ["facewearTraitor", ["TKE_CombatGlasses"]];

/* Officer: An official who is present at places like Military Administration. */
_loadoutData set ["uniformsOfficer", ["TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F"]];
_loadoutData set ["vestsOfficer", ["TKE_MDTFArmour1Snow"]];
_loadoutData set ["helmetsOfficer", ["H_Watchcap_blk"]];
_loadoutData set ["facewearOfficer", ["G_Bandanna_blk"]];

/* Cloak: Basically a small patrol sniper team. */
_loadoutData set ["uniformsCloak", ["TKE_U_B_ECWCS_MDTFSnow_F"]];
_loadoutData set ["vestsCloak", ["TKE_MDTFArmour4_1Snow"]];
_loadoutData set ["helmetsCloak", ["TKE_MDTFHeavyHelmSnow"]];
_loadoutData set ["facewearCloak", ["TKE_MDWebbingNettingSnow"]];

/* Core: Shared loadout data. If not overwritten by _tierLoadoutData, it uses these instead. */
_loadoutData set ["uniforms", []];
_loadoutData set ["uniformsSL", []];
_loadoutData set ["uniformsHeavy", []];
_loadoutData set ["uniformsSniper", []];
_loadoutData set ["uniformsMedic", []];
_loadoutData set ["uniformsGrenadier", []];
_loadoutData set ["uniformsMachineGunner", []];
_loadoutData set ["uniformsWarbot", []];

_loadoutData set ["vests", []];
_loadoutData set ["vestsSL", []];
_loadoutData set ["vestsHeavy", []];
_loadoutData set ["vestsSniper", []];
_loadoutData set ["vestsMedic", []];
_loadoutData set ["vestsGrenadier", []];
_loadoutData set ["vestsMachineGunner", []];
_loadoutData set ["vestsWarbot", []];

_loadoutData set ["backpacks", ["TKE_CamelBakV2MDSnow", "TKE_BackPack1MDSnow", "TKE_BackPack2MDSnow", "TKE_AlicePackMTDFSnow"]];
_loadoutData set ["backpacksRadio", ["TKE_RadioPackUCN"]];
_loadoutData set ["backpacksAT", ["TKE_AlicePackMTDFSnow"]];

_loadoutData set ["helmets", []];
_loadoutData set ["helmetsSL", []];
_loadoutData set ["helmetsHeavy", []];
_loadoutData set ["helmetsSniper", []];
_loadoutData set ["helmetsMedic", []];
_loadoutData set ["helmetsGrenadier", []];
_loadoutData set ["helmetsMachineGunner", []];
_loadoutData set ["helmetsWarbot", []];

_loadoutData set ["facewear", []];
_loadoutData set ["facewearWarbot", []];

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
_crewLoadoutData set ["uniforms", ["TKE_U_B_ECWCS_MDTFSnow_F"]];
_crewLoadoutData set ["vests", ["TKE_MDTFArmour1Snow"]];
_crewLoadoutData set ["helmets", ["TKE_FCrewHelmMDWhite"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F"]];
_pilotLoadoutData set ["vests", ["TKE_PilotVestMerc"]];
_pilotLoadoutData set ["helmets", ["TKE_MercHelmClosed_BASE"]];

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", "TKEJAM_U_B_ECWCS_MDTFSnow_F"]];
_policeLoadoutData set ["vests", ["TKE_FlakJacketMPDFCG"]];
_policeLoadoutData set ["helmets", ["TKE_MDTFMilitiaHelmCG"]];
_policeLoadoutData set ["facewear", ["TKE_MPSleeve"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

/* Unit Gear */
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", [
    "TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.3, 
    "TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.3, 
    "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.4
]];
_militiaLoadoutData set ["uniformsSL", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 1]];
_militiaLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitMerc_U_B", 1]];
_militiaLoadoutData set ["uniformsSniper", ["TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 1]];
_militiaLoadoutData set ["uniformsMedic", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.5]];
_militiaLoadoutData set ["uniformsGrenadier", ["TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.5]];
_militiaLoadoutData set ["uniformsMachineGunner", ["TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.5]];
_militiaLoadoutData set ["vests", [
    "TKE_MDTFArmour1Snow", 0.5,
    "TKE_MDTFArmour3Snow", 0.5
]];
_militiaLoadoutData set ["vestsSL", ["TKE_MDTFArmour3_1Snow", 1]];
_militiaLoadoutData set ["vestsHeavy", ["TKE_MDTFArmour3_1Snow", 0.5, "TKE_MDTFArmour3_1Snow", 0.5]];
_militiaLoadoutData set ["vestsSniper", ["TKE_MDTFArmour3_1Snow", 1]];
_militiaLoadoutData set ["vestsMedic", ["TKE_MDTFArmour3_1Snow", 1]];
_militiaLoadoutData set ["vestsGrenadier", ["TKE_MDTFArmour3_1Snow", 1]];
_militiaLoadoutData set ["vestsMachineGunner", ["TKE_MDTFArmour3_1Snow", 1]];
// _militiaLoadoutData set ["backpacks", []];
_militiaLoadoutData set ["helmets", ["H_Watchcap_blk", 1]];
_militiaLoadoutData set ["helmetsSL", ["TKE_MDTFHelmClearSnow", 1]];
_militiaLoadoutData set ["helmetsHeavy", ["TKE_MDTFHelmSnow", 1]];
_militiaLoadoutData set ["helmetsSniper", ["TKE_MDTFHelmSnow", 0.5, "H_Watchcap_blk", 0.5]];
_militiaLoadoutData set ["helmetsMedic", ["TKE_MDTFHelmClearSnow", 1]];
_militiaLoadoutData set ["helmetsGrenadier", ["TKE_MDTFHelmClearSnow", 0.5, "H_Watchcap_blk", 0.5]];
_militiaLoadoutData set ["helmetsMachineGunner", ["TKE_MDTFHelmClearSnow", 0.5, "H_Watchcap_blk", 0.5]];

/* Unit Misc Gear */
_militiaLoadoutData set ["facewear", [
    "TKE_MDChestPouches1Snow", 0.2,
    "TKE_MDLegPouchSnow", 0.2,
    "TKE_UCMCGogglesDown", 0.2,
    "TKE_FaceCoverGrey", 0.4
]];

/* Unit Weapons */

// We're going to let the default _loadoutData handle weapons from here

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

/* Unit Gear */
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", [
    "TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.3, 
    "TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.3, 
    "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.4
]];
_militaryLoadoutData set ["uniformsSL", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 1]];
_militaryLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitMerc_U_B", 1]];
_militaryLoadoutData set ["uniformsSniper", ["TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 1]];
_militaryLoadoutData set ["uniformsMedic", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.5]];
_militaryLoadoutData set ["uniformsGrenadier", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.5]];
_militaryLoadoutData set ["uniformsMachineGunner", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.5]];
_militaryLoadoutData set ["vests", [
    "TKE_MDTFArmour3Snow", 0.5,
    "TKE_MDTFArmour4Snow", 0.5
]];
_militaryLoadoutData set ["vestsSL", ["TKE_MDTFArmour4_1Snow", 1]];
_militaryLoadoutData set ["vestsHeavy", ["TKE_MDTFArmour4_1Snow", 0.5, "TKE_MDTFArmour4_2Snow", 0.5]];
_militaryLoadoutData set ["vestsSniper", ["TKE_MDTFArmour4_1Snow", 1]];
_militaryLoadoutData set ["vestsMedic", ["TKE_MDTFArmour4_1Snow", 1]];
_militaryLoadoutData set ["vestsGrenadier", ["TKE_MDTFArmour4_2Snow", 1]];
_militaryLoadoutData set ["vestsMachineGunner", ["TKE_MDTFArmour4_2Snow", 1]];
// _militaryLoadoutData set ["backpacks", []];
_militaryLoadoutData set ["helmets", ["TKE_MDTFHelmClearSnow", 1]];
_militaryLoadoutData set ["helmetsSL", ["TKE_MDTFHelmClearSnow", 1]];
_militaryLoadoutData set ["helmetsHeavy", ["TKE_MDTFHeavyHelmSnow", 1]];
_militaryLoadoutData set ["helmetsSniper", ["TKE_MDTFHelmSnow", 0.5, "TKE_MDTFHelmClearSnow", 0.5]];
_militaryLoadoutData set ["helmetsMedic", ["TKE_MDTFHelmClearSnow", 1]];
_militaryLoadoutData set ["helmetsGrenadier", ["TKE_MDTFHeavyHelmSnow", 0.5, "TKE_MDTFHelmClearSnow", 0.5]];
_militaryLoadoutData set ["helmetsMachineGunner", ["TKE_MDTFHeavyHelmSnow", 0.5, "TKE_MDTFHelmClearSnow", 0.5]];

_militaryLoadoutData set ["uniformsWarbot", ["TKE_WarbotUniMDTFSnow_U_B"]];
_militaryLoadoutData set ["vestsWarbot", ["TKE_WarBotArmourMDTFSnow"]];
_militaryLoadoutData set ["helmetsWarbot", ["TKE_WarBotHeadMDTFSnow"]];

/* Unit Misc Gear */
_militaryLoadoutData set ["facewear", [
    "TKE_MDWebbingV1Snow", 0.2,
    "TKE_MDTFNvg2FCGrey", 0.2,
    "TKE_UCMCGogglesDown", 0.2,
    "TKE_FaceCoverGrey", 0.4
]];

/* Unit Weapons */

// We're going to let the default _loadoutData handle weapons from here

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

/* Unit Gear */
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", [
    "TKEJAM_U_B_IHWCU_combat_MDTFSnow_F", 0.3, 
    "TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.3, 
    "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.4
]];
_eliteLoadoutData set ["uniformsSL", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 1]];
_eliteLoadoutData set ["uniformsHeavy", ["TKE_VoidSuitMerc_U_B", 1]];
_eliteLoadoutData set ["uniformsSniper", ["TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 1]];
_eliteLoadoutData set ["uniformsMedic", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.5]];
_eliteLoadoutData set ["uniformsGrenadier", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.5]];
_eliteLoadoutData set ["uniformsMachineGunner", ["TKEJAM_U_B_ECWCS_MDTFSnow_F", 0.5, "TKEJAM_U_B_IHWCU_combat_shortsleeve_MDTFSnow_F", 0.5]];
_eliteLoadoutData set ["vests", [
    "TKE_MDTFArmour4Snow", 0.5,
    "TKE_MDTFArmour2Snow", 0.5
]];
_eliteLoadoutData set ["vestsSL", ["TKE_MDTFArmour2_1Snow", 1]];
_eliteLoadoutData set ["vestsHeavy", ["TKE_MDTFArmour2_1Snow", 0.5, "TKE_MDTFArmour2_2Snow", 0.5]];
_eliteLoadoutData set ["vestsSniper", ["TKE_MDTFArmour2_1Snow", 1]];
_eliteLoadoutData set ["vestsMedic", ["TKE_MDTFArmour2_1Snow", 1]];
_eliteLoadoutData set ["vestsGrenadier", ["TKE_MDTFArmour2_2Snow", 1]];
_eliteLoadoutData set ["vestsMachineGunner", ["TKE_MDTFArmour2_2Snow", 1]];
// _eliteLoadoutData set ["backpacks", []];
_eliteLoadoutData set ["helmets", ["TKE_MDTFHelmSnow", 1]];
_eliteLoadoutData set ["helmetsSL", ["TKE_MDTFHeavyHelmSnow", 1]];
_eliteLoadoutData set ["helmetsHeavy", ["TKE_MDTFHeavyHelmSnow", 1]];
_eliteLoadoutData set ["helmetsSniper", ["TKE_MDTFHelmSnow", 0.5, "TKE_MDTFHeavyHelmSnow", 0.5]];
_eliteLoadoutData set ["helmetsMedic", ["TKE_MDTFHelmSnow", 1]];
_eliteLoadoutData set ["helmetsGrenadier", ["TKE_MDTFHelmSnow", 0.5, "TKE_MDTFHeavyHelmSnow", 0.5]];
_eliteLoadoutData set ["helmetsMachineGunner", ["TKE_MDTFHelmSnow", 0.5, "TKE_MDTFHeavyHelmSnow", 0.5]];

_eliteLoadoutData set ["uniformsWarbot", ["TKE_WarbotUniMDTFSnow_U_B"]];
_eliteLoadoutData set ["vestsWarbot", ["TKE_WarBotArmourMDTFSnow"]];
_eliteLoadoutData set ["helmetsWarbot", ["TKE_WarBotHeadMDTFSnow"]];

/* Unit Misc Gear */
_eliteLoadoutData set ["facewear", [
    "TKE_MDWebbingV1Snow", 0.2,
    "TKE_MDTFNvg2FCGrey", 0.2,
    "TKE_UCMCGogglesDown", 0.2,
    "TKE_FaceCoverGrey", 0.4
]];

/* Unit Weapons */

// We're going to let the default _loadoutData handle weapons from here

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

#define GEAR_SF_VEST "TKE_MDTFArmour2Red", "TKE_MDTFArmour2_1Red", "TKE_MDTFArmour4Red", "TKE_MDTFArmour4_1Red"

/* Unit Gear */
private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["uniformsSL", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["uniformsHeavy", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["uniformsSniper", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["uniformsMedic", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["uniformsGrenadier", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["uniformsMachineGunner", ["TKE_CombatUniMDMarine1_U_B"]];
_sfLoadoutData set ["vests", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsSL", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsHeavy", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsSniper", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsMedic", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsGrenadier", [GEAR_SF_VEST]];
_sfLoadoutData set ["vestsMachineGunner", [GEAR_SF_VEST]];
_sfLoadoutData set ["backpacks", ["TKE_EVAPackMDMC", "TKE_CamelBakV2MDBlack"]];
_sfLoadoutData set ["helmets", ["TKE_MDTFHelmRed"]];
_sfLoadoutData set ["helmetsSL", ["TKE_MDTFHelmRed"]];
_sfLoadoutData set ["helmetsHeavy", ["TKE_MDTFHeavyHelmSnowRed"]];
_sfLoadoutData set ["helmetsSniper", ["TKE_MDTFHelmRed"]];
_sfLoadoutData set ["helmetsMedic", ["TKE_MDPilotHelmRVMarineNoPipes"]];
_sfLoadoutData set ["helmetsGrenadier", ["TKE_MDTFHeavyHelmSnowRed"]];
_sfLoadoutData set ["helmetsMachineGunner", ["TKE_MDTFHeavyHelmSnowRed"]];

/* Unit Misc Gear */
_sfLoadoutData set ["facewear", ["TKE_MDWebbingGrey", "TKE_MDWebbingV1CamoGrey", "TKE_MDWebbingNettingGrey", "TKE_MDWebbingV4Grey"]];
_sfLoadoutData set ["NVG", ["TKE_MDTFNvg2Red"]];

/* Unit Weapons */
private _opticsSharedSF = ["TKE_MRCOSight", 0.5, "TKE_4xSight", 0.5];
private _mountsSharedSF = ["acc_flashlight", 0.4, "acc_pointer_IR", 0.4, "", 0.2];
_sfLoadoutData set ["rifles", [
    ["TKE_MDRifle", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 1
]];
_sfLoadoutData set ["riflesSL", [
    ["TKE_MDRifle", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 5,
    ["TKE_ARX12", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_ARX12_62x35_mag", "TKE_ARX12_62x35_magTR"], [], ""], 3
]]; // Rifle given to Squad Leaders
_sfLoadoutData set ["riflesAuto", [
    ["TKE_MDLMG", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_150rnd_62x35_magMD"], [], ""], 3,
    ["TKE_UCNMMGMD", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_100rnd_ucnmmg_mag"], [], ""], 1.5
]]; // An LMG or machine gun
_sfLoadoutData set ["riflesMarksman", [
    ["TKE_MDDMR", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, "TKE_10xSight", ["TKE_20rnd_969x51_magMD"], [], "bipod_03_F_blk"], 1
]]; // Accurate long barrel rifle
_sfLoadoutData set ["riflesSniper", [
    ["TKE_MDSniperGrey", "", "", ["TKE_10xSight", 0.7, "TKE_ThermScope", 0.3], ["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"], [], "bipod_01_F_blk"], 2,
    ["WRS_Weapon_Sniper_Bolt", "", "", ["optic_LRPS", 0.7, "TKE_ThermScope", 0.3], ["WRS_Boomslang_Magazine"], [], ""], 0.5
]]; // Designated sniper rifle
_sfLoadoutData set ["riflesCarbine", [
    ["TKE_MDRifle", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], [], ""], 1
]]; // A rifle with a shorter barrel length
_sfLoadoutData set ["launchersGrenade", [
    ["TKE_MDRifleV2", "muzzle_snds_65_TI_blk_F", _mountsSharedSF, _opticsSharedSF, ["TKE_35rnd_62x35_magMD", "TKE_35rnd_62x35_magTRMD"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], ""], 1
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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
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
    [["helmetsWarbot", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["vestsWarbot", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniformsWarbot", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["riflesAutoWarbot"] call _fnc_setPrimary;
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
    ["facewearTraitor"] call _fnc_setFacewear;
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
    ["facewearOfficer"] call _fnc_setFacewear;
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
    ["facewearCloak"] call _fnc_setFacewear;
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
    ["facewearCloak"] call _fnc_setFacewear;
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