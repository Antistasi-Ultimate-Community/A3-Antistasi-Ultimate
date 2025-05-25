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

["name", "PLA"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "PLA"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Markers\PLA_Flag.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3u_flag_PLA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesSDV", ["B_SDV_01_F"]] call _fnc_saveToTemplate;

["vehiclesDropPod", ["SpaceshipCapsule_01_F"]] call _fnc_saveToTemplate;

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_T_East_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["Flex_CUP_PLA_Quadbike"]] call _fnc_saveToTemplate;			 // unarmed or armed, with 0-2 passengers
["vehiclesLightUnarmed", ["Flex_CUP_PLA_Tigr_M_233114", "Flex_CUP_PLA_LSV_02_unarmed"]] call _fnc_saveToTemplate;		 // must be unarmed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesLightArmed", ["Flex_CUP_PLA_LSV_02_armed", "Flex_CUP_PLA_LSV_02_AT", "Flex_CUP_PLA_Tigr_M_233114_PK", "Flex_CUP_PLA_Tigr_M_233114_KORD"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["Flex_CUP_PLA_Truck_03_transport", "Flex_CUP_PLA_Truck_03"]] call _fnc_saveToTemplate;		 // vehicle that can carry troops and cargoboxes
["vehiclesCargoTrucks", ["Flex_CUP_PLA_Truck_03_transport", "Flex_CUP_PLA_Truck_03"]] call _fnc_saveToTemplate;		 // vehicle that can carry only cargoboxes
["vehiclesAmmoTrucks", ["Flex_CUP_PLA_Truck_03_ammo"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to rearm vehicles
["vehiclesRepairTrucks", ["Flex_CUP_PLA_Truck_03_repair"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to repair vehicles
["vehiclesFuelTrucks", ["Flex_CUP_PLA_Truck_03_fuel"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to refuel vehicles
["vehiclesMedical", ["Flex_CUP_PLA_Truck_03_medical"]] call _fnc_saveToTemplate;		 // vehicle with capability to provide healing
["vehiclesLightAPCs", ["Flex_CUP_PLA_APC_Wheeled_02"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["Flex_CUP_PLA_APC_Wheeled_02"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesAirborne", ["Flex_CUP_PLA_Tigr_M_233114_PK", "Flex_CUP_PLA_Tigr_M_233114_KORD", "Flex_CUP_PLA_LSV_02_armed"]] call _fnc_saveToTemplate;              // airborne vehicles, could be with passenger seats or just a crew 
["vehiclesIFVs", ["Flex_CUP_PLA_APC_Tracked_02"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesTanks", ["Flex_CUP_PLA_T90MS"]] call _fnc_saveToTemplate;                 // cannon armed, heavely armored, passengers will be ignored
["vehiclesLightTanks", ["O_UGV_01_rcws_F"]] call _fnc_saveToTemplate;             // tanks with poor armor and weapons
["vehiclesAA", ["Flex_CUP_PLA_APC_Tracked_02_AA"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored

["vehiclesTransportBoats", ["Flex_CUP_PLA_RHIB_Unarmed"]] call _fnc_saveToTemplate;	// boat that can carry passengers and cargoboxes
["vehiclesGunBoats", ["CUP_B_RHIB_HIL", "CUP_B_RHIB2Turret_HIL"]] call _fnc_saveToTemplate;              // armed boat, with passengers(?)
//["vehiclesAmphibious", []] call _fnc_saveToTemplate;          // armed or unarmed wheled or tracked based vehicle with light armor(?) and passengers(?)

["vehiclesPlanesCAS", ["O_Plane_CAS_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["O_Plane_Fighter_02_F"]] call _fnc_saveToTemplate;              //Will be used with ASF script, must be defined in setPlaneLoadout.
//Needs fixed gun and either rockets or missiles
["vehiclesPlanesTransport", ["O_T_VTOL_02_infantry_dynamicLoadout_F"]] call _fnc_saveToTemplate;	//Plane that can carry passengers and cargo(?), infantry variant if availbe 
//no need for vehicle variant currently
["vehiclesPlanesGunship", ["Flex_CUP_PLA_Heli_Attack_02"]] call _fnc_saveToTemplate;     // planes like V-44X armed, AC-130 or pelican from OPTRE, used in GUNSHIP support
//probably can also be a helicopter

["vehiclesHelisLight", ["Flex_CUP_PLA_Heli_Light_02_unarmed"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["Flex_CUP_PLA_Heli_Light_02_unarmed"]] call _fnc_saveToTemplate;        // bigger heli with more passengers. 
//Should be capable of dealing damage to ground targets without additional scripting

// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["Flex_CUP_PLA_Heli_Light_02"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["Flex_CUP_PLA_Heli_Attack_02"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesAirPatrol", ["Flex_CUP_PLA_Heli_Attack_02"]] call _fnc_saveToTemplate;             // preferably light helicopters(armed or unarmed), used in base patrol near bases

["vehiclesArtillery", ["Flex_CUP_PLA_MBT_02_arty"]] call _fnc_saveToTemplate;             // wheeled or tracked vehicle with artillery cannon or rockets
["magazines", createHashMapFromArray [
    ["Flex_CUP_PLA_MBT_02_arty", ["32Rnd_155mm_Mo_shells_O"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["Flex_CUP_PLA_UAV_04_CAS"]] call _fnc_saveToTemplate;                    // unmanned aerial vehicle with heavy armament
["uavsPortable", ["Flex_CUP_PLA_UAV_01"]] call _fnc_saveToTemplate;                  // unmanned aerial vehicle(drone), unarmed or armed(Western Sahara style), must be able to be disassembled


//Config special vehicles
["vehiclesMilitiaLightArmed", ["Flex_CUP_PLA_LSV_02_armed", "Flex_CUP_PLA_LSV_02_AT"]] call _fnc_saveToTemplate;     // same as "vehiclesLightArmed" but for milita forces
["vehiclesMilitiaTrucks", ["Flex_CUP_PLA_Truck_03", "Flex_CUP_PLA_Truck_03_transport"]] call _fnc_saveToTemplate;         // same as "vehiclesTrucks" but for milita forces
["vehiclesMilitiaCars", ["Flex_CUP_PLA_LSV_02_unarmed"]] call _fnc_saveToTemplate;           // same as "vehiclesLightUnarmed" but for milita forces

["vehiclesMilitiaAPCs", ["Flex_CUP_PLA_LSV_02_armed", "Flex_CUP_PLA_LSV_02_AT"]] call _fnc_saveToTemplate;              // Militia APCs will be used at roadblocks and attacks at first 4 war levels

["vehiclesPolice", ["Flex_CUP_PLA_LSV_02_unarmed"]] call _fnc_saveToTemplate;                // cars used by police forces

["staticMGs", ["Flex_CUP_PLA_DSHKM", "Flex_CUP_PLA_KORD_High"]] call _fnc_saveToTemplate;                     // static machine guns
["staticAT", ["Flex_CUP_PLA_Kornet"]] call _fnc_saveToTemplate;                      // static anti-tank weapons 
["staticAA", ["Flex_CUP_PLA_ZU23", "Flex_CUP_PLA_Igla_AA_pod"]] call _fnc_saveToTemplate;                      // static anti-aircraft weapons
["staticMortars", ["Flex_CUP_PLA_Mortar"]] call _fnc_saveToTemplate;                 // static mortars
["staticHowitzers", ["Flex_CUP_PLA_D30"]] call _fnc_saveToTemplate;               // static howitzers

["vehicleRadar", "Flex_CUP_PLA_Radar_System"] call _fnc_saveToTemplate;                  // vehicle with radar
["vehicleSam", "Flex_CUP_PLA_SAM_System"] call _fnc_saveToTemplate;                    // vehicle with SAM

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
["faces", ["AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_01", "AsianHead_A3_05", "AsianHead_A3_04", "AsianHead_A3_07", "AsianHead_A3_06"]] call _fnc_saveToTemplate;
["voices", ["Male01CHI", "Male02CHI", "Male03CHI"]] call _fnc_saveToTemplate;

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
    ["hgun_Rook40_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
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

_loadoutData set ["traitorUniforms", ["PLA_Combat_Uniform", "PLA_Combat_Uniform_Rolled"]];
_loadoutData set ["traitorVests", ["V_TacVest_oli"]];
_loadoutData set ["traitorHats", ["PLA_Patrol_cap"]];

_loadoutData set ["officerUniforms", ["PLA_Combat_Uniform_Rolled"]];
_loadoutData set ["officerVests", ["PLA_Vest_Rifleman_Wood"]];
_loadoutData set ["officerHats", ["PLA_Patrol_cap"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["longRangeRadios", ["PLA_Radio_Backpack"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["PLA_H_Helmet02"]];
_loadoutData set ["sniHats", ["PLA_Patrol_cap"]];

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
_sfLoadoutData set ["uniforms", ["PLA_Combat_Uniform_Rolled", "PLA_Combat_Uniform"]];
_sfLoadoutData set ["vests", ["CUP_V_CPC_communicationsbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_lightbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_weaponsbelt_rngr", "CUP_V_CPC_communications_rngr", "CUP_V_CPC_Fast_rngr", "CUP_V_CPC_light_rngr", "CUP_V_CPC_medical_rngr", "CUP_V_CPC_tl_rngr", "CUP_V_CPC_weapons_rngr"]];
_sfLoadoutData set ["helmets", ["PLA_Opscore_SF"]];
_sfLoadoutData set ["backpacks", ["PLA_Backpack_Compact", "B_Carryall_oli", "PLA_Backpack", "PLA_Radio_Backpack"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["lightATLaunchers", [
    ["launch_RPG32_F", "", "", "", ["RPG32_F"], [], ""]
]];
_sfLoadoutData set ["lightHELaunchers", [
    ["launch_RPG32_F", "", "", "", ["RPG32_HE_F"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG26", "", "", "", [], [], ""]
]];
_sfLoadoutData set ["missileATLaunchers", [
    ["launch_I_Titan_short_F", "", "", "", ["Titan_AT"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [], [], ""]
]];

_sfLoadoutData set ["slRifles", [
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],

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
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],

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
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "optic_Yorris", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "CUP_optic_ZeissZPoint", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimipara", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],

    ["arifle_CTARS_blk_F", "", "", "", ["100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_07_blk_F", "", "", "CUP_optic_LeupoldM3LR", ["20Rnd_650x39_Cased_Mag_F"], [], ""],
    ["srifle_DMR_07_blk_F", "", "", "CUP_optic_SB_11_4x20_PM", ["20Rnd_650x39_Cased_Mag_F"], [], ""],

    ["CUP_arifle_HK417_12", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_12", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M2010_blk", "", "", "optic_LRPS", ["CUP_5Rnd_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sidearms", [
    ["hgun_Rook40_F", "CUP_muzzle_snds_M9", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutDataData set ["uniforms", ["PLA_Combat_Uniform_Rolled", "PLA_Combat_Uniform"]];
_eliteLoadoutData set ["vests", ["CUP_V_CPC_communicationsbelt_rngr", "CUP_V_CPC_Fastbelt_rngr", "CUP_V_CPC_lightbelt_rngr", "CUP_V_CPC_medicalbelt_rngr", "CUP_V_CPC_tlbelt_rngr", "CUP_V_CPC_weaponsbelt_rngr", "CUP_V_CPC_communications_rngr", "CUP_V_CPC_Fast_rngr", "CUP_V_CPC_light_rngr", "CUP_V_CPC_medical_rngr", "CUP_V_CPC_tl_rngr", "CUP_V_CPC_weapons_rngr"]];
_eliteLoadoutData set ["helmets", ["PLA_Opscore_SF"]];
_eliteLoadoutData set ["backpacks", ["PLA_Backpack_Compact", "B_Carryall_oli", "PLA_Backpack", "PLA_Radio_Backpack"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_eliteLoadoutData set ["lightATLaunchers", [
    ["launch_RPG32_F", "", "", "", ["RPG32_F"], [], ""]
]];
_eliteLoadoutData set ["lightHELaunchers", [
    ["launch_RPG32_F", "", "", "", ["RPG32_HE_F"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG26", "", "", "", [], [], ""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["launch_I_Titan_short_F", "", "", "", ["Titan_AT"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],

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
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_AFG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],
    ["CUP_arifle_AK19_VG_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], [], ""],

    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_CTAR_GL_blk_F", "muzzle_snds_58_blk_F", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], ["CUP_1Rnd_HE_M203"], ""],

    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Elcan_SpecterDR_black", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_Hamr", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "optic_MRCO", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
    ["CUP_arifle_AK19_GP34_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Black", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_AK19_M", "CUP_30Rnd_556x45_Tracer_Red_AK19_M"], ["CUP_1Rnd_HE_GP25_M"], ""],

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
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "optic_Yorris", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""],
    ["CUP_smg_vityaz_vfg_top_rail", "CUP_muzzle_snds_KZRZP_AK762", "CUP_acc_LLM_black", "CUP_optic_ZeissZPoint", ["CUP_30Rnd_9x19AP_Vityaz"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimipara", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],

    ["arifle_CTARS_blk_F", "", "", "", ["100Rnd_580x42_Mag_Tracer_F"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_07_blk_F", "", "", "CUP_optic_LeupoldM3LR", ["20Rnd_650x39_Cased_Mag_F"], [], ""],
    ["srifle_DMR_07_blk_F", "", "", "CUP_optic_SB_11_4x20_PM", ["20Rnd_650x39_Cased_Mag_F"], [], ""],

    ["CUP_arifle_HK417_12", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_12", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M2010_blk", "", "", "optic_LRPS", ["CUP_5Rnd_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sidearms", [
    ["hgun_Rook40_F", "CUP_muzzle_snds_M9", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["PLA_Combat_Uniform", "PLA_Combat_Uniform_Rolled"]];
_militaryLoadoutData set ["vests", ["PLA_Vest_Rifleman_Wood", "PLA_Vest_Machinegunner_Wood", "PLA_Vest_Grenadier_Wood"]];
_militaryLoadoutData set ["backpacks", ["PLA_Backpack_Compact", "PLA_Backpack", "PLA_Radio_Backpack", "B_FieldPack_oli"]];
_militaryLoadoutData set ["helmets", ["PLA_H_Helmet01", "PLA_H_Helmet02"]];

_militaryLoadoutData set ["lightATLaunchers", [
    ["launch_RPG32_F", "", "", "", ["RPG32_F"], [], ""]
]];
_militaryLoadoutData set ["lightHELaunchers", [
    ["launch_RPG32_F", "", "", "", ["RPG32_HE_F"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG26", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],

    ["CUP_arifle_AK103_GL_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK103_GL_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK103_GL_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
    ["CUP_arifle_AK103_GL_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],
    ["arifle_CTAR_blk_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"], [], ""],

    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_CompM4", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_1P87_RIS", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_AC11704_Black", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""],
    ["CUP_arifle_AK103_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "acc_flashlight", "CUP_optic_MicroT1", ["CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK103_bakelite_M"], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["SMG_02_F", "", "", "optic_Yorris", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["SMG_02_F", "", "", "CUP_optic_MRad", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["SMG_02_F", "", "", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],

    ["CUP_smg_EVO", "", "", "optic_Yorris", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_MRad", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_arifle_RPK74_top_rail", "", "", "", ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD_top_rail", "", "", "optic_MRCO", ["CUP_10Rnd_762x54_SVD_M"], [], ""],
    ["CUP_srifle_SVD_top_rail", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_10Rnd_762x54_SVD_M"], [], ""],
    ["CUP_srifle_SVD_top_rail", "", "", "CUP_optic_LeupoldM3LR", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M40A3", "", "", "optic_DMS", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", [
    ["hgun_Rook40_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["PLA_Combat_Uniform_Rolled", "PLA_Combat_Uniform"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE", "CUP_V_C_Police_Holster"]];
_policeLoadoutData set ["helmets", ["PLA_Patrol_cap"]];

_policeLoadoutData set ["SMGs", [
    ["SMG_02_F", "", "", "optic_Yorris", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["SMG_02_F", "", "", "CUP_optic_MRad", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["SMG_02_F", "", "", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],

    ["CUP_smg_EVO", "", "", "optic_Yorris", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_MRad", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""],
    ["CUP_smg_EVO", "", "", "CUP_optic_OKP_7_rail", ["CUP_30Rnd_9x19_EVO", "30Rnd_9x21_Mag_SMG_02_Tracer_Green"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["hgun_Rook40_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["PLA_Combat_Uniform", "PLA_Combat_Uniform_Rolled"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_PASGT_OD", "CUP_V_B_PASGT_no_bags_OD"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_oli", "Flex_CUP_POL_AssaultPack", "B_TacticalPack_blk"]];
_militiaLoadoutData set ["helmets", ["CUP_H_Ger_M92", "CUP_H_Ger_M92_GG", "CUP_H_Ger_M92_GG_CF", "CUP_H_Ger_M92_GG_CB"]];

_militiaLoadoutData set ["ATLaunchers", [
    ["CUP_launch_RPG26", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["AALaunchers", [
    ["CUP_launch_9K32Strela", "", "", "", [], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["CUP_arifle_M16A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M16A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M16A1GL", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M16A1GL", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M16A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M16A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_M4A1_black", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_black", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A1GL", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_M16A1GL", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_bizon", "", "", "", ["CUP_64Rnd_9x19_Bizon_M", "CUP_64Rnd_Green_Tracer_9x19_Bizon_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_arifle_RPK74_top_rail", "", "", "", ["CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["hgun_Rook40_F", "", "", "", ["16Rnd_9x21_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["PLA_Combat_Uniform", "PLA_Combat_Uniform_Rolled"]];
_crewLoadoutData set ["vests", ["V_TacVest_oli"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PLA_Pilot_Uniform"]];
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
