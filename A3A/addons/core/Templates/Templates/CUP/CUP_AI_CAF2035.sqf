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

["name", "CAF"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", format [localize "STR_supportcorridor", "CAF"]] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION. Format and localize function can be used for translation

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\A3\ui_f\data\map\markers\flags\Canada_ca.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_Canada"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_W_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_A_NATO_Equip_wdl_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["PUP_CAF_QuadBike_01_F"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["PUP_CAF_LSV_01_unarmed_F", "PUP_CAF_LSV_01_light_F", "PUP_CAF_MRAP_03_F", "B_W_MRAP_01_F", "B_T_MRAP_01_F", "B_W_LSV_01_unarmed_F", "B_W_LSV_01_light_F", "CUP_B_nM1151_Unarmed_NATO_T"]] call _fnc_saveToTemplate; 		//this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- Array, can contain multiple assets
["vehiclesLightArmed",["PUP_CAF_LSV_01_armed_F", "PUP_CAF_LSV_01_AT_F", "B_W_LSV_01_armed_F", "B_W_LSV_01_AT_F", "CUP_B_nM1151_ogpk_m2_NATO_T", "CUP_B_nM1151_ogpk_m240_NATO_T", "CUP_B_nM1151_ogpk_mk19_NATO_T", "PUP_CAF_MRAP_03_hmg_F", "PUP_CAF_MRAP_03_gmg_F", "B_T_MRAP_01_hmg_F", "B_T_MRAP_01_gmg_F", "B_W_MRAP_01_hmg_F", "B_W_MRAP_01_gmg_F"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["PUP_CAF_Truck_01_transport_F", "PUP_CAF_Truck_01_covered_F"]] call _fnc_saveToTemplate; 			//this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesCargoTrucks", ["PUP_CAF_Truck_01_cargo_F"]] call _fnc_saveToTemplate; 		//this line determines cargo trucks -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesAmmoTrucks", ["PUP_CAF_Truck_01_ammo_F"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["PUP_CAF_Truck_01_Repair_F"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["PUP_CAF_Truck_01_fuel_F"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["PUP_CAF_Truck_01_medical_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["PUP_CAF_APC_Tracked_01_CRV_F"]] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate; //This is just for my own enjoyment. I'm not exactly following the CAF equipment to a T.
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate; //This is just for my own enjoyment. I'm not exactly following the CAF equipment to a T.
["vehiclesAA", ["PUP_CAF_APC_Tracked_01_AA_F", "CUP_B_nM1097_AVENGER_USMC_WDL"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["PUP_CAF_APC_Wheeled_01_cannon_v2_F", "CUP_B_M1126_ICV_M2_Woodland", "CUP_B_M1126_ICV_MK19_Woodland", "CUP_B_M1130_CV_M2_Woodland"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["CUP_B_LAV25_green", "CUP_B_LAV25M240_green"]] call _fnc_saveToTemplate;


private _vehiclesLightTanks = ["CUP_B_M1128_MGS_Woodland", "B_T_UGV_01_rcws_olive_F"];

if (isClass (configFile >> "CfgPatches" >> "QAV_Ripsaw")) then {
    _vehiclesLightTanks append ["qav_ripsaw_Mk44"];
};

private _vehiclesTanks = ["PUP_CAF_MBT_03_cannon_F"];

if (isClass (configFile >> "CfgPatches" >> "QAV_AbramsX")) then {
    _vehiclesTanks append ["qav_abramsx"];
};

["vehiclesTransportBoats", ["B_Boat_Transport_01_F", "B_GEN_Boat_Transport_02_F"]] call _fnc_saveToTemplate; 	//this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F", "CUP_B_RHIB_USMC", "CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate; 			//this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- Array, can contain multiple assets
["vehiclesAmphibious", ["PUP_CAF_APC_Wheeled_01_cannon_v2_F", "CUP_B_LAV25_green", "CUP_B_LAV25M240_green"]] call _fnc_saveToTemplate; 		//this line determines amphibious vehicles  -- Example: ["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] -- Array, can contain multiple assets

["vehiclesPlanesCAS", ["PUP_CAF_Plane_Fighter_04_F", "PUP_CAF_Plane_Fighter_05_F"]] call _fnc_saveToTemplate; 		//this line determines CAS planes -- Example: ["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] -- Array, can contain multiple assets
["vehiclesPlanesAA", ["PUP_CAF_Plane_Fighter_04_F", "PUP_CAF_Plane_Fighter_05_F", "PUP_CAF_Plane_Fighter_05_Stealth_F"]] call _fnc_saveToTemplate; 			//this line determines air supperiority planes -- Example: ["vehiclesPlanesAA", ["B_Plane_Fighter_01_F"]] -- Array, can contain multiple assets
["vehiclesPlanesTransport", ["PUP_CAF_Plane_Transport_01_infantry_F"]] call _fnc_saveToTemplate; 	//this line determines transport planes -- Example: ["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] -- Array, can contain multiple assets

["vehiclesHelisLight", ["B_T_Heli_light_01_F"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["PUP_CAF_Heli_Transport_03_F", "PUP_CAF_Heli_Transport_02_F"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["B_T_Heli_Light_01_dynamicLoadout_F"]] call _fnc_saveToTemplate;		// this line determines light attack helicopters
["vehiclesHelisAttack", ["PUP_CAF_Heli_Attack_03_F"]] call _fnc_saveToTemplate; 		//this line determines attack helis -- Example: ["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] -- Array, can contain multiple assets

["vehiclesArtillery", ["PUP_CAF_MBT_01_arty_F", "CUP_B_M119_USMC"]] call _fnc_saveToTemplate;		//this line determines SPAs
["magazines", createHashMapFromArray [
["PUP_CAF_MBT_01_arty_F", ["32Rnd_155mm_Mo_shells"]],
["CUP_B_M119_USMC",["CUP_30Rnd_105mmHE_M119_M"]]
]] call _fnc_saveToTemplate;			//this line determines ammo to be used with specified SPA, hashMap makes sure that SPA gets proper ammo

["uavsAttack", ["PUP_CAF_UAV_02_dynamicLoadout_F", "B_T_UAV_03_dynamicLoadout_F"]] call _fnc_saveToTemplate; 				//this line determines attack UAVs -- Example: ["uavsAttack", ["B_UAV_02_CAS_F"]] -- Array, can contain multiple assets
["uavsPortable", ["PUP_CAF_UAV_01_F"]] call _fnc_saveToTemplate; 				//this line determines portable UAVs -- Example: ["uavsPortable", ["B_UAV_01_F"]] -- Array, can contain multiple assets

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["PUP_CAF_LSV_01_armed_F", "PUP_CAF_LSV_01_AT_F", "B_W_LSV_01_armed_F", "B_W_LSV_01_AT_F", "CUP_B_nM1151_ogpk_m2_NATO_T", "CUP_B_nM1151_ogpk_m240_NATO_T", "CUP_B_nM1151_ogpk_mk19_NATO_T"]] call _fnc_saveToTemplate; //this line determines lightly armed militia vehicles -- Example: ["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaTrucks", ["PUP_CAF_Truck_01_transport_F", "PUP_CAF_Truck_01_covered_F"]] call _fnc_saveToTemplate; 	//this line determines militia trucks (unarmed) -- Example: ["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaCars", ["B_W_LSV_01_unarmed_F", "B_W_LSV_01_light_F", "CUP_B_nM1151_Unarmed_NATO_T"]] call _fnc_saveToTemplate; 		//this line determines militia cars (unarmed) -- Example: ["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesMilitiaAPCs", ["PUP_CAF_MRAP_03_hmg_F", "PUP_CAF_LSV_01_armed_F"]] call _fnc_saveToTemplate;						//this line determines militia APCs

["vehiclesPolice", ["PUP_CAF_LSV_01_unarmed_F"]] call _fnc_saveToTemplate; 			//this line determines police cars -- Example: ["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] -- Array, can contain multiple assets

["staticMGs", ["PUP_CAF_HMG_02_high_F"]] call _fnc_saveToTemplate; 					//this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- Array, can contain multiple assets
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate; 					//this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- Array, can contain multiple assets
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate; 					//this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- Array, can contain multiple assets
["staticMortars", ["PUP_CAF_Mortar_01_F"]] call _fnc_saveToTemplate; 				//this line determines static mortars -- Example: ["staticMortars", ["B_Mortar_01_F"]] -- Array, can contain multiple assets
["staticHowitzers", ["CUP_B_M119_USMC"]] call _fnc_saveToTemplate;							//this line determines static howitzers. Basically it's just a stronger mortar, use same syntax as above.

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		//this line determines smoke-shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;		//this line determines flare shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Flare_white"] - ENTER ONLY ONE OPTION

["howitzerMagazineHE", "CUP_30Rnd_105mmHE_M119_M"] call _fnc_saveToTemplate;			//this line determines available HE-shells for the static howitzers - !needs to be compatible with the howitzer! -- same syntax as above - ENTER ONLY ONE OPTION

["vehicleRadar", "PUP_CAF_Radar_System_01_F"] call _fnc_saveToTemplate;                  // vehicle with radar
["vehicleSam", "PUP_CAF_SAM_System_03_F"] call _fnc_saveToTemplate;                    // vehicle with SAM

//Minefield definition
["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//vehicle skins
["variants", [
    ["CUP_B_nM1097_AVENGER_USMC_WDL", ["NATOGreen", 1]]
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "WhiteHead_01",
    "WhiteHead_02",
    "WhiteHead_18",
    "WhiteHead_05",
    "WhiteHead_03",
    "WhiteHead_33",
    "WhiteHead_04",
    "WhiteHead_06",
    "WhiteHead_07",
    "WhiteHead_08",
    "WhiteHead_09",
    "WhiteHead_16",
    "WhiteHead_11",
    "WhiteHead_19"
]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG", "CUP_D_Male01_EN", "CUP_D_Male02_EN", "CUP_D_Male03_EN", "CUP_D_Male04_EN", "CUP_D_Male05_EN", "Male01FRE", "Male02FRE", "Male03FRE", "Male01ENGFRE", "Male02ENGFRE"]] call _fnc_saveToTemplate;

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
_loadoutData set ["sidearms", [
    "CUP_hgun_Glock17",
    "CUP_hgun_Glock17_blk",
    "Aegis_hgun_P320_black_F",
    "Aegis_hgun_P320_khaki_F",
    "hgun_G17_black_F"
]];

_loadoutData set ["ATMines", ["CUP_Mine_M"]]; 					//this line determines the AT mines which can be carried by units -- Example: ["ATMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]]; 					//this line determines the APERS mines which can be carried by units -- Example: ["APERSMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]]; 			//this line determines light explosives -- Example: ["DemoCharge_Remote_Mag"] -- Array, can contain multiple assets
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]]; 			//this line determines heavy explosives -- Example: ["SatchelCharge_Remote_Mag"] -- Array, can contain multiple assets

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]]; 		//this line determines anti infantry grenades (frag and such) -- Example: ["HandGrenade", "MiniGrenade"] -- Array, can contain multiple assets
_loadoutData set ["antiTankGrenades", []]; 			//this line determines anti tank grenades. Leave empty when not available. -- Array, can contain multiple assets
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];				//this line determines map
_loadoutData set ["watches", ["ItemWatch", "ACE_Altimeter"]];		//this line determines watch
_loadoutData set ["compasses", ["ItemCompass"]];	//this line determines compass
_loadoutData set ["radios", ["ItemRadio"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS", "B_UavTerminal"]];			//this line determines GPS
_loadoutData set ["NVGs", ["NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP", "O_NVGoggles_blk_F", "Aegis_NVG_IVAS_01_blk_F", "Aegis_NVG_IVAS_01_grn_F", "Aegis_NVG_IVAS_01_tan_F", "NVGogglesB_blk_F", "NVGogglesB_grn_F", "NVGogglesB_gry_F", "CUP_NVG_1PN138", "CUP_NVG_PVS15_black", "CUP_NVG_PVS15_green", "CUP_NVG_PVS15_tan", "CUP_NVG_PVS7", "CUP_NVG_PVS14", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_GPNVG_tan", "CUP_NVG_HMNVS"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["Binocular"]];		//this line determines the binoculars
_loadoutData set ["rangefinders", ["Rangefinder", "CUP_LRTV", "CUP_Vector21Nite", "CUP_SOFLAM"]];

_loadoutData set ["traitorUniforms", ["PUP_CA_U_Field_Uniform_F", "PUP_CA_U_Field_Uniform_RS_G_F", "PUP_CA_U_Field_Uniform_RS_F"]];		//this line determines traitor uniforms for traitor mission
_loadoutData set ["traitorVests", ["V_Chestrig_oli", "V_BandollierB_oli", "V_TacVest_oli", "V_Rangemaster_belt_oli", "V_ChestrigF_oli", "V_TacChestrig_oli_F", "V_lxWS_TacVestIR_oli", "V_lxWS_HarnessO_oli"]];			//this line determines traitor vesets for traitor mission
_loadoutData set ["traitorHats", ["PUP_CA_Cap_Military_CADPAT_F"]];			//this line determines traitor headgear for traitor missions

_loadoutData set ["officerUniforms", ["PUP_CA_U_Field_Uniform_RS_G_F"]];		//this line determines officer uniforms for assassination mission
_loadoutData set ["officerVests", ["JCA_MCRP_V_CarrierRigKBT_01_holster_olive_F", "Aegis_V_CarrierRigKBT_01_holster_olive_F"]];			//this line determines officer vesets for assassination mission
_loadoutData set ["officerHats", ["PUP_CA_Cap_Military_CADPAT_F"]];	//this line determines officer headgear for assassination missions

_loadoutData set ["uniforms", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slUniforms", ["PUP_CA_U_CombatUniform_tshirt_F"]];
_loadoutData set ["vests", []];						//don't fill this line - this is only to set the variable
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["V_Chestrig_rgr", "V_Chestrig_oli", "V_ChestrigF_rgr", "V_ChestrigF_oli", "CUP_V_B_GER_Carrier_Rig_2_Brown", "CUP_V_B_GER_Carrier_Rig_3_Brown", "CUP_V_B_RRV_Light_CB", "CUP_V_B_RRV_Scout_CB", "CUP_V_B_RRV_Scout2_CB", "CUP_V_B_RRV_Scout3", "CUP_V_B_RRV_Scout", "CUP_V_B_RRV_Scout2", "CUP_V_B_RRV_Scout3_GRN"]];
_loadoutData set ["backpacks", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["longRangeRadios", ["CA_Radiobag"]];
_loadoutData set ["atBackpacks", ["Aegis_B_patrolBackpack_cbr_F", "Aegis_B_patrolBackpack_khk_F", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli"]];
_loadoutData set ["helmets", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slHat", ["PUP_CA_Cap_Military_CADPAT_F"]];
_loadoutData set ["sniHats", ["PUP_CA_H_Booniehat", "PUP_CA_H_Booniehat_hs"]];

_loadoutData set ["glasses", ["CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drk", "CUP_G_Oakleys_Embr"]];	//cosmetics
_loadoutData set ["goggles", ["PUP_CA_PUP_TAC_G", "PUP_CA_PUP_TAC_G2"]];		//cosmetics

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
_sfLoadoutData set ["uniforms", ["PUP_CA_U_CombatUniform_F", "PUP_CA_U_CombatUniform_vest_F", "PUP_CA_U_CombatUniform_tshirt_F"]];
_sfLoadoutData set ["vests", ["PUP_CA_V_CarrierRigKBT_recon", "PUP_CA_V_CarrierRigKBT_light", "PUP_CA_V_CarrierRigKBT_cqb", "PUP_CA_V_CarrierRigKBT_compact", "PUP_CA_V_CarrierRigKBT_combat"]];
_sfLoadoutData set ["Hvests", ["PUP_CA_V_CarrierRigKBT_heavy", "PUP_CA_V_CarrierRigKBT_command", "PUP_CA_V_CarrierRigKBT_tactical"]];
_sfLoadoutData set ["backpacks", ["CA_backpack_fast"]];
_sfLoadoutData set ["helmets", ["PUP_CA_H_MAN", "PUP_CA_H_ECH", "PUP_CA_H_CombatHelmet_C", "PUP_CA_H_CombatHelmet_T", "PUP_CA_H_CombatHelmet"]];
_sfLoadoutData set ["binoculars", ["Rangefinder"]];

_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_black_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_green_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_olive_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_sand_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", [
    "CUP_launch_M136",
    "CUP_launch_NLAW"
]];
_sfLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""],
    ["launch_O_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_I_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_B_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_Titan_short_blk_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_O_Titan_short_camo_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_B_Titan_short_tna_F", "", "", "", ["Titan_AT"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""],
    ["launch_B_Titan_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_Titan_blk_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_O_Titan_camo_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_B_Titan_tna_F", "", "", "", ["Titan_AA"], [], ""]
]];

_sfLoadoutData set ["designatedGrenadeLaunchers", [
    ["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
    ["arifle_SCAR_L_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_grip_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["CUP_arifle_HK416_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_HK416_AGL_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_GL_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["arifle_SCAR_L_GL_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

    ["arifle_SCAR_GL_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["arifle_SCAR_GL_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["rifles", [
    ["arifle_SCAR_L_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_grip_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["CUP_arifle_HK416_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_HK416_AGL_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "suppressor_l_lxWS", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_snds_SCAR_L", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["arifle_SCAR_L_short_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_short_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_short_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_short_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""]

    
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["arifle_SCAR_L_GL_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],
    ["arifle_SCAR_L_GL_black_F", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

    ["arifle_SCAR_GL_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_HEDP_M203"], ""],
    ["arifle_SCAR_GL_black_F", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_HEDP_M203"], ""]
]];

_sfLoadoutData set ["SMGs", [
    ["SMG_04_blk_F", "muzzle_snds_460", "CUP_acc_LLM_black", "Aegis_optic_1p87", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["SMG_04_snd_F", "muzzle_snds_460", "CUP_acc_LLM_black", "Aegis_optic_1p87", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["CUP_smg_MP5A5_Rail", "muzzle_snds_L", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "muzzle_snds_L", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "muzzle_snds_L", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
    ["LMG_03_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["LMG_03_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["LMG_03_snd_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["LMG_03_snd_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_02_tna_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_camo_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_sniper_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["srifle_DMR_02_tna_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_camo_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_sniper_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["srifle_DMR_02_tna_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_camo_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_sniper_F", "muzzle_snds_338_black", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M2010_blk", "muzzle_snds_B", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_dsrt", "muzzle_snds_B", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_wdl", "muzzle_snds_B", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M2010_blk", "muzzle_snds_B", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_dsrt", "muzzle_snds_B", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_wdl", "muzzle_snds_B", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sidearms", []];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["PUP_CA_U_CombatUniform_F", "PUP_CA_U_CombatUniform_vest_F", "PUP_CA_U_CombatUniform_tshirt_F"]];
_eliteLoadoutData set ["vests", ["PUP_CA_V_CarrierRigKBT_recon", "PUP_CA_V_CarrierRigKBT_light", "PUP_CA_V_CarrierRigKBT_cqb", "PUP_CA_V_CarrierRigKBT_compact", "PUP_CA_V_CarrierRigKBT_combat"]];
_eliteLoadoutData set ["Hvests", ["PUP_CA_V_CarrierRigKBT_heavy", "PUP_CA_V_CarrierRigKBT_command", "PUP_CA_V_CarrierRigKBT_tactical"]];
_eliteLoadoutData set ["backpacks", ["CA_backpack_fast"]];
_eliteLoadoutData set ["helmets", ["PUP_CA_H_MAN", "PUP_CA_H_ECH", "PUP_CA_H_CombatHelmet_C", "PUP_CA_H_CombatHelmet_T", "PUP_CA_H_CombatHelmet"]];
_eliteLoadoutData set ["binoculars", ["Rangefinder"]];

_eliteLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_black_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_green_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_olive_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""],
    ["launch_MRAWS_sand_F", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
    "CUP_launch_M136",
    "CUP_launch_NLAW"
]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""],
    ["launch_O_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_I_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_B_Titan_short_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_Titan_short_blk_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_O_Titan_short_camo_F", "", "", "", ["Titan_AT"], [], ""],
    ["launch_B_Titan_short_tna_F", "", "", "", ["Titan_AT"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""],
    ["launch_B_Titan_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_Titan_blk_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_O_Titan_camo_F", "", "", "", ["Titan_AA"], [], ""],
    ["launch_B_Titan_tna_F", "", "", "", ["Titan_AA"], [], ""]
]];

_eliteLoadoutData set ["designatedGrenadeLaunchers", [
    ["glaunch_GLX_lxWS", "", "", "", ["1Rnd_HEDP_Grenade_shell", "1Rnd_HE_Grenade_shell"], [], ""],
    ["glaunch_GLX_tan_lxWS", "", "", "", ["1Rnd_HEDP_Grenade_shell", "1Rnd_HE_Grenade_shell"], [], ""],
    ["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
    ["arifle_SCAR_L_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_grip_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_GL_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["arifle_SCAR_L_GL_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

    ["arifle_SCAR_GL_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["arifle_SCAR_GL_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["rifles", [
    ["arifle_SCAR_L_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_grip_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_grip_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_grip_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_grip_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],

    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_LLM_black", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
    ["arifle_SCAR_L_short_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_L_short_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["arifle_SCAR_L_short_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],
    ["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], [], ""],

    ["arifle_SCAR_short_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""],

    ["arifle_SCAR_short_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_Eotech553_Black", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "optic_Hamr", ["20Rnd_762x51_Mag"], [], ""],
    ["arifle_SCAR_short_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
    ["arifle_SCAR_L_GL_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],
    ["arifle_SCAR_L_GL_black_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],
    ["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Red"], ["CUP_1Rnd_HEDP_M203"], ""],

    ["arifle_SCAR_GL_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_HEDP_M203"], ""],
    ["arifle_SCAR_GL_black_F", "CUP_muzzle_mfsup_SCAR_H", "CUP_acc_ANPEQ_2_Black_Top", "CUP_optic_AC11704_Black", ["20Rnd_762x51_Mag"], ["CUP_1Rnd_HEDP_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
    ["SMG_04_blk_F", "", "CUP_acc_LLM_black", "Aegis_optic_1p87", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["SMG_04_snd_F", "", "CUP_acc_LLM_black", "Aegis_optic_1p87", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "Aegis_optic_ROS_SMG", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];

_eliteLoadoutData set ["machineGuns", [
    ["LMG_03_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["LMG_03_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["LMG_03_snd_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["LMG_03_snd_F", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "Aegis_acc_pointer_DM", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["CUP_lmg_m249_pip2", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_m249_pip2", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["CUP_lmg_Mk48", "", "Aegis_acc_pointer_DM", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_Mk48", "", "Aegis_acc_pointer_DM", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],

    ["CUP_lmg_Mk48_nohg", "", "Aegis_acc_pointer_DM", "optic_ERCO_blk_F", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_Mk48_nohg", "", "Aegis_acc_pointer_DM", "CUP_optic_Elcan_SpecterDR_black", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""]
]];

_eliteLoadoutData set ["marksmanRifles", [
    ["srifle_DMR_02_tna_F", "", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_F", "", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_camo_F", "", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_sniper_F", "", "CUP_acc_ANPEQ_15_Black", "optic_LRPS", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["srifle_DMR_02_tna_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_camo_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_sniper_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_RAD_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["srifle_DMR_02_tna_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_camo_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["srifle_DMR_02_sniper_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["10Rnd_338_Mag"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20_Desert", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_arifle_HK417_20_Wood", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_RSASS_Black", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_RSASS_Dazzle", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_RSASS_WDL", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["Aegis_arifle_SR25_MR_blk_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["Aegis_20Rnd_762x51_Tracer_Red_SMAG"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["Aegis_arifle_SR25_MR_khk_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["Aegis_20Rnd_762x51_Tracer_Red_SMAG"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["Aegis_arifle_SR25_MR_snd_F", "", "CUP_acc_ANPEQ_15_Black", "JCA_optic_HPPO_black", ["Aegis_20Rnd_762x51_Tracer_Red_SMAG"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_eliteLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M2010_blk", "", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_dsrt", "", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_wdl", "", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M2010_blk", "", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_dsrt", "", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M2010_wdl", "", "Aegis_acc_pointer_compact_red", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_TE1_Red_Tracer_762x67_M2010_M"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_G22_wdl", "", "", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_G22_blk", "", "", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_G22_des", "", "", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M40A3", "", "CUP_Mxx_camo_half", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_G22_blk", "", "", "JCA_optic_HPPO_RAD_black", ["CUP_5Rnd_762x67_G22"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_eliteLoadoutData set ["sidearms", []];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["PUP_CA_U_CombatUniform_F", "PUP_CA_U_CombatUniform_vest_F", "PUP_CA_U_CombatUniform_tshirt_F"]];
_militaryLoadoutData set ["vests", ["PUP_CA_V_CarrierRigKBT_recon", "PUP_CA_V_CarrierRigKBT_light", "PUP_CA_V_CarrierRigKBT_cqb", "PUP_CA_V_CarrierRigKBT_compact", "PUP_CA_V_CarrierRigKBT_combat"]];
_militaryLoadoutData set ["Hvests", ["PUP_CA_V_CarrierRigKBT_heavy", "PUP_CA_V_CarrierRigKBT_command", "PUP_CA_V_CarrierRigKBT_tactical"]];
_militaryLoadoutData set ["backpacks", ["CA_backpack_fast"]];
_militaryLoadoutData set ["helmets", ["PUP_CA_H_MAN", "PUP_CA_H_ECH", "PUP_CA_H_CombatHelmet_C", "PUP_CA_H_CombatHelmet_T", "PUP_CA_H_CombatHelmet"]];
_militaryLoadoutData set ["binoculars", ["Rangefinder", "Binoculars"]];

_militaryLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""]
]];
_militaryLoadoutData set ["ATLaunchers", [
    "CUP_launch_M136"
]];
_militaryLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
    ["PUP_arifle_SPAR_02_F", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_02_F", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_02_F", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["PUP_EMAG_65x39_T"], [], ""],

    ["PUP_arifle_SPAR_03_F", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_03_F", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_03_F", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["PUP_EMAG_65x39_T"], [], ""],

    ["CUP_arifle_M4A1_MOE_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_wdl", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_wdl", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_wdl", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_dsrt", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_dsrt", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_dsrt", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_wdl", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_wdl", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_wdl", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_desert_carryhandle", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert_carryhandle", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert_carryhandle", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_camo_carryhandle", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo_carryhandle", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo_carryhandle", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_camo", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A3_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A3_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A3_camo", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_camo", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_camo", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_BUIS_GL", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_GL_carryhandle", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_GL_carryhandle_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_GL_carryhandle_camo", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_camo", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_camo", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    
    ["CUP_arifle_M4A1_BUIS_desert_GL", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_desert_GL", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_desert_GL", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_BUIS_camo_GL", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_camo_GL", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_camo_GL", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["PUP_arifle_SPAR_02_F", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_02_F", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_02_F", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["PUP_EMAG_65x39_T"], [], ""],

    ["PUP_arifle_SPAR_03_F", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_03_F", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["PUP_EMAG_65x39_T"], [], ""],
    ["PUP_arifle_SPAR_03_F", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["PUP_EMAG_65x39_T"], [], ""],

    ["CUP_arifle_M4A1_MOE_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_wdl", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_wdl", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_wdl", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_dsrt", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_dsrt", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_dsrt", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_wdl", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_wdl", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_wdl", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_desert_carryhandle", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert_carryhandle", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert_carryhandle", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_camo_carryhandle", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo_carryhandle", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo_carryhandle", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_camo", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_camo", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A3_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_black", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A3_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A3_camo", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_camo", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A3_camo", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_SBR_od", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_od", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_od", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_SBR_black", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_black", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_short_black", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_black", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_short_desert", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_desert", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_MOE_short_wdl", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_wdl", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_MOE_short_wdl", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_short_black", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_short_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_short_dsrt", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_short_dsrt", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_short_dsrt", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_M4A1_standard_short_wdl", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_short_wdl", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_M4A1_standard_short_wdl", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M4A1_BUIS_GL", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_GL", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_GL_carryhandle", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_GL_carryhandle_desert", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_desert", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_desert", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_GL_carryhandle_camo", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_camo", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_GL_carryhandle_camo", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    
    ["CUP_arifle_M4A1_BUIS_desert_GL", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_desert_GL", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_desert_GL", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],

    ["CUP_arifle_M4A1_BUIS_camo_GL", "", "Aegis_acc_pointer_DM", "Aegis_optic_ICO", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_camo_GL", "", "Aegis_acc_pointer_DM", "optic_r1_high_lxWS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""],
    ["CUP_arifle_M4A1_BUIS_camo_GL", "", "Aegis_acc_pointer_DM", "optic_Holosight_blk_F", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], ["1Rnd_HE_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_arifle_SBR_od", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_od", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_od", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],

    ["CUP_arifle_SBR_black", "", "Aegis_acc_pointer_DM", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_black", "", "Aegis_acc_pointer_DM", "CUP_optic_MicroT1", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""],
    ["CUP_arifle_SBR_black", "", "Aegis_acc_pointer_DM", "Aegis_optic_ROS", ["CUP_30Rnd_556x45_PMAG_BLACK_Tracer_Red"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_m249_para", "", "", "", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["CUP_lmg_m249_pip3", "", "", "", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["CUP_lmg_m249_pip1", "", "", "", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""],

    ["CUP_lmg_m249_pip4", "", "", "", ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_L129A1", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_L129A1", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_L129A1_d", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_L129A1_d", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_L129A1_w", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_L129A1_w", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_L129A1_HG", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_L129A1_HG", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_L129A1_HG_d", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_L129A1_HG_d", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_L129A1_HG_w", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_L129A1_HG_w", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_RSASS_Black", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_RSASS_Black", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_RSASS_Dazzle", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_RSASS_Dazzle", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_RSASS_WDLNet", "", "", "CUP_optic_Leupold_VX3", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_RSASS_WDLNet", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_TE1_Red_Tracer_762x51_M110"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M24_des", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M24_des", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],

    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", []];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["PUP_CA_U_Field_Uniform_F", "PUP_CA_U_Field_Uniform_RS_G_F", "PUP_CA_U_Field_Uniform_RS_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_brn", "V_TacVest_khk", "V_TacVest_oli"]];
_policeLoadoutData set ["helmets", ["PUP_CA_Cap_Military_CADPAT_F", "PUP_CA_H_Booniehat"]];

_policeLoadoutData set ["SMGs", [
    ["SMG_04_blk_F", "", "CUP_acc_LLM_black", "", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["SMG_04_snd_F", "", "CUP_acc_LLM_black", "", ["CUP_40Rnd_46x30_MP7"], [], ""],
    ["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "", ["CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", []];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["PUP_CA_U_CombatUniform_F", "PUP_CA_U_CombatUniform_vest_F", "PUP_CA_U_CombatUniform_tshirt_F"]];
_militiaLoadoutData set ["vests", ["CUP_V_B_RRV_Light_CB", "CUP_V_B_RRV_Scout_CB", "CUP_V_B_RRV_Scout2_CB", "CUP_V_B_RRV_Scout3", "CUP_V_B_RRV_TL_CB", "CUP_V_B_RRV_Officer_CB", "V_TacVest_brn", "V_TacVest_khk", "V_TacVest_oli"]];
_militiaLoadoutData set ["Hvests", ["CUP_V_B_RRV_MG", "V_TacVest_brn", "V_TacVest_khk", "V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["CA_backpack_fast"]];
_militiaLoadoutData set ["helmets", ["H_PASGT_basic_sand_F", "H_PASGT_goggles_sand_F", "lxWS_H_PASGT_goggles_olive_F"]];

_militiaLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_Mk153Mod0", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""],
    ["CUP_launch_Mk153Mod0_blk", "", "", "CUP_optic_SMAW_Scope", ["CUP_SMAW_HEAA_M", "CUP_SMAW_HEDP_M", "CUP_SMAW_NE_M"], ["CUP_SMAW_Spotting"], ""]
]];
_militiaLoadoutData set ["ATLaunchers", [
    "CUP_launch_M136"
]];
_militiaLoadoutData set ["AALaunchers", [
    ["CUP_launch_FIM92Stinger", "", "", "", [], [], ""]
]];

_militiaLoadoutData set ["slRifles", [
    ["CUP_arifle_M16A1", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    
    ["CUP_arifle_M16A1E1", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A2", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A4_Base", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A4_Grip", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A1GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M16A1E1GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M16A2_GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M16A4_GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M16A1", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    
    ["CUP_arifle_M16A1E1", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A2", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A4_Base", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],

    ["CUP_arifle_M16A4_Grip", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A1GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M16A1E1GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M16A2_GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""],

    ["CUP_arifle_M16A4_GL", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], ["1Rnd_Smoke_Grenade_shell"], ""]
]];

_militiaLoadoutData set ["SMGs", [
    ["CUP_arifle_Colt727", "", "saber_light_lxWS", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];

_militiaLoadoutData set ["machineGuns", [
    ["CUP_lmg_M240_norail", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],

    ["CUP_lmg_M240_B", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
    ["Aegis_arifle_M16A4_F", "", "", "Aegis_optic_ACOG", ["CUP_20Rnd_556x45_Stanag_Tracer_Red"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_militiaLoadoutData set ["sniperRifles", [
    ["Aegis_arifle_M16A4_F", "", "", "Aegis_optic_ACOG", ["CUP_20Rnd_556x45_Stanag_Tracer_Red"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_militiaLoadoutData set ["sidearms", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["PUP_CA_U_CombatUniform_tshirt_F"]];
_crewLoadoutData set ["vests", ["PUP_CA_V_CarrierRigKBT_crew"]];
_crewLoadoutData set ["helmets", ["PUP_CA_H_CrewHelmet"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["PUP_CA_U_Coveralls_F"]];
_pilotLoadoutData set ["vests", ["CUP_V_B_PilotVest"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B", "H_PilotHelmetHeli_O", "H_PilotHelmetHeli_B_visor_up", "H_PilotHelmetHeli_I_E_visor_up"]];





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