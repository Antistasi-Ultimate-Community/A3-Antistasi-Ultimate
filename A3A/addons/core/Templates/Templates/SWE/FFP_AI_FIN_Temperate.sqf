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

["name", "FDF"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", format [localize "STR_supportcorridor", "FDF"]] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION. Format and localize function can be used for translation

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\ffp_config\data\flag\fin_flag_ca.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "ffp_flag"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", []] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["ffp_bv206", "ffp_rg32m"]] call _fnc_saveToTemplate; 		//this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- Array, can contain multiple assets
["vehiclesLightArmed",["sfp_tgb16_ksp58", "sfp_tgb16_rws"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["ffp_susi_sa420", "ffp_susi_sa420_covered"]] call _fnc_saveToTemplate; 			//this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesCargoTrucks", ["ffp_susi_sa420", "ffp_susi_sa420_covered"]] call _fnc_saveToTemplate; 		//this line determines cargo trucks -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesAmmoTrucks", ["ffp_susi8x8_ammo"]] call _fnc_saveToTemplate; 		//this line determines ammo trucks -- Example: ["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] -- Array, can contain multiple assets
["vehiclesRepairTrucks", ["ffp_susi_sa420_repair"]] call _fnc_saveToTemplate; 		//this line determines repair trucks -- Example: ["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] -- Array, can contain multiple assets
["vehiclesFuelTrucks", ["ffp_susi_sa420_fuel"]] call _fnc_saveToTemplate;		//this line determines fuel trucks -- Array, can contain multiple assets
["vehiclesMedical", ["ffp_van_ambulance"]] call _fnc_saveToTemplate;			//this line determines medical vehicles -- Array, can contain multiple assets
["vehiclesAPCs", ["ffp_bmp2", "ffp_bmp2_atgm", "ffp_cv9030"]] call _fnc_saveToTemplate; 				//this line determines APCs -- Example: ["vehiclesAPCs", ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F"]] -- Array, can contain multiple assets
["vehiclesTanks", ["ffp_leopard2a4", "ffp_leopard2a6"]] call _fnc_saveToTemplate; 			//this line determines tanks -- Example: ["vehiclesTanks", ["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"]] -- Array, can contain multiple assets
["vehiclesAA", ["sfp_lvkv90c"]] call _fnc_saveToTemplate; 				//this line determines AA vehicles -- Example: ["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] -- Array, can contain multiple assets
["vehiclesLightAPCs", _vehiclesLightAPCs] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs

private _vehiclesLightAPCs = []; 

if (isClass (configFile >> "CfgPatches" >> "XA_185")) then {
    _vehiclesLightAPCs = ["XA185_A1"];
};


["vehiclesTransportBoats", ["ffp_gruppbat"]] call _fnc_saveToTemplate; 	//this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesGunBoats", ["sfp_strb90", "sfp_strb90_rws"]] call _fnc_saveToTemplate; 			//this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- Array, can contain multiple assets
["vehiclesAmphibious", []] call _fnc_saveToTemplate; 		//this line determines amphibious vehicles  -- Example: ["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] -- Array, can contain multiple assets

["vehiclesPlanesCAS", ["ffp_jas39e", "ffp_jas39e_rb15"]] call _fnc_saveToTemplate; 		//this line determines CAS planes -- Example: ["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] -- Array, can contain multiple assets
["vehiclesPlanesAA", ["ffp_jas39e", "ffp_jas39e_rb15"]] call _fnc_saveToTemplate; 			//this line determines air supperiority planes -- Example: ["vehiclesPlanesAA", ["B_Plane_Fighter_01_F"]] -- Array, can contain multiple assets
["vehiclesPlanesTransport", []] call _fnc_saveToTemplate; 	//this line determines transport planes -- Example: ["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] -- Array, can contain multiple assets

["vehiclesHelisLight", ["ffp_md500"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["ffp_nh90"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["ffp_nh90_armed"]] call _fnc_saveToTemplate;		// this line determines light attack helicopters
["vehiclesHelisAttack", []] call _fnc_saveToTemplate; 		//this line determines attack helis -- Example: ["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] -- Array, can contain multiple assets

["vehiclesArtillery", ["ffp_rsrakh06"]] call _fnc_saveToTemplate;		//this line determines SPAs
["magazines", createHashMapFromArray [
["ffp_rsrakh06", ["12Rnd_230mm_rockets"]]
]] call _fnc_saveToTemplate;			//this line determines ammo to be used with specified SPA, hashMap makes sure that SPA gets proper ammo

["uavsAttack", []] call _fnc_saveToTemplate; 				//this line determines attack UAVs -- Example: ["uavsAttack", ["B_UAV_02_CAS_F"]] -- Array, can contain multiple assets
["uavsPortable", ["ffp_orbiter"]] call _fnc_saveToTemplate; 				//this line determines portable UAVs -- Example: ["uavsPortable", ["B_UAV_01_F"]] -- Array, can contain multiple assets

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["sfp_tgb16_ksp58"]] call _fnc_saveToTemplate; //this line determines lightly armed militia vehicles -- Example: ["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaTrucks", ["ffp_susi_sa420", "ffp_susi_sa420_covered"]] call _fnc_saveToTemplate; 	//this line determines militia trucks (unarmed) -- Example: ["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaCars", ["ffp_rg32m"]] call _fnc_saveToTemplate; 		//this line determines militia cars (unarmed) -- Example: ["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesMilitiaAPCs", ["sfp_tgb16_ksp58"]] call _fnc_saveToTemplate;						//this line determines militia APCs

["vehiclesPolice", ["ffp_rg32m"]] call _fnc_saveToTemplate; 			//this line determines police cars -- Example: ["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] -- Array, can contain multiple assets

["staticMGs", ["B_G_HMG_02_high_F"]] call _fnc_saveToTemplate; 					//this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- Array, can contain multiple assets
["staticAT", ["ffp_pstohj83"]] call _fnc_saveToTemplate; 					//this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- Array, can contain multiple assets
["staticAA", ["CUP_B_ZU23_CDF", "ffp_ito2005m"]] call _fnc_saveToTemplate; 					//this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- Array, can contain multiple assets
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate; 				//this line determines static mortars -- Example: ["staticMortars", ["B_Mortar_01_F"]] -- Array, can contain multiple assets
["staticHowitzers", ["ffp_122h63"]] call _fnc_saveToTemplate;							//this line determines static howitzers. Basically it's just a stronger mortar, use same syntax as above.

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		//this line determines smoke-shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;		//this line determines flare shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Flare_white"] - ENTER ONLY ONE OPTION

["howitzerMagazineHE", "32Rnd_155mm_Mo_shells"] call _fnc_saveToTemplate;			//this line determines available HE-shells for the static howitzers - !needs to be compatible with the howitzer! -- same syntax as above - ENTER ONLY ONE OPTION

//Minefield definition
["minefieldAT", ["ffp_telamiina"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["ffp_sm_65_98"]] call _fnc_saveToTemplate;

#include "FFP_Vehicle_Attributes.sqf"

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

private _voices = ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG", "CUP_D_Male01_EN", "CUP_D_Male02_EN", "CUP_D_Male03_EN", "CUP_D_Male04_EN", "CUP_D_Male05_EN"];

if (isClass (configFile >> "CfgPatches" >> "FDF_VOICES_A3")) then {
    _voices = ["Male01FIN_FDF","Male02FIN_FDF","Male03FIN_FDF","Male04FIN_FDF","Male05FIN_FDF","Male06FIN_FDF","Male07FIN_FDF","Male08FIN_FDF","Male09FIN_FDF"];
};

["voices", _voices] call _fnc_saveToTemplate;

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

_loadoutData set ["ATMines", ["ffp_telamiina_mag"]]; 					//this line determines the AT mines which can be carried by units -- Example: ["ATMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["APMines", ["ffp_sm_65_98_mag"]]; 					//this line determines the APERS mines which can be carried by units -- Example: ["APERSMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag", "sfp_sprdeg46_mag"]]; 			//this line determines light explosives -- Example: ["DemoCharge_Remote_Mag"] -- Array, can contain multiple assets
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]]; 			//this line determines heavy explosives -- Example: ["SatchelCharge_Remote_Mag"] -- Array, can contain multiple assets

_loadoutData set ["antiInfantryGrenades", ["ffp_handgrenade_runko43"]]; 		//this line determines anti infantry grenades (frag and such) -- Example: ["HandGrenade", "MiniGrenade"] -- Array, can contain multiple assets
_loadoutData set ["antiTankGrenades", []]; 			//this line determines anti tank grenades. Leave empty when not available. -- Array, can contain multiple assets
_loadoutData set ["smokeGrenades", ["ffp_smoke_white"]];
_loadoutData set ["signalsmokeGrenades", ["ffp_smoke_red", "ffp_smoke_green", "ffp_smoke_blue"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];				//this line determines map
_loadoutData set ["watches", ["ItemWatch"]];		//this line determines watch
_loadoutData set ["compasses", ["ItemCompass"]];	//this line determines compass
_loadoutData set ["radios", ["ItemRadio"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS"]];			//this line determines GPS
_loadoutData set ["NVGs", ["CUP_NVG_1PN138", "CUP_NVG_PVS15_black", "CUP_NVG_PVS15_green", "CUP_NVG_PVS7", "CUP_NVG_PVS14", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_HMNVS"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["Binocular"]];		//this line determines the binoculars
_loadoutData set ["rangefinders", ["Rangefinder", "CUP_LRTV", "CUP_Vector21Nite"]];

_loadoutData set ["traitorUniforms", ["ffp_m05w_uniform"]];		//this line determines traitor uniforms for traitor mission
_loadoutData set ["traitorVests", ["V_TacVest_oli", "V_Chestrig_oli", "V_Chestrig_rgr"]];			//this line determines traitor vesets for traitor mission
_loadoutData set ["traitorHats", ["CUP_H_PMC_Beanie_Khaki","sfp_wool_beanie_green"]];			//this line determines traitor headgear for traitor missions

_loadoutData set ["officerUniforms", ["ffp_m05w_uniform"]];		//this line determines officer uniforms for assassination mission
_loadoutData set ["officerVests", ["V_Rangemaster_belt"]];			//this line determines officer vesets for assassination mission
_loadoutData set ["officerHats", ["H_Beret_blk", "CUP_H_Beret_HIL"]];	//this line determines officer headgear for assassination missions

_loadoutData set ["uniforms", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];						//don't fill this line - this is only to set the variable
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["CUP_V_B_ALICE", "CUP_V_O_SLA_M23_1_OD", "CUP_V_I_RACS_Carrier_Rig_wdl_2", "CUP_V_I_RACS_Carrier_Rig_wdl_3", "V_TacVest_oli"]];
_loadoutData set ["backpacks", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["longRangeRadios", ["CUP_B_Kombat_Radio_Olive"]];
_loadoutData set ["atBackpacks", ["sfp_backpack_stridssack2000"]];
_loadoutData set ["helmets", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slHat", ["H_Beret_blk", "CUP_H_Beret_HIL"]];
_loadoutData set ["sniHats", ["CUP_H_PMC_Beanie_Headphones_Khaki", "H_Booniehat_oli"]];

_loadoutData set ["glasses", ["None", "CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drks", "CUP_G_Oakleys_Embr"]];	//cosmetics
_loadoutData set ["goggles", ["None", "CUP_G_ESS_BLK_Dark", "CUP_G_ESS_BLK_Ember", "CUP_G_ESS_BLK", "CUP_G_ESS_CBR_Dark", "CUP_G_ESS_CBR_Ember", "CUP_G_ESS_CBR", "CUP_G_ESS_RGR_Dark", "CUP_G_ESS_RGR_Ember", "CUP_G_ESS_RGR", "CUP_G_ESS_KHK_Dark", "CUP_G_ESS_KHK_Ember", "CUP_G_ESS_KHK"]];		//cosmetics

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
_sfLoadoutData set ["uniforms", ["ffp_m05w_uniform"]];
_sfLoadoutData set ["vests", ["CUP_V_B_LBT_LBV_Black", "CUP_V_B_LBT_LBV_GRN", "CUP_V_B_LBT_LBV_OD"]];
_sfLoadoutData set ["Hvests", ["CUP_V_B_LBT_LBV_Black", "CUP_V_B_LBT_LBV_GRN", "CUP_V_B_LBT_LBV_OD"]];
_sfLoadoutData set ["backpacks", ["ffp_m05_backpack_small", "sfp_backpack_stridssack2000", "B_AssaultPack_rgr", "B_AssaultPack_khk", "B_Carryall_oli", "B_Kitbag_rgr"]];
_sfLoadoutData set ["helmets", ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Green_NoHS", "CUP_H_OpsCore_Green_SF", "CUP_H_OpsCore_Tan", "CUP_H_OpsCore_Tan_NoHS", "CUP_H_OpsCore_Tan_SF"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM", "CUP_LRTV"]];

_sfLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""],
    ["sfp_grg86", "", "", "", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", ["ffp_kes88", "ffp_66kes12", "ffp_66kes12_rak"]];
_sfLoadoutData set ["missileATLaunchers", [
    ["ffp_nlaw", "", "", "", ["ffp_nlaw_mag"], [], ""],
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
    ["ffp_ito15", "", "", "", ["ffp_ito15_mag"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["rifles", [
["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["CUP_arifle_Mk17_CQC", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],

["CUP_arifle_Mk17_CQC", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk17_CQC_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_CQC_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_CQC_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_Mk17_CQC_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_CQC_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_Mk17_CQC_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""]
]];

_sfLoadoutData set ["SMGs", [
["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
["CUP_lmg_minimi_railed", "", "CUP_acc_LLM_black", "ffp_ta11_3d", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
["ffp_TKiv2000", "", "", "ffp_optic_TKiv2000", ["ffp_5Rnd_TKiv2000_mag", "CUP_5Rnd_86x70_L115A1"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["CUP_hgun_P30L_blk", "CUP_muzzle_snds_M9", "sfp_tlr2", "", ["CUP_17Rnd_9x19_P30L"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["ffp_m05w_uniform"]];
_eliteLoadoutData set ["vests", ["CUP_V_JPC_communications_rngr", "CUP_V_JPC_Fast_rngr", "CUP_V_B_JPC_OD_Light", "CUP_V_JPC_medical_rngr", "CUP_V_JPC_tl_rngr", "CUP_V_JPC_weapons_rngr", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_lightbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_JPC_weaponsbelt_rngr"]];
_eliteLoadoutData set ["Hvests", ["CUP_V_JPC_communications_rngr", "CUP_V_JPC_Fast_rngr", "CUP_V_B_JPC_OD_Light", "CUP_V_JPC_medical_rngr", "CUP_V_JPC_tl_rngr", "CUP_V_JPC_weapons_rngr", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_lightbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_JPC_weaponsbelt_rngr"]];
_eliteLoadoutData set ["backpacks", ["B_Kitbag_rgr", "ffp_m05_backpack_small", "B_Carryall_khk", "B_Carryall_oli"]];
_eliteLoadoutData set ["helmets", ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Green_NoHS", "CUP_H_OpsCore_Tan", "CUP_H_OpsCore_Tan_NoHS"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV", "CUP_Vector21Nite"]];

_eliteLoadoutData set ["lightATLaunchers", [
    ["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""],
    ["sfp_grg86", "", "", "", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", ["ffp_kes88", "ffp_66kes12", "ffp_66kes12_rak"]];
_eliteLoadoutData set ["missileATLaunchers", [
    ["ffp_nlaw", "", "", "", ["ffp_nlaw_mag"], [], ""],
    ["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
    ["ffp_ito15", "", "", "", ["ffp_ito15_mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],

["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],

["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["rifles", [
["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],

["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["CUP_arifle_Mk17_CQC", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],

["CUP_arifle_Mk17_CQC", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_Mk17_CQC_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""],

["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];


_eliteLoadoutData set ["machineGuns", [
["CUP_lmg_minimi_railed", "", "CUP_acc_LLM_black", "ffp_ta11_3d", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
]];

_eliteLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_eliteLoadoutData set ["sniperRifles", [
["ffp_TKiv2000", "", "", "ffp_optic_TKiv2000", ["ffp_5Rnd_TKiv2000_mag", "CUP_5Rnd_86x70_L115A1"], [], ""]
]];
_eliteLoadoutData set ["sidearms", [
["CUP_hgun_P30L_blk", "", "sfp_tlr2", "", ["CUP_17Rnd_9x19_P30L"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["ffp_m05w_uniform"]];
_militaryLoadoutData set ["vests", ["ffp_m05combatvest", "ffp_m05combatvest_radio", "ffp_m05flak"]];
_militaryLoadoutData set ["Hvests", ["ffp_m05combatvest_radio"]];
_militaryLoadoutData set ["backpacks", ["B_AssaultPack_rgr", "B_AssaultPack_khk", "B_FieldPack_oli", "B_FieldPack_khk", "B_Kitbag_rgr", "B_TacticalPack_oli", "ffp_m05_backpack_small"]];
_militaryLoadoutData set ["helmets", ["ffp_m05w_helmet", "ffp_m05w_helmet_glasses", "ffp_m05w_helmet_peltor"]];
_militaryLoadoutData set ["binoculars", ["Binocular", "Rangefinder", "CUP_Vector21Nite"]];

_militaryLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", ["ffp_kes88", "ffp_66kes12_rak", "ffp_66kes12", "ffp_Apilas", "ffp_nlaw"]];
_militaryLoadoutData set ["AALaunchers", [
["ffp_ito15", "", "", "", ["ffp_ito15_mag"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["ffp_rk95", "", "", "CUP_optic_CompM2_low", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["ffp_rk95", "", "", "CUP_optic_VortexRazor_UH1_Black", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["rifles", [
["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["ffp_rk95", "", "", "CUP_optic_CompM2_low", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["ffp_rk95", "", "", "CUP_optic_VortexRazor_UH1_Black", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["CUP_arifle_M4A1_standard_short_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
["CUP_arifle_M4A1_standard_short_wdl", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],

["CUP_arifle_M4A1_standard_short_black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
["CUP_arifle_M4A1_standard_short_wdl", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],

["CUP_arifle_M4A1_standard_short_black", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
["CUP_arifle_M4A1_standard_short_wdl", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_smg_MP5A5_Rail", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5_Rail", "", "", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
["ffp_kk_pkm", "", "", "optic_Hamr", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
["ffp_kk_pkm", "", "", "optic_MRCO", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
["ffp_kk_pkm", "", "", "CUP_optic_HensoldtZO_RDS", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];

_militaryLoadoutData set ["sniperRifles", [
["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
["ffp_pist2008", "", "sfp_tlr2", "", ["ffp_17rnd_9x9_mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["ffp_m05w_uniform"]];
_policeLoadoutData set ["vests", ["V_TacVest_oli", "V_TacVest_blk"]];
_policeLoadoutData set ["helmets", ["H_Beret_blk", "CUP_H_Beret_HIL"]];

_policeLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "CUP_acc_Flashlight_MP5", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5_Rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["ffp_pist2008", "", "", "", ["ffp_17rnd_9x9_mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["CUP_I_B_PMC_Unit_39", "CUP_U_O_SLA_Green"]];
_militiaLoadoutData set ["vests", ["V_Chestrig_oli", "V_TacVest_oli"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["B_TacticalPack_oli", "B_FieldPack_oli", "B_AssaultPack_dgtl"]];
_militiaLoadoutData set ["helmets", ["CUP_H_SLA_Helmet", "CUP_H_SLA_Helmet_OD_worn", "CUP_H_RUS_SSH68_green", "CUP_H_RUS_SSH68_olive"]];

_militiaLoadoutData set ["ATLaunchers", ["ffp_kes88", "ffp_66kes12_rak", "ffp_66kes12"]];

_militiaLoadoutData set ["slRifles", [
["CUP_arifle_AKM_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM_top_rail", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],

["CUP_arifle_AKM_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],

["CUP_arifle_AKM_GL_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AKM_GL", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],

["CUP_arifle_AKM_GL_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AKM_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""]
]];
_militiaLoadoutData set ["rifles", [
["CUP_arifle_AKM_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM_top_rail", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],

["CUP_arifle_AKM_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
["CUP_arifle_AKM_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
["CUP_arifle_AKS74U_top_rail", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_AKM_GL_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
["CUP_arifle_AKM_GL", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],

["CUP_arifle_AKM_GL_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
["CUP_arifle_AKM_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CUP_smg_MP5A5_Rail", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5_Rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["ffp_kk_pkm", "", "", "", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
["ffp_KVKK", "", "", "", ["ffp_100Rnd_KVKK_mag", "ffp_100Rnd_KVKK_mag_Tracer"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["ffp_pist2008", "", "", "", ["ffp_17rnd_9x9_mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["ffp_m05w_uniform"]];
_crewLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_OD_Veh"]];
_crewLoadoutData set ["helmets", ["CUP_H_CVC"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_USArmy_PilotOverall"]];
_pilotLoadoutData set ["vests", ["V_TacVest_oli"]];
_pilotLoadoutData set ["helmets", ["H_CrewHelmetHeli_O", "H_CrewHelmetHeli_B", "H_PilotHelmetHeli_O", "H_PilotHelmetHeli_B"]];





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