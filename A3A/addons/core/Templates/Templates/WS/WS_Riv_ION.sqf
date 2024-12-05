private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasArtOfWar = "aow" in A3A_enabledDLC;
private _hasRF = "rf" in A3A_enabledDLC;
private _hasEF = "ef" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "ION Services"] call _fnc_saveToTemplate;
["nameLeader", "Amos Gibson"] call _fnc_saveToTemplate;


//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG",
"Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG",
"Male12ENG", "Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB",
"Male05ENGB", "Male01ENGFRE", "Male02ENGFRE"
]] call _fnc_saveToTemplate;


//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate;

private _lightArmedVehicles = ["B_ION_Offroad_armed_lxWS"];
private _lightUnarmedVehicles = ["B_ION_Offroad_lxWS"];
private _apc = ["B_ION_APC_Wheeled_01_command_lxWS", "B_ION_APC_Wheeled_02_hmg_lxWS"];
private _tanks = [];
private _helis = ["a3a_Heli_Light_01_ION_F","a3a_Heli_Light_01_dynamicLoadout_ION_F", "B_ION_Heli_Light_02_dynamicLoadout_lxWS", "B_ION_Heli_Light_02_unarmed_lxWS"];
private _uav = ["ION_UAV_01_lxWS", "ION_UAV_02_lxWS"];
private _trucks = ["B_ION_Truck_02_covered_lxWS"];

private _staticLowWeapons = ["O_G_HMG_02_F"];
private _staticAT = ["O_static_AT_F"];
private _staticMortars = ["O_Mortar_01_F"];

if (_hasApex) then {
	_lightArmedVehicles pushBack "O_LSV_02_armed_F";
	_lightUnarmedVehicles pushBack "O_LSV_02_unarmed_F";
};

if (_hasLawsOfWar) then {
	_trucks append ["a3a_Van_02_black_transport_F", "a3a_Van_02_black_vehicle_F"];
    _uav append ["C_IDAP_UAV_06_antimine_F"];
};

if (_hasRF) then {
	_helis pushBack "B_ION_Heli_EC_01_RF";
	_lightArmedVehicles pushBack "B_ION_Pickup_mmg_rf";
	_lightUnarmedVehicles pushBack "B_ION_Pickup_rf";
};

if (_hasContact) then {
	_lightUnarmedVehicles pushBack "C_Offroad_01_covered_F";
};


["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["handGrenadeAmmo", ["GrenadeHand"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

["staticLowWeapons", _staticLowWeapons] call _fnc_saveToTemplate;
["staticAT", _staticAT] call _fnc_saveToTemplate;
["staticMortars", _staticMortars] call _fnc_saveToTemplate;
["vehiclesRivalsLightArmed", _lightArmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", _trucks] call _fnc_saveToTemplate;
["vehiclesRivalsCars", _lightUnarmedVehicles] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", _apc] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", _tanks] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", _helis] call _fnc_saveToTemplate;
["vehiclesRivalsUavs", _uav] call _fnc_saveToTemplate;		

["animations", [
	["C_Offroad_01_covered_F", ["hidePolice",1,"HideServices",1,"HideCover",0,"StartBeaconLight",0,"HideRoofRack",0,"HideLoudSpeakers",0.3,"HideAntennas",0.5,"HideBeacon",1,"HideSpotlight",0.3,"HideDoor3",0,"OpenDoor3",0.3,"HideDoor1",0,"HideDoor2",0,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",0,"BeaconsStart",0]],
	["O_LSV_02_armed_F", ["Unarmed_Doors_Hide", 0.5]],
	["O_LSV_02_unarmed_F", ["Unarmed_Doors_Hide", 0.5]],
    ["B_ION_APC_Wheeled_02_hmg_lxWS", ["mg_hide_armor_front", 0.3, "mg_hide_armor_rear", 0.3, "mg_Hide_Rail", 0.3, "showBags", 0, "showCanisters", 0.3, "showTools", 0.3, "showCamonetHull", 0, "showSLATHull", 0.3]],
    ["B_ION_APC_Wheeled_01_command_lxWS", ["showBags", 0, "showCamonetHull", 0, "showCamonetTurret", 0, "showSLATHull", 0.3, "showSLATTurret", 0.3]]
]] call _fnc_saveToTemplate;

["variants", [
    ["I_LT_01_cannon_F", ["Indep_Olive",1]],
	["O_LSV_02_armed_F", ["Black", 1, "Arid", 0, "GreenHex", 0]],
	["O_LSV_02_unarmed_F", ["Black", 1, "Arid", 0, "GreenHex", 0]],
	["B_ION_APC_Wheeled_01_command_lxWS", ["ION_BLACK", 0.7, "BLACK", 0.3 ]],
	["B_ION_Heli_Light_02_dynamicLoadout_lxWS", ["ION_BLACK", 0.6, "Black", 0.2, "Blackcustom", 0.2]],
	["B_ION_Heli_Light_02_unarmed_lxWS", ["ION_BLACK", 0.6, "Black", 0.2, "Blackcustom", 0.2]]
]] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;

private _rifles = [
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_Velko_lxWS", "", "saber_light_lxWS", "",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
	["arifle_Velko_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""]
];
if (_hasApex) then {
	_rifles append [
		["arifle_SPAR_02_blk_F", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
        ["arifle_SPAR_02_blk_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
		["arifle_AK12_F", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
		["arifle_AK12_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
	]
};

private _carbines = [
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_VelkoR5_lxWS", "", "saber_light_lxWS", "",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
	["arifle_VelkoR5_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
	["arifle_SLR_Para_lxWS", "", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""],
	["arifle_SLR_Para_snake_lxWS", "", "saber_light_lxWS", "optic_r1_high_black_sand_lxWS",  ["20Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS", "30Rnd_762x51_slr_lxWS"], [], ""]
];
if (_hasContact ) then {
	_carbines append [
		["arifle_AK12U_F", "", "saber_light_lxWS", "", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""],
		["arifle_AK12U_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Green_F", "30Rnd_762x39_Mag_Tracer_Green_F"], [], ""]
	];
};

private _tunedRifles = [
	["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_MRCO", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
	["arifle_Velko_lxWS", "", "saber_light_lxWS", "optic_hamr",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], [], ""],
	["arifle_SLR_V_lxWS", "", "", "optic_hamr", ["30Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""]
];
if (_hasApex) then {
	_tunedRifles pushBack ["arifle_SPAR_02_blk_F", "", "saber_light_lxWS", "optic_Arco_blk_F", ["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"], [], ""];
};

private _enforcerRifles = [
	["sgun_aa40_lxWS", "", "saber_light_lxWS", "", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
	["sgun_aa40_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
	["sgun_aa40_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
	["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
	["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
	["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "optic_aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""]
];
if (_hasRF) then {
	_enforcerRifles append [
		["arifle_ash12_blk_RF","","saber_light_lxWS","",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], ""],
		["arifle_ash12_blk_RF","","saber_light_lxWS","optic_Holosight_blk_F",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], ""],
		["arifle_ash12_blk_RF","","saber_light_lxWS","optic_r1_low_lxWS",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], ""]
	]
};

private _gls = [
	["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
	["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
	["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "optic_aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
	["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
	["arifle_VelkoR5_GL_lxWS", "", "saber_light_lxWS", "optic_r1_high_lxWS",  ["35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_reload_tracer_green_lxWS", "35Rnd_556x45_Velko_tracer_green_lxWS"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "UGL_FlareWhite_F", "1Rnd_Smoke_Grenade_shell"], ""],
	["arifle_SLR_V_GL_lxWS", "", "", "optic_Holosight_blk_F", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], ""],
	["arifle_SLR_V_GL_lxWS", "", "", "optic_hamr", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], ["1Rnd_40mm_HE_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], ""]
];
if (_hasRF) then {
	_gls append [
		["arifle_ash12_GL_blk_RF","","saber_light_lxWS","",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], ["1Rnd_40mm_HE_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], ""],
		["arifle_ash12_GL_blk_RF","","saber_light_lxWS","optic_Holosight_blk_F",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], ["1Rnd_40mm_HE_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], ""],
		["arifle_ash12_GL_blk_RF","","saber_light_lxWS","optic_r1_low_lxWS",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], ["1Rnd_40mm_HE_lxWS", "1Rnd_40mm_HE_lxWS", "1Rnd_58mm_AT_lxWS", "1Rnd_50mm_Smoke_lxWS"], ""]
	];
};

private _designatedGls = [
	["glaunch_GLX_lxWS", "", "", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""]
];

private _smgs = [
	["SMG_03C_black", "", "saber_light_lxWS", "", [], [], ""],
	["SMG_03C_TR_black", "", "saber_light_lxWS", "optic_Holosight_smg_blk_F", [], [], ""],
	["SMG_03_black", "", "saber_light_lxWS", "", [], [], ""],
	["SMG_03_TR_black", "", "saber_light_lxWS", "optic_Holosight_smg_blk_F", [], [], ""],
	["SMG_02_F", "", "saber_light_lxWS", "", [], [], ""],
	["SMG_02_F", "", "saber_light_lxWS", "optic_Holosight_smg_blk_F", [], [], ""]
];
if (_hasRF) then {
	_smgs append [
		["SMG_01_black_RF", "", "", "", [], [], ""],
		["SMG_01_black_RF", "", "optic_Holosight_smg_blk_F", "", [], [], ""]
	];
} else {
	_smgs append [
		["SMG_01_F", "", "", "", [], [], ""],
		["SMG_01_F", "", "", "optic_Holosight_smg_blk_F", [], [], ""]
	];
};

private _mgs = [
	["arifle_XMS_M_lxWS", "", "saber_light_lxWS", "", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
	["arifle_XMS_M_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
	["arifle_XMS_M_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
	["LMG_S77_Compact_lxWS", "", "saber_light_lxWS", "", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
	["LMG_S77_Compact_lxWS", "", "saber_light_lxWS", "optic_hamr", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
	["LMG_S77_Compact_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
	["LMG_Mk200_black_F", "", "", "", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_blk"],
	["LMG_Mk200_black_F", "", "", "optic_hamr", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_blk"],
	["LMG_Mk200_black_F", "", "", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_blk"]		
];

if (_hasContact) then {
	_mgs append [
		["arifle_RPK12_F", "", "", "", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
		["arifle_RPK12_F", "", "", "optic_r1_high_lxWS", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""],
		["arifle_RPK12_F", "", "", "optic_Holosight_blk_F", ["75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F"], [], ""]
	];
};

private _marksmanRifles = [
	["arifle_SLR_V_lxWS", "", "", "optic_dms", ["20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_lxWS", "20Rnd_762x51_slr_reload_tracer_green_lxWS"], [], ""],
	["srifle_EBR_blk_F", "", "", "optic_dms", [], [], "bipod_01_F_blk"]
];
if (_hasMarksman) then {
	_marksmanRifles pushBack ["srifle_DMR_03_F", "", "", "optic_ams", [], [], "bipod_01_F_blk"];
};
if (_hasRF) then {
	_marksmanRifles pushBack ["arifle_ash12_LR_blk_RF","","saber_light_lxWS","optic_dms",["20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF","20Rnd_127x55_Mag_RF"], [], "bipod_02_F_blk"];
};

private _pistols = [
	["hgun_P07_blk_F", "", "", "", [], [], ""],
	["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "", [], [], ""],
	["hgun_Pistol_heavy_01_green_F", "", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""],
	["hgun_ACPC2_F", "muzzle_snds_acp", "acc_flashlight_pistol", "", [], [], ""]
];
if (_hasRF) then {
	_pistols append [
		["hgun_Glock19_RF", "", "", "", [], [], ""],
		["hgun_Glock19_RF", "", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""],
        ["hgun_Glock19_auto_RF", "", "acc_flashlight_pistol", "optic_MRD_black", ["33Rnd_9x19_Mag_RF"], [], ""],
        ["hgun_DEagle_RF", "", "", "", [], [], ""]
	];
};


_loadoutData set ["rifles", _rifles];
_loadoutData set ["tunedRifles", _tunedRifles];
_loadoutData set ["enforcerRifles", _enforcerRifles];
_loadoutData set ["carbines", _carbines];
_loadoutData set ["grenadeLaunchers", _gls];
_loadoutData set ["designatedGrenadeLaunchers", _designatedGls];
_loadoutData set ["smgs", _smgs];
_loadoutData set ["machineGuns", _mgs];
_loadoutData set ["marksmanRifles", _marksmanRifles];
_loadoutData set ["sidearms", _pistols];


_loadoutData set ["lightATLaunchers", [
	["launch_MRAWS_green_rail_F", "", "", "", ["MRAWS_HEAT55_F", "MRAWS_HE_F"], [], ""],
	["launch_MRAWS_green_rail_F", "", "", "", ["MRAWS_HEAT55_F", "MRAWS_HEAT_F"], [], ""],
	["launch_MRAWS_green_rail_F", "", "", "", ["MRAWS_HEAT55_F"], [], ""],
	["launch_RPG32_tan_lxWS", "", "", "", ["RPG32_F", "RPG32_F"], [], ""]
]];
_loadoutData set ["lightHELaunchers", [
	["launch_MRAWS_green_rail_F", "", "", "", ["MRAWS_HEAT55_F"], [], ""],
	["launch_RPG32_tan_lxWS", "", "", "", ["RPG32_HE_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", ["launch_NLAW_F"]];
_loadoutData set ["AALaunchers", [
	["launch_I_Titan_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];


/////Facewear

private _facewear = [
	"G_Aviator",
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_Spectacles",
	"G_Spectacles_Tinted",
	"G_Sport_Red",
	"G_Sport_Blackyellow",
	"G_Sport_BlackWhite",
	"G_Sport_Checkered",
	"G_Sport_Blackred",
	"G_Sport_Greenblack",
	"G_Bandanna_aviator",
	"G_Bandanna_beast",
	"G_Bandanna_blk",
	"G_Bandanna_shades",
	"G_Bandanna_sport",
	"G_Bandanna_khk",
	"G_Bandanna_tan",	
	"G_Tactical_Clear",
	"G_Tactical_Black",
	"G_Combat_lxWS",
	"G_Lowprofile"
];
if (_hasRF) then {
	_facewear pushBack "G_Glasses_black_RF";
};


/////Headgear

private _headgear = [
    "lxWSH_Bandanna_blk_hs",
	"H_Booniehat_khk_hs",
	"H_Cap_blk",
	"H_Cap_blk_ION",
	"H_Cap_headphones_ion_lxWS",
	"lxWS_H_CapB_rvs_blk_ION",
	"H_MilCap_gry",
	"H_Cap_headphones",
	"H_Cap_oli_hs",
	"lsWS_H_Headset",
	"H_Beret_Headset_lxWS"
];

private _pilotHeadgear = ["H_Cap_headphones_ion_lxWS", "lxWS_H_CapB_rvs_blk_ION"];

if (_hasLawsOfWar) then {
	_pilotHeadgear append ["H_HeadSet_black_F", "H_HeadSet_white_F"];
	_headgear pushBack "H_WirelessEarpiece_F";
};


/////Uniforms

private _uniforms = [
	"U_lxWS_ION_Casual2",
	"U_lxWS_ION_Casual3",
	"U_lxWS_ION_Casual4",
	"U_lxWS_ION_Casual5",
	"U_lxWS_ION_Casual6",
	"U_BG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
	"U_I_G_resistanceLeader_F",
	"U_I_G_Story_Protagonist_F",
	"U_Marshal",
	"U_Rangemaster",
	"U_C_ArtTShirt_01_v1_F",
	"U_C_ArtTShirt_01_v4_F",
	"U_C_ArtTShirt_01_v6_F",
	"U_I_L_Uniform_01_tshirt_skull_F",
	"U_I_L_Uniform_01_tshirt_black_F"
];

private _pilotUniforms = [
	"U_lxWS_ION_Casual2",
	"U_lxWS_ION_Casual3",
	"U_lxWS_ION_Casual4",
	"U_lxWS_ION_Casual5",
	"U_lxWS_ION_Casual6"
];
if (_hasRF) then {
	_pilotUniforms append [
		"U_C_HeliPilotCoveralls_Black_RF",
	 	"U_C_HeliPilotCoveralls_Green_RF", 
		"U_C_PilotJacket_black_RF",
        "U_C_PilotJacket_brown_RF",
        "U_C_PilotJacket_lbrown_RF"
	];
};


/////Vests

private _vests = ["V_Chestrig_blk", "V_Chestrig_oli", "V_TacVest_blk", "V_TacVest_oli", "V_TacVestIR_blk", "V_lxWS_TacVestIR_oli"];

if (_hasRF) then {
	_vests append ["V_TacVest_blk", "V_TacVest_oli"]; //TODO: Incorrect items?
};
if (_hasContact) then {
	_vests pushBack "V_CarrierRigKBT_01_Olive_F";
};


private _heavyVests = ["V_PlateCarrier1_blk", "V_PlateCarrier2_blk", "V_PlateCarrier1_rgr_noFlag_F", "V_PlateCarrier2_rgr_noflag_F"];

if (_hasRF) then {
	_heavyVests pushBack "V_PlateCarrierLite_black_noflag_RF";
};
if (_hasContact) then {
	_heavyVests pushBack "V_CarrierRigKBT_01_light_Olive_F";
};


/////Backpacks

private _backpacks = ["B_AssaultPack_blk", "B_AssaultPack_sgg", "B_Kitbag_sgg"];

if (_hasRF) then {
	_backpacks append ["B_DuffleBag_Black_NoLogo_RF", "B_DuffleBag_Olive_NoLogo_RF"];
};



/////Helmets

private _helmets = ["lxWS_H_PASGT_goggles_black_F", "lxWS_H_PASGT_goggles_olive_F", "H_HelmetB_black"];

if (_hasLawsOfWar) then {
	_helmets append ["H_PASGT_basic_black_F", "H_PASGT_basic_olive_F"];
};


private _crewHelmets = ["H_Tank_black_F", "lxWS_H_PASGT_goggles_black_F", "H_Tank_black_F"];

if (_hasLawsOfWar) then {
	_crewHelmets pushBack "H_PASGT_basic_black_F";
};



private _pilotHelmets = ["H_PilotHelmetHeli_B", "H_CrewHelmetHeli_B"];

if (_hasRF) then {
	_pilotHelmets append ["H_PilotHelmetHeli_Black_RF", "H_PilotHelmetHeli_White_RF"];
};



_loadoutData set ["facewear", _facewear];
_loadoutData set ["headgear", _headgear];
_loadoutData set ["uniforms", _uniforms];
_loadoutData set ["vests", _vests];
_loadoutData set ["heavyVests", _heavyVests];
_loadoutData set ["backpacks", _backpacks];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["crewHelmets", _crewHelmets];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
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


//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["helmets", _crewhelmets];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", _pilotUniforms];
_pilotLoadoutData set ["helmets", _pilotHelmets];
_pilotLoadoutData set ["headgear", _pilotHeadgear];



// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	["headgear"] call _fnc_setHelmet;
	[selectRandom [[], "facewear"]] call _fnc_setFacewear;
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	[selectRandom["helmets", "headgear"]] call _fnc_setHelmet;
	["facewear"] call _fnc_setFacewear;
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	["headgear"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "facewear", 3]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	["headgear"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "facewear", 3]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
	};
	
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;


	[selectRandom ["rifles", "carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _minutemanTemplate = {
	["headgear"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "facewear", 3]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
	["headgear"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "facewear", 3]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	[selectRandom["carbines", "smgs"]] call _fnc_setPrimary;
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

private _saboteurTemplate = {
	[selectRandomWeighted["headgear", 2, "helmets", 1]] call _fnc_setHelmet;
	["facewear"] call _fnc_setFacewear;
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
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
	[selectRandomWeighted["headgear", 2, "helmets", 1]] call _fnc_setHelmet;
	["facewear"] call _fnc_setFacewear;
	["heavyVests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
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

private _atTemplate = {
	["headgear"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "facewear", 3]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;
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
	["headgear"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 1, "facewear", 3]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["carbines", "smgs"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
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

private _oppressorTemplate = {
	[selectRandom["helmets", "headgear"]] call _fnc_setHelmet;
	["facewear"] call _fnc_setFacewear;
	[selectRandom ["vests", "heavyVests"]] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _sharpshooterTemplate = {
	["headgear"] call _fnc_setHelmet;
	[selectRandom [[], "facewear"]] call _fnc_setFacewear;
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
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	[selectRandom["helmets", "headgear"]] call _fnc_setHelmet;
	["facewear"] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["smgs"] call _fnc_setPrimary;
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
	[selectRandom [[], "facewear"]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	["headgear"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

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

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
