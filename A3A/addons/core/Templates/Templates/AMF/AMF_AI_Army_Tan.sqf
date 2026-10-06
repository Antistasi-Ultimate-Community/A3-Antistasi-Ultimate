/////////////////////////////////
//   Side Information - Occ   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

["name", "French Army"] call _fnc_saveToTemplate; // Name of our faction, in game. NOT for the selection screen.
["spawnMarkerName", "French Support Corridor"] call _fnc_saveToTemplate; // Name of the spawn corridor.

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", "flag_France"] call _fnc_saveToTemplate; // Marker from CfgMarkers.

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
private _vehiclesBasic = ["B_Quadbike_01_F"]; // Absolute basic vehicle. Quadbike, LSV, etc.
private _vehiclesLightUnarmed = ["amf_pvp_01_mag_TDF_f", "amf_pvp_01_top_TDF_f", "B_AMF_VAB_ULTIMA_X8_TDF_F", "AMF_VBL_TDF_762_01_F"]; // Fundamental vehicle. Think an unarmoured humvee.
private _vehiclesLightArmed = ["AMF_VB2L_TDF_762_01_F", "amf_VBAE_02_TDF_f", "amf_VBAE_03_TDF_f", "amf_VBAE_01_TDF_f", "AMF_VB2L_TDF", "AMF_VBL_TDF_127_01_F", "AMF_VBL_127_TDF", "AMF_VBL_762_TDF"]; // Fundamental vehicle. Think a lightly armoured humvee with an M240.

private _vehiclesTrucks = ["AMF_GBC180_PERS_02"]; // Used for troop carrying.
private _vehiclesCargoTrucks = ["AMF_GBC180_PLATEAU_02", "AMF_GBC180_PERS_02"]; // Used for cargo carrying. Must have logistics nodes.
private _vehiclesAmmoTrucks = ["AMF_GBC180_AmmoTruck_02"];
private _vehiclesRepairTrucks = ["AMF_GBC180_MECA_02"];
private _vehiclesFuelTrucks = ["B_Truck_01_fuel_F"];
private _vehiclesMedicalTrucks = ["AMF_VBMR_SAN_TDF"];

private _vehiclesLightAPCs = ["AMF_VBMR_HMG_TDF", "AMF_VBMR_L_TDF_02", "AMF_VBMR_GENIE_TDF", "AMF_VBMR_L_TDF_01", "AMF_VBMRL_762_Tundra", "AMF_VBMRL_127_DA", "AMF_VBMR_L_TDF_01"]; // A light APC is an Armoured Personnel Carrier. Generally, light armoured vehicle + light gun.
private _vehiclesAPCs = ["B_AMF_AMX10_RCR_02_F", "B_AMF_VAB_ULTIMA_TOP_X8_TDF_F", "AMF_VBMR_COMMANDEMENT_TDF", "AMF_VBMR_GMG_TDF", "AMF_VBMR_TDF", "AMF_VBMR_VOA_TDF", "AMF_VBMR_ARX30_TDF", "AMF_VBMR_DEF_TDF", "AMF_VBMR_HMG_TDF", "AMF_VBMR_MMP_TDF"]; // An APC is a light APC but bigger. Generally, armoured vehicle + medium gun.
private _vehiclesIFVs = ["AMF_VBCI_TDF_01_F", "AMF_VBCI_TDF", "AMF_EBRC_TDF_01"]; // An IFV is an Infantry Fighting Vehicle. Generally, armoured vehicle + big gun.
private _vehiclesAirborne = ["B_AMF_VAB_ULTIMA_X8_TDF_F", "AMF_VBMR_HMG_TDF", "AMF_VBCI_TDF_01_F", "AMF_EBRC_TDF_01", "B_AMF_AMX10_RCR_02_F"]; // Vehicles that can be "paradropped". Not *too* strict, but use common sense.
private _vehiclesAA = ["AMF_VBMR_MISTRAL_TDF"]; // Vehicles that AI crew can use to shoot down aircraft. If they can, it's an AA vehicle!

private _vehiclesLightTanks = ["B_AMF_AMX10_RCR_SEPAR_02_F", "AMF_AMX10RCR_SEPAR_TDF", "B_AMF_AMX10_RCR_02_F"]; // A light tank is a tank that is light... Think an american M60 (the tank).
private _vehiclesTanks = ["AMF_Leclerc_S2_TDF", "AMF_Leclerc_XLR_TDF", "B_AMF_TANK_TDF_01_F", "B_AMF_TANK_TDF_02_F"]; // A tank is a tank. Shocker. Think an M1 Abrams.

/* Sea Vehicles */
private _vehiclesTransportBoats = ["B_Boat_Transport_01_F"];
private _vehiclesGunBoats = ["B_Boat_Armed_01_minigun_F"];

/* Air Vehicles */
private _vehiclesPlanesCAS = ["AMF_RAFALE_B_01_F"]; // CAS = Close Air Support, CfgPlaneLoadouts >> CAS and CASDIVE
private _vehiclesPlanesAA = ["AMF_RAFALE_B_01_F", "B_AMF_PLANE_FIGHTER_02_F"]; // AA = Anti-Air, CfgPlaneLoadouts >> AA
private _vehiclesPlanesTransport = ["B_AMF_PLANE_TRANSPORT_01_F"]; // Troop carriers for paradrop OR VTOL landing
private _vehiclesPlanesGunship = []; // Self explanatory
private _vehiclesPlanesLargeCAS = []; // Used for planes that need to spawn on the runway.
private _vehiclesPlanesLargeAA = []; // Used for planes that need to spawn on the runway.

private _vehiclesHelisLight = ["AMF_gazelle_afte_da_f"]; // A light transport helicopter.
private _vehiclesHelisTransport = ["amf_nh90_tth_transport", "amf_cougar"]; // A transport helicopter.
private _vehiclesHelisLightAttack = ["AMF_gazelle_hot_f", "AMF_gazelle_minigun_da_f"]; // A light attack helicopter.
private _vehiclesHelisAttack = ["AMF_TIGRE_01"]; // An attack helicopter.
private _vehiclesAirPatrol = ["AMF_gazelle_afte_da_f"]; // A helicopter that is used to patrol areas.

/* Special Vehicles */
private _vehiclesArtillery = ["amf_CAESAR_01_CE_f", "B_T_MBT_01_arty_F", "B_T_MBT_01_mlrs_F"]; // If it has an artillery computer and moves, it's probably vehicular artillery.
["magazines", createHashMapFromArray [
    ["amf_CAESAR_01_CE_f",["32Rnd_155mm_CAESAR_explo"]],
    ["B_T_MBT_01_arty_F",["32Rnd_155mm_Mo_shells"]],
    ["B_T_MBT_01_mlrs_F",["12Rnd_230mm_rockets"]] // ["vehicle", ["magazine1", "magazine2"]]. You can add multiple vehicles.
]] call _fnc_saveToTemplate;

/* Militia Vehicles */
private _vehiclesMilitiaLightArmed = ["amf_pvp_01_mag_TDF_f", "amf_pvp_01_top_TDF_f", "AMF_VBL_TDF_762_01_F"]; // Think: What would a hastily formed militia use?
private _vehiclesMilitiaTrucks = ["AMF_GBC180_PERS_02"];
private _vehiclesMilitiaCars = ["amf_pvp_01_top_TDF_f"];
private _vehiclesMilitiaAPCs = ["B_AMF_VAB_ULTIMA_TOP_X8_TDF_F"];

/* Police Vehicles */
private _vehiclesPolice = ["B_GEN_Offroad_01_gen_F", "AMF_VBMRL_762_ONU", "AMF_VBMR_VOA_ONU"];

/* Radar and SAM */
private _vehiclesRadar = "B_Radar_System_01_F";
private _vehiclesSam = "B_SAM_System_03_F";

/* Statics */
private _staticMG = ["B_G_HMG_02_high_F"]; // Must fit in a standard Altis defensive tower.
private _staticAT = ["AMF_WiredGuided_mmp_F"]; // Must fit in a standard Altis defensive tower.
private _staticAA = ["B_static_AA_F"]; // Must fit on a standard Altis HQ military building.

private _staticMortars = ["B_Mortar_01_F"]; // Must fit in a ~2x2 sandbag emplacement.
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your mortar.
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

private _staticHowitzers = ["AMF_Mo120_01_CE_F"];
["howitzerMagazineHE", "AMF_8Rnd_120mm_OE"] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your howitzer.

/* UAV's */
private _uavsPortable = ["AMF_Anafi_01_F"]; // A UAV that is packable into a backpack.
private _uavsAttack = ["B_AMF_REAPER_dynamicLoadout_F"]; // A UAV that is capable of attacking. Think a reaper drone.

/* Mines */
private _minefieldAT = ["ATMine"]; // Mine used for Anti Tank fields.
private _minefieldAPERS = ["APERSMine"]; // Mine used for Anti Personnel fields.

/* Variants of Vehicles */
private _animations = [];
private _variants = [
    ["AMF_GBC180_PERS_02", ["TDF",1]],
    ["AMF_GBC180_PLATEAU_02", ["TDF",1]],
    ["AMF_GBC180_AmmoTruck_02", ["TDF",1]],
    ["AMF_GBC180_MECA_02", ["TDF",1]],
    ["AMF_gazelle_afte_da_f", ["DA",1]],
    ["AMF_gazelle_hot_f", ["DA",1]],
    ["AMF_gazelle_minigun_da_f", ["DA",1]],
    ["CLASS", ["TDF",1]]
];

//////////////////////
///  Identities   ///
////////////////////

// These are the "Military" identities by default. 
// They also encompass any tier you *don't* define, so these are "fallback" entries too.
private _faces = ["WhiteHead_01","WhiteHead_02","WhiteHead_03","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"];
private _voices = ["Male01FRE","Male02FRE","Male03FRE","Male01ENGFRE","Male02ENGFRE"];
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
private _sfVoices = [];
private _sfInsignia = [];

/*
["sfFaces", _sfFaces] call _fnc_saveToTemplate;
["sfVoices", _sfVoices] call _fnc_saveToTemplate;
["sfInsignia", _sfInsignia] call _fnc_saveToTemplate;
*/

///////////////////////////
//       Loadouts       //
/////////////////////////

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

private _opticsShared = [];
private _opticsSharedSL = [];
private _mountsShared = [];
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["riflesSL", []]; // Rifle given to Squad Leaders
_loadoutData set ["riflesAuto", []]; // An LMG or machine gun
_loadoutData set ["riflesMarksman", []]; // Accurate long barrel rifle
_loadoutData set ["riflesSniper", []]; // Designated sniper rifle
_loadoutData set ["riflesCarbine", []]; // A rifle with a shorter barrel length
_loadoutData set ["launchersGrenade", [
   ["AMF_614_long_HK269_01_F", "", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]]; // A (usually) rifle mounted grenade launcher
_loadoutData set ["launchersGrenadeDesignated", []]; // A standalone grenade launcher

_loadoutData set ["launchersLightAT", ["AMF_NLAW_Loaded", "AMF_AT4CS_Loaded"]]; // Light launcher that fires a non-missile projectile
_loadoutData set ["launchersAT", [
    ["AMF_LRAC89_F", "", "", "", ["AMF_AC89mm_F1"], [], ""]
]]; // Launcher that fires a non-missile projectile
_loadoutData set ["launchersMissileAT", [
    ["AMF_Eryx", "", "", "", ["Eryx_HEAT"], [], ""]
]]; // Launcher that fires a missile projectile
_loadoutData set ["launchersAA", [
    ["launch_B_Titan_olive_F", "", "", "", ["Titan_AA"], [], ""]
]]; // Launcher that fires an AA guided missile projectile
_loadoutData set ["sidearms", []];

_loadoutData set ["minesAT", ["ATMine_Range_Mag"]]; // Anti-tank
_loadoutData set ["minesAP", ["APERSMine_Range_Mag"]]; // Anti-personnel
_loadoutData set ["explosivesLight", ["DemoCharge_Remote_Mag"]]; // Found on explosive expert units
_loadoutData set ["explosivesHeavy", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalSmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]]; // (Flare)

/* Basic equipment. Shouldn't need touching most of the time. */
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["GPS", ["ItemGPS"]];
_loadoutData set ["NVG", ["NVGoggles"]]; // NVG's given to all units PROVIDED they have no tier-specific overwrites
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

/* Traitor: A rebel traitor who has defected to *this* faction. */
_loadoutData set ["uniformsTraitor", ["amf_uniform_05_TAN"]];
_loadoutData set ["vestsTraitor", ["amf_SMB_AUXSAN"]];
_loadoutData set ["helmetsTraitor", ["AMF_BERET_MARINE_PARA"]];

/* Officer: An official who is present at places like Military Administration. */
_loadoutData set ["uniformsOfficer", ["amf_uniform_05_MTP"]];
_loadoutData set ["vestsOfficer", ["amf_SMB_FUS"]];
_loadoutData set ["helmetsOfficer", ["AMF_BERET_PARA"]];

/* Cloak: Basically a small patrol sniper team. */
_loadoutData set ["uniformsCloak", ["amf_uniform_02_DA_MD"]];
_loadoutData set ["vestsCloak", ["amf_SMB_TP_HK417"]];
_loadoutData set ["helmetsCloak", []];

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

_loadoutData set ["backpacks", []];
_loadoutData set ["backpacksRadio", ["AMF_FELIN_BACKPACK_RADIO_TDF"]];
_loadoutData set ["backpacksAT", []];

_loadoutData set ["helmets", []];
_loadoutData set ["helmetsSL", ["AMF_BERET_INFANTERIE"]];
_loadoutData set ["helmetsHeavy", []];
_loadoutData set ["helmetsSniper", ["AMF_BERET_RPIMa"]];
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
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
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

if (isClass (configfile >> "CfgPatches" >> "CUP_Weapons_Stinger") || isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") || isClass (configfile >> "CfgPatches" >> "Redd_Marder_1A5")) then {
	if (isClass (configfile >> "CfgPatches" >> "CUP_Weapons_Stinger") && !isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy")) then {
        (_loadoutData get "launchersAA") = [ ["CUP_launch_FIM92Stinger", "", "", "", [""], [], ""] ];
    };

    if (isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") && !isClass (configfile >> "CfgPatches" >> "CUP_Weapons_Stinger")) then {
       (_loadoutData get "launchersAA") = [ ["rhs_weap_fim92", "", "", "", ["rhs_fim92_mag"], [], ""] ];
    };
};

///////////////////////////
//    Misc Loadouts     //
/////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["amf_uniform_01_CE_HX"]];
_crewLoadoutData set ["vests", ["amf_SMB"]];
_crewLoadoutData set ["helmets", ["AMF_ELNO_DH_586"]];
_crewLoadoutData set ["rifles", [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_crewLoadoutData set ["sidearms", []];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["amf_pilot_01_f"]];
_pilotLoadoutData set ["vests", ["AMF_Pilot_Vest"]];
_pilotLoadoutData set ["helmets", ["AMF_ALPHA900"]];
_pilotLoadoutData set ["rifles", [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""],
    ["amf_sig552", "", "", "", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""]
]];
_pilotLoadoutData set ["sidearms", []];

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_gen_F"]];
_policeLoadoutData set ["helmets", ["H_Beret_gen_F"]];
_policeLoadoutData set ["rifles", [
    ["amf_hk_mp5_01_f", "", "", "", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
]];

/////////////////////////////////
//    Militia Loadout Data    //
///////////////////////////////

/* Unit Gear */
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["amf_uniform_01_RE_NG_DA_HX"]];
_militiaLoadoutData set ["uniformsSL", []];
_militiaLoadoutData set ["uniformsHeavy", []];
_militiaLoadoutData set ["uniformsSniper", []];
_militiaLoadoutData set ["uniformsMedic", []];
_militiaLoadoutData set ["uniformsGrenadier", []];
_militiaLoadoutData set ["uniformsMachineGunner", []];
_militiaLoadoutData set ["vests", ["amf_SMB_FUS"]];
_militiaLoadoutData set ["vestsSL", []];
_militiaLoadoutData set ["vestsHeavy", []];
_militiaLoadoutData set ["vestsSniper", ["amf_SMB_TP_SCAR"]];
_militiaLoadoutData set ["vestsMedic", []];
_militiaLoadoutData set ["vestsGrenadier", []];
_militiaLoadoutData set ["vestsMachineGunner", []];
_militiaLoadoutData set ["backpacks", ["amf_tecpack_30L"]];
_militiaLoadoutData set ["helmets", ["AMF_FELIN_05_CE", "AMF_FELIN_05_TAN", "AMF_FELIN_06_CE"]];
_militiaLoadoutData set ["helmetsSL", []];
_militiaLoadoutData set ["helmetsHeavy", []];
_militiaLoadoutData set ["helmetsSniper", ["AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"]];
_militiaLoadoutData set ["helmetsMedic", []];
_militiaLoadoutData set ["helmetsGrenadier", []];
_militiaLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_militiaLoadoutData set ["facewear", []];
_militiaLoadoutData set ["NVG", []];

/* Unit Weapons */
_militiaLoadoutData set ["rifles", [
    ["amf_sig552", "", "", "", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""],
    ["amf_sig552", "", "", "", ["AMF_30Rnd_556x45_SIG_BO_BT_M196"], [], ""],
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], ""]
]];
_militiaLoadoutData set ["riflesSL", []];
_militiaLoadoutData set ["riflesAuto", [
    ["amf_mag58_01_f", "", "", "", ["AMF_50Rnd_762x51_MAG58_BO_F3", "AMF_75Rnd_762x51_MAG58_BO_F3"], [], ""],
    ["AANF1_LB", "", "", "", ["AMF_50Rnd_762x51_AANF1_BO_BT_F3"], [], ""]
]];
_militiaLoadoutData set ["riflesMarksman", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["20Rnd_762x51_Mag"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_militiaLoadoutData set ["riflesSniper", [
    ["AMF_RFF2_01_F", "", "", "ScromeJ8", ["AMF_10Rnd_762x51_BO_F3"], [], ""]
]];
_militiaLoadoutData set ["riflesCarbine", [
    ["AMF_614_short_FS_BLK", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["AMF_SCAR_L_01_F", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["Famas_F1", "", "", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_SS109", "AMF_25Rnd_BO_MEN_SS109"], [], ""],
    ["Famas_F1", "", "", "", ["AMF_25Rnd_BO_BT_MEN_SS109", "AMF_25Rnd_BO_MEN_SS109"], [], ""]
]];
_militiaLoadoutData set ["launchersGrenade", [
    ["Famas_F1", "", "", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_SS109"], ["AMF_RFG_AC58", "AMF_RFG_APAV40"], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["AMF_PSA_Glock_17", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
]];
_militiaLoadoutData set ["binoculars", []];

//////////////////////////////////
//    Military Loadout Data    //
////////////////////////////////

/* Unit Gear */
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["amf_uniform_01_DA_HX", "amf_uniform_01_RE_DA_MD", "amf_uniform_01_RE_NG_DA_MD"]];
_militaryLoadoutData set ["uniformsSL", ["amf_uniform_05_TAN"]];
_militaryLoadoutData set ["uniformsHeavy", []];
_militaryLoadoutData set ["uniformsSniper", []];
_militaryLoadoutData set ["uniformsMedic", []];
_militaryLoadoutData set ["uniformsGrenadier", []];
_militaryLoadoutData set ["uniformsMachineGunner", []];
_militaryLoadoutData set ["vests", ["amf_SMB_FUS", "amf_SMB_FUS_FAMAS"]];
_militaryLoadoutData set ["vestsSL", ["amf_SMB_LEADER_FAMAS", "amf_SMB_LEADER"]];
_militaryLoadoutData set ["vestsHeavy", []];
_militaryLoadoutData set ["vestsSniper", ["amf_SMB_TP_SCAR", "amf_SMB_TP_HK417", "amf_SMB_TP_FRF2"]];
_militaryLoadoutData set ["vestsMedic", ["amf_SMB_AUXSAN", "amf_SMB_AUXSAN_FAMAS"]];
_militaryLoadoutData set ["vestsGrenadier", ["amf_SMB_GRE"]];
_militaryLoadoutData set ["vestsMachineGunner", ["amf_SMB_ART"]];
_militaryLoadoutData set ["backpacks", ["amf_tecpack_30L"]];
_militaryLoadoutData set ["helmets", ["AMF_FELIN_05_TAN", "AMF_FELIN_05_CE", "AMF_FELIN_06_CE", "AMF_FELIN_06_TAN", "AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"]];
_militaryLoadoutData set ["helmetsSL", []];
_militaryLoadoutData set ["helmetsHeavy", []];
_militaryLoadoutData set ["helmetsSniper", ["AMF_FELIN_L05_TAN", "AMF_FELIN_L05_CE", "AMF_FELIN_L06_CE", "AMF_FELIN_L06_TAN"]];
_militaryLoadoutData set ["helmetsMedic", []];
_militaryLoadoutData set ["helmetsGrenadier", []];
_militaryLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_militaryLoadoutData set ["facewear", []];
_militaryLoadoutData set ["NVG", []];

/* Unit Weapons */
_militaryLoadoutData set ["rifles", [
    ["AMF_614_short_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_long_01_F", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Famas_G2", "", "", "", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["Famas_G2_PGMP", "", "", "Aimpoint_CompM_PGMP", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""]
]];
_militaryLoadoutData set ["riflesSL", [
    ["AMF_614_short_01_F", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip3"],
    ["AMF_614_long_01_F", "", "", "AMF_xps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip3"],
    ["AMF_614_short_FS_BLK", "", "", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"]
]];
_militaryLoadoutData set ["riflesAuto", [
    ["FN_Minimi_MK3", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"],
    ["FN_Minimi_MK3", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"]
]];
_militaryLoadoutData set ["riflesMarksman", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["20Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "amf_acc_714_long_grip3"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "amf_acc_714_long_grip3"]
]];
_militaryLoadoutData set ["riflesSniper", [
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "AMF_schmidt_benderx4", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"]
]];
_militaryLoadoutData set ["riflesCarbine", [
    ["AMF_SCAR_L_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["amf_hk_mp5_02_f", "", "", "AMF_Red_Dot_Sight", ["AMF_30Rnd_9x19_MP5_BO_123GR"], [], ""]
]];
_militaryLoadoutData set ["launchersGrenade", [
    ["AMF_614_long_HK269_01_F", "", "", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "", "AMF_EOTECH_553", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
]];
_militaryLoadoutData set ["binoculars", ["AMF_APX_M241"]];

//////////////////////////////////
//    Elite Loadout Data       //
////////////////////////////////

/* Unit Gear */
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["AMF_CRY_G3_RolledSleeve_DA", "amf_uniform_05_TAN"]];
_eliteLoadoutData set ["uniformsSL", ["amf_uniform_04_TAN"]];
_eliteLoadoutData set ["uniformsHeavy", []];
_eliteLoadoutData set ["uniformsSniper", []];
_eliteLoadoutData set ["uniformsMedic", []];
_eliteLoadoutData set ["uniformsGrenadier", []];
_eliteLoadoutData set ["uniformsMachineGunner", []];
_eliteLoadoutData set ["vests", ["amf_SMB_FUS", "amf_SMB_FUS_FAMAS"]];
_eliteLoadoutData set ["vestsSL", ["amf_SMB_LEADER_FAMAS", "amf_SMB_LEADER"]];
_eliteLoadoutData set ["vestsHeavy", []];
_eliteLoadoutData set ["vestsSniper", ["amf_SMB_TP_SCAR", "amf_SMB_TP_HK417", "amf_SMB_TP_FRF2"]];
_eliteLoadoutData set ["vestsMedic", ["amf_SMB_AUXSAN", "amf_SMB_AUXSAN_FAMAS"]];
_eliteLoadoutData set ["vestsGrenadier", ["amf_SMB_GRE"]];
_eliteLoadoutData set ["vestsMachineGunner", ["amf_SMB_ART"]];
_eliteLoadoutData set ["backpacks", ["amf_tecpack_30L"]];
_eliteLoadoutData set ["helmets", ["AMF_FELIN_05_TAN", "AMF_FELIN_06_TAN", "AMF_OPSCORE_TAN_2", "AMF_OPSCORE3_TAN", "AMF_OPSCORE4_TAN"]];
_eliteLoadoutData set ["helmetsSL", []];
_eliteLoadoutData set ["helmetsHeavy", []];
_eliteLoadoutData set ["helmetsSniper", ["AMF_FELIN_L06_TAN", "AMF_FELIN_L04_TAN"]];
_eliteLoadoutData set ["helmetsMedic", []];
_eliteLoadoutData set ["helmetsGrenadier", []];
_eliteLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_eliteLoadoutData set ["facewear", []];
_eliteLoadoutData set ["NVG", []];

/* Unit Weapons */
_eliteLoadoutData set ["rifles", [
    ["AMF_614_short_FS_BLK", "", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS_TAN2", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip10"],
    ["AMF_614_short_FS_BLK", "", "AMF_AN_PEQ_15_black", "AMF_EOTECH_553_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["Famas_Valo", "", "", "AMF_EOTECH_553", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["Famas_FELIN", "", "", "AMF_Aimpoint_Pro_Patrol", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], ""]
]];
_eliteLoadoutData set ["riflesSL", [
    ["AMF_614_short_FS_TAN2", "", "", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_TAN", "", "AMF_AN_PEQ_15_black", "AMF_exps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_TAN", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_SCAR_L_01_F", "", "AMF_AN_PEQ_15_black", "AMF_Red_Dot_Sight", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["riflesAuto", [
    ["FN_Minimi_MK3", "", "", "AMF_specter", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"],
    ["FN_Minimi_MK3", "", "", "AMF_EOTECH_553", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], "Minimi_Grip_MK2"]
]];
_eliteLoadoutData set ["riflesMarksman", [
    ["AMF_SCAR_H_01_F", "", "", "AMF_schmidt_benderx4_tan", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], ""],
    ["AMF_SCAR_H_01_F", "", "", "optic_LRPS", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], "bipod_01_F_blk"],
    ["AMF_HK417_F", "", "", "AMF_schmidt_benderx4", ["AMF_20Rnd_762x51_HK417_BO_F3"], [], "amf_acc_714_long_grip3"],
    ["AMF_714_Long_01_F", "", "", "AMF_schmidt_benderx4", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "amf_acc_714_long_grip3"]
]];
_eliteLoadoutData set ["riflesSniper", [
    ["AMF_PGM_ULTIMA_RATIO_01_F", "", "", "AMF_schmidt_benderx4", ["10Rnd_762x51_Mag"], [], "bipod_01_F_blk"],
    ["AMF_PGM_Hecate_II_Poly_RIS", "", "", "AMF_SB_PM2_P3L", ["AMF_7Rnd_127x99_HECATE2_IMI_661GR_FMJ"], [], ""],
    ["AMF_PGM_Hecate_II_Poly", "", "", "ScromeJ10", ["AMF_7Rnd_127x99_HECATE2_IMI_661GR_FMJ"], [], ""]
]];
_eliteLoadoutData set ["riflesCarbine", [
    ["AMF_614_short_FS_BLK", "", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS_TAN2", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip10"],
    ["AMF_SCAR_L_01_F", "", "", "", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_SCAR_L_02_F", "", "", "AMF_Aimpoint_Pro_Patrol", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_01_F", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["launchersGrenade", [
    ["AMF_614_long_HK269_01_F", "", "", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "", "AMF_EOTECH_553", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["sidearms", [
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""],
    ["AMF_Pamas", "", "", "", ["AMF_15Rnd_9x19_PAMAS"], [], ""]
]];
_eliteLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

////////////////////////////////////////
//    Special Forces Loadout Data    //
//////////////////////////////////////

/* Unit Gear */
private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["amf_uniform_04_TAN", "amf_uniform_05_TAN"]];
_sfLoadoutData set ["uniformsSL", []];
_sfLoadoutData set ["uniformsHeavy", []];
_sfLoadoutData set ["uniformsSniper", []];
_sfLoadoutData set ["uniformsMedic", []];
_sfLoadoutData set ["uniformsGrenadier", []];
_sfLoadoutData set ["uniformsMachineGunner", []];
_sfLoadoutData set ["vests", ["amf_SMB_FUS", "amf_SMB_FUS_FAMAS"]];
_sfLoadoutData set ["vestsSL", ["amf_SMB_LEADER_FAMAS", "amf_SMB_LEADER"]];
_sfLoadoutData set ["vestsHeavy", []];
_sfLoadoutData set ["vestsSniper", ["amf_SMB_TP_SCAR", "amf_SMB_TP_HK417", "amf_SMB_TP_FRF2"]];
_sfLoadoutData set ["vestsMedic", ["amf_SMB_AUXSAN", "amf_SMB_AUXSAN_FAMAS"]];
_sfLoadoutData set ["vestsGrenadier", ["amf_SMB_GRE"]];
_sfLoadoutData set ["vestsMachineGunner", ["amf_SMB_ART"]];
_sfLoadoutData set ["backpacks", ["amf_tecpack_30L"]];
_sfLoadoutData set ["helmets", ["AMF_OPSCORE_TAN", "AMF_OPSCORE_TAN_2"]];
_sfLoadoutData set ["helmetsSL", []];
_sfLoadoutData set ["helmetsHeavy", []];
_sfLoadoutData set ["helmetsSniper", ["AMF_OPSCORE_TAN2_2", "AMF_FELIN_L03_TAN"]];
_sfLoadoutData set ["helmetsMedic", []];
_sfLoadoutData set ["helmetsGrenadier", []];
_sfLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_sfLoadoutData set ["facewear", []];
_sfLoadoutData set ["NVG", ["AMF_ONYX_NVG"]];

/* Unit Weapons */
_sfLoadoutData set ["rifles", [  
    ["AMF_SCAR_L_02_F", "muzzle_snds_M", "AMF_AN_PEQ_15_black", "AMF_specter", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], [], ""],
    ["AMF_614_short_FS3_BLK", "AMF_ROTEX_V", "", "AMF_exps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS3_BLK", "AMF_ROTEX_V", "", "AMF_EOTECH_553", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_V", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["riflesSL", [
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_III", "AMF_AN_PEQ_15_black", "AMF_specter", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"],
    ["AMF_614_short_FS4_BLK", "AMF_ROTEX_V", "AMF_WMX200", "AMF_AIMPOINT_MICRO_T2", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["Famas_F1", "muzzle_snds_M", "AMF_AN_PEQ_15_black", "AMF_Red_Dot_Sight", ["AMF_25Rnd_BO_BT_MEN_SS109"], [], "amf_acc_famas_grip5"]
]];
_sfLoadoutData set ["riflesAuto", [
    ["FN_Minimi_MK3", "", "", "AMF_xps3_magnifier_side", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""],
    ["FN_Minimi_MK3", "", "", "ScromeJ4_RIS_NoCover", ["AMF_100Rnd_556x45_Minimi_BO_BT_SS109_DCP"], [], ""]
]];
_sfLoadoutData set ["riflesMarksman", [
    ["AMF_714_Long_01_F", "", "AMF_AN_PEQ_15_black", "AMF_schmidt_benderx4", ["20Rnd_762x51_HK417_mag"], [], "bipod_03_F_blk"],
    ["AMF_714_Long_01_F", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["20Rnd_762x51_HK417_mag"], [], "bipod_03_F_blk"],
    ["AMF_SCAR_H_02_F_BLK", "", "AMF_AN_PEQ_15_black", "AMF_specter", ["AMF_20Rnd_762x51_SCAR_BLK_BO_F3"], [], "amf_Scar_VGBipodBLK"],
    ["AMF_714_Long_01_F", "muzzle_snds_B", "", "AMF_schmidt_benderx4", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "amf_acc_714_long_grip3"]
]];
_sfLoadoutData set ["riflesSniper", [   
    ["AMF_PGM_ULTIMA_RATIO_F", "", "", "optic_LRPS", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "bipod_01_F_blk"],
    ["AMF_PGM_ULTIMA_RATIO_F", "muzzle_snds_B", "", "optic_LRPS", ["AMF_10Rnd_308WIN_UR_CBC_168GR_HPBT"], [], "bipod_01_F_blk"],
    ["AMF_PGM_Hecate_II_Poly_RIS", "", "", "optic_LRPS", ["AMF_7Rnd_127x99_HECATE2_IMI_661GR_FMJ"], [], ""]
]];
_sfLoadoutData set ["riflesCarbine", [  
    ["AMF_614_short_FS4_BLK", "", "", "AMF_Eotech_552", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS_BLK", "", "", "AMF_Red_Dot_Sight", ["30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["AMF_614_short_FS3_BLK", "", "", "AMF_exps3", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip4"],
    ["AMF_614_short_FS5_BLK", "", "", "AMF_xps3_magnifier_side", ["30Rnd_556x45_Stanag_Tracer_Green"], [], "amf_acc_614_grip5"]
]];
_sfLoadoutData set ["launchersGrenade", [
    ["AMF_614_long_HK269_01_F", "", "AMF_WMX200", "AMF_specter_painted", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""],
    ["AMF_614_long_HK269_01_F", "", "AMF_WMX200", "AMF_specter_painted", ["AMF_30Rnd_556x45_SS109_Tracer_Stanag"], ["1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F", "1Rnd_SmokeGreen_Grenade_shell"], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["AMF_PAMAC_50", "", "", "", ["AMF_9Rnd_9x19_PAMC50"], [], ""],
    ["AMF_Glock_17_Gen4", "", "", "", ["AMF_17Rnd_9x19_Glock"], [], ""]
]];
_sfLoadoutData set ["binoculars", ["AMF_OB72_SOPHIE"]];

/////////////////////////////
//    Conditional Gear     //
/////////////////////////////

if (_hasLawsOfWar) then {
    _vehiclesPolice append ["B_GEN_Van_02_transport_F", "B_GEN_Van_02_vehicle_F"];
};

if (_hasContact) then {
    _vehiclesPolice append ["B_GEN_Offroad_01_comms_F", "B_GEN_Offroad_01_covered_F"];
};

if (_hasRF) then {
    _vehiclesPolice append ["B_GEN_Pickup_covered_rf"];
    _vehiclesAirPatrol append ["B_GEN_Heli_EC_01_RF"];
    _vehiclesTransportBoats append ["EF_B_CombatBoat_Unarmed_NATO", "EF_B_CombatBoat_Unarmed_GEN"];
    _vehiclesGunBoats append ["EF_B_CombatBoat_HMG_NATO", "EF_B_CombatBoat_AT_NATO"];
};

if (_hasEF) then {
    _vehiclesPolice append ["EF_B_Gyra_GEN", "EF_B_Gyra_HMG_GEN"];
};

if (isClass (configFile >> "CfgVehicles" >> "clv_Aml20")) then {
    _vehiclesLightArmed append ["clv_Aml20", "clv_AmlHS30", "clv_Aml90"];
    _vehiclesLightTanks append ["clv_Amx13", "clv_Kurassier"];
    _vehiclesLightAPCs append ["CLV_VCPC"];
    _vehiclesIFVs append ["CLV_VCTP", "CLV_VCTP2IP"];
    _vehiclesAA append ["clv_VCLM", "clv_Dragon"];
    _staticAA append ["CLV_OERLIKON"];
    _staticHowitzers append ["CLV_OMM56"];

    _variants append [
        ["clv_Aml20", ["Desert",1]],
        ["clv_Aml90", ["UN",1]],
        ["clv_AmlHS30", ["Desert",1]],
        ["clv_Amx13", ["Desert",1]],
        ["clv_Kurassier", ["Desert",1]],
        ["clv_Kurassier", ["BicolorI",1]],
        ["clv_VCLM", ["BicolorI",1]],
        ["CLV_VCPC", ["lightgreen",1]],
        ["CLV_VCTP2IP", ["Darkgreen",1]],
        ["CLV_VCTP", ["Darkgreen",1]],
        ["CLV_OERLIKON", ["Gdf2",1]],
        ["CLV_OMM56", ["Otomelara2",1]]
    ];

    _variants append [
        ["clv_Aml20", ["Desert",1]],
        ["clv_Aml90", ["UN",1]],
        ["clv_AmlHS30", ["Desert",1]],
        ["clv_Amx13", ["Desert",1]],
        ["clv_Kurassier", ["Desert",1]],
        ["clv_Kurassier", ["BicolorI",1]],
        ["clv_VCLM", ["BicolorI",1]],
        ["CLV_VCPC", ["lightgreen",1]],
        ["CLV_VCTP2IP", ["Darkgreen",1]],
        ["CLV_VCTP", ["Darkgreen",1]],
        ["CLV_OERLIKON", ["Gdf2",1]],
        ["CLV_OMM56", ["Otomelara2",1]]
    ];
};

if (isClass (configFile >> "CfgPatches" >> "hlcweapons_core")) then {
    (_sfLoadoutData get "riflesSL") append [
            ["hlc_rifle_416D10_st6", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
            ["hlc_rifle_416D145_CAG", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
            ["hlc_rifle_416N", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], "hlc_grip_AFG2"],
            ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""]
    ];
    (_sfLoadoutData get "rifles") append [
            ["hlc_rifle_416D10", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416D145", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416D165", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
            ["hlc_wp_SCARL_STD_blk", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""]
    ];
    (_sfLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
    ];
    (_sfLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
    ];
    (_sfLoadoutData get "riflesMarksman") append [
            ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"]
    ];
    (_sfLoadoutData get "riflesSniper") append [
            ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
            ["hlc_rifle_awmagnum", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""]
    ];
    (_sfLoadoutData get "sidearms") append [
            ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""],
            ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
    ];
    (_eliteLoadoutData get "riflesSL") append [
            ["hlc_rifle_416D10_st6", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
            ["hlc_rifle_416D145_CAG", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["hlc_30rnd_556x45_TDim_L5"], [], ""],
            ["hlc_rifle_416N", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], "hlc_grip_AFG2"],
            ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_specter", ["hlc_30rnd_556x45_TDim_L5"], [], ""]
    ];
    (_eliteLoadoutData get "rifles") append [
            ["hlc_rifle_416D10", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416D145", "", "hlc_muzzle_SF3P_556", "AMF_xps3_magnifier_side", ["AMF_30Rnd_556x45_M193_Stanag"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416D165", "", "hlc_muzzle_SF3P_556", "AMF_specter", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""],
            ["hlc_wp_SCARL_STD_blk", "", "", "AMF_xps3", ["AMF_30Rnd_556x45_M193_Stanag"], [], ""]
    ];
    (_eliteLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_416D10C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_wp_SCARL_CQC_Blk", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""],
            ["hlc_wp_SCARL_DMR_Blk", "", "", "AMF_Aimpoint_Pro_Patrol", ["hlc_30rnd_556x45_EPR"], [], ""],
            ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""],
            ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR_PMAG"], [], ""]
    ];
    (_eliteLoadoutData get "riflesCarbine") append [
            ["hlc_smg_mp5N_tac", "", "", "AMF_EOTECH_553", ["hlc_30Rnd_9x19_B_MP5"], [], ""],
            ["hlc_smg_mp5k_PDW", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
    ];
    (_eliteLoadoutData get "riflesMarksman") append [
            ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"]
    ];
    (_eliteLoadoutData get "riflesSniper") append [
            ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
            ["hlc_rifle_awmagnum", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""]
    ];
    (_eliteLoadoutData get "sidearms") append [
            ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""],
            ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
    ];
    (_militaryLoadoutData get "riflesSL") append [
            ["hlc_rifle_416D10", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416C", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    (_militaryLoadoutData get "rifles") append [
            ["hlc_rifle_416D10", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""],
            ["hlc_rifle_416D165", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], ""],
            ["hlc_rifle_416C", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    (_militaryLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_416D10", "", "", "AMF_xps3", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    (_militaryLoadoutData get "riflesCarbine") append [
            ["hlc_smg_MP5N", "", "", "AMF_Red_Dot_Sight", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
    ];
    (_militaryLoadoutData get "riflesMarksman") append [
            ["hlc_wp_SCARH_STD", "", "", "AMF_schmidt_benderx4_tan", ["hlc_20Rnd_762x51_B_SCARH_Tan"], [], ""],
            ["hlc_wp_SCARH_STD", "", "", "optic_LRPS", ["hlc_20Rnd_762x51_B_SCARH_Tan"], [], "bipod_01_F_blk"],
            ["hlc_rifle_m14sopmod", "", "", "hlc_optic_ZF95Base", ["hlc_20Rnd_762x51_B_M14"], [], "HLC_bipod_UTGShooters"]
    ];
    (_militaryLoadoutData get "riflesSniper") append [
            ["hlc_rifle_awmagnum_BL", "", "", "hlc_optic_LeupoldM3A", ["hlc_5rnd_300WM_FMJ_AWM"], [], ""],
            ["hlc_rifle_psg1", "", "", "", ["hlc_20rnd_762x51_b_G3"], [], ""]
    ];
    (_militaryLoadoutData get "sidearms") append [
            ["hlc_pistol_P226R", "", "", "", ["hlc_15Rnd_9x19_B_P226", "hlc_15Rnd_9x19_JHP_P226"], [], ""]
    ];
    (_policeLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_G36C", "", "", "AMF_Red_Dot_Sight", ["hlc_30rnd_556x45_EPR_G36"], [], ""],
            ["hlc_rifle_416C", "", "", "AMF_EOTECH_553", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    (_policeLoadoutData get "sidearms") append [
            ["hlc_pistol_P226R_Combat", "", "", "", ["hlc_15Rnd_9x19_B_P226"], [], ""]
    ];
    (_militiaLoadoutData get "riflesSL") append [
            ["hlc_rifle_416D10", "", "", "AMF_AIMPOINT_MICRO_T2", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416D165", "", "", "AMF_specter", ["hlc_30rnd_556x45_EPR"], [], "hlc_grip_AFG2"],
            ["hlc_rifle_416C", "", "", "AMF_exps3", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    (_militiaLoadoutData get "rifles") append [
            ["hlc_rifle_SG551LB", "", "", "", ["hlc_30Rnd_556x45_EPR_sg550"], [], ""]
    ];
    (_militiaLoadoutData get "riflesCarbine") append [
            ["hlc_smg_MP5N", "", "", "", ["hlc_30Rnd_9x19_B_MP5"], [], ""]
    ];
    (_militiaLoadoutData get "riflesMarksman") append [
            ["hlc_rifle_psg1", "", "", "", ["hlc_20rnd_762x51_b_G3"], [], ""],
            ["hlc_rifle_g3a3", "", "", "hlc_optic_STANAGZF_G3", ["hlc_20rnd_762x51_b_G3"], [], ""]
    ];
    (_militiaLoadoutData get "riflesSniper") append [
            ["hlc_rifle_FN3011", "", "", "hlc_optic_Kern_3011", ["hlc_10Rnd_762x51_B_fal"], [], ""]
    ];
    (_crewLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_416C", "", "", "", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
    (_pilotLoadoutData get "riflesCarbine") append [
            ["hlc_rifle_416C", "", "", "", ["hlc_30rnd_556x45_EPR"], [], ""]
    ];
};

//////////////////////////////////
//    Unit Type Definitions    //
////////////////////////////////

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

#include "definitions\Main\Main_Definitions.sqf"