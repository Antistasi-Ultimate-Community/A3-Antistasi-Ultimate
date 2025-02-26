#include "..\BuildObjectsList.hpp"
class tem_kujari {
	population[] = {
		{"Gonidi",71},{"AfofoBangoua",25},{"AfofoGangna",25},{"AfofoKiska",25},{"AriBoudoumiri",84},
		{"BiriNoula",110},{"Chouwari",48},{"Damaram",629},{"Gouara",36},{"Kabaridi",25},
		{"KawiyaBoukarSouri",31},{"KawiyaGambori",82},{"KawiyaLawanBachir",39},{"KawiyaLawanBoukar",105},{"KawiyaMainari",27},
		{"KawiyaMaloumdi",44},{"KawiyaMoustapha",76},{"KoubleMaimatara",46},{"Madairi",100},{"Maiwa",46},
		{"Mandalari",46},{"Marwey",501},{"Mianmi",25},{"Mourimadi",121},{"Rara",25},
		{"Salmari",99},{"Wondori",142},{"Afofo",25},{"Mawa",29},{"LawanAridi",46},
		{"Ariboudoumari",30},{"Samari",182},{"Douro",39},{"GeydamTchoukou",292},{"Barawas",32},
		{"Bramataro",34},{"Walada",54},{"Gororop",25},{"Mimi",78},{"BiriBoula",128},
		{"Kaoya",115},{"Malari",25},{"GajajiMastafa",25},{"Masakali",55},{"Isufuri",25},
		{"KyariKinnai",206},{"MallumtiBurin",50},{"Yusufari",92},{"BalamaKurdi",69},{"Chunguliski",25},
		{"GadjadjiLawan",33},{"Tsakuwa",25},{"Gano",25},{"Kumbotso",25},{"Kura",116},
		{"Izala",47},{"Danashiwa",169},{"Turawa",25},{"Karaye",31},{"Bora",83}
	}; 
	disabledTowns[] = {"Ndilgori"};
	antennas[] = {
		{9907.64,8816.97,0.0937614},{6227.55,9143.77,0.0173683},{11706.2,6888.35,0.0166779},{6463.11,11835.9,0.00778198},
		{8057.83,3152.71,0.0414696},{4289.6,3838.09,0.00062561},{14559.3,9804.99,0.121281},{12689.9,3212.28,-0.00634003},
		{2218.75,4310.41,-0.00779724},{15247.8,5813.69,0.0383797},{12153.8,15080.1,-0.00162506},{1004.36,12550.4,0.0623932},
		{3028.17,15750.5,0.0923653}
	};
	antennasBlacklistIndex[] = {}; 
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"milbase_1","outpost_8","outpost_16","outpost_19","resource_1","resource_2","resource_13"},{},{"control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{11757.375,2692.375,0},{15058,10807.875,0},{4048.75,8720.875,0},{5974.5,10572.125,0}
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_SAND,
		BUILDABLES_ARID,
		BUILDABLES_CUP,
		BUILDABLES_UNIVERSAL
	};
};
