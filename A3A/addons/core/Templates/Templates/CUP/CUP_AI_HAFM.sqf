//these variables determine whether specified dlcs are loaded
private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "HAFM"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", format [localize "STR_supportcorridor", "HAFM"]] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION. Format and localize function can be used for translation

["flag", "Flag_AAF_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\A3\ui_f\data\map\markers\flags\Greece_ca.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_Greece"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", []] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["HAFM_GD240_Unarmed2", "HAFM_HMMWV1", "HAFM_VBL2"]] call _fnc_saveToTemplate; 		//this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- Array, can contain multiple assets
["vehiclesLightArmed",["HAFM_GD240_Patrol2", "HAFM_HMMWV1_M2", "HAFM_HMMWV1_Kornet", "HAFM_HMMWV1_Milan", "HAFM_HMMWV1_TOW", "HAFM_HMMWV1_MK19", "HAFM_VBL2_M50", "HAFM_VBL2_M240"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["Unimog1550_SemiCovered2", "Unimog1550_Covered2"]] call _fnc_saveToTemplate; 			//this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesCargoTrucks", ["Unimog1550_Covered2"]] call _fnc_saveToTemplate; 		//this line determines cargo trucks -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesAmmoTrucks", ["B_T_Truck_01_ammo_F"]] call _fnc_saveToTemplate; 		//this line determines ammo trucks -- Example: ["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] -- Array, can contain multiple assets
["vehiclesRepairTrucks", ["CUP_B_nM1038_Repair_NATO_T"]] call _fnc_saveToTemplate; 		//this line determines repair trucks -- Example: ["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] -- Array, can contain multiple assets
["vehiclesFuelTrucks", ["B_T_Truck_01_fuel_F"]] call _fnc_saveToTemplate;		//this line determines fuel trucks -- Array, can contain multiple assets
["vehiclesMedical", []] call _fnc_saveToTemplate;			//this line determines medical vehicles -- Array, can contain multiple assets
["vehiclesAPCs", ["Leonidas3_BLU"]] call _fnc_saveToTemplate; 				//this line determines APCs -- Example: ["vehiclesAPCs", ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F"]] -- Array, can contain multiple assets
["vehiclesTanks", ["Leopard1A4_2", "Leopard2A4_2", "Leopard2A6HEL_2", "M60A3_2"]] call _fnc_saveToTemplate; 			//this line determines tanks -- Example: ["vehiclesTanks", ["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"]] -- Array, can contain multiple assets
["vehiclesAA", ["CUP_B_nM1097_AVENGER_NATO_T"]] call _fnc_saveToTemplate; 				//this line determines AA vehicles -- Example: ["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] -- Array, can contain multiple assets
["vehiclesLightAPCs", ["CUP_B_M113A3_olive_USA", "Leonidas2_2", "blx_M1117_GR"]] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["HAFM_Naval_RHIB"]] call _fnc_saveToTemplate; 	//this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesGunBoats", ["HAFM_Naval_CB90_BLU"]] call _fnc_saveToTemplate; 			//this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- Array, can contain multiple assets
["vehiclesAmphibious", []] call _fnc_saveToTemplate; 		//this line determines amphibious vehicles  -- Example: ["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] -- Array, can contain multiple assets

["vehiclesPlanesCAS", ["A7BLU", "F4E_BLU", "M2000C_BLU", "A7BLU_TIGER", "F4E_BLU_AG"]] call _fnc_saveToTemplate; 		//this line determines CAS planes -- Example: ["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] -- Array, can contain multiple assets
["vehiclesPlanesAA", ["F16C_BLU", "F16_B52_BLU", "M2000C_BLU"]] call _fnc_saveToTemplate; 			//this line determines air supperiority planes -- Example: ["vehiclesPlanesAA", ["B_Plane_Fighter_01_F"]] -- Array, can contain multiple assets
["vehiclesPlanesTransport", ["C130H_BLU"]] call _fnc_saveToTemplate; 	//this line determines transport planes -- Example: ["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] -- Array, can contain multiple assets

["vehiclesHelisLight", ["HAFM_UH1H"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["NH90_GR2", "CH_47F_BLU", "NH90Armed_GR2"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["HAFM_Kiowa", "HAFM_Kiowa_AT"]] call _fnc_saveToTemplate;		// this line determines light attack helicopters
["vehiclesHelisAttack", ["HAFM_AH64D"]] call _fnc_saveToTemplate; 		//this line determines attack helis -- Example: ["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] -- Array, can contain multiple assets

["vehiclesAirPatrol", ["HAFM_UH1H","HAFM_Kiowa", "HAFM_Kiowa_AT"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["GR_MBT_mlrs"]] call _fnc_saveToTemplate;		//this line determines SPAs
["magazines", createHashMapFromArray [
["GR_MBT_mlrs", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;			//this line determines ammo to be used with specified SPA, hashMap makes sure that SPA gets proper ammo

["uavsAttack", []] call _fnc_saveToTemplate; 				//this line determines attack UAVs -- Example: ["uavsAttack", ["B_UAV_02_CAS_F"]] -- Array, can contain multiple assets
["uavsPortable", ["HAFM_Pegasus"]] call _fnc_saveToTemplate; 				//this line determines portable UAVs -- Example: ["uavsPortable", ["B_UAV_01_F"]] -- Array, can contain multiple assets

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["HAFM_GD240_Patrol2", "HAFM_HMMWV1_M2"]] call _fnc_saveToTemplate; //this line determines lightly armed militia vehicles -- Example: ["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaTrucks", ["Unimog1550_SemiCovered2", "Unimog1550_Covered2"]] call _fnc_saveToTemplate; 	//this line determines militia trucks (unarmed) -- Example: ["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaCars", ["HAFM_GD240_Unarmed2", "HAFM_HMMWV1"]] call _fnc_saveToTemplate; 		//this line determines militia cars (unarmed) -- Example: ["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesMilitiaAPCs", ["HAFM_HMMWV1_M2"]] call _fnc_saveToTemplate;						//this line determines militia APCs

["vehiclesPolice", ["HAFM_VBL2", "HAFM_HMMWV1"]] call _fnc_saveToTemplate; 			//this line determines police cars -- Example: ["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] -- Array, can contain multiple assets

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate; 					//this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- Array, can contain multiple assets
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate; 					//this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- Array, can contain multiple assets
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate; 					//this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- Array, can contain multiple assets
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate; 				//this line determines static mortars -- Example: ["staticMortars", ["B_Mortar_01_F"]] -- Array, can contain multiple assets
["staticHowitzers", ["CUP_B_M119_US"]] call _fnc_saveToTemplate;							//this line determines static howitzers. Basically it's just a stronger mortar, use same syntax as above.

["vehicleRadar", "B_Radar_System_01_F"] call _fnc_saveToTemplate;                  // vehicle with radar
["vehicleSam", "B_SAM_System_03_F"] call _fnc_saveToTemplate;                    // vehicle with SAM

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		//this line determines smoke-shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;		//this line determines flare shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Flare_white"] - ENTER ONLY ONE OPTION

["howitzerMagazineHE", "CUP_30Rnd_105mmHE_M119_M"] call _fnc_saveToTemplate;			//this line determines available HE-shells for the static howitzers - !needs to be compatible with the howitzer! -- same syntax as above - ENTER ONLY ONE OPTION

//Minefield definition
["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "GreekHead_A3_02",
    "GreekHead_A3_03",
    "GreekHead_A3_04",
    "GreekHead_A3_05",
    "GreekHead_A3_06",
    "GreekHead_A3_07",
    "GreekHead_A3_08",
    "GreekHead_A3_09",
    "GreekHead_A3_11",
    "GreekHead_A3_12",
    "GreekHead_A3_13",
    "GreekHead_A3_14",
    "Ioannou",
    "Mavros"
]] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;

["insignia", ["gr_flag_colored", "army_patch", "haf_patch"]] call _fnc_saveToTemplate;
["polinsignia", ["police_patch"]] call _fnc_saveToTemplate;

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

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["CUP_Mine_M"]]; 					//this line determines the AT mines which can be carried by units -- Example: ["ATMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]]; 					//this line determines the APERS mines which can be carried by units -- Example: ["APERSMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]]; 			//this line determines light explosives -- Example: ["DemoCharge_Remote_Mag"] -- Array, can contain multiple assets
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]]; 			//this line determines heavy explosives -- Example: ["SatchelCharge_Remote_Mag"] -- Array, can contain multiple assets

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67", "MiniGrenade"]]; 		//this line determines anti infantry grenades (frag and such) -- Example: ["HandGrenade", "MiniGrenade"] -- Array, can contain multiple assets
_loadoutData set ["antiTankGrenades", []]; 			//this line determines anti tank grenades. Leave empty when not available. -- Array, can contain multiple assets
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];				//this line determines map
_loadoutData set ["watches", ["ItemWatch"]];		//this line determines watch
_loadoutData set ["compasses", ["ItemCompass"]];	//this line determines compass
_loadoutData set ["radios", ["ItemRadio"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS"]];			//this line determines GPS
_loadoutData set ["NVGs", ["hafm_nvg"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["Binocular"]];		//this line determines the binoculars
_loadoutData set ["rangefinders", ["Rangefinder", "CUP_Vector21Nite", "CUP_LRTV"]];

_loadoutData set ["traitorUniforms", ["GR_Soldier_Uniform"]];		//this line determines traitor uniforms for traitor mission
_loadoutData set ["traitorVests", ["Greek_TacChestrig_camo", "Greek_Harness", "Greek_Chestrig_oli"]];			//this line determines traitor vesets for traitor mission
_loadoutData set ["traitorHats", ["Greek_Berret1"]];			//this line determines traitor headgear for traitor missions

_loadoutData set ["officerUniforms", ["GR_AO_Uniform"]];		//this line determines officer uniforms for assassination mission
_loadoutData set ["officerVests", ["Greek_A_Rig_Oil"]];			//this line determines officer vesets for assassination mission
_loadoutData set ["officerHats", ["Greek_Berret"]];	//this line determines officer headgear for assassination missions

_loadoutData set ["uniforms", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];						//don't fill this line - this is only to set the variable
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["Greek_TacChestrig_camo", "Greek_Harness", "Greek_Chestrig_oli"]];
_loadoutData set ["backpacks", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["atBackpacks", ["hafm_heavy_crossbow_bag"]];
_loadoutData set ["helmets", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slHat", ["Greek_Berret", "Greek_A_cap"]];
_loadoutData set ["sniHats", ["H_Booniehat_GR"]];

_loadoutData set ["glasses", ["None", "HAFM_Mask", "HAFM_Balaclava", "HAFM_Goggles_Badana_black", "HAFM_Goggles_Badana_BlkClear", "HAFM_Goggles_Badana_Grn", "HAFM_Goggles_Badana_GrnClear", "HAFM_Goggles_Badana_Khk", "HAFM_Goggles_Badana_KhkClear", "HAFM_Goggles_Badana_Tan", "HAFM_Goggles_Badana_TanClear"]];	//cosmetics
_loadoutData set ["goggles", ["None", "HAFM_Goggles_black", "HAFM_Goggles_Clear", "HAFM_Goggles_Green", "HAFM_Goggles_Khaki", "HAFM_Goggles_Tan"]];		//cosmetics

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
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

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["GR_A_Uniform"]];
_sfLoadoutData set ["vests", ["GR_PlateCarrier_B", "GR_PlateCarrier", "GR_PlateCarrier_camo_B"]];
_sfLoadoutData set ["Hvests", ["GR_PlateCarrier_B", "GR_PlateCarrier", "GR_PlateCarrier_camo_B"]];
_sfLoadoutData set ["backpacks", ["Greek_AssaultPack", "hafm_heavy_assault_bag", "Greek_Tactical_pack"]];
_sfLoadoutData set ["helmets", ["HAFM_tacticalHelmet", "HAFM_tacticalHelmet2", "HAFM_sealHelmet", "HAFM_sealHelmetCamo"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];

_sfLoadoutData set ["lightATLaunchers", [
["hafm_gustav", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", ["HAFM_M136_Loaded", "HAFM_M136_hp_Loaded"]];
_sfLoadoutData set ["missileATLaunchers", [
["HAFM_fgm148", "", "", "", ["hafm_fgm148_magazine_AT"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_sfLoadoutData set ["slRifles", [
["HAFM_m4dd_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_m4dd_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_m4dd_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_HK416GL", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL320_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

["HAFM_HK416GL", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL320_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

["HAFM_HK416GL", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL320_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["rifles", [
["HAFM_m4dd_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_m4dd_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_m4dd_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["CUP_arifle_HK416_CQB_Black", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK416_CQB_Black", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK416_CQB_Black", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["HAFM_HK416GL", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL320_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_M68", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

["HAFM_HK416GL", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL320_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "HAFM_Eotech_553", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

["HAFM_HK416GL", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL320_short", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "HAFM_M4_muzzle_snds_556", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""]
]];

_sfLoadoutData set ["SMGs", [
["HAFM_MP5A4", "HAFM_MP5_muzzle_snds_9mm", "HAFM_acc_flashlight_mp5", "CUP_optic_MicroT1", ["HAFM_MP5A4_Mag"], [], ""],
["HAFM_MP5A4", "HAFM_MP5_muzzle_snds_9mm", "HAFM_acc_flashlight_mp5", "CUP_optic_AC11704_Black", ["HAFM_MP5A4_Mag"], [], ""],
["HAFM_MP5A4", "HAFM_MP5_muzzle_snds_9mm", "HAFM_acc_flashlight_mp5", "CUP_optic_VortexRazor_UH1_Black", ["HAFM_MP5A4_Mag"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
["HAFM_HK21", "", "", "optic_Hamr", ["HAFM_HK21_762"], [], ""],
["HAFM_HK21", "", "", "HAFM_optic_ELCAN", ["HAFM_HK21_762"], [], ""],
["HAFM_HK21", "", "", "HAFM_acog_ard_rmr", ["HAFM_HK21_762"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "HAFM_Gem_762_muzzle", "HAFM_acc_PEQ15_side", "HAFM_M110v2_scope", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "HAFM_Gem_762_muzzle", "HAFM_acc_PEQ15_side", "HAFM_Mark_Scope", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "HAFM_Gem_762_muzzle", "HAFM_acc_PEQ15_side", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["HAFM_M110_EMPTY", "HAFM_Gem_762_muzzle", "HAFM_acc_PEQ15_side", "HAFM_M110v2_scope", ["HAFM_20rnd_M110_762"], [], "CUP_bipod_VLTOR_Modpod_black"],
["HAFM_M110_EMPTY", "HAFM_Gem_762_muzzle", "HAFM_acc_PEQ15_side", "HAFM_Mark_Scope", ["HAFM_20rnd_M110_762"], [], "CUP_bipod_VLTOR_Modpod_black"],
["HAFM_M110_EMPTY", "HAFM_Gem_762_muzzle", "HAFM_acc_PEQ15_side", "CUP_optic_SB_11_4x20_PM", ["HAFM_20rnd_M110_762"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
["HAFM_M107_EMPTY", "", "", "HAFM_scope_optic_m107", ["HAFM_10rnd_M107"], [], ""],
["HAFM_M107_EMPTY", "", "", "CUP_optic_LeupoldMk4", ["HAFM_10rnd_M107"], [], ""],
["HAFM_M107_EMPTY", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["HAFM_10rnd_M107"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["HAFM_G17C", "HAFM_MP5_muzzle_snds_9mm", "", "", ["HAFM_G17C_Mag"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["GR_Soldier_Uniform", "GR_F_NRF", "GR_A55_Uniform", "GR_A4_Uniform", "GR_A3_Uniform"]];
_eliteLoadoutData set ["slUniforms", ["GR_A3_Uniform"]];
_eliteLoadoutData set ["vests", ["GR_PlateCarrier", "GR_PlateCarrier_camo_B"]];
_eliteLoadoutData set ["Hvests", ["GR_PlateCarrier", "GR_PlateCarrier_camo_B"]];
_eliteLoadoutData set ["backpacks", ["hafm_heavy_assault_bag", "Greek_CarryAll_pack", "Greek_Tactical_pack"]];
_eliteLoadoutData set ["helmets", ["HAFM_PBR_Helmet_Bow_Green", "HAFM_PBR_Helmet_Bow", "HAFM_tacticalHelmet2", "HAFM_tacticalHelmet"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["lightATLaunchers", [
["hafm_gustav", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", ["HAFM_M136_Loaded", "HAFM_M136_hp_Loaded"]];
_eliteLoadoutData set ["missileATLaunchers", [
["HAFM_fgm148", "", "", "", ["hafm_fgm148_magazine_AT"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_eliteLoadoutData set ["slRifles", [
["HAFM_G36C", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_G36C_mag"], [], ""],
["CUP_arifle_G36A_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3_grip", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["HAFM_m4dd_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK_M27_VFG", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_G36C", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["HAFM_G36C_mag"], [], ""],
["CUP_arifle_G36A_RIS", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3_grip", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["HAFM_m4dd_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK_M27_VFG", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_G36C", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["HAFM_G36C_mag"], [], ""],
["CUP_arifle_G36A_RIS", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3_grip", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["HAFM_m4dd_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK_M27_VFG", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_G36C_M320", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_G36C_mag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A3_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A_AG36_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL320_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_HK416GL", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

["HAFM_G36C_M320", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["HAFM_G36C_mag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A3_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A_AG36_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL320_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_HK416GL", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

["HAFM_G36C_M320", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["HAFM_G36C_mag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A3_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A_AG36_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL320_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_m4ddGL_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_HK416GL", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["rifles", [
["HAFM_G36C", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_G36C_mag"], [], ""],
["CUP_arifle_G36A_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3_grip", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["HAFM_m4dd_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK_M27_VFG", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_G36C", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["HAFM_G36C_mag"], [], ""],
["CUP_arifle_G36A_RIS", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3_grip", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["HAFM_m4dd_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK_M27_VFG", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

["HAFM_G36C", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["HAFM_G36C_mag"], [], ""],
["CUP_arifle_G36A_RIS", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A3_grip", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["HAFM_m4dd_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_m4ddv5_long", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["HAFM_HK416", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], [], ""],
["CUP_arifle_HK_M27", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
["CUP_arifle_HK_M27_VFG", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["CUP_arifle_G36CA3", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3_afg", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3_grip", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_PULL", "CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Red"], [], ""],

["CUP_arifle_G36CA3", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_CompM2_low", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3_afg", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_CompM2_low", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3_grip", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_CompM2_low", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_CompM2_low", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_PULL", "CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Red"], [], ""],

["CUP_arifle_G36CA3", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_Eotech553_Black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3_afg", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_Eotech553_Black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36CA3_grip", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_Eotech553_Black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], [], ""],
["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_SCAR_L", "CUP_optic_Eotech553_Black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_PULL", "CUP_30Rnd_556x45_PMAG_BLACK_PULL_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["HAFM_G36C_M320", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_G36C_mag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A3_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_G36A_AG36_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL320_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_HK416GL", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

["HAFM_G36C_M320", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["HAFM_G36C_mag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A3_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_G36A_AG36_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL320_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_HK416GL", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

["HAFM_G36C_M320", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["HAFM_G36C_mag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_G36A3_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_G36A_AG36_RIS", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_G36K_RIS_AG36", "CUP_muzzle_mfsup_SCAR_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL320_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_m4ddGL_short", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["HAFM_HK416GL", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["hafm_mag_30Rnd_556x45_Mk318_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_M855_Stanag"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "CUP_muzzle_mfsup_SCAR_L", "HAFM_acc_PEQ15_side", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CUP_smg_MP5A5_Rail", "", "HAFM_acc_PEQ15_side", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "HAFM_acc_PEQ15_side", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "HAFM_acc_PEQ15_side", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5_Rail", "", "HAFM_acc_PEQ15_side", "CUP_optic_CompM4", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "HAFM_acc_PEQ15_side", "CUP_optic_CompM4", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "HAFM_acc_PEQ15_side", "CUP_optic_CompM4", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];

_eliteLoadoutData set ["machineGuns", [
["HAFM_M249", "", "", "CUP_optic_CompM4", ["HAFM_M249_556"], [], ""],
["CUP_lmg_m249_pip2", "", "", "CUP_optic_CompM4", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip3", "", "", "CUP_optic_CompM4", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip4", "", "", "CUP_optic_CompM4", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

["HAFM_M249", "", "", "CUP_optic_Elcan_reflex", ["HAFM_M249_556"], [], ""],
["CUP_lmg_m249_pip2", "", "", "CUP_optic_Elcan_reflex", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip3", "", "", "CUP_optic_Elcan_reflex", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip4", "", "", "CUP_optic_Elcan_reflex", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
]];

_eliteLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "", "HAFM_acc_PEQ15_side", "HAFM_M110v2_scope", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "", "HAFM_acc_PEQ15_side", "HAFM_Mark_Scope", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "", "HAFM_acc_PEQ15_side", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["HAFM_M110_EMPTY", "", "HAFM_acc_PEQ15_side", "HAFM_M110v2_scope", ["HAFM_20rnd_M110_762"], [], ""],
["HAFM_M110_EMPTY", "", "HAFM_acc_PEQ15_side", "HAFM_Mark_Scope", ["HAFM_20rnd_M110_762"], [], ""],
["HAFM_M110_EMPTY", "", "HAFM_acc_PEQ15_side", "CUP_optic_SB_11_4x20_PM", ["HAFM_20rnd_M110_762"], [], ""],

["CUP_srifle_M110_black", "", "HAFM_acc_PEQ15_side", "HAFM_M110v2_scope", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M110_black", "", "HAFM_acc_PEQ15_side", "HAFM_Mark_Scope", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M110_black", "", "HAFM_acc_PEQ15_side", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_eliteLoadoutData set ["sniperRifles", [
["CUP_srifle_M2010_blk", "", "acc_pointer_IR", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], ""],
["CUP_srifle_M2010_blk", "", "acc_pointer_IR", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], ""],
["CUP_srifle_M2010_blk", "", "acc_pointer_IR", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["HAFM_G17C", "", "", "", ["HAFM_G17C_Mag"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["GR_Soldier_Uniform", "GR_F_NRF"]];
_militaryLoadoutData set ["slUniforms", ["GR_Soldier_Uniform", "GR_F_NRF"]];
_militaryLoadoutData set ["vests", ["CUP_V_B_PASGT_no_bags_OD", "CUP_V_B_PASGT_OD"]];
_militaryLoadoutData set ["Hvests", ["CUP_V_B_PASGT_no_bags_OD", "CUP_V_B_PASGT_OD"]];
_militaryLoadoutData set ["backpacks", ["Greek_Tactical_pack", "Greek_AssaultPack"]];
_militaryLoadoutData set ["helmets", ["Greek_A_Helmet_Pasgt", "Greek_A_Helmet_Pasgt_bow", "Greek_A_Helmet_Pasgt_ess", "Greek_A_Helmet_Pasgt_ess_bow"]];
_militaryLoadoutData set ["binoculars", ["Binocular", "Rangefinder"]];

_militaryLoadoutData set ["lightATLaunchers", [
["hafm_gustav", "", "", "", ["CUP_MAAWS_HEAT_M"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", ["HAFM_M136_Loaded", "HAFM_M136_hp_Loaded"]];
_militaryLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_militaryLoadoutData set ["slRifles", [
["HAFM_G3A3", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3RIS", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3_SG", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], [], ""],
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_ris_vfg", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],

["HAFM_G3A3", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3RIS", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3_SG", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], [], ""],
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_ris_vfg", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],

["HAFM_G3A3", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3RIS", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3_SG", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], [], ""],
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_ris_vfg", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],

["HAFM_G3A3_GL", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_G3A3_GL", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], ["CUP_1Rnd_Smoke_M203"], ""],
["HAFM_G3A3_GL", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["rifles", [
["HAFM_G3A3", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3RIS", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3_SG", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], [], ""],
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_ris_vfg", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],

["HAFM_G3A3", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3RIS", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3_SG", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], [], ""],
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_ris_vfg", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],

["HAFM_G3A3", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3RIS", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], [], ""],
["HAFM_G3A3_SG", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], [], ""],
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_ris_vfg", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""],
["CUP_arifle_G3A3_modern_ris", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_762x51_G3"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["CUP_arifle_HK416_CQB_Black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
["CUP_arifle_HK416_CQB_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
["CUP_arifle_HK416_CQB_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["HAFM_G3A3_GL", "", "", "CUP_optic_Eotech553_Black", ["HAFM_20rnd_G3A3_762"], ["CUP_1Rnd_HE_M203"], ""],
["HAFM_G3A3_GL", "", "", "CUP_optic_HensoldtZO_low_RDS", ["HAFM_20rnd_G3A3_762"], ["CUP_1Rnd_HE_M203"], ""],
["HAFM_G3A3_GL", "", "", "CUP_optic_ACOG_TA31_KF", ["HAFM_20rnd_G3A3_762"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "", "CUP_optic_ZeissZPoint", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["HAFM_MP5A4", "", "", "CUP_optic_ZeissZPoint", ["HAFM_MP5A4_Mag"], [], ""],

["CUP_smg_MP5A5", "", "", "CUP_optic_MRad", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["HAFM_MP5A4", "", "", "CUP_optic_MRad", ["HAFM_MP5A4_Mag"], [], ""],

["CUP_smg_MP5A5", "", "", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["HAFM_MP5A4", "", "", "CUP_optic_AC11704_Black", ["HAFM_MP5A4_Mag"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
["HAFM_M60E4", "", "", "", ["HAFM_M60_762"], [], ""],
["CUP_lmg_M60E4_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_M60E4", "", "", "CUP_optic_RCO", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_M60E4", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_M60E4", "", "", "HAFM_Elcan_Spectre_ARD_RMR", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "", "", "HAFM_M110v2_scope", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["HAFM_M110_EMPTY", "", "", "HAFM_M110v2_scope", ["HAFM_20rnd_M110_762"], [], ""],
["CUP_srifle_m110_kac_black", "", "", "HAFM_M110v2_scope", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_militaryLoadoutData set ["sniperRifles", [
["CUP_srifle_M24_blk", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", [
["HAFM_sig226", "", "acc_flashlight_pistol", "optic_Yorris", ["HAFM_sig226_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["GR_SWAT_Uniform"]];
_policeLoadoutData set ["vests", ["GR_TacVest_Police"]];
_policeLoadoutData set ["helmets", ["Greek_P_cap", "HAFM_MYK_Helmet"]];

_policeLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["HAFM_MP5A4", "", "", "", ["HAFM_MP5A4_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["HAFM_Colt1911", "", "", "", ["HAFM_1911_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["GR_Soldier_Uniform", "GR_F_NRF"]];
_militiaLoadoutData set ["vests", ["V_TacVest_oli", "Greek_Harness", "Greek_TacChestrig_camo"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["Greek_AssaultPack", "Greek_Tactical_pack"]];
_militiaLoadoutData set ["helmets", ["Greek_A_Helmet"]];

_militiaLoadoutData set ["ATLaunchers", ["HAFM_M136_Loaded", "HAFM_M136_hp_Loaded"]];

_militiaLoadoutData set ["slRifles", [
["HAFM_M4A1", "", "", "", ["hafm_mag_30Rnd_556x45_M855_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["HAFM_M4A1_EMPTY", "", "", "", ["hafm_mag_30Rnd_556x45_M855_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

["HAFM_M4A1_M203", "", "", "", ["hafm_mag_30Rnd_556x45_M855_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_Mk318_Stanag"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["rifles", [
["HAFM_M4A1", "", "", "", ["hafm_mag_30Rnd_556x45_M855_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["HAFM_M4A1_EMPTY", "", "", "", ["hafm_mag_30Rnd_556x45_M855_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_Mk318_Stanag"], [], ""],
["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CUP_arifle_M4A1_standard_short_black", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["HAFM_M4A1_M203", "", "", "", ["hafm_mag_30Rnd_556x45_M855_Stanag", "hafm_mag_30Rnd_556x45_M855A1_Stanag", "hafm_mag_30Rnd_556x45_Mk318_Stanag"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["HAFM_MP5A4", "", "", "", ["HAFM_MP5A4_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["HAFM_M60E4", "", "", "", ["HAFM_M60_762"], [], ""],
["CUP_lmg_M60E4_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
["HAFM_M14_EMPTY", "", "", "optic_Hamr", ["HAFM_20rnd_M14_762"], [], ""],
["CUP_srifle_M14_DMR", "", "", "optic_Hamr", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["HAFM_M14_EMPTY", "", "", "optic_Hamr", ["HAFM_20rnd_M14_762"], [], ""],
["CUP_srifle_M14_DMR", "", "", "optic_Hamr", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["HAFM_sig226", "", "", "", ["HAFM_sig226_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["GR_A5_Uniform"]];
_crewLoadoutData set ["vests", ["GR_PlateCarrier"]];
_crewLoadoutData set ["helmets", ["H_HelmetCrew_I"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["GR_HeliPilot_Uniform"]];
_pilotLoadoutData set ["vests", ["Greek_Harness"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_O", "H_PilotHelmetHeli_O", "Greek_A_Pilot_Helmet"]];





/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
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
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
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
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
	["Sniper", _sniperTemplate, [], [_prefix]]
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
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
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
	["Sniper", _sniperTemplate, [], [_prefix]]
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