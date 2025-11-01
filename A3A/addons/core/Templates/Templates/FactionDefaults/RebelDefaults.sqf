//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["FirstAidKit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["mediKits", ["Medikit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["toolKits", ["ToolKit"]] call _fnc_saveToTemplate;  // Relies on autodetection.
["itemMaps", ["ItemMap"]] call _fnc_saveToTemplate;  // Relies on autodetection.
["diveGear", ["U_I_Wetsuit", "V_RebreatherIA", "G_Diving"]] call _fnc_saveToTemplate;
["flyGear", ["U_I_pilotCoveralls"]] call _fnc_saveToTemplate;

["lootCrate", "A3AP_Box_Syndicate_Ammo_F"] call _fnc_saveToTemplate;
["rallyPoint", "B_RadioBag_01_wdl_F"] call _fnc_saveToTemplate;
["reviveKitBox", ["Box_NATO_Support_F", 2100]] call _fnc_saveToTemplate;

["vehiclesCivPlane", []] call _fnc_saveToTemplate;
["vehiclesPlane", []] call _fnc_saveToTemplate;
["vehiclesMedical", []] call _fnc_saveToTemplate;

["animations", []] call _fnc_saveToTemplate;
["variants", []] call _fnc_saveToTemplate;

["flares", ["F_40mm_white", "F_40mm_Red", "F_40mm_Yellow", "F_40mm_Green"]] call _fnc_saveToTemplate;

["vehicleLightSource", "Land_LampShabby_F"] call _fnc_saveToTemplate;
["vehicleFuelDrum", ["FlexibleTank_01_forest_F", 2000]] call _fnc_saveToTemplate;
["vehicleFuelTank", ["B_Slingload_01_Fuel_F", 10000]] call _fnc_saveToTemplate;
["vehicleRepairStation", ["Land_RepairDepot_01_green_F", 10000]] call _fnc_saveToTemplate;
["vehicleAmmoStation", ["Box_IND_AmmoVeh_F", 10000]] call _fnc_saveToTemplate;
["vehicleHealthStation", ["Land_MedicalTent_01_MTP_closed_F", 75]] call _fnc_saveToTemplate;

private _medBox = ["Box_AAF_Equip_F", 5];
if(A3A_hasACE) then {
	_medBox = ["ACE_medicalSupplyCrate_advanced", 5];
};

["vehicleMedicalBox", _medBox] call _fnc_saveToTemplate;

["attributesVehicles", []] call _fnc_saveToTemplate;

//FIA Rebels as Example
["faces", ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","Ioannou","Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE", "Male02GRE", "Male03GRE", "Male04GRE", "Male05GRE", "Male06GRE"]] call _fnc_saveToTemplate;
