/* private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasJets = "jets" in A3A_enabledDLC;
private _hasHelicopters = "heli" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasGM = "gm" in A3A_enabledDLC;
private _hasCSLA = "csla" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasSOG = "vn" in A3A_enabledDLC;
private _hasSPE = "spe" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC; */ ///dlc stuff if your templates needs it

#include "..\..\script_component.hpp"

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "FDF"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "FDF"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Markers\marker_fin_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_FIN"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["B_SDV_01_F"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["SpaceshipCapsule_01_F"]] call _fnc_saveToTemplate;

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["Flex_CUP_FIN_Quadbike"]] call _fnc_saveToTemplate;			 // unarmed or armed, with 0-2 passengers
["vehiclesLightUnarmed", ["Flex_CUP_FIN_LR_Transport"]] call _fnc_saveToTemplate;		 // must be unarmed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesLightArmed", ["Flex_CUP_FIN_LR_MG", "Flex_CUP_FIN_RG31_Mk19", "Flex_CUP_FIN_RG31E_M2", "Flex_CUP_FIN_RG31_M2"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["Flex_CUP_FIN_Truck_Transport", "Flex_CUP_FIN_Truck_Covered"]] call _fnc_saveToTemplate;		 // vehicle that can carry troops and cargoboxes
["vehiclesCargoTrucks", ["Flex_CUP_FIN_Truck_Transport", "Flex_CUP_FIN_Truck_Covered"]] call _fnc_saveToTemplate;		 // vehicle that can carry only cargoboxes
["vehiclesAmmoTrucks", ["Flex_CUP_FIN_Truck_Ammo"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to rearm vehicles
["vehiclesRepairTrucks", ["Flex_CUP_FIN_Truck_Repair"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to repair vehicles
["vehiclesFuelTrucks", ["Flex_CUP_FIN_Truck_Fuel"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to refuel vehicles
["vehiclesMedical", ["Flex_CUP_FIN_Truck_Medical", "Flex_CUP_FIN_LR_Ambulance", "Flex_CUP_FIN_BMP2_AMB", "Flex_CUP_FIN_Patria_AMV_MEV"]] call _fnc_saveToTemplate;		 // vehicle with capability to provide healing
["vehiclesLightAPCs", ["Flex_CUP_FIN_BMP2"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["Flex_CUP_FIN_Patria_AMV_M2"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesAirborne", ["Flex_CUP_FIN_LR_MG", "Flex_CUP_FIN_RG31_Mk19", "Flex_CUP_FIN_RG31E_M2", "Flex_CUP_FIN_RG31_M2"]] call _fnc_saveToTemplate;              // airborne vehicles, could be with passenger seats or just a crew 
["vehiclesIFVs", ["Flex_CUP_FIN_APC_tracked_03"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesTanks", ["Flex_CUP_FIN_Leopard2A6"]] call _fnc_saveToTemplate;                 // cannon armed, heavely armored, passengers will be ignored
["vehiclesLightTanks", ["O_UGV_01_rcws_F"]] call _fnc_saveToTemplate;             // tanks with poor armor and weapons
["vehiclesAA", ["CUP_B_nM1097_AVENGER_NATO_T"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored

["vehiclesTransportBoats", ["Flex_CUP_FIN_Boat_Transport"]] call _fnc_saveToTemplate;	// boat that can carry passengers and cargoboxes
["vehiclesGunBoats", ["Flex_CUP_FIN_RHIB", "Flex_CUP_FIN_RHIB2Turret"]] call _fnc_saveToTemplate;              // armed boat, with passengers(?)
//["vehiclesAmphibious", []] call _fnc_saveToTemplate;          // armed or unarmed wheled or tracked based vehicle with light armor(?) and passengers(?)

["vehiclesPlanesCAS", ["Flex_CUP_FIN_F35B"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["Flex_CUP_FIN_F35B", "Flex_CUP_FIN_F35B_Stealth"]] call _fnc_saveToTemplate;              //Will be used with ASF script, must be defined in setPlaneLoadout.
//Needs fixed gun and either rockets or missiles
["vehiclesPlanesTransport", ["CUP_B_C130J_USMC"]] call _fnc_saveToTemplate;	//Plane that can carry passengers and cargo(?), infantry variant if availbe 
//no need for vehicle variant currently
["vehiclesPlanesGunship", ["CUP_B_AH64D_DL_USA"]] call _fnc_saveToTemplate;     // planes like V-44X armed, AC-130 or pelican from OPTRE, used in GUNSHIP support
//probably can also be a helicopter

["vehiclesHelisLight", ["Flex_CUP_FIN_AH9_Transport"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["Flex_CUP_FIN_AH9_Transport", "Flex_CUP_FIN_NH90"]] call _fnc_saveToTemplate;        // bigger heli with more passengers. 
//Should be capable of dealing damage to ground targets without additional scripting

// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["B_Heli_Light_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["CUP_B_AH64D_DL_USA"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesAirPatrol", ["CUP_B_AH64D_DL_USA"]] call _fnc_saveToTemplate;             // preferably light helicopters(armed or unarmed), used in base patrol near bases

["vehiclesArtillery", ["Flex_CUP_FIN_Truck_MRL", "Flex_CUP_FIN_M270_DPICM", "Flex_CUP_FIN_M270_HE"]] call _fnc_saveToTemplate;             // wheeled or tracked vehicle with artillery cannon or rockets
["magazines", createHashMapFromArray [
    ["Flex_CUP_FIN_Truck_MRL", ["12Rnd_230mm_rockets"]],
    ["Flex_CUP_FIN_M270_DPICM", ["CUP_12Rnd_MLRS_DPICM"]],
    ["Flex_CUP_FIN_M270_HE", ["CUP_12Rnd_MLRS_HE"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;                    // unmanned aerial vehicle with heavy armament
["uavsPortable", ["Flex_CUP_FIN_UAV_01"]] call _fnc_saveToTemplate;                  // unmanned aerial vehicle(drone), unarmed or armed(Western Sahara style), must be able to be disassembled


//Config special vehicles
["vehiclesMilitiaLightArmed", ["Flex_CUP_FIN_LR_MG"]] call _fnc_saveToTemplate;     // same as "vehiclesLightArmed" but for milita forces
["vehiclesMilitiaTrucks", ["Flex_CUP_FIN_Truck_Transport", "Flex_CUP_FIN_Truck_Covered"]] call _fnc_saveToTemplate;         // same as "vehiclesTrucks" but for milita forces
["vehiclesMilitiaCars", ["Flex_CUP_FIN_LR_Transport"]] call _fnc_saveToTemplate;           // same as "vehiclesLightUnarmed" but for milita forces

["vehiclesMilitiaAPCs", ["Flex_CUP_FIN_LR_MG"]] call _fnc_saveToTemplate;              // Militia APCs will be used at roadblocks and attacks at first 4 war levels

["vehiclesPolice", ["Flex_CUP_FIN_LR_Transport"]] call _fnc_saveToTemplate;                // cars used by police forces

["staticMGs", ["Flex_CUP_FIN_KORD_High", "Flex_CUP_FIN_HMG_High"]] call _fnc_saveToTemplate;                     // static machine guns
["staticAT", ["Flex_CUP_FIN_TOW2"]] call _fnc_saveToTemplate;                      // static anti-tank weapons 
["staticAA", ["Flex_CUP_FIN_Stinger_AA_pod", "Flex_CUP_FIN_ZU23"]] call _fnc_saveToTemplate;                      // static anti-aircraft weapons
["staticMortars", ["Flex_CUP_FIN_Mortar"]] call _fnc_saveToTemplate;                 // static mortars
["staticHowitzers", ["Flex_CUP_FIN_D30"]] call _fnc_saveToTemplate;               // static howitzers

["vehicleRadar", "Flex_CUP_FIN_Radar_System"] call _fnc_saveToTemplate;                  // vehicle with radar
["vehicleSam", "Flex_CUP_FIN_SAM_System"] call _fnc_saveToTemplate;                    // vehicle with SAM

["howitzerMagazineHE", "CUP_30Rnd_122mmHE_D30_M"] call _fnc_saveToTemplate;            // explosive ammo for Howitzer

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;              // explosive ammo for mortars
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;           // smoke ammo for mortars

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", ["CUP_MineE"]] call _fnc_saveToTemplate;                   // anti-tank mines
["minefieldAPERS", ["APERSBoundingMine"]] call _fnc_saveToTemplate;                // anti-personal mines

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["faces", [
    "WhiteHead_01", 
    "WhiteHead_02", 
    "WhiteHead_03", 
    "WhiteHead_04", 
    "WhiteHead_05", 
    "WhiteHead_06", 
    "WhiteHead_07", 
    "WhiteHead_08", 
    "WhiteHead_09", 
    "WhiteHead_10", 
    "WhiteHead_11", 
    "WhiteHead_12", 
    "WhiteHead_13", 
    "WhiteHead_14", 
    "WhiteHead_15", 
    "WhiteHead_16", 
    "WhiteHead_17", 
    "WhiteHead_18", 
    "WhiteHead_19", 
    "WhiteHead_20", 
    "WhiteHead_21"
]] call _fnc_saveToTemplate;
["voices", ["Male01FIN_FDF_flex","Male02FIN_FDF_flex","Male03FIN_FDF_flex","Male04FIN_FDF_flex","Male05FIN_FDF_flex","Male06FIN_FDF_flex","Male07FIN_FDF_flex","Male08FIN_FDF_flex","Male09FIN_FDF_flex"]] call _fnc_saveToTemplate;

"finnish_names_generic" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["sidearms", [
    ["hgun_P07_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["lightHELaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];

_loadoutData set ["ATMines", ["CUP_MineE_M"]];
_loadoutData set ["APMines", ["APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellBlue", "SmokeShellGreen", "SmokeShellOrange", "SmokeShellPurple", "SmokeShellRed", "SmokeShellYellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["CUP_NVG_1PN138", "CUP_NVG_PVS15_black", "CUP_NVG_PVS7", "CUP_NVG_PVS14", "CUP_NVG_GPNVG_black", "CUP_NVG_HMNVS"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder", "CUP_SOFLAM", "CUP_Vector21Nite", "CUP_LRTV"]];

_loadoutData set ["traitorUniforms", ["Flex_CUP_FIN_Combat_Uniform_Tshirt"]];
_loadoutData set ["traitorVests", ["V_Chestrig_rgr", "V_TacVest_oli"]];
_loadoutData set ["traitorHats", ["H_Watchcap_camo", "Flex_CUP_FIN_Beret_Army", "Flex_CUP_FIN_Patrol_cap"]];

_loadoutData set ["officerUniforms", ["Flex_CUP_FIN_Combat_Uniform_Gloves_Rolled", "Flex_CUP_FIN_Combat_Uniform_Pads_Rolled"]];
_loadoutData set ["officerVests", ["Flex_CUP_FIN_V_CPC_tlbelt", "Flex_CUP_FIN_V_CPC_tl"]];
_loadoutData set ["officerHats", ["Flex_CUP_FIN_Beret_Army"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["longRangeRadios", ["Flex_CUP_FIN_RadioBag"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["Flex_CUP_FIN_Beret_Army"]];
_loadoutData set ["sniHats", ["Flex_CUP_FIN_Boonie_Wood"]];

_loadoutData set ["facewear", []];

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

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["Flex_CUP_FIN_Combat_Uniform_Pads_Gloves", "Flex_CUP_FIN_Combat_Uniform_Gloves", "Flex_CUP_FIN_Combat_Uniform_Pads"]];
_sfLoadoutData set ["vests", ["Flex_CUP_FIN_V_CPC_communicationsbelt", "Flex_CUP_FIN_V_CPC_Fastbelt", "Flex_CUP_FIN_V_CPC_lightbelt", "Flex_CUP_FIN_V_CPC_medicalbelt", "Flex_CUP_FIN_V_CPC_tlbelt", "Flex_CUP_FIN_V_CPC_weaponsbelt", "Flex_CUP_FIN_V_CPC_communications", "Flex_CUP_FIN_V_CPC_Fast", "Flex_CUP_FIN_V_CPC_light", "Flex_CUP_FIN_V_CPC_medical", "Flex_CUP_FIN_V_CPC_tl", "Flex_CUP_FIN_V_CPC_weapons"]];
_sfLoadoutData set ["helmets", ["Flex_CUP_FIN_Opscore_SF", "Flex_CUP_FIN_Opscore", "Flex_CUP_FIN_Opscore_No_Headset"]];
_sfLoadoutData set ["backpacks", ["Flex_CUP_FIN_AssaultPack", "Flex_CUP_FIN_Kitbag", "Flex_CUP_FIN_RadioBag"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "", ["CUP_MAAWS_HEAT_M"], [], ""]
]];
_sfLoadoutData set ["lightHELaunchers", [
    ["CUP_launch_MAAWS", "", "", "", ["CUP_MAAWS_HEDP_M"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [], [], ""]
]];
_sfLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""]
]];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "optic_Yorris", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_ZeissZPoint", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_Pecheneg_B50_vfg", "CUP_muzzle_mfsup_Flashhider_PK_Black", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["20Rnd_650x39_Cased_Mag_F"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["20Rnd_650x39_Cased_Mag_F"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["srifle_LRR_F", "", "", "optic_LRPS", ["7Rnd_408_Mag"], [], ""],
    ["srifle_LRR_F", "", "", "CUP_optic_LeupoldMk4", ["7Rnd_408_Mag"], [], ""],

    ["CUP_srifle_M107_Base", "", "", "optic_LRPS", ["CUP_10Rnd_127x99_M107"], [], ""],
    ["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""] 
]];
_sfLoadoutData set ["sidearms", [
    ["hgun_P07_F", "CUP_muzzle_snds_M9", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["Flex_CUP_FIN_Combat_Uniform_Pads_Gloves", "Flex_CUP_FIN_Combat_Uniform_Gloves", "Flex_CUP_FIN_Combat_Uniform_Pads"]];
_eliteLoadoutData set ["vests", ["Flex_CUP_FIN_V_CPC_communicationsbelt", "Flex_CUP_FIN_V_CPC_Fastbelt", "Flex_CUP_FIN_V_CPC_lightbelt", "Flex_CUP_FIN_V_CPC_medicalbelt", "Flex_CUP_FIN_V_CPC_tlbelt", "Flex_CUP_FIN_V_CPC_weaponsbelt", "Flex_CUP_FIN_V_CPC_communications", "Flex_CUP_FIN_V_CPC_Fast", "Flex_CUP_FIN_V_CPC_light", "Flex_CUP_FIN_V_CPC_medical", "Flex_CUP_FIN_V_CPC_tl", "Flex_CUP_FIN_V_CPC_weapons"]];
_eliteLoadoutData set ["helmets", ["Flex_CUP_FIN_Opscore_SF", "Flex_CUP_FIN_Opscore", "Flex_CUP_FIN_Opscore_No_Headset"]];
_eliteLoadoutData set ["backpacks", ["Flex_CUP_FIN_AssaultPack", "Flex_CUP_FIN_Kitbag", "Flex_CUP_FIN_RadioBag"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_eliteLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "", ["CUP_MAAWS_HEAT_M"], [], ""]
]];
_eliteLoadoutData set ["lightHELaunchers", [
    ["CUP_launch_MAAWS", "", "", "", ["CUP_MAAWS_HEDP_M"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [], [], ""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "optic_Yorris", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_ZeissZPoint", ["CUP_30Rnd_9x19_MP5"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_Pecheneg_B50_vfg", "CUP_muzzle_mfsup_Flashhider_PK_Black", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["20Rnd_650x39_Cased_Mag_F"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["20Rnd_650x39_Cased_Mag_F"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["srifle_LRR_F", "", "", "optic_LRPS", ["7Rnd_408_Mag"], [], ""],
    ["srifle_LRR_F", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x67_M2010_M"], [], ""],

    ["CUP_srifle_M107_Base", "", "", "optic_LRPS", ["CUP_10Rnd_127x99_M107"], [], ""],
    ["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""] 
]];
_eliteLoadoutData set ["sidearms", [
    ["hgun_P07_F", "CUP_muzzle_snds_M9", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["Flex_CUP_FIN_Combat_Uniform_Pads_Gloves", "Flex_CUP_FIN_Combat_Uniform_Gloves", "Flex_CUP_FIN_Combat_Uniform_Pads"]];
_militaryLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Empty", "CUP_V_PMC_CIRAS_OD_Grenadier", "CUP_V_PMC_CIRAS_OD_TL", "CUP_V_PMC_CIRAS_OD_Veh", "CUP_V_PMC_CIRAS_OD_Patrol"]];
_militaryLoadoutData set ["backpacks", ["Flex_CUP_FIN_AssaultPack", "Flex_CUP_FIN_Kitbag", "Flex_CUP_FIN_RadioBag"]];
_militaryLoadoutData set ["helmets", ["Flex_CUP_FIN_Helmet_Comms", "Flex_CUP_FIN_Helmet_Comms_cov"]];

_militaryLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M"], [], ""]
]];
_militaryLoadoutData set ["lightHELaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [], [], ""],
    ["CUP_launch_NLAW", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
    ["KAR_RIFLE_RK62", "", "", "", ["KARRK62_Mag"], [], ""],

    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_MicroT1_low", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_Eotech553_Black", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_MARS", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_OKP_7_rail", ["KARRK62_Mag"], [], ""],

    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["KAR_RIFLE_RK62", "", "", "", ["KARRK62_Mag"], [], ""],

    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_MicroT1_low", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_Eotech553_Black", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_MARS", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_OKP_7_rail", ["KARRK62_Mag"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["KAR_RIFLE_RK62", "", "", "", ["KARRK62_Mag"], [], ""],

    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_MicroT1_low", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_Eotech553_Black", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_MARS", ["KARRK62_Mag"], [], ""],
    ["KAR_RIFLE_RK62M2", "", "acc_flashlight", "CUP_optic_OKP_7_rail", ["KARRK62_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "", "acc_flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "", "optic_Yorris", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail", "", "", "CUP_optic_MRad", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail", "", "", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_Pecheneg", "", "", "", ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", [
    ["hgun_P07_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["Flex_CUP_FIN_Combat_Uniform_Gloves_Rolled", "Flex_CUP_FIN_Combat_Uniform_Pads_Rolled", "Flex_CUP_FIN_Combat_Uniform_Rolled", "Flex_CUP_FIN_Combat_Uniform_Tshirt_Gloves", "Flex_CUP_FIN_Combat_Uniform_Tshirt", "Flex_CUP_FIN_Combat_Uniform_Tshirt_Pads"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE", "CUP_V_C_Police_Holster"]];
_policeLoadoutData set ["helmets", ["Flex_CUP_FIN_Beret_Army", "Flex_CUP_FIN_Patrol_cap"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["hgun_P07_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["Flex_CUP_FIN_Combat_Uniform_Pads_Gloves", "Flex_CUP_FIN_Combat_Uniform_Gloves", "Flex_CUP_FIN_Combat_Uniform_Pads", "Flex_CUP_FIN_Combat_Uniform_Tshirt", "Flex_CUP_FIN_Combat_Uniform_Tshirt_Gloves", "Flex_CUP_FIN_Combat_Uniform_Tshirt_Pads"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_PASGT_OD", "CUP_V_B_PASGT_no_bags_OD"]];
_militiaLoadoutData set ["backpacks", ["Flex_CUP_FIN_AssaultPack", "Flex_CUP_FIN_Kitbag", "Flex_CUP_FIN_RadioBag"]];
_militiaLoadoutData set ["helmets", ["Flex_CUP_FIN_Helmet_Comms_cov", "Flex_CUP_FIN_Helmet_Comms"]];

_militiaLoadoutData set ["ATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [], [], ""],
    ["CUP_launch_NLAW", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["CUP_arifle_M4A1_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_MOE_short_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_standard_short_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_BUIS_GL", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M4A1_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_MOE_short_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_standard_short_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_MOE_short_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_standard_short_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_RPK74", "", "", "", ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["hgun_P07_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["Flex_CUP_FIN_Combat_Uniform_Tshirt", "Flex_CUP_FIN_Combat_Uniform_Tshirt_Gloves", "Flex_CUP_FIN_Combat_Uniform_Tshirt_Pads"]];
_crewLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Veh"]];
_crewLoadoutData set ["helmets", ["H_Tank_eaf_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_PilotCoveralls"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_O", "H_PilotHelmetHeli_O"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.
private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandomWeighted ["carbines", 0.4, "SMGs", 0.6]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
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
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [["vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["sniperRifles", "marksmanRifles"] call _fnc_setPrimary;
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
    [["vests"] call _fnc_fallback] call _fnc_setVest;
    [["uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["carbines"] call _fnc_setPrimary;
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
