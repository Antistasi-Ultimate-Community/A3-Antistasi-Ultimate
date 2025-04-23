class tem_chernarusw {
	population[] = {
		{"Alta", 348},{"Rafsbotn", 328},{"Russertoppen", 18},{"Kvenvik", 89},{"Melsvik", 152},{"Talvik", 117},{"Maze", 28},{"Sorvar", 48},{"Skaidi", 17},{"Skoganvarre", 30},{"Iskuras", 34},{"Kautokeino", 27},{"Oteren", 74},{"Lyngseidet", 60},{"Siebe", 50},{"Lakselv", 72},{"Nyvoll", 39},{"Eiby", 23},{"Stengelsen", 77},{"Gargia", 17},{"Kirkenes", 138},{"Rogne", 118},{"Ryfoss", 48},{"Nystuen", 43},{"Tyin", 8},{"Randsverk", 61},{"Skogbygda", 100},{"Heidal", 17},{"Sandbumoen", 52},{"Forset", 34},{"Follebu", 58},{"Faberg", 112},{"Jorstadmoen", 43},{"Ringsaker", 69},{"Bilitt", 99},{"Bjoneroa", 68},{"Gulsvik", 58},{"Solumsmoen", 31},{"Seljord", 55},{"Hemsedal", 67},{"Gravset", 25},{"Leveld", 78},{"Ustaoset", 47},{"Dyranut", 29},{"Utne", 70},{"Anes", 14}
	};
	disabledTowns[] = {};
	antennas[] = {
		{5125.701,2353.229,0},{6521.86,3624.619,0},{11255.68,4304.561,0},{12919.624,12767.68,0.007},{8850.322,11657.392,0},{8136.89,9137.387,0},{4630.810,9736.921,0},{6331.710,7700.563,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"outpost_3","outpost_21","control_30","resource_5", "resource_8", "factory"},{},{"control_30"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	milAdministrations[] = {
		{7214.376,7685.618,0},{12831.134,10088.688,0},{12042.953,3594.922,0},{2978.561,5419.017,0},{6932.764,2604.034,0}
	};
	climate = "arctic";
	buildObjects[] = {
		{"CUP_Winter_obj_fortified_nest_big", 300}, {"Land_Fort_Watchtower_EP1", 300}, {"Fort_Nest", 60}, {"CUP_Winter_obj_snowman", 200},
		{"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
		// CUP sandbag walls
		{"Land_BagFenceLong", 10}, {"Land_BagFenceShort", 10}, {"Land_BagFenceRound", 10},        //{"Land_BagFenceEnd", 0, 5}, 
		// Other CUP fences
		{"Land_fort_artillery_nest_EP1", 200}, {"CUP_Winter_obj_fort_rampart_ep1", 50}, {"FenceWood", 10}, {"FenceWoodPalet", 10},
		// Non-camo vanilla stuff
		{"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
		{"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
	};
};
