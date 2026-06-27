#include "..\BuildObjectsList.hpp"
class UMB_Armavir {
	population[] = {
{"Pavlovskaya", 181},
{"Tikhoretsk", 23},
{"Kamennyy", 17},
{"Prigorodnyy", 121},
{"Atamanka", 5},
{"Mirskoy", 139},
{"Stepnoy", 21},
{"Proletarskiy", 66},
{"Kropotkin", 26},
{"Priozernyy", 131},
{"Kosyakinskaya", 191},
{"Seredinskiy", 119},
{"Zapadnyy", 68},
{"Konokovo", 121},
{"Uspenskoye", 146},
{"Ukrainskiy", 66},
{"Beletskiy", 145},
{"Malamino", 69},
{"Sukhoy", 247},
{"Kommayak", 123},
{"Edissiya", 181},
{"Svoboda", 132},
{"Kochergin", 104},
{"Izmaylov", 87},
{"Udarnyy", 146},
{"Loboda", 93},
{"Novolabinskii", 57},
{"Nekrasov", 99},
{"Pervaya_Siniukha", 156},
{"Zubodne", 88},
{"Peredovoi_Industry", 74},
{"Pervomaiskii_Industry", 93},
{"Peredovoi_Castle", 47},
{"Fortshtadt", 23},
{"Zuevo", 264},
{"Zuevo_Prison", 38},
{"Kartsev", 16},
{"Tambovskii", 127},
{"Lesnoi", 15},
{"Lesnoi_Base", 99},
{"Krupskii", 57},
{"Rastsvet", 27},
{"Blechepsin", 113},
{"Georgievskoe", 50},
{"Labinsk", 6},
{"Zapadnyy_Industrial", 53}
	};
	disabledTowns[] = {"Peredovoi_Industry","Pervomaiskii_Industry","Lesnoi_Base","Zapadnyy_Industrial"}; //no towns that need to be disabled
	antennas[] = {
		{20234.713,24058.117,0},{17227.932,14677.137,0},{23991.727,12508.381,2.805},{25197.502,7831.787,0},{12299.186,8173.839,0},{6186.099,5267.791,0},{8875.642,14760.96,0},{3687.330,22204.584,0},{13860.011,26222.9,0},{15535.173,5147.5,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
	
	};
	garrison[] = {
		{},{"airport_3", "seaport_11", "resource_17","outpost_38", "outpost_39", "factory_14", "resource_18", "milbase_5", "outpost_40", "control_21","control_22","control_23","control_65","control_66","control_67","control_68","control_69"},{},{"control_21","control_22","control_23","control_65","control_66","control_67","control_68","control_69"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{24801.416,9297.618,0},{14924.552,10200.258,0},{7101.352,17323.938,0},{23145.723,13910.898,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_UNIVERSAL,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_CUP
	};
};