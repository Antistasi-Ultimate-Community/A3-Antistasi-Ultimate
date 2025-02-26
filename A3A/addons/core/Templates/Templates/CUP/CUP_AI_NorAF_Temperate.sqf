//these variables determine whether specified dlcs are loaded
private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

#include "..\..\script_component.hpp" // TAKE NOTE OF THIS. WITHOUT THIS, YOU CAN'T USE MACROS LIKE QPATHTOFOLDER.

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "NorAF"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", format [localize "STR_supportcorridor", "NorAF"]] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION. Format and localize function can be used for translation

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\A3\ui_f\data\map\markers\flags\Norway_ca.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_Norway"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

private _vehiclesLightUnarmed = ["CUP_B_nM1025_Unarmed_NATO_T", "CUP_B_nM1025_Unarmed_DF_NATO_T", "CUP_B_nM1151_Unarmed_NATO_T", "CUP_B_nM1151_Unarmed_DF_NATO_T"];
private _vehiclesLightArmed = ["Flex_CUP_NOR_Dingo_MG", "Flex_CUP_NOR_Dingo_GL"];

if (isClass (configFile >> "CfgPatches" >> "Swedish_Forces_Pack")) then {
    _vehiclesLightUnarmed append ["sfp_bv206", "sfp_tgb16"];
    _vehiclesLightArmed append ["sfp_tgb16_ksp58", "sfp_tgb16_rws"];
};

["vehiclesBasic", ["B_T_Quadbike_01_F"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate; 		//this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- Array, can contain multiple assets
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["Flex_CUP_NOR_Truck_01_transport", "Flex_CUP_NOR_Truck_01_covered"]] call _fnc_saveToTemplate; 			//this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesCargoTrucks", ["Flex_CUP_NOR_Truck_01_flatbed", "Flex_CUP_NOR_Truck_01_cargo"]] call _fnc_saveToTemplate; 		//this line determines cargo trucks -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesAmmoTrucks", ["Flex_CUP_NOR_Truck_01_ammo", "Flex_CUP_NOR_M113A3_Reammo"]] call _fnc_saveToTemplate; 		//this line determines ammo trucks -- Example: ["vehiclesAmmoTrucks", ["B_Truck_01_ammo_F"]] -- Array, can contain multiple assets
["vehiclesRepairTrucks", ["Flex_CUP_NOR_Truck_01_Repair", "Flex_CUP_NOR_M113A3_Repair"]] call _fnc_saveToTemplate; 		//this line determines repair trucks -- Example: ["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] -- Array, can contain multiple assets
["vehiclesFuelTrucks", ["Flex_CUP_NOR_Truck_01_fuel"]] call _fnc_saveToTemplate;		//this line determines fuel trucks -- Array, can contain multiple assets
["vehiclesMedical", ["Flex_CUP_NOR_Truck_01_medical", "Flex_CUP_NOR_M113A3_Med"]] call _fnc_saveToTemplate;			//this line determines medical vehicles -- Array, can contain multiple assets
["vehiclesAPCs", ["Flex_CUP_NOR_M113A3"]] call _fnc_saveToTemplate; 				//this line determines APCs -- Example: ["vehiclesAPCs", ["B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F"]] -- Array, can contain multiple assets
["vehiclesTanks", ["Flex_CUP_NOR_Leopard2A6"]] call _fnc_saveToTemplate; 			//this line determines tanks -- Example: ["vehiclesTanks", ["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"]] -- Array, can contain multiple assets
["vehiclesAA", ["CUP_B_nM1097_AVENGER_NATO_T"]] call _fnc_saveToTemplate; 				//this line determines AA vehicles -- Example: ["vehiclesAA", ["B_APC_Tracked_01_AA_F"]] -- Array, can contain multiple assets
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;			//this line determines light APCs
["vehiclesIFVs", []] call _fnc_saveToTemplate;				//this line determines IFVs


["vehiclesTransportBoats", ["Flex_CUP_NOR_Boat_Transport"]] call _fnc_saveToTemplate; 	//this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesGunBoats", ["Flex_CUP_NOR_RHIB", "Flex_CUP_NOR_RHIB2Turret"]] call _fnc_saveToTemplate; 			//this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- Array, can contain multiple assets
["vehiclesAmphibious", []] call _fnc_saveToTemplate; 		//this line determines amphibious vehicles  -- Example: ["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] -- Array, can contain multiple assets

private _vehiclesFighters = ["Flex_CUP_NOR_F35B"];

if (isClass (configFile >> "CfgPatches" >> "F16_Norwegian_Reskin")) then {
    _vehiclesFighters append ["F16C_NATO50"];
};

["vehiclesPlanesCAS", _vehiclesFighters] call _fnc_saveToTemplate; 		//this line determines CAS planes -- Example: ["vehiclesPlanesCAS", ["B_Plane_CAS_01_dynamicLoadout_F"]] -- Array, can contain multiple assets
["vehiclesPlanesAA", _vehiclesFighters] call _fnc_saveToTemplate; 			//this line determines air supperiority planes -- Example: ["vehiclesPlanesAA", ["B_Plane_Fighter_01_F"]] -- Array, can contain multiple assets
["vehiclesPlanesTransport", ["Flex_CUP_NOR_C130J"]] call _fnc_saveToTemplate; 	//this line determines transport planes -- Example: ["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] -- Array, can contain multiple assets

["vehiclesHelisLight", ["Flex_CUP_NOR_Bell412_Transport", "Flex_CUP_NOR_Bell412_Utility", "Flex_CUP_NOR_Bell412_Radar"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["Flex_CUP_NOR_Merlin_HC3", "Flex_CUP_NOR_MH60S_Unarmed"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["Flex_CUP_NOR_Bell412_Armed", "Flex_CUP_NOR_Bell412_Armed_AT", "Flex_CUP_NOR_Bell412_dynamicLoadout", "Flex_CUP_NOR_MH60S_Armed", "Flex_CUP_NOR_Merlin_HC3_Armed"]] call _fnc_saveToTemplate;		// this line determines light attack helicopters
["vehiclesHelisAttack", []] call _fnc_saveToTemplate; 		//this line determines attack helis -- Example: ["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] -- Array, can contain multiple assets

["vehiclesArtillery", []] call _fnc_saveToTemplate;             // wheeled or tracked vehicle with artillery cannon or rockets
["magazines", createHashMapFromArray []] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate; 				//this line determines attack UAVs -- Example: ["uavsAttack", ["B_UAV_02_CAS_F"]] -- Array, can contain multiple assets
["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate; 				//this line determines portable UAVs -- Example: ["uavsPortable", ["B_UAV_01_F"]] -- Array, can contain multiple assets

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["CUP_B_nM1025_M2_NATO_T", "CUP_B_nM1025_M240_NATO_T", "CUP_B_nM1036_TOW_NATO_T"]] call _fnc_saveToTemplate; //this line determines lightly armed militia vehicles -- Example: ["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaTrucks", ["Flex_CUP_NOR_Truck_01_transport", "Flex_CUP_NOR_Truck_01_covered"]] call _fnc_saveToTemplate; 	//this line determines militia trucks (unarmed) -- Example: ["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaCars", ["CUP_B_nM1025_Unarmed_NATO_T", "CUP_B_nM1025_Unarmed_DF_NATO_T", "CUP_B_nM1151_Unarmed_NATO_T", "CUP_B_nM1151_Unarmed_DF_NATO_T"]] call _fnc_saveToTemplate; 		//this line determines militia cars (unarmed) -- Example: ["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesMilitiaAPCs", ["CUP_B_nM1025_M2_NATO_T", "CUP_B_nM1025_M240_NATO_T"]] call _fnc_saveToTemplate;						//this line determines militia APCs

["vehiclesPolice", ["B_T_LSV_01_unarmed_F", "CUP_B_nM1025_Unarmed_NATO_T"]] call _fnc_saveToTemplate; 			//this line determines police cars -- Example: ["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] -- Array, can contain multiple assets

["staticMGs", ["Flex_CUP_NOR_HMG_high"]] call _fnc_saveToTemplate; 					//this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- Array, can contain multiple assets
["staticAT", ["Flex_CUP_NOR_TOW2_TriPod"]] call _fnc_saveToTemplate; 					//this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- Array, can contain multiple assets
["staticAA", ["Flex_CUP_NOR_Stinger_AA_pod"]] call _fnc_saveToTemplate; 					//this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- Array, can contain multiple assets
["staticMortars", ["Flex_CUP_NOR_Mortar"]] call _fnc_saveToTemplate; 				//this line determines static mortars -- Example: ["staticMortars", ["B_Mortar_01_F"]] -- Array, can contain multiple assets
["staticHowitzers", ["Flex_CUP_NOR_M119"]] call _fnc_saveToTemplate;							//this line determines static howitzers. Basically it's just a stronger mortar, use same syntax as above.

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		//this line determines smoke-shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;		//this line determines flare shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Flare_white"] - ENTER ONLY ONE OPTION

["howitzerMagazineHE", "CUP_30Rnd_105mmHE_M119_M"] call _fnc_saveToTemplate;			//this line determines available HE-shells for the static howitzers - !needs to be compatible with the howitzer! -- same syntax as above - ENTER ONLY ONE OPTION

["vehicleRadar", "Flex_CUP_NOR_Radar_System"] call _fnc_saveToTemplate;
["vehicleSam", "Flex_CUP_NOR_SAM_System"] call _fnc_saveToTemplate;

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
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG", "CUP_D_Male01_EN", "CUP_D_Male02_EN", "CUP_D_Male03_EN", "CUP_D_Male04_EN", "CUP_D_Male05_EN"]] call _fnc_saveToTemplate;

["insignia", ["NOR_NB_Patch", "NOR_Nato_Patch"]] call _fnc_saveToTemplate;
["sfInsignia", ["NOR_GSV_Patch"]] call _fnc_saveToTemplate;

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
_loadoutData set ["rangefinders", ["CUP_LRTV", "CUP_Vector21Nite"]];

_loadoutData set ["traitorUniforms", ["NOR_Gorka_Uniform", "NOR_Gorka_Uniform_Pads", "NOR_Combat_Uniform", "NOR_Combat_Uniform_Gloves", "NOR_Combat_Uniform_Gloves_Rolled", "NOR_Combat_Uniform_Rolled"]];		//this line determines traitor uniforms for traitor mission
_loadoutData set ["traitorVests", ["V_TacVest_oli", "V_TacVest_brn", "V_TacVest_khk", "V_Chestrig_rgr", "V_Chestrig_khk", "V_Chestrig_oli"]];			//this line determines traitor vesets for traitor mission
_loadoutData set ["traitorHats", ["CUP_H_US_patrol_cap_OD", "H_Cap_oli", "H_Cap_headphones"]];			//this line determines traitor headgear for traitor missions

_loadoutData set ["officerUniforms", ["NOR_Combat_Uniform_Gloves", "NOR_Combat_Uniform_Gloves_Rolled"]];		//this line determines officer uniforms for assassination mission
_loadoutData set ["officerVests", ["V_Rangemaster_belt", "V_TacVest_khk", "V_TacVest_oli"]];			//this line determines officer vesets for assassination mission
_loadoutData set ["officerHats", ["CUP_H_SLA_BeretRed"]];	//this line determines officer headgear for assassination missions

_loadoutData set ["uniforms", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];						//don't fill this line - this is only to set the variable
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["CUP_V_B_RRV_Scout", "CUP_V_B_RRV_Scout2", "CUP_V_B_RRV_Scout3_GRN", "CUP_V_B_RRV_Scout_CB", "CUP_V_B_RRV_Scout2_CB", "CUP_V_B_RRV_Scout3"]];
_loadoutData set ["backpacks", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["longRangeRadios", ["NOR_Predator_Radio_Backpack"]];
_loadoutData set ["atBackpacks", ["B_Carryall_cbr", "B_Carryall_oli", "B_Carryall_khk"]];
_loadoutData set ["helmets", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slHat", ["CUP_H_SLA_BeretRed"]];
_loadoutData set ["sniHats", ["H_Booniehat_khk", "H_Booniehat_oli", "H_Booniehat_tan"]];

_loadoutData set ["glasses", ["None", "CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drk", "CUP_G_Oakleys_Embr"]];	//cosmetics
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
_sfLoadoutData set ["uniforms", ["NOR_Combat_Uniform_Gloves_Rolled", "NOR_Combat_Uniform_Gloves"]];
_sfLoadoutData set ["vests", ["CUP_V_B_Armatus_Coyote", "CUP_V_B_Armatus_BB_Coyote", "CUP_V_B_Armatus_OD", "CUP_V_B_Armatus_BB_OD"]];
_sfLoadoutData set ["Hvests", ["CUP_V_B_Armatus_Coyote", "CUP_V_B_Armatus_BB_Coyote", "CUP_V_B_Armatus_OD", "CUP_V_B_Armatus_BB_OD"]];
_sfLoadoutData set ["backpacks", ["NOR_Predator_Backpack", "B_Kitbag_cbr", "B_Kitbag_rgr", "B_Carryall_cbr", "B_Carryall_oli", "B_Carryall_khk"]];
_sfLoadoutData set ["helmets", ["NOR_Opscore_No_Headset", "NOR_Opscore", "NOR_Opscore_SF", "NOR_Opscore_Tan_No_Headset", "NOR_Opscore_Tan", "NOR_Opscore_Tan_SF"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];

_sfLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_sfLoadoutData set ["ATLaunchers", ["CUP_launch_M72A6"]];
_sfLoadoutData set ["missileATLaunchers", [
["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_sfLoadoutData set ["slRifles", [
["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["rifles", [
["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_CQB_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_CQB_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_CQB_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_CQB_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_HK416_M203_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "CUP_muzzle_snds_M16", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""]
]];

_sfLoadoutData set ["SMGs", [
["CUP_smg_MP5SD6", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "CUP_muzzle_snds_MP7", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "CUP_muzzle_snds_MP7", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],

["CUP_smg_MP5SD6", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "CUP_muzzle_snds_MP7", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "CUP_muzzle_snds_MP7", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
["CUP_lmg_minimi_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "CUP_optic_Elcan_reflex", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
["CUP_lmg_MG3_rail", "", "", "CUP_optic_Elcan_reflex", ["CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],

["CUP_lmg_minimi_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "CUP_optic_ACOG_TA01B_Black", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
["CUP_lmg_MG3_rail", "", "", "CUP_optic_ACOG_TA01B_Black", ["CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];

_sfLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_sfLoadoutData set ["sniperRifles", [
["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_AWM_wdl", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Woodland", "", "", "CUP_optic_LeupoldMk4", ["CUP_10Rnd_127x99_M107"], [], ""],

["CUP_srifle_AWM_blk", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_AWM_wdl", "CUP_muzzle_snds_AWM", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M107_Base", "", "", "CUP_optic_LeupoldM3LR", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Pristine", "", "", "CUP_optic_LeupoldM3LR", ["CUP_10Rnd_127x99_M107"], [], ""],
["CUP_srifle_M107_Woodland", "", "", "CUP_optic_LeupoldM3LR", ["CUP_10Rnd_127x99_M107"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["CUP_hgun_Mk23", "CUP_muzzle_snds_mk23", "CUP_acc_mk23_lam_f", "", ["CUP_12Rnd_45ACP_mk23"], [], ""],
["CUP_hgun_Glock17_blk", "muzzle_snds_L", "CUP_acc_Glock17_Flashlight", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "muzzle_snds_L", "CUP_acc_Glock17_Flashlight", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["NOR_Combat_Uniform", "NOR_Combat_Uniform_Gloves", "NOR_Combat_Uniform_Gloves_Rolled", "NOR_Combat_Uniform_Rolled"]];
_eliteLoadoutData set ["slUniforms", ["NOR_Combat_Uniform", "NOR_Combat_Uniform_Gloves", "NOR_Combat_Uniform_Gloves_Rolled", "NOR_Combat_Uniform_Rolled"]];
_eliteLoadoutData set ["vests", ["CUP_V_B_Ciras_Coyote", "CUP_V_B_Ciras_Coyote2", "CUP_V_B_Ciras_Coyote3", "CUP_V_B_Ciras_Coyote4", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_Khaki2", "CUP_V_B_Ciras_Khaki3", "CUP_V_B_Ciras_Khaki4", "CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Olive2", "CUP_V_B_Ciras_Olive3", "CUP_V_B_Ciras_Olive4"]];
_eliteLoadoutData set ["Hvests", ["CUP_V_B_Ciras_Coyote", "CUP_V_B_Ciras_Coyote2", "CUP_V_B_Ciras_Coyote3", "CUP_V_B_Ciras_Coyote4", "CUP_V_B_Ciras_Khaki", "CUP_V_B_Ciras_Khaki2", "CUP_V_B_Ciras_Khaki3", "CUP_V_B_Ciras_Khaki4", "CUP_V_B_Ciras_Olive", "CUP_V_B_Ciras_Olive2", "CUP_V_B_Ciras_Olive3", "CUP_V_B_Ciras_Olive4"]];
_eliteLoadoutData set ["backpacks", ["NOR_Predator_Backpack", "B_Kitbag_rgr", "B_Kitbag_cbr", "B_Carryall_khk", "B_Carryall_oli"]];
_eliteLoadoutData set ["helmets", ["NOR_Opscore_No_Headset", "NOR_Opscore", "NOR_Opscore_Tan_No_Headset", "NOR_Opscore_Tan"]];
_eliteLoadoutData set ["binoculars", ["CUP_LRTV", "CUP_Vector21Nite"]];

_eliteLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", ["CUP_launch_M72A6"]];
_eliteLoadoutData set ["missileATLaunchers", [
["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_eliteLoadoutData set ["slRifles", [
["CUP_arifle_HK416_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_M203_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_HK416_M203_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_HK416_M203_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_eliteLoadoutData set ["rifles", [
["CUP_arifle_HK416_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["carbines", [
["CUP_arifle_HK416_CQB_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_CQB_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_CQB_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_CQB_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],

["CUP_arifle_HK416_CQB_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""],
["CUP_arifle_HK416_CQB_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], [], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_HK416_M203_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_HensoldtZO_low_RDS", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_HK416_M203_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],

["CUP_arifle_HK416_M203_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_M203_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Black", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""],
["CUP_arifle_HK416_AGL_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_ACOG", ["CUP_30Rnd_556x45_PMAG_BLACK_RPL", "CUP_30Rnd_556x45_PMAG_BLACK_RPL_Tracer_Green"], ["CUP_1Rnd_HEDP_M203"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["CUP_smg_MP5A5_Rail", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_Eotech553_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],

["CUP_smg_MP5A5_Rail", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_ANPEQ_15_Black", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_AC11704_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""]
]];

_eliteLoadoutData set ["machineGuns", [
["CUP_lmg_minimi_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "CUP_optic_Elcan_reflex", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
["CUP_lmg_MG3_rail", "", "", "CUP_optic_Elcan_reflex", ["CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""],

["CUP_lmg_minimi_railed", "CUP_muzzle_mfsup_Flashhider_556x45_Black", "", "CUP_optic_ACOG_TA01B_Black", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249"], [], ""],
["CUP_lmg_MG3_rail", "", "", "CUP_optic_ACOG_TA01B_Black", ["CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M"], [], ""]
]];

_eliteLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_SB_3_12x50_PMII", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_20", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_20_Wood", "", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_optic_LeupoldMk4", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_eliteLoadoutData set ["sniperRifles", [
["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_AWM_wdl", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_srifle_AWM_blk", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_AWM_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_86x70_L115A1"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_eliteLoadoutData set ["sidearms", [
["CUP_hgun_Mk23", "", "CUP_acc_mk23_lam_f", "", ["CUP_12Rnd_45ACP_mk23"], [], ""],
["CUP_hgun_Glock17_blk", "", "CUP_acc_Glock17_Flashlight", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "CUP_acc_Glock17_Flashlight", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["NOR_Combat_Uniform", "NOR_Combat_Uniform_Gloves", "NOR_Combat_Uniform_Gloves_Rolled", "NOR_Combat_Uniform_Rolled", "NOR_Gorka_Uniform", "NOR_Gorka_Uniform_Pads"]];
_militaryLoadoutData set ["slUniforms", ["NOR_Combat_Uniform", "NOR_Combat_Uniform_Gloves", "NOR_Combat_Uniform_Gloves_Rolled", "NOR_Combat_Uniform_Rolled"]];
_militaryLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_Coyote_Empty", "CUP_V_PMC_CIRAS_Khaki_Empty", "CUP_V_PMC_CIRAS_OD_Empty", "CUP_V_PMC_CIRAS_Coyote_Patrol", "CUP_V_PMC_CIRAS_Coyote_TL", "CUP_V_PMC_CIRAS_Khaki_TL", "CUP_V_PMC_CIRAS_OD_TL"]];
_militaryLoadoutData set ["Hvests", ["CUP_V_PMC_CIRAS_Coyote_Grenadier", "CUP_V_PMC_CIRAS_Khaki_Grenadier", "CUP_V_PMC_CIRAS_OD_Grenadier"]];
_militaryLoadoutData set ["backpacks", ["NOR_Predator_Backpack", "B_Kitbag_cbr", "B_Kitbag_rgr", "B_FieldPack_oli", "B_FieldPack_khk", "B_AssaultPack_cbr", "B_AssaultPack_rgr", "B_AssaultPack_khk"]];
_militaryLoadoutData set ["helmets", ["NOR_Helmet_Comms", "NOR_Helmet_Comms_cov"]];
_militaryLoadoutData set ["binoculars", ["Binocular", "Rangefinder"]];

_militaryLoadoutData set ["lightATLaunchers", [
["CUP_launch_MAAWS", "", "", "", ["CUP_MAAWS_HEAT_M", "CUP_MAAWS_HEDP_M"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", ["CUP_launch_M72A6"]];
_militaryLoadoutData set ["AALaunchers", ["CUP_launch_FIM92Stinger"]];

_militaryLoadoutData set ["slRifles", [
["CUP_arifle_M4A1_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo_carryhandle", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_camo", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

["CUP_arifle_M4A1_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo_carryhandle", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_camo", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

["CUP_arifle_M4A1_BUIS_GL", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_camo_GL", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle_camo", "", "", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],

["CUP_arifle_M4A1_BUIS_GL", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_camo_GL", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle_camo", "", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["rifles", [
["CUP_arifle_M4A1_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo_carryhandle", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_camo", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

["CUP_arifle_M4A1_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo_carryhandle", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_black", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A3_camo", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["CUP_arifle_M4A1_MOE_short_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_short_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_short_black", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_short_wdl", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

["CUP_arifle_M4A1_MOE_short_black", "", "CUP_acc_Flashlight", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_MOE_short_black", "", "CUP_acc_Flashlight", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_short_black", "", "CUP_acc_Flashlight", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_short_wdl", "", "CUP_acc_Flashlight", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_M4A1_BUIS_GL", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_BUIS_camo_GL", "", "CUP_acc_Flashlight", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle_camo", "", "", "CUP_optic_HensoldtZO_RDS", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],

["CUP_arifle_M4A1_BUIS_GL", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_BUIS_camo_GL", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle_camo", "", "", "CUP_optic_HoloBlack", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "CUP_acc_Flashlight_MP5", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_Flashlight_MP5", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "", "CUP_acc_Flashlight", "CUP_optic_AC11704_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "", "CUP_acc_Flashlight", "CUP_optic_AC11704_Black", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_Flashlight_MP5", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_Flashlight_MP5", "CUP_optic_AC11704_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],

["CUP_smg_MP5A5", "", "CUP_acc_Flashlight_MP5", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_Flashlight_MP5", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "", "CUP_acc_Flashlight", "CUP_optic_HoloBlack", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_Flashlight_MP5", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_Flashlight_MP5", "CUP_optic_HoloBlack", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
["CUP_lmg_minimi", "", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch"], [], ""],
["CUP_lmg_minimipara", "", "", "", ["CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
["CUP_arifle_HK417_12", "", "CUP_acc_Flashlight", "optic_MRCO", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_Flashlight", "optic_MRCO", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_arifle_HK417_12", "", "CUP_acc_Flashlight", "optic_Hamr", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_arifle_HK417_12_Wood", "", "CUP_acc_Flashlight", "optic_Hamr", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];

_militaryLoadoutData set ["sniperRifles", [
["CUP_srifle_M24_blk", "", "", "optic_LRPS", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M24_wdl", "", "", "optic_LRPS", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],

["CUP_srifle_M24_blk", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"],
["CUP_srifle_M24_wdl", "", "", "CUP_optic_SB_11_4x20_PM", ["CUP_5Rnd_762x51_M24"], [], "CUP_bipod_VLTOR_Modpod_black"]
]];
_militaryLoadoutData set ["sidearms", [
["CUP_hgun_Glock17_blk", "", "CUP_acc_Glock17_Flashlight", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "CUP_acc_Glock17_Flashlight", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["NOR_Gorka_Grey_Uniform", "NOR_Gorka_Grey_Uniform_Pads"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk", "V_TacVest_oli"]];
_policeLoadoutData set ["helmets", ["H_Beret_blk", "CUP_H_SLA_BeretRed"]];

_policeLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "CUP_acc_Flashlight_MP5", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "", "CUP_acc_Flashlight", "", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "", "CUP_acc_Flashlight", "", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["NOR_Combat_Uniform", "NOR_Combat_Uniform_Rolled"]];
_militiaLoadoutData set ["vests", ["V_TacVest_brn", "V_TacVest_khk", "V_TacVest_oli"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_brn", "V_TacVest_khk", "V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["B_AssaultPack_cbr", "B_AssaultPack_rgr", "B_AssaultPack_khk", "B_FieldPack_cbr", "B_FieldPack_oli", "B_FieldPack_khk", "B_TacticalPack_oli"]];
_militiaLoadoutData set ["helmets", ["NOR_Helmet_Comms", "NOR_Helmet_Comms_cov"]];

_militiaLoadoutData set ["ATLaunchers", ["CUP_launch_M72A6"]];

_militiaLoadoutData set ["slRifles", [
["CUP_arifle_G36A", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A_wdl", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
["CUP_arifle_M4A1_black", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo_carryhandle", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],

["CUP_arifle_AG36", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_AG36_wdl", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_BUIS_camo_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle_camo", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["rifles", [
["CUP_arifle_G36A", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
["CUP_arifle_G36A_wdl", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""],
["CUP_arifle_M4A1_black", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_camo_carryhandle", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["CUP_arifle_M4A1_standard_short_black", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_M4A1_standard_short_wdl", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], [], ""],
["CUP_arifle_G36C_VFG_Carry", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["CUP_arifle_AG36", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_AG36_wdl", "", "CUP_acc_Flashlight", "CUP_optic_G36DualOptics_3D", ["CUP_30Rnd_556x45_G36", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_BUIS_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_BUIS_camo_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""],
["CUP_arifle_M4A1_GL_carryhandle_camo", "", "", "", ["CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Green"], ["CUP_1Rnd_HE_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["CUP_smg_MP5A5", "", "CUP_acc_Flashlight_MP5", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP5A5_Rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Green_Tracer_9x19_MP5"], [], ""],
["CUP_smg_MP7", "", "CUP_acc_Flashlight", "", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""],
["CUP_smg_MP7_woodland", "", "CUP_acc_Flashlight", "", ["CUP_40Rnd_46x30_MP7", "CUP_40Rnd_46x30_MP7_Green_Tracer"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["CUP_lmg_minimipara", "", "", "", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
["CUP_arifle_G3A3_ris", "", "", "CUP_optic_ACOG2", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], "CUP_bipod_G3"],
["CUP_arifle_G3A3_ris_black", "", "", "CUP_optic_ACOG2", ["CUP_20Rnd_762x51_G3", "CUP_20Rnd_TE1_Green_Tracer_762x51_G3"], [], "CUP_bipod_G3"]
]];
_militiaLoadoutData set ["sniperRifles", [
["CUP_srifle_LeeEnfield", "", "", "CUP_optic_no23mk2", ["CUP_10x_303_M"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["CUP_hgun_Glock17_blk", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""],
["CUP_hgun_Glock17", "", "", "", ["CUP_17Rnd_9x19_glock17"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["NOR_Gorka_Uniform", "NOR_Gorka_Uniform_Pads"]];
_crewLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_Coyote_Veh", "CUP_V_PMC_CIRAS_Khaki_Veh", "CUP_V_PMC_CIRAS_OD_Veh"]];
_crewLoadoutData set ["helmets", ["CUP_H_CVC"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["NOR_Gorka_Uniform", "NOR_Gorka_Uniform_Pads"]];
_pilotLoadoutData set ["vests", ["CUP_V_PMC_CIRAS_Coyote_Veh", "CUP_V_PMC_CIRAS_Khaki_Veh", "CUP_V_PMC_CIRAS_OD_Veh"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_O", "H_PilotHelmetHeli_B", "H_CrewHelmetHeli_B", "H_CrewHelmetHeli_O"]];





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