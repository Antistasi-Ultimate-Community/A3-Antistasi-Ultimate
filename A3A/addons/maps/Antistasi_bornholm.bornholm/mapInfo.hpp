#include "\x\A3A\addons\maps\BuildObjectsList.hpp"
class bornholm {
	population[] = {
{"Tejn", 198},
{"Hammershus", 10},
{"Vang", 182},
{"Hasle", 749},
{"Klemensker", 312},
{"Olsker", 88},
{"Roe", 174},
{"Teglkaas", 41},
{"Rutsker", 51},
{"Muleby", 77},
{"Sorthat", 48},
{"Nyker", 150},
{"Nylars", 120},
{"Lobbaek", 112},
{"Aakirkeby", 431},
{"Vestermarie", 83},
{"Aarsballe", 47},
{"Arnager", 60},
{"Soemarken", 40},
{"OesterSoemarken", 76},
{"Strandmarken", 40},
{"Dueodde", 31},
{"Snogebaek", 32},
{"Balka", 17},
{"Pedersker", 146},
{"Nexoe", 532},
{"Aarsdale", 239},
{"Svaneke", 415},
{"Listed", 37},
{"Oestermarie", 158},
{"Oesterlars", 94},
{"Saltune", 12},
{"Tofte", 16},
{"Roenne", 914},
{"RoenneCenter", 583},
{"Moellevangen", 56},
{"NexoeCenter", 560},
{"Sandvig", 246},
{"Allinge", 350},
{"Melsted", 107},
{"Boelshavn", 12},
{"Boderne", 10},
{"Christiansoe", 137},
{"Ertholmene", 16},
{"Gudhjem", 367}
		
	};
	disabledTowns[] = {"Hammershus","Saltune","Boelshavn","Boderne","Dueodde","Ertholmene","Christiansoe","RoenneCenter","NexoeCenter"}; //no towns that need to be disabled
	antennas[] = {
		{11010,10996.6,0.0017395}, 
		{7613.93,11681.4,0},
		{8390.47,8459.06,0.0132141},
		{15592.2,5545.28,0.209503},
		{3279,10093.6,0.0243454},
		{9275.19,2532.52,0.00250626},
		{2081.95,11147,0.00671768},
		{1926.46,9088.29,0.0217743},
		{1928.94,6797.62,0.00681305},
		{16599.1,1601.06,0.677429},
		{19721,22013.7,0.750999},
		{4660.25,16241.75,0.008},
		{13937.5,10755.5,0},
		{5086.75,19362.25,0.100},
		{2803,13879.5,0},
		{4343,4780.5,0},
		{9371.412,15039.610,-0.002},
		{7614,11684.5,0.031},
		{9318.5,11729,0},
		{15463.482,3256.413,0}
		
	
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{4777.75,19176,0},{1665.25,13018.75,0}
		
	};
	garrison[] = {
		{},{"airport_3","outpost_13","outpost_41", "resource_12","outpost_28","factory_7","factory_14","resource_1","outpost_39","outpost_45","resource_10"},{},{"control_5","control_6","control_19","control_20","control_75","control_76"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{4028.216,19958.871,0},{1961.75,11819.75,0},{1929,10858.5,0},{6503.5,5793,0},{9603.468,5919.625,0},{12124.125,1161.25,0},{17973.875,7942,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_UNIVERSAL,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE
	};
};