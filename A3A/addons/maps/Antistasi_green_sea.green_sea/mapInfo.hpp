#include "..\BuildObjectsList.hpp"
class green_sea 
{
	population[] = {
		{"city_Chernogorsk", 532},
		{"city_Elektrozavodsk", 521},
		{"vill_Tulga", 35},
		{"city_Solnychniy", 179},
		{"city_Berezino", 279},
		{"city_StarySobor", 150},
		{"vill_Msta", 76},
		{"vill_Staroye", 93},
		{"vill_Shakhovka", 52},
		{"vill_Dolina", 76},
		{"vill_Orlovets", 54},
		{"vill_Bor", 52},
		{"city_Gorka", 136},
		{"vill_NovySobor", 110},
		{"vill_Kabanino", 78},
		{"vill_Mogilevka", 100},
		{"vill_Nadezhdino", 82},
		{"vill_Guglovo", 25},
		{"vill_Kamyshovo", 168},
		{"vill_Pusta", 47},
		{"city_Zelenogorsk", 235},
		{"city_Vybor", 188},
		{"vill_Dubrovka", 94},
		{"vill_Khelm", 90},
		{"vill_Olsha", 18},
		{"vill_Gvozdno", 91},
		{"city_Krasnostav", 182},
		{"vill_Petrovka", 38},
		{"vill_Grishino", 121},
		{"vill_Rogovo", 63},
		{"vill_Pogorevka", 65},
		{"vill_Pustoshka", 156},
		{"vill_Kozlovka", 94},
		{"vill_Polana", 123},
		{"vill_Balota", 133},
		{"vill_Komarovo", 108},
		{"vill_Kamenka", 110},
		{"vill_Myshkino", 55},
		{"vill_Pavlovo", 77},
		{"vill_Lopatino", 119},
		{"vill_Vyshnoye", 37},
		{"vill_Prigorodki", 127},
		{"vill_Drozhino", 79},
		{"vill_Sosnovka", 45},
		{"vill_Nizhnoye", 112},
		{"vill_Pulkovo", 34},
		{"vil_Peregon", 179},
		{"Caribou_isl029", 57},
		{"Caribou_isl051", 0},
		{"Utes_name", 0}
	};
	disabledTowns[] = {"Caribou_isl051","Utes_name"};
	antennas[] = {
		{18756.8,3134.26,0},{18289.3,1370.28,0},{15694.5,3797.18,0},{19413,5229.23,0},{4382.49,2113.59,0},{20132.6,13999.8,0},{4783.7,11457.4,0},{12530.4,12106.2,0},{5964.07,12690.3,0},{4490.69,16111.1,0},{12455.4,18906.4,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"outpost_22","outpost_24","outpost_25","outpost_26","seaport_5","milbase_2","airport_5","resource_10","resource_11","resource_12", "resource_13", "factory_5"},{},{}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	milAdministrations[] = {
		{9914.04,8561.59,0},{11489.5,15359.9,-3.8147e-006},{2493.91,11565.8,0},{17076.549,18934.75,0}
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