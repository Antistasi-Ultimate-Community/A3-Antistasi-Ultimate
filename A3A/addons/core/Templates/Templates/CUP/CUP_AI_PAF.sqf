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

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "PAF"] call _fnc_saveToTemplate;
["spawnMarkerName", "PAF Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\Poland_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_Poland"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

//["vehiclesSDV", ["B_SDV_01_F"]] call _fnc_saveToTemplate; //used only in salvage mission and only if template has "vanilla" flag 
/// can be "B_SDV_01_F", "O_SDV_01_F" or "I_SDV_01_F"

//["vehiclesDropPod", ["SpaceshipCapsule_01_F"]] call _fnc_saveToTemplate; //used in QRF orbital and crashsite mission
/// can be a vehicle or prop like in example above(but it must have physix)

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["Flex_CUP_POL_Quadbike"]] call _fnc_saveToTemplate;			 // unarmed or armed, with 0-2 passengers
["vehiclesLightUnarmed", ["Flex_CUP_POL_nM1025_Unarmed", "Flex_CUP_POL_nM1038", "Flex_CUP_POL_nM1038_4s", "Flex_CUP_POL_LR_Transport", "Flex_CUP_POL_MRAP"]] call _fnc_saveToTemplate;		 // must be unarmed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesLightArmed", ["Flex_CUP_POL_nM1025_M240", "Flex_CUP_POL_nM1036_TOW", "Flex_CUP_POL_LR_MG", "Flex_CUP_POL_RG31E_M2", "Flex_CUP_POL_RG31_Mk19", "Flex_CUP_POL_RG31_M2"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["Flex_CUP_POL_Truck_Transport", "Flex_CUP_POL_Truck_Covered"]] call _fnc_saveToTemplate;		 // vehicle that can carry troops and cargoboxes
["vehiclesCargoTrucks", ["Flex_CUP_POL_Truck_Transport", "Flex_CUP_POL_Truck_Covered"]] call _fnc_saveToTemplate;		 // vehicle that can carry only cargoboxes
["vehiclesAmmoTrucks", ["Flex_CUP_POL_nM1038_Ammo", "Flex_CUP_POL_Truck_Ammo"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to rearm vehicles
["vehiclesRepairTrucks", ["Flex_CUP_POL_nM1038_Repair", "Flex_CUP_POL_Truck_Repair"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to repair vehicles
["vehiclesFuelTrucks", ["Flex_CUP_POL_Truck_Fuel"]] call _fnc_saveToTemplate;		 // wheeled vehicle with capability to refuel vehicles
["vehiclesMedical", ["Flex_CUP_POL_LR_Ambulance", "Flex_CUP_POL_Truck_Medical"]] call _fnc_saveToTemplate;		 // vehicle with capability to provide healing
["vehiclesLightAPCs", ["Flex_CUP_POL_APC_BRDM2_HQ", "Flex_CUP_POL_ATGM_BRDM2", "Flex_CUP_POL_APC_BRDM2"]] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", ["Flex_CUP_POL_BWP1", "Flex_CUP_POL_APC_Wheeled_01"]] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesAirborne", ["Flex_CUP_POL_APC_BRDM2_HQ", "Flex_CUP_POL_RG31E_M2", "Flex_CUP_POL_RG31_Mk19", "Flex_CUP_POL_RG31_M2"]] call _fnc_saveToTemplate;              // airborne vehicles, could be with passenger seats or just a crew 
["vehiclesIFVs", ["Flex_CUP_POL_BWP1", "Flex_CUP_POL_APC_Wheeled_01"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesTanks", ["Flex_CUP_POL_Leopard2A6", "Flex_CUP_POL_PT91", "Flex_CUP_POL_MBT_M1A2C", "Flex_CUP_POL_MBT_M1A2C_TUSK", "Flex_CUP_POL_MBT_M1A2C_TUSK_II"]] call _fnc_saveToTemplate;                 // cannon armed, heavely armored, passengers will be ignored
["vehiclesLightTanks", ["B_UGV_01_rcws_F"]] call _fnc_saveToTemplate;             // tanks with poor armor and weapons
["vehiclesAA", ["Flex_CUP_POL_ZSU23"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored

["vehiclesTransportBoats", ["Flex_CUP_POL_Boat_Transport"]] call _fnc_saveToTemplate;	// boat that can carry passengers and cargoboxes
["vehiclesGunBoats", ["CUP_B_RHIB_HIL", "CUP_B_RHIB2Turret_HIL"]] call _fnc_saveToTemplate;              // armed boat, with passengers(?)
//["vehiclesAmphibious", []] call _fnc_saveToTemplate;          // armed or unarmed wheled or tracked based vehicle with light armor(?) and passengers(?)

private _vehiclesFighters = ["Flex_CUP_POL_F35B"];

if (isClass (configFile >> "CfgPatches" >> "Flex_CUP_POL_Plus_Faction")) then {
    _vehiclesFighters append ["Flex_CUP_POL_F16A", "Flex_CUP_POL_Mig29"];
};

["vehiclesPlanesCAS", _vehiclesFighters] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", _vehiclesFighters] call _fnc_saveToTemplate;              //Will be used with ASF script, must be defined in setPlaneLoadout.
//Needs fixed gun and either rockets or missiles
["vehiclesPlanesTransport", ["Flex_CUP_POL_C130J"]] call _fnc_saveToTemplate;	//Plane that can carry passengers and cargo(?), infantry variant if availbe 
//no need for vehicle variant currently
["vehiclesPlanesGunship", ["Flex_CUP_POL_AH64", "Flex_CUP_POL_Mi24_V"]] call _fnc_saveToTemplate;     // planes like V-44X armed, AC-130 or pelican from OPTRE, used in GUNSHIP support
//probably can also be a helicopter

["vehiclesHelisLight", ["CUP_B_MH6J_USA"]] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", ["Flex_CUP_POL_Mi8AMT", "Flex_CUP_POL_Mi8AMT_medevac", "Flex_CUP_POL_AW101"]] call _fnc_saveToTemplate;        // bigger heli with more passengers. 
//Should be capable of dealing damage to ground targets without additional scripting

// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", ["CUP_B_AH6M_USA"]] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", ["Flex_CUP_POL_Mi24_V", "Flex_CUP_POL_Mi24_D", "Flex_CUP_POL_AH64"]] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesAirPatrol", ["Flex_CUP_POL_Mi8AMT", "Flex_CUP_POL_AH64"]] call _fnc_saveToTemplate;             // preferably light helicopters(armed or unarmed), used in base patrol near bases

["vehiclesArtillery", ["Flex_CUP_POL_Truck_MRL", "Flex_CUP_POL_MBT_01_arty"]] call _fnc_saveToTemplate;             // wheeled or tracked vehicle with artillery cannon or rockets
["magazines", createHashMapFromArray [
    ["Flex_CUP_POL_Truck_MRL", ["12Rnd_230mm_rockets"]],
    ["Flex_CUP_POL_MBT_01_arty", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", ["B_UAV_02_dynamicLoadout_F"]] call _fnc_saveToTemplate;                    // unmanned aerial vehicle with heavy armament
["uavsPortable", ["Flex_CUP_POL_UAV_01"]] call _fnc_saveToTemplate;                  // unmanned aerial vehicle(drone), unarmed or armed(Western Sahara style), must be able to be disassembled


//Config special vehicles
["vehiclesMilitiaLightArmed", ["Flex_CUP_POL_nM1025_M240", "Flex_CUP_POL_LR_MG", "Flex_CUP_POL_nM1036_TOW"]] call _fnc_saveToTemplate;     // same as "vehiclesLightArmed" but for milita forces
["vehiclesMilitiaTrucks", ["Flex_CUP_POL_Truck_Transport", "Flex_CUP_POL_Truck_Covered"]] call _fnc_saveToTemplate;         // same as "vehiclesTrucks" but for milita forces
["vehiclesMilitiaCars", ["Flex_CUP_POL_LR_Transport", "Flex_CUP_POL_nM1025_Unarmed"]] call _fnc_saveToTemplate;           // same as "vehiclesLightUnarmed" but for milita forces

["vehiclesMilitiaAPCs", ["Flex_CUP_POL_nM1025_M240", "Flex_CUP_POL_nM1036_TOW"]] call _fnc_saveToTemplate;              // Militia APCs will be used at roadblocks and attacks at first 4 war levels

["vehiclesPolice", ["Flex_CUP_POL_LR_Transport", "Flex_CUP_POL_nM1025_Unarmed"]] call _fnc_saveToTemplate;                // cars used by police forces

["staticMGs", ["Flex_CUP_POL_HMG_High"]] call _fnc_saveToTemplate;                     // static machine guns
["staticAT", ["Flex_CUP_POL_TOW2"]] call _fnc_saveToTemplate;                      // static anti-tank weapons 
["staticAA", ["Flex_CUP_POL_ZU23", "Flex_CUP_POL_Igla_AA_pod"]] call _fnc_saveToTemplate;                      // static anti-aircraft weapons
["staticMortars", ["Flex_CUP_POL_Mortar"]] call _fnc_saveToTemplate;                 // static mortars
["staticHowitzers", ["Flex_CUP_POL_D30"]] call _fnc_saveToTemplate;               // static howitzers

["vehicleRadar", "Flex_CUP_POL_Radar_System"] call _fnc_saveToTemplate;                  // vehicle with radar
["vehicleSam", "Flex_CUP_POL_SAM_System"] call _fnc_saveToTemplate;                    // vehicle with SAM

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
["faces", ["WhiteHead_18", "WhiteHead_05", "GreekHead_A3_07", "WhiteHead_03"]] call _fnc_saveToTemplate;
["voices", ["Male01POL", "Male02POL", "Male03POL"]] call _fnc_saveToTemplate;

["sfInsignia", ["POL_GROM_Patch"]] call _fnc_saveToTemplate;

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

_loadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M"], [], ""]
]];
_loadoutData set ["lightHELaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEDP_M"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CUP_launch_M72A6", "", "", "", [], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["CUP_launch_Igla", "", "", "", [], [], ""]
]];
_loadoutData set ["sidearms", [
    ["CUP_hgun_M17_Black", "", "CUP_acc_SF_XC1", "", ["CUP_17Rnd_9x19_M17_Black"], [], ""]
]];

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

_loadoutData set ["traitorUniforms", ["Flex_CUP_POL_BDU_Rolled_Pads"]];
_loadoutData set ["traitorVests", ["V_TacVest_oli"]];
_loadoutData set ["traitorHats", ["Flex_CUP_POL_cap"]];

_loadoutData set ["officerUniforms", ["Flex_CUP_POL_BDU_Rolled_Pads"]];
_loadoutData set ["officerVests", ["Flex_CUP_POL_Mk4_Scout"]];
_loadoutData set ["officerHats", ["Flex_CUP_POL_Beret_Army"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_Carryall_oli"]];
_loadoutData set ["longRangeRadios", ["Flex_CUP_POL_RadioBag"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["Flex_CUP_POL_Beret_Army"]];
_loadoutData set ["sniHats", ["Flex_CUP_POL_cap"]];

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
_sfLoadoutData set ["uniforms", ["Flex_CUP_POL_G2"]];
_sfLoadoutData set ["vests", ["Flex_CUP_POL_V_CarrierRigKBT_01_F", "Flex_CUP_POL_V_CarrierRigKBT_01_light_F"]];
_sfLoadoutData set ["Hvests", ["Flex_CUP_POL_V_CarrierRigKBT_01_heavy_F"]];
_sfLoadoutData set ["helmets", ["Flex_CUP_POL_Opscore_SF", "Flex_CUP_POL_Opscore_SF_Camo"]];
_sfLoadoutData set ["backpacks", ["Flex_CUP_POL_AssaultPack", "B_Carryall_oli", "B_Kitbag_rgr"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],

    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],

    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_AUG_A1", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_AUG", "CUP_30Rnd_TE1_Green_Tracer_556x45_AUG"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_AUG_A1", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_AUG", "CUP_30Rnd_TE1_Green_Tracer_556x45_AUG"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_fh_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_fh_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],

    ["CUP_smg_p90_black", "muzzle_snds_570", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Green_Tracer_P90_M"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimipara", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "", "optic_LRPS", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_M17_Black", "CUP_muzzle_snds_M9", "CUP_acc_SF_XC1", "optic_MRD_black", ["CUP_17Rnd_9x19_M17_Black"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["Flex_CUP_POL_G2"]];
_eliteLoadoutData set ["vests", ["Flex_CUP_POL_V_CarrierRigKBT_01_F", "Flex_CUP_POL_V_CarrierRigKBT_01_light_F"]];
_eliteLoadoutData set ["Hvests", ["Flex_CUP_POL_V_CarrierRigKBT_01_heavy_F"]];
_eliteLoadoutData set ["helmets", ["Flex_CUP_POL_Opscore_SF", "Flex_CUP_POL_Opscore_SF_Camo", "Flex_CUP_POL_H_HelmetHBK_F", "Flex_CUP_POL_H_HelmetHBK_chops_F", "Flex_CUP_POL_H_HelmetHBK_ear_F", "Flex_CUP_POL_H_HelmetHBK_headset_F", "Flex_CUP_POL_Opscore_No_Headset", "Flex_CUP_POL_Opscore_No_Headset_Camo", "Flex_CUP_POL_Opscore_Camo", "Flex_CUP_POL_Opscore"]];
_eliteLoadoutData set ["backpacks", ["Flex_CUP_POL_AssaultPack", "B_Carryall_oli", "B_Kitbag_rgr"]];

_eliteLoadoutData set ["slRifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],

    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],

    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],

    ["CUP_arifle_AUG_A1", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_AUG", "CUP_30Rnd_TE1_Green_Tracer_556x45_AUG"], [], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_G36A3_grip", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_AUG_A1", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_G33_HWS_BLK", ["CUP_30Rnd_556x45_AUG", "CUP_30Rnd_TE1_Green_Tracer_556x45_AUG"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""],
    ["arifle_Mk20C_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG_TA01B_RMR_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG2", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_HK416_CQB_AG36", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["arifle_Mk20_GL_plain_F", "muzzle_snds_M", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Hamr", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_Aco", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "optic_MRCO", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_G36A3_AG36", "CUP_muzzle_snds_G36_black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_fh_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_fh_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_Flashlight", "optic_Aco_smg", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],

    ["CUP_smg_p90_black", "muzzle_snds_570", "CUP_acc_Flashlight", "CUP_optic_Eotech553_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Green_Tracer_P90_M"], [], ""]
]];
_eliteLoadoutData set ["machineGuns", [
    ["CUP_lmg_minimipara", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M110_black", "CUP_muzzle_snds_M110_black", "CUP_acc_ANPEQ_2_grey", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_AWM_blk", "", "", "optic_LRPS", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sidearms", [
    ["CUP_hgun_M17_Black", "CUP_muzzle_snds_M9", "CUP_acc_SF_XC1", "optic_MRD_black", ["CUP_17Rnd_9x19_M17_Black"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["Flex_CUP_POL_BDU_Pads", "Flex_CUP_POL_BDU_Gloves_Pads", "Flex_CUP_POL_BDU_Gloves_Pads_Rolled", "Flex_CUP_POL_BDU", "Flex_CUP_POL_BDU_Gloves", "Flex_CUP_POL_BDU_Gloves_Rolled", "Flex_CUP_POL_BDU_Rolled", "Flex_CUP_POL_BDU_Rolled_Pads"]];
_militaryLoadoutData set ["vests", ["Flex_CUP_POL_Mk4_Empty", "Flex_CUP_POL_Mk4_AutomaticRifleman", "Flex_CUP_POL_Mk4_Crewman", "Flex_CUP_POL_Mk4_Grenadier", "Flex_CUP_POL_Mk4_Medic", "Flex_CUP_POL_Mk4_Officer", "Flex_CUP_POL_Mk4_Engineer", "Flex_CUP_POL_Mk4_Rifleman", "Flex_CUP_POL_Mk4_Scout"]];
_militaryLoadoutData set ["backpacks", ["Flex_CUP_POL_AssaultPack", "B_TacticalPack_oli", "B_Kitbag_rgr", "B_FieldPack_oli"]];
_militaryLoadoutData set ["helmets", ["Flex_CUP_POL_Opscore_No_Headset", "Flex_CUP_POL_Opscore_No_Headset_Camo", "Flex_CUP_POL_PASGT_Helmet"]];

_militaryLoadoutData set ["slRifles", [
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_TrijiconRx01_black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],

    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_TrijiconRx01_black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_TrijiconRx01_black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_TrijiconRx01_black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""],
    ["Flex_CUP_POL_arifle_ACR_blk", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_TrijiconRx01_black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["Flex_CUP_POL_arifle_ACR_blk_EGLM", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Black_Top", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK", "CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_UZI", "", "", "optic_Yorris", ["CUP_32Rnd_9x19_UZI_M", "CUP_72Rnd_9x19_UZI_M"], [], ""],
    ["CUP_smg_UZI", "", "", "CUP_optic_MRad", ["CUP_32Rnd_9x19_UZI_M", "CUP_72Rnd_9x19_UZI_M"], [], ""],
    ["CUP_smg_UZI", "", "", "CUP_optic_OKP_7_rail", ["CUP_32Rnd_9x19_UZI_M", "CUP_72Rnd_9x19_UZI_M"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_arifle_HK417_12", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_Flashlight", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_12", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_Flashlight", "CUP_optic_ACOG", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_12", "CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_acc_Flashlight", "CUP_optic_ACOG2", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_M17_Black", "", "", "", ["CUP_17Rnd_9x19_M17_Black"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["Flex_CUP_POL_BDU_Rolled_Pads"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["Flex_CUP_POL_Beret_MP", "Flex_CUP_POL_cap"]];

_policeLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "CUP_acc_Flashlight_MP5", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_M17_Black", "", "", "", ["CUP_17Rnd_9x19_M17_Black"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["Flex_CUP_POL_BDU_Pads", "Flex_CUP_POL_Gorka_Uniform", "Flex_CUP_POL_Gorka_Uniform_Pads"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_PASGT_OD", "CUP_V_B_PASGT_no_bags_OD"]];
_militiaLoadoutData set ["backpacks", ["B_FieldPack_oli", "Flex_CUP_POL_AssaultPack", "B_TacticalPack_blk"]];
_militiaLoadoutData set ["helmets", ["Flex_CUP_POL_PASGT_Helmet"]];

_militiaLoadoutData set ["slRifles", [
    ["CUP_arifle_Colt727", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_Colt727", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

    ["CUP_arifle_Colt727_M203", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_Colt727_M203", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_Colt727", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_Colt727", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
    ["CUP_arifle_Colt727", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_Colt727_M203", "", "acc_flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
    ["CUP_arifle_Colt727_M203", "", "acc_pointer_IR", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "optic_Yorris", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "", "", "CUP_optic_PSO_1", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_M17_Black", "", "", "", ["CUP_17Rnd_9x19_M17_Black"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["Flex_CUP_POL_BDU_Pads"]];
_crewLoadoutData set ["vests", ["Flex_CUP_POL_Mk4_Crewman"]];
_crewLoadoutData set ["helmets", ["H_Tank_eaf_F"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_B_PilotCoveralls"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetFighter_B"]];


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
