#include "\x\A3A\addons\maps\BuildObjectsList.hpp"
class egl_laghisola {
	population[] = {
	{"Tama", 6},
	{"Itaura", 268},
	{"Esperan", 259},
	{"Vala", 56},
	{"Valado", 16},
	{"SandeRasna", 25},
	{"Cacola", 105},
	{"ManikauaMn", 126},
	{"Cape", 112},
	{"Baltarni", 200},
	{"Santiani", 97},
	{"Verno", 60},
	{"Rica", 91},
	{"Kabypana", 268},
	{"SandeRopa", 175},
	{"Fazen", 36},
	{"Guaytan", 33},
	{"Binora", 99},
	{"MonteSore", 104},
	{"Sollano", 8},
	{"Zaro", 79},
	{"Carayan", 164},
	{"Cubanua", 100},
	{"Marlan", 91},
	{"Saray", 116},
	{"MonteCristoPrison", 141},
	{"Komerca", 72},
	{"PalmOilHill", 142},
	{"Elisio", 154},
	{"Penedo", 211},
	{"doldrums", 201},
	{"Joianopantano", 191}

	};
	disabledTowns[] = {"Esperan","Valado","Vala","Baltarni","Cubanua","Fazen","Guaytan","Kabypana","Komerca","ManikauaMn","MonteCristoPrison","MonteSore","SandeRasna","Saray","PalmOilHill","Tama","Carayan","Penedo","Marlan"}; //no towns that need to be disabled
	
	antennas[] = {
		{5115.24,4848.42,0.0013237},{4734.13,4095.8,-1.90735e-06},{4823.22,6413.39,0.0394974},{3689.7,3716.6,0.0581551},{7279.1,4381.64,0},{7384.11,3609.24,0.809658},{7536.85,7526.46,0},{2453.32,7271.85,0},{2337.33,7470.55,0.00394249},{5454.77,8781.2,9.15527e-05},{1274.12,8687.63,0},{1366.85,335.166,0.445953}
	};
	antennasBlacklistIndex[] = {1,2,4,8,12};
	banks[] = {
		{6533.75,2389.875,0}
	};
	garrison[] = {
		{},{airport_2,outpost_8,outpost_7,milbase_3},{},{control_9}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC"
	};
	milAdministrations[] = {
		{6809.821,2405.739,4.538},{1806.189,5855.292,3.06},{8404.146,5429.703,15.591}
		
	};
	climate = "Temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL
	};
};