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

["name", "EST"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", format [localize "STR_supportcorridor", "EST"]] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION. Format and localize function can be used for translation

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\EST_Markers\Data\Marker_EST.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "Marker_EST"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", []] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["EST_Offroad_Army", "EST_Offroad_Comms_Army", "EST_Offroad_Covered_Army", "EST_Strider_Army"]] call _fnc_saveToTemplate; 		//this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- Array, can contain multiple assets
["vehiclesLightArmed",["EST_Offroad_Armed_Army", "EST_Strider_Army_HMG", "EST_Strider_Army_GMG"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["EST_Tatra_Unarmed", "EST_MTVR_Covered"]] call _fnc_saveToTemplate; 			//this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesCargoTrucks", ["EST_Tatra_Unarmed", "EST_MTVR_Covered"]] call _fnc_saveToTemplate; 		//this line determines cargo trucks -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesAmmoTrucks", ["EST_Tatra_Ammo", "EST_MTVR_Ammo"]] call _fnc_saveToTemplate; 		//this line determines ammo trucks -- Example: ["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] -- Array, can contain multiple assets
["vehiclesRepairTrucks", ["EST_Offroad_Repair_Army", "EST_Tatra_Repair", "EST_MTVR_Repair"]] call _fnc_saveToTemplate; 		//this line determines repair trucks -- Example: ["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] -- Array, can contain multiple assets
["vehiclesFuelTrucks", ["EST_Tatra_Fuel", "EST_MTVR_Fuel"]] call _fnc_saveToTemplate;		//this line determines fuel trucks -- Array, can contain multiple assets
["vehiclesMedical", ["EST_Army_Marid_Medical"]] call _fnc_saveToTemplate;			//this line determines medical vehicles -- Array, can contain multiple assets
["vehiclesAPCs", ["EST_Army_Marid"]] call _fnc_saveToTemplate; 				//this line determines APCs -- Example: ["vehiclesAPCs", ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F"]] -- Array, can contain multiple assets
["vehiclesTanks", ["EST_Army_Challenger2"]] call _fnc_saveToTemplate; 			//this line determines tanks -- Example: ["vehiclesTanks", ["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"]] -- Array, can contain multiple assets
["vehiclesLightTanks", ["EST_Army_Rhino", "EST_Army_Rhino_UP"]] call _fnc_saveToTemplate;             // tanks with poor armor and weapons
["vehiclesAA", ["EST_Avenger"]] call _fnc_saveToTemplate; 				//this line determines AA vehicles -- Example: ["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] -- Array, can contain multiple assets
["vehiclesLightAPCs", ["EST_Army_Marid_Unarmed"]] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", ["EST_Army_Mora"]] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["EST_Army_RHIB"]] call _fnc_saveToTemplate; 	//this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesGunBoats", ["EST_Navy_Speedboat_Minigun", "EST_Navy_Speedboat_HMG"]] call _fnc_saveToTemplate; 			//this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- Array, can contain multiple assets
["vehiclesAmphibious", []] call _fnc_saveToTemplate; 		//this line determines amphibious vehicles  -- Example: ["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] -- Array, can contain multiple assets

//Add FFAA Hornet Submod
private _vehiclesPlanesCAS = ["EST_Gryphon", "EST_Navy_AV8B"];
private _vehiclesPlanesAA = ["EST_Gryphon"];

if (isClass (configFile >> "CfgPatches" >> "Estraria_Hornet")) then {
    _vehiclesPlanesCAS append ["EST_Hornet", "EST_Hornet_Navy"];
    _vehiclesPlanesAA append ["EST_Hornet", "EST_Hornet_Navy"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["EST_AirForce_C130J", "EST_Navy_C130J", "EST_Army_V22_Infantry", "EST_Army_V22_RampGun", "EST_Navy_V22_Infantry", "EST_Navy_V22_RampGun"]] call _fnc_saveToTemplate; 	//this line determines transport planes -- Example: ["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] -- Array, can contain multiple assets

["vehiclesHelisLight", ["EST_Hellcat_Unarmed"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["EST_Army_Mohawk", "EST_Navy_Puma_HC1", "EST_Navy_Puma_HC2"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["EST_Hellcat_Armed"]] call _fnc_saveToTemplate;		// this line determines light attack helicopters
["vehiclesHelisAttack", ["EST_Blackfoot_Army", "EST_Blackfoot_Navy"]] call _fnc_saveToTemplate; 		//this line determines attack helis -- Example: ["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] -- Array, can contain multiple assets

["vehiclesArtillery", []] call _fnc_saveToTemplate;		//this line determines SPAs
["magazines", createHashMapFromArray []] call _fnc_saveToTemplate;			//this line determines ammo to be used with specified SPA, hashMap makes sure that SPA gets proper ammo

["uavsAttack", ["EST_AirForce_MQ4", "EST_AirForce_MQ9", "EST_Navy_UCAV"]] call _fnc_saveToTemplate; 				//this line determines attack UAVs -- Example: ["uavsAttack", ["B_UAV_02_CAS_F"]] -- Array, can contain multiple assets
["uavsPortable", ["EST_Army_Darter"]] call _fnc_saveToTemplate; 				//this line determines portable UAVs -- Example: ["uavsPortable", ["B_UAV_01_F"]] -- Array, can contain multiple assets

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["EST_Offroad_Armed_Army"]] call _fnc_saveToTemplate; //this line determines lightly armed militia vehicles -- Example: ["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaTrucks", ["EST_Tatra_Unarmed", "EST_MTVR_Covered"]] call _fnc_saveToTemplate; 	//this line determines militia trucks (unarmed) -- Example: ["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaCars", ["EST_Offroad_Army_MP", "EST_Offroad_Comms_Army_MP", "EST_Offroad_Covered_Army_MP", "EST_Offroad_Army_MP_Beacon"]] call _fnc_saveToTemplate; 		//this line determines militia cars (unarmed) -- Example: ["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesMilitiaAPCs", ["EST_Army_MP_Marid"]] call _fnc_saveToTemplate;						//this line determines militia APCs

["vehiclesPolice", ["EST_Offroad_Police", "EST_Offroad_Comms_Police", "EST_Offroad_Covered_Police", "EST_Offroad_Police_Detective", "EST_Offroad_Comms_Police_Detective", "EST_Offroad_Covered_Police_Detective", "EST_Van_Cargo_Police", "EST_Van_Transport_Police"]] call _fnc_saveToTemplate; 			//this line determines police cars -- Example: ["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] -- Array, can contain multiple assets

["vehicleRadar", "EST_AirForce_Static_Radar"] call _fnc_saveToTemplate;                  // vehicle with radar
["vehicleSam", "EST_AirForce_Static_SAM"] call _fnc_saveToTemplate;                    // vehicle with SAM

["staticMGs", ["EST_Army_M2_Raised"]] call _fnc_saveToTemplate; 					//this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- Array, can contain multiple assets
["staticAT", ["CUP_B_TOW2_TriPod_USMC"]] call _fnc_saveToTemplate; 					//this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- Array, can contain multiple assets
["staticAA", ["CUP_B_Stinger_AA_pod_Base_USMC"]] call _fnc_saveToTemplate; 					//this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- Array, can contain multiple assets
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate; 				//this line determines static mortars -- Example: ["staticMortars", ["B_Mortar_01_F"]] -- Array, can contain multiple assets
["staticHowitzers", ["EST_Army_M119A2_Turret"]] call _fnc_saveToTemplate;							//this line determines static howitzers. Basically it's just a stronger mortar, use same syntax as above.

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
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG","CUP_D_Male01_EN","CUP_D_Male02_EN","CUP_D_Male03_EN","CUP_D_Male04_EN","CUP_D_Male05_EN","Male01ENGB","Male02ENGB","Male03ENGB","Male04ENGB","Male05ENGB","CUP_D_Male01_GB_BAF","CUP_D_Male02_GB_BAF","CUP_D_Male03_GB_BAF","CUP_D_Male04_GB_BAF","CUP_D_Male05_GB_BAF"]] call _fnc_saveToTemplate;

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
_loadoutData set ["NVGs", ["CUP_NVG_1PN138", "CUP_NVG_PVS15_black", "CUP_NVG_PVS15_green", "CUP_NVG_PVS7", "CUP_NVG_PVS14", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_HMNVS"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["Binocular"]];		//this line determines the binoculars
_loadoutData set ["rangefinders", ["Rangefinder", "CUP_LRTV"]];

_loadoutData set ["traitorUniforms", ["EST_CombatUni_Woodland_GreenTee", "EST_CombatUni_Woodland_BrownTee", "EST_CombatUni_Woodland_BlackTee"]];		//this line determines traitor uniforms for traitor mission
_loadoutData set ["traitorVests", ["V_TacVest_blk", "V_TacVest_oli", "V_Chestrig_oli", "V_Chestrig_blk"]];			//this line determines traitor vesets for traitor mission
_loadoutData set ["traitorHats", ["EST_Cap_Woodland","EST_PatrolCap_Woodland"]];			//this line determines traitor headgear for traitor missions

_loadoutData set ["officerUniforms", ["EST_Police_CombatUni_CIT", "EST_Police_CombatUni_CIT_Rolled"]];		//this line determines officer uniforms for assassination mission
_loadoutData set ["officerVests", ["V_Rangemaster_belt", "Tac_Vest_EST_Police"]];			//this line determines officer vesets for assassination mission
_loadoutData set ["officerHats", ["EST_Beret_Main", "EST_PatrolCap_Police", "EST_PatrolCap_Woodland"]];	//this line determines officer headgear for assassination missions

_loadoutData set ["uniforms", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];						//don't fill this line - this is only to set the variable
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["CUP_V_B_RRV_Scout", "CUP_V_B_RRV_Scout2", "CUP_V_B_RRV_Scout3_GRN", "Tac_Vest_EST_Woodland"]];
_loadoutData set ["backpacks", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", ["Carryall_EST_Olive", "Carryall_EST_Woodland"]];
_loadoutData set ["helmets", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slHat", ["EST_Beret_Main", "EST_Beret_Army", "EST_Beret_AirForce", "EST_Beret_Navy"]];
_loadoutData set ["sniHats", ["EST_Boonie_Woodland", "EST_Boonie_Woodland_Headset", "EST_Cap_Headphones_Woodland"]];

_loadoutData set ["glasses", ["None", "BVC_Glasses_Ballistic_Black_Blue", "BVC_Glasses_Ballistic_Black_Clear", "BVC_Glasses_Ballistic_Black_Orange", "BVC_Glasses_Ballistic_Black_Tint", "BVC_Glasses_Ballistic_Black_White", "BVC_Glasses_Ballistic_Black_Yellow", "BVC_Bandana_Black", "BVC_Bandana_Sport_Black", "BVC_Bandana_Green", "BVC_Bandana_Sport_Green", "BVC_Sport_Black"]];	//cosmetics
_loadoutData set ["goggles", ["None", "BVC_Balaclava_Black", "BVC_Balaclava2_Black", "BVC_Balaclava3_Black", "BVC_Balaclava4_Black", "BVC_Balaclava5_Black", "BVC_Balaclava6_Black", "BVC_Balaclava7_Black", "BVC_Balaclava_Green", "BVC_Balaclava2_Green", "BVC_Balaclava3_Green", "BVC_Balaclava4_Green", "BVC_Balaclava5_Green", "BVC_Balaclava6_Green", "BVC_Balaclava7_Green"]];		//cosmetics

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
_sfLoadoutData set ["uniforms", ["EST_Army_CombatUni_Black", "EST_Army_CombatUni_Black_Rolled", "EST_CombatUni_Black_BlackTee", "EST_CombatUni_Black_Polo_Black"]];
_sfLoadoutData set ["vests", ["GA_Carrier_Rig_EST_Black", "GA_Carrier_Lite_EST_Black_Trygon", "GA_Carrier_Lite_EST_Black"]];
_sfLoadoutData set ["Hvests", ["GA_Carrier_GL_EST_Black"]];
_sfLoadoutData set ["backpacks", ["Assaultpack_EST_Black", "Assaultpack_Special_EST_WelpYoureHere", "Carryall_EST_Black", "Fieldpack_EST_Black", "Kitbag_EST_Black", "Kitbag_EST_Black_Medic"]];
_sfLoadoutData set ["helmets", ["EST_EnhancedCombatHelmet_Black", "EST_EnhancedCombatHelmet_Black_Unmarked"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];

_sfLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], [], ""],
["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", ["CUP_launch_NLAW"]];
_sfLoadoutData set ["missileATLaunchers", [
["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_sfLoadoutData set ["slRifles", [
["CUP_arifle_Mk16_STD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_STD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_STD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["rifles", [
["CUP_arifle_Mk16_STD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_STD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_STD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["CUP_arifle_Mk16_CQC_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_CQC_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk16_CQC_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_AFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_FG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_SFG_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_Mk16_STD_EGLM_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_SCAR_H", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""]
]];

_sfLoadoutData set ["SMGs", [
["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_MRad", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
["CUP_lmg_Mk48", "", "CUP_acc_LLM_black", "CUP_optic_Elcan_SpecterDR_KF_RMR_black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_Mk48_nohg", "", "CUP_acc_LLM_black", "CUP_optic_Elcan_SpecterDR_KF_RMR_black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],

["CUP_lmg_Mk48", "", "CUP_acc_LLM_black", "CUP_optic_ACOG_TA01NSN_RMR_Black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_Mk48_nohg", "", "CUP_acc_LLM_black", "CUP_optic_ACOG_TA01NSN_RMR_Black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],

["CUP_lmg_Mk48", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_Mk48_nohg", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
["CUP_srifle_M107_Base", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Base", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Base", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],

["CUP_srifle_M107_Pristine", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "CUP_muzzle_mfsup_Suppressor_M107_Black", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "", "", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_10Rnd_127x99_M107"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["CUP_hgun_M17_Black", "CUP_muzzle_snds_M9", "CUP_acc_SF_XC1", "", ["CUP_21Rnd_9x19_M17_Black"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["EST_Army_CombatUni_Woodland", "EST_Army_CombatUni_Woodland_BrownTop", "EST_Army_CombatUni_Woodland_BrownTop_Rolled", "EST_Army_CombatUni_Woodland_GreenTop", "EST_Army_CombatUni_Woodland_GreenTop_Rolled", "EST_Army_CombatUni_Woodland_BlackTop", "EST_Army_CombatUni_Woodland_BlackTop_Rolled", "EST_Army_CombatUni_Woodland_Rolled", "EST_CombatUni_Green", "EST_CombatUni_Green_Rolled"]];
_eliteLoadoutData set ["slUniforms", ["U_I_OfficerUniform"]];
_eliteLoadoutData set ["vests", ["GA_Carrier_Lite_EST_Woodland", "GA_Carrier_Lite_EST_Woodland_Shiza", "GA_Carrier_Lite_EST_Woodland_Townshend", "GA_Carrier_Rig_EST_Woodland", "GA_Carrier_Rig_EST_Woodland_Grillbone", "GA_Carrier_Rig_EST_Woodland_ThePieGuy"]];
_eliteLoadoutData set ["Hvests", ["GA_Carrier_GL_EST_Woodland"]];
_eliteLoadoutData set ["backpacks", ["Assaultpack_EST_Woodland", "Assaultpack_Special_EST_Blarcy", "Assaultpack_Special_EST_CovaX", "Assaultpack_Special_EST_Wood_Flag", "Assaultpack_Special_EST_Wood_FlagLowVis", "Assaultpack_Special_EST_Grillbone", "Assaultpack_Special_EST_Shiza", "Assaultpack_Special_EST_ThePieGuy", "Assaultpack_Special_EST_Townshend", "Assaultpack_Special_EST_Trygon", "Carryall_EST_Woodland", "Fieldpack_EST_Woodland", "Kitbag_EST_Woodland", "Kitbag_EST_Woodland_Medic"]];
_eliteLoadoutData set ["helmets", ["EST_EnhancedCombatHelmet_Woodland", "EST_EnhancedCombatHelmet_Black_Unmarked", "EST_EnhancedCombatHelmet_Green", "EST_EnhancedCombatHelmet_Black"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV"]];

_eliteLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], [], ""],
["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", ["CUP_launch_NLAW"]];
_eliteLoadoutData set ["missileATLaunchers", [
["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_eliteLoadoutData set ["slRifles", [
["CUP_arifle_Mk16_STD_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_Black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27_VFG", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_Black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27_VFG", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27_VFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK_M27_AG36", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["rifles", [
["CUP_arifle_Mk16_STD_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_Black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27_VFG", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_Black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27_VFG", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_HK_M27_VFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["CUP_arifle_Mk16_CQC_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_CQB_Black", "", "CUP_acc_LLM_black", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_CQC_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_CQB_Black", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],

["CUP_arifle_Mk16_CQC_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk16_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK416_CQB_Black", "", "CUP_acc_LLM_black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_Mk16_STD_EGLM_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "", "CUP_acc_LLM_black", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk16_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK_M27_AG36", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Yellow"], ["CUP_1Rnd_HEDP_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "CUP_optic_MRad", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MRad", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "CUP_optic_MRad", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""]
]];


_eliteLoadoutData set ["machineGuns", [
["CUP_lmg_Mk48", "", "CUP_acc_LLM_black", "CUP_optic_Elcan_SpecterDR_KF_RMR_black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_Mk48_nohg", "", "CUP_acc_LLM_black", "CUP_optic_Elcan_SpecterDR_KF_RMR_black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],

["CUP_lmg_Mk48", "", "CUP_acc_LLM_black", "CUP_optic_ACOG_TA01NSN_RMR_Black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_Mk48_nohg", "", "CUP_acc_LLM_black", "CUP_optic_ACOG_TA01NSN_RMR_Black", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],

["CUP_lmg_Mk48", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""],
["CUP_lmg_Mk48_nohg", "", "CUP_acc_LLM_black", "CUP_optic_HensoldtZO", ["CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""]
]];

_eliteLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_srifle_RSASS_Black", "", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_RSASS_Black", "", "CUP_acc_LLM_black", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_RSASS_Black", "", "CUP_acc_LLM_black", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_B_M110", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_eliteLoadoutData set ["sniperRifles", [
["CUP_srifle_M2010_blk", "", "acc_pointer_IR", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M2010_blk", "", "acc_pointer_IR", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M2010_blk", "", "acc_pointer_IR", "CUP_optic_LeupoldMk4_25x50_LRT", ["CUP_5Rnd_762x67_M2010_M", "CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sidearms", [
["CUP_hgun_M17_Black", "", "CUP_acc_SF_XC1", "", ["CUP_21Rnd_9x19_M17_Black"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["EST_Army_CombatUni_Woodland", "EST_Army_CombatUni_Woodland_BrownTop", "EST_Army_CombatUni_Woodland_BrownTop_Rolled", "EST_Army_CombatUni_Woodland_GreenTop", "EST_Army_CombatUni_Woodland_GreenTop_Rolled", "EST_Army_CombatUni_Woodland_Rolled", "EST_CombatUni_Green", "EST_CombatUni_Green_Rolled", "EST_CombatUni_Woodland_Polo_Green", "EST_CombatUni_Woodland_Polo_Tan"]];
_militaryLoadoutData set ["slUniforms", ["EST_Army_CombatUni_Woodland"]];
_militaryLoadoutData set ["vests", ["CUP_V_B_PASGT_no_bags_OD", "CUP_V_B_PASGT_OD"]];
_militaryLoadoutData set ["Hvests", ["CUP_V_B_PASGT_no_bags_OD", "CUP_V_B_PASGT_OD"]];
_militaryLoadoutData set ["backpacks", ["Assaultpack_EST_Olive", "Assaultpack_EST_Woodland", "Assaultpack_Special_EST_Blarcy", "Assaultpack_Special_EST_CovaX", "Assaultpack_Special_EST_Wood_Flag", "Assaultpack_Special_EST_Wood_FlagLowVis", "Assaultpack_Special_EST_Grillbone", "Assaultpack_Special_EST_Shiza", "Assaultpack_Special_EST_ThePieGuy", "Assaultpack_Special_EST_Townshend", "Assaultpack_Special_EST_Trygon", "Fieldpack_EST_Olive", "Fieldpack_EST_Woodland", "Kitbag_EST_Olive", "Kitbag_EST_Olive_Medic", "Kitbag_EST_Woodland", "Kitbag_EST_Woodland_Medic"]];
_militaryLoadoutData set ["helmets", ["EST_CombatHelmet_Woodland", "EST_CombatHelmet_Green", "EST_CombatHelmetLight_Woodland", "EST_CombatHelmetLight_Green"]];
_militaryLoadoutData set ["binoculars", ["Rangefinder"]];

_militaryLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", ["CUP_launch_M136"]];
_militaryLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_militaryLoadoutData set ["slRifles", [
["ACR_EST_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_EST_Woodland", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_EST_Wood", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_EST_Black", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_EST_Woodland", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_Black", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_EST_Wood", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_EST_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_EST_Woodland", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_EST_Wood", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_EGLM_EST_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["ACR_EGLM_EST_Woodland", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["TRG21_GL_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["TRG21_GL_EST_Wood", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],

["ACR_EGLM_EST_Black", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["ACR_EGLM_EST_Woodland", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["TRG21_GL_Black", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["TRG21_GL_EST_Wood", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],

["ACR_EGLM_EST_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["ACR_EGLM_EST_Woodland", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["TRG21_GL_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["TRG21_GL_EST_Wood", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["rifles", [
["ACR_EST_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_EST_Woodland", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_Black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_EST_Wood", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_EST_Black", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_EST_Woodland", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_Black", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_EST_Wood", "", "", "CUP_optic_ACOG_TA31_KF", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_EST_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_EST_Woodland", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG21_EST_Wood", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["ACR_C_EST_Black", "", "", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_C_EST_Woodland", "", "", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG20_Black", "", "", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG20_EST_Wood", "", "", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_C_EST_Black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_C_EST_Woodland", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG20_Black", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG20_EST_Wood", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],

["ACR_C_EST_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["ACR_C_EST_Woodland", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG20_Black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""],
["TRG20_EST_Wood", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["ACR_EGLM_EST_Black", "", "", "CUP_optic_MARS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_EGLM_EST_Woodland", "", "", "CUP_optic_MARS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["TRG21_GL_Black", "", "", "CUP_optic_MARS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["TRG21_GL_EST_Wood", "", "", "CUP_optic_MARS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_C_EGLM_EST_Black", "", "", "CUP_optic_MARS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_C_EGLM_EST_Woodland", "", "", "CUP_optic_MARS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],

["ACR_EGLM_EST_Black", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_EGLM_EST_Woodland", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["TRG21_GL_Black", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["TRG21_GL_EST_Wood", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_C_EGLM_EST_Black", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_C_EGLM_EST_Woodland", "", "", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],  

["ACR_EGLM_EST_Black", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_EGLM_EST_Woodland", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["TRG21_GL_Black", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["TRG21_GL_EST_Wood", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_C_EGLM_EST_Black", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""],
["ACR_C_EGLM_EST_Woodland", "", "", "CUP_optic_MicroT1_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_smg_p90_black", "", "", "CUP_optic_AC11704_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["CUP_smg_p90_olive", "", "", "CUP_optic_AC11704_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03C_TR_black", "", "", "CUP_optic_AC11704_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03_TR_black", "", "", "CUP_optic_AC11704_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],

["CUP_smg_p90_black", "", "", "CUP_optic_Eotech553_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["CUP_smg_p90_olive", "", "", "CUP_optic_Eotech553_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03C_TR_black", "", "", "CUP_optic_Eotech553_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03_TR_black", "", "", "CUP_optic_Eotech553_Black", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],

["CUP_smg_p90_black", "", "", "CUP_optic_MARS", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["CUP_smg_p90_olive", "", "", "CUP_optic_MARS", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03C_TR_black", "", "", "CUP_optic_MARS", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03_TR_black", "", "", "CUP_optic_MARS", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],

["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""],
["SMG_03_black", "", "", "", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
["CUP_lmg_m249_pip3", "", "", "CUP_optic_HensoldtZO_low", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip2", "", "", "CUP_optic_HensoldtZO_low", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip3", "", "", "optic_Hamr", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip2", "", "", "optic_Hamr", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip3", "", "", "v", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["CUP_lmg_m249_pip2", "", "", "CUP_optic_Eotech553_Black", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],

["CUP_lmg_m249_para", "", "", "", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
["ACR_DMR_EST_Black", "", "", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], "CUP_bipod_VLTOR_Modpod_black"],
["ACR_DMR_EST_Woodland", "", "", "optic_MRCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], "CUP_bipod_VLTOR_Modpod_black"],

["ACR_DMR_EST_Black", "", "", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], "CUP_bipod_VLTOR_Modpod_black"],
["ACR_DMR_EST_Woodland", "", "", "optic_Hamr", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], "CUP_bipod_VLTOR_Modpod_black"],

["ACR_DMR_EST_Black", "", "", "CUP_optic_RCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], "CUP_bipod_VLTOR_Modpod_black"],
["ACR_DMR_EST_Woodland", "", "", "CUP_optic_RCO", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Yellow"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_militaryLoadoutData set ["sniperRifles", [
["CUP_srifle_M40A3", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M40A3", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", [
["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["EST_Police_CombatUni_CIT", "EST_Police_CombatUni_CIT_Rolled", "EST_Outfit_Police_05", "EST_Outfit_Police_06", "EST_Outfit_Police_03", "EST_Outfit_Police_04"]];
_policeLoadoutData set ["vests", ["Tac_Vest_EST_Police"]];
_policeLoadoutData set ["helmets", ["EST_PatrolCap_Police"]];

_policeLoadoutData set ["SMGs", [
["CUP_smg_EVO", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_EVO"], [], ""],
["SMG_02_F", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_EVO"], [], ""],

["CUP_smg_EVO", "", "CUP_acc_ANPEQ_2_grey", "", ["CUP_30Rnd_9x19_EVO"], [], ""],
["SMG_02_F", "", "CUP_acc_ANPEQ_2_grey", "", ["CUP_30Rnd_9x19_EVO"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["EST_CombatUni_Green", "EST_CombatUni_Green_Rolled"]];
_militiaLoadoutData set ["vests", ["Tac_Vest_EST_MP", "Tac_Vest_EST_Woodland"]];
_militiaLoadoutData set ["Hvests", ["Tac_Vest_EST_MP", "Tac_Vest_EST_Woodland"]];
_militiaLoadoutData set ["backpacks", ["Assaultpack_EST_Olive", "Assaultpack_EST_Black", "Fieldpack_EST_Black", "Fieldpack_EST_Olive"]];
_militiaLoadoutData set ["helmets", ["EST_CombatHelmetLight_Green", "EST_CombatHelmetLight_MP"]];

_militiaLoadoutData set ["ATLaunchers", ["CUP_launch_M136"]];

_militiaLoadoutData set ["slRifles", [
["CUP_arifle_M4A1_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A1_standard_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A3_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["rifles", [
["CUP_arifle_M4A1_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A1_standard_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A1", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["CUP_arifle_M4A3_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CUP_arifle_M4A1_standard_short_black", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_M4A1_BUIS_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SMG_03C_black", "", "", "", ["50Rnd_570x28_SMG_03", "CUP_50Rnd_570x28_Yellow_Tracer_P90_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["CUP_lmg_M249_E1", "", "", "", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""],
["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
["ACR_DMR_EST_Black", "", "", "optic_Hamr", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["ACR_DMR_EST_Woodland", "", "", "optic_Hamr", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],

["ACR_DMR_EST_Black", "", "", "optic_MRCO", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""],
["ACR_DMR_EST_Woodland", "", "", "optic_MRCO", ["CUP_30Rnd_556x45_Stanag_Mk16_black", "CUP_30Rnd_556x45_Stanag_Mk16_black_Tracer_Yellow"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["CUP_srifle_M24_blk", "", "", "optic_LRPS", ["CUP_5Rnd_762x51_M24"], [], ""],
["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["EST_CombatUni_Green", "EST_CombatUni_Green_Rolled"]];
_crewLoadoutData set ["vests", ["Rangemaster_Belt_Black", "Tac_Vest_EST_Woodland", "V_TacVest_oli"]];
_crewLoadoutData set ["helmets", ["EST_CrewHelmet_Olive", "EST_CrewHelmet_Woodland"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["EST_Army_HeliFlightSuit"]];
_pilotLoadoutData set ["vests", ["Rangemaster_Belt_Black"]];
_pilotLoadoutData set ["helmets", ["EST_HeliCrewHelmet_EA", "EST_HeliCrewHelmet_EA_Eyes", "EST_HeliCrewHelmet_EA_Fazbear", "EST_HeliCrewHelmet_EA_Flag", "EST_HeliCrewHelmet_EA_Man", "EST_HeliPilotHelmet_EA", "EST_HeliPilotHelmet_EA_Eyes", "EST_HeliPilotHelmet_EA_Flag"]];





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