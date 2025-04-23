#include "..\BuildObjectsList.hpp"
class namalsk {
	population[] = {
{"OldHospital", 81},
{"OldSawmill", 43},
{"TaraHarbor", 130},
{"Nemsk", 183},
{"NemskFactory", 34},
{"Jalovisko", 176},
{"Vorkuta", 301},
{"VorkutaOut", 139},
{"OldYard", 60},
{"Alakit", 31},
{"SebjanDam", 33},
{"SebjanAIR", 71},
{"SebjanCHEM", 65},
{"Sebjan", 232},
{"SebjanMINE", 40},
{"SebjanWAR", 41},
{"Lubjansk", 186},
{"TaraRAIL", 119},
{"BrenskRAIL", 149},
{"AII", 132},
{"AI", 6},
{"Brensk", 50},
{"Norinsk", 73}};
	disabledTowns[] = {"OldSawmill","NemskFactory","Alakit","SebjanDam","SebjanAIR","SebjanCHEM","SebjanMINE","SebjanWAR","BrenskRAIL"};
	antennas[] = {
		{7602.856,11245.77,0},{4807.747,10834.78,0},{4164.692,6654.220,0},{6301.125,9338.219,0},{7264.734,7077.224,0}
	};
	antennasBlacklistIndex[] = {0};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"milbase_1","outpost_5","outpost_8","seaport_1","control_2"},{},{"control_2"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	milAdministrations[] = {
		{7347.248,7934.714,0},{5753.133,8670.256,0},{6672.96,11121.087,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_CUP,
		BUILDABLES_UNIVERSAL
	};
};
