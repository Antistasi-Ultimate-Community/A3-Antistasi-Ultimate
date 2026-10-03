/////////////////////////////////
//   Side Information - Occ   //
///////////////////////////////

#include "..\..\script_template_common.hpp" // Do NOT remove or else you will not be able to use any macros such as QPATH

["name", ""] call _fnc_saveToTemplate; // Name of our faction, in game. NOT for the selection screen.
["spawnMarkerName", ""] call _fnc_saveToTemplate; // Name of the spawn corridor.

["flag", DEFAULT_FLAG] call _fnc_saveToTemplate; // Physical flag object classname. Rarely needs to change.
["flagTexture", QPATHTOFOLDER(Templates\Templates\MOD\images\flag_FACTION_co.paa)] call _fnc_saveToTemplate; // Texture path applied to the physical flag. Can point to external files.
["flagMarkerType", ""] call _fnc_saveToTemplate; // Marker from CfgMarkers.

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
private _vehiclesBasic = []; // Absolute basic vehicle. Quadbike, LSV, etc.
private _vehiclesLightUnarmed = []; // Fundamental vehicle. Think an unarmoured humvee.
private _vehiclesLightArmed = []; // Fundamental vehicle. Think a lightly armoured humvee with an M240.

private _vehiclesTrucks = []; // Used for troop carrying.
private _vehiclesCargoTrucks = []; // Used for cargo carrying. Must have logistics nodes.
private _vehiclesAmmoTrucks = [];
private _vehiclesRepairTrucks = [];
private _vehiclesFuelTrucks = [];
private _vehiclesMedicalTrucks = [];

private _vehiclesLightAPCs = []; // A light APC is an Armoured Personnel Carrier. Generally, light armoured vehicle + light gun.
private _vehiclesAPCs = []; // An APC is a light APC but bigger. Generally, armoured vehicle + medium gun.
private _vehiclesIFVs = []; // An IFV is an Infantry Fighting Vehicle. Generally, armoured vehicle + big gun.
private _vehiclesAirborne = []; // Vehicles that can be "paradropped". Not *too* strict, but use common sense.
private _vehiclesAA = []; // Vehicles that AI crew can use to shoot down aircraft. If they can, it's an AA vehicle!

private _vehiclesLightTanks = []; // A light tank is a tank that is light... Think an american M60 (the tank).
private _vehiclesTanks = []; // A tank is a tank. Shocker. Think an M1 Abrams.

/* Sea Vehicles */
private _vehiclesTransportBoats = [];
private _vehiclesGunBoats = [];

/* Air Vehicles */
private _vehiclesPlanesCAS = []; // CAS = Close Air Support, CfgPlaneLoadouts >> CAS and CASDIVE
private _vehiclesPlanesAA = []; // AA = Anti-Air, CfgPlaneLoadouts >> AA
private _vehiclesPlanesTransport = []; // Troop carriers for paradrop OR VTOL landing
private _vehiclesPlanesGunship = []; // Self explanatory
private _vehiclesPlanesLargeCAS = []; // Used for planes that need to spawn on the runway.
private _vehiclesPlanesLargeAA = []; // Used for planes that need to spawn on the runway.

private _vehiclesHelisLight = []; // A light transport helicopter.
private _vehiclesHelisTransport = []; // A transport helicopter.
private _vehiclesHelisLightAttack = []; // A light attack helicopter.
private _vehiclesHelisAttack = []; // An attack helicopter.
private _vehiclesAirPatrol = []; // A helicopter that is used to patrol areas.

/* Special Vehicles */
private _vehiclesArtillery = []; // If it has an artillery computer and moves, it's probably vehicular artillery.
["magazines", createHashMapFromArray [
    ["", [""]] // ["vehicle", ["magazine1", "magazine2"]]. You can add multiple vehicles.
]] call _fnc_saveToTemplate;

/* Militia Vehicles */
private _vehiclesMilitiaLightArmed = []; // Think: What would a hastily formed militia use?
private _vehiclesMilitiaTrucks = [];
private _vehiclesMilitiaCars = [];
private _vehiclesMilitiaAPCs = [];

/* Police Vehicles */
private _vehiclesPolice = [];

/* Radar and SAM */
private _vehiclesRadar = [];
private _vehiclesSam = [];

/* Statics */
private _staticMG = []; // Must fit in a standard Altis defensive tower.
private _staticAT = []; // Must fit in a standard Altis defensive tower.
private _staticAA = []; // Must fit on a standard Altis HQ military building.

private _staticMortars = []; // Must fit in a ~2x2 sandbag emplacement.
["mortarMagazineHE", ""] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your mortar.
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;
["mortarMagazineFlare", ""] call _fnc_saveToTemplate;

private _staticHowitzers = [];
["howitzerMagazineHE", ""] call _fnc_saveToTemplate; // Use `magazines cursorObject` whilst looking at your howitzer.

/* UAV's */
private _uavsPortable = []; // A UAV that is packable into a backpack.
private _uavsAttack = []; // A UAV that is capable of attacking. Think a reaper drone.

/* Mines */
private _minefieldAT = []; // Mine used for Anti Tank fields.
private _minefieldAPERS = []; // Mine used for Anti Personnel fields.

#include "FACTION_Vehicle_Attributes.sqf"

//////////////////////
///  Identities   ///
////////////////////

// These are the "Military" identities by default. 
// They also encompass any tier you *don't* define, so these are "fallback" entries too.
private _faces = [];
private _voices = [];
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
_loadoutData set ["launchersGrenade", []]; // A (usually) rifle mounted grenade launcher
_loadoutData set ["launchersGrenadeDesignated", []]; // A standalone grenade launcher

_loadoutData set ["launchersLightAT", []]; // Light launcher that fires a non-missile projectile
_loadoutData set ["launchersAT", []]; // Launcher that fires a non-missile projectile
_loadoutData set ["launchersMissileAT", []]; // Launcher that fires a missile projectile
_loadoutData set ["launchersAA", []]; // Launcher that fires an AA guided missile projectile
_loadoutData set ["sidearms", []];

_loadoutData set ["minesAT", []]; // Anti-tank
_loadoutData set ["minesAP", []]; // Anti-personnel
_loadoutData set ["explosivesLight", []]; // Found on explosive expert units
_loadoutData set ["explosivesHeavy", []];

_loadoutData set ["antiInfantryGrenades", []];
_loadoutData set ["smokeGrenades", []];
_loadoutData set ["signalSmokeGrenades", []]; // (Flare)

/* Basic equipment. Shouldn't need touching most of the time. */
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["GPS", ["ItemGPS"]];
_loadoutData set ["NVG", []]; // NVG's given to all units PROVIDED they have no tier-specific overwrites
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

/* Traitor: A rebel traitor who has defected to *this* faction. */
_loadoutData set ["uniformsTraitor", []];
_loadoutData set ["vestsTraitor", []];
_loadoutData set ["helmetsTraitor", []];

/* Officer: An official who is present at places like Military Administration. */
_loadoutData set ["uniformsOfficer", []];
_loadoutData set ["vestsOfficer", []];
_loadoutData set ["helmetsOfficer", []];

/* Cloak: Basically a small patrol sniper team. */
_loadoutData set ["uniformsCloak", []];
_loadoutData set ["vestsCloak", []];
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
_loadoutData set ["backpacksRadio", []];
_loadoutData set ["backpacksAT", []];

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

///////////////////////////
//    Misc Loadouts     //
/////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", []];
_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", []];
_crewLoadoutData set ["rifles", []];
_crewLoadoutData set ["sidearms", []];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", []];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", []];
_pilotLoadoutData set ["rifles", []];
_pilotLoadoutData set ["sidearms", []];

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_policeLoadoutData set ["uniforms", []];
_policeLoadoutData set ["vests", []];
_policeLoadoutData set ["helmets", []];
_policeLoadoutData set ["rifles", []];
_policeLoadoutData set ["sidearms", []];

/////////////////////////////////
//    Militia Loadout Data    //
///////////////////////////////

/* Unit Gear */
private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", []];
_militiaLoadoutData set ["uniformsSL", []];
_militiaLoadoutData set ["uniformsHeavy", []];
_militiaLoadoutData set ["uniformsSniper", []];
_militiaLoadoutData set ["uniformsMedic", []];
_militiaLoadoutData set ["uniformsGrenadier", []];
_militiaLoadoutData set ["uniformsMachineGunner", []];
_militiaLoadoutData set ["vests", []];
_militiaLoadoutData set ["vestsSL", []];
_militiaLoadoutData set ["vestsHeavy", []];
_militiaLoadoutData set ["vestsSniper", []];
_militiaLoadoutData set ["vestsMedic", []];
_militiaLoadoutData set ["vestsGrenadier", []];
_militiaLoadoutData set ["vestsMachineGunner", []];
_militiaLoadoutData set ["backpacks", []];
_militiaLoadoutData set ["helmets", []];
_militiaLoadoutData set ["helmetsSL", []];
_militiaLoadoutData set ["helmetsHeavy", []];
_militiaLoadoutData set ["helmetsSniper", []];
_militiaLoadoutData set ["helmetsMedic", []];
_militiaLoadoutData set ["helmetsGrenadier", []];
_militiaLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_militiaLoadoutData set ["facewear", []];
_militiaLoadoutData set ["NVGs", []];

/* Unit Weapons */
_militiaLoadoutData set ["rifles", []];
_militiaLoadoutData set ["riflesSL", []];
_militiaLoadoutData set ["riflesAuto", []];
_militiaLoadoutData set ["riflesMarksman", []];
_militiaLoadoutData set ["riflesSniper", []];
_militiaLoadoutData set ["riflesCarbine", []];
_militiaLoadoutData set ["launchersGrenade", []];
_militiaLoadoutData set ["sidearms", []];
_militiaLoadoutData set ["binoculars", []];

//////////////////////////////////
//    Military Loadout Data    //
////////////////////////////////

/* Unit Gear */
private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", []];
_militaryLoadoutData set ["uniformsSL", []];
_militaryLoadoutData set ["uniformsHeavy", []];
_militaryLoadoutData set ["uniformsSniper", []];
_militaryLoadoutData set ["uniformsMedic", []];
_militaryLoadoutData set ["uniformsGrenadier", []];
_militaryLoadoutData set ["uniformsMachineGunner", []];
_militaryLoadoutData set ["vests", []];
_militaryLoadoutData set ["vestsSL", []];
_militaryLoadoutData set ["vestsHeavy", []];
_militaryLoadoutData set ["vestsSniper", []];
_militaryLoadoutData set ["vestsMedic", []];
_militaryLoadoutData set ["vestsGrenadier", []];
_militaryLoadoutData set ["vestsMachineGunner", []];
_militaryLoadoutData set ["backpacks", []];
_militaryLoadoutData set ["helmets", []];
_militaryLoadoutData set ["helmetsSL", []];
_militaryLoadoutData set ["helmetsHeavy", []];
_militaryLoadoutData set ["helmetsSniper", []];
_militaryLoadoutData set ["helmetsMedic", []];
_militaryLoadoutData set ["helmetsGrenadier", []];
_militaryLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_militaryLoadoutData set ["facewear", []];
_militaryLoadoutData set ["NVGs", []];

/* Unit Weapons */
_militaryLoadoutData set ["rifles", []];
_militaryLoadoutData set ["riflesSL", []];
_militaryLoadoutData set ["riflesAuto", []];
_militaryLoadoutData set ["riflesMarksman", []];
_militaryLoadoutData set ["riflesSniper", []];
_militaryLoadoutData set ["riflesCarbine", []];
_militaryLoadoutData set ["launchersGrenade", []];
_militaryLoadoutData set ["sidearms", []];
_militaryLoadoutData set ["binoculars", []];

//////////////////////////////////
//    Elite Loadout Data       //
////////////////////////////////

/* Unit Gear */
private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", []];
_eliteLoadoutData set ["uniformsSL", []];
_eliteLoadoutData set ["uniformsHeavy", []];
_eliteLoadoutData set ["uniformsSniper", []];
_eliteLoadoutData set ["uniformsMedic", []];
_eliteLoadoutData set ["uniformsGrenadier", []];
_eliteLoadoutData set ["uniformsMachineGunner", []];
_eliteLoadoutData set ["vests", []];
_eliteLoadoutData set ["vestsSL", []];
_eliteLoadoutData set ["vestsHeavy", []];
_eliteLoadoutData set ["vestsSniper", []];
_eliteLoadoutData set ["vestsMedic", []];
_eliteLoadoutData set ["vestsGrenadier", []];
_eliteLoadoutData set ["vestsMachineGunner", []];
_eliteLoadoutData set ["backpacks", []];
_eliteLoadoutData set ["helmets", []];
_eliteLoadoutData set ["helmetsSL", []];
_eliteLoadoutData set ["helmetsHeavy", []];
_eliteLoadoutData set ["helmetsSniper", []];
_eliteLoadoutData set ["helmetsMedic", []];
_eliteLoadoutData set ["helmetsGrenadier", []];
_eliteLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_eliteLoadoutData set ["facewear", []];
_eliteLoadoutData set ["NVGs", []];

/* Unit Weapons */
_eliteLoadoutData set ["rifles", []];
_eliteLoadoutData set ["riflesSL", []];
_eliteLoadoutData set ["riflesAuto", []];
_eliteLoadoutData set ["riflesMarksman", []];
_eliteLoadoutData set ["riflesSniper", []];
_eliteLoadoutData set ["riflesCarbine", []];
_eliteLoadoutData set ["launchersGrenade", []];
_eliteLoadoutData set ["sidearms", []];
_eliteLoadoutData set ["binoculars", []];

////////////////////////////////////////
//    Special Forces Loadout Data    //
//////////////////////////////////////

/* Unit Gear */
private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", []];
_sfLoadoutData set ["uniformsSL", []];
_sfLoadoutData set ["uniformsHeavy", []];
_sfLoadoutData set ["uniformsSniper", []];
_sfLoadoutData set ["uniformsMedic", []];
_sfLoadoutData set ["uniformsGrenadier", []];
_sfLoadoutData set ["uniformsMachineGunner", []];
_sfLoadoutData set ["vests", []];
_sfLoadoutData set ["vestsSL", []];
_sfLoadoutData set ["vestsHeavy", []];
_sfLoadoutData set ["vestsSniper", []];
_sfLoadoutData set ["vestsMedic", []];
_sfLoadoutData set ["vestsGrenadier", []];
_sfLoadoutData set ["vestsMachineGunner", []];
_sfLoadoutData set ["backpacks", []];
_sfLoadoutData set ["helmets", []];
_sfLoadoutData set ["helmetsSL", []];
_sfLoadoutData set ["helmetsHeavy", []];
_sfLoadoutData set ["helmetsSniper", []];
_sfLoadoutData set ["helmetsMedic", []];
_sfLoadoutData set ["helmetsGrenadier", []];
_sfLoadoutData set ["helmetsMachineGunner", []];

/* Unit Misc Gear */
_sfLoadoutData set ["facewear", []];
_sfLoadoutData set ["NVGs", []];

/* Unit Weapons */
_sfLoadoutData set ["rifles", []];
_sfLoadoutData set ["riflesSL", []];
_sfLoadoutData set ["riflesAuto", []];
_sfLoadoutData set ["riflesMarksman", []];
_sfLoadoutData set ["riflesSniper", []];
_sfLoadoutData set ["riflesCarbine", []];
_sfLoadoutData set ["launchersGrenade", []];
_sfLoadoutData set ["sidearms", []];
_sfLoadoutData set ["binoculars", []];

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