//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["FirstAidKit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["mediKits", ["Medikit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.

["insignia", []] call _fnc_saveToTemplate;
["sfInsignia", []] call _fnc_saveToTemplate;
["milInsignia", []] call _fnc_saveToTemplate;
["polInsignia", []] call _fnc_saveToTemplate;
["eliteInsignia", []] call _fnc_saveToTemplate;

// The bellow are optional overrides

["vehiclesDropPod", []] call _fnc_saveToTemplate; 

["placeIntel_desk", ["Land_CampingTable_F",0]] call _fnc_saveToTemplate;  // [classname,azimuth].
["placeIntel_itemMedium", ["Land_Document_01_F",-155,false]] call _fnc_saveToTemplate;  // [classname,azimuth,isComputer].
["placeIntel_itemLarge", ["Land_Laptop_unfolded_F",-25,true]] call _fnc_saveToTemplate;  // [classname,azimuth,isComputer].

["attributesVehicles", []] call _fnc_saveToTemplate;
["animations", []] call _fnc_saveToTemplate;
["variants", []] call _fnc_saveToTemplate;

["vehiclesAirPatrol", []] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", []] call _fnc_saveToTemplate;
["vehiclesPlanesLargeAA", []] call _fnc_saveToTemplate;
["vehiclesPlanesGunship", []] call _fnc_saveToTemplate;

["flares", ["F_40mm_white", "F_40mm_Red", "F_40mm_Yellow", "F_40mm_Green"]] call _fnc_saveToTemplate;

["smallBunker", "Land_BagBunker_Small_F"] call _fnc_saveToTemplate;
["sandbag", "Land_BagFence_Long_F"] call _fnc_saveToTemplate;
["sandbagRound", "Land_BagFence_Round_F"] call _fnc_saveToTemplate;
