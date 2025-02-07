#include "..\BuildObjectsList.hpp"
class fapovo {
	population[] = {
		{"biaboj", 293},
		{"mimi", 74},
		{"narancici", 50},
		{"ivanograd", 120},
		{"lixovo", 110},
		{"sossana", 75},
		{"zelina", 55},
		{"botana", 297},
		{"mikula", 17},
		{"viruvitia", 103},
		{"kruger", 226},
		{"jabovo", 108},
		{"malinka", 4},
		{"sharkovo", 168},
		{"jabovo2", 163},
		{"ranica", 32},
		{"vetlan", 22},
		{"islatera", 31},
		{"gralin", 50},
		{"jagobor", 37},
		{"suzevac", 58},
		{"vinkov", 12},
		{"prilov", 27},
		{"gova", 34},
		{"beratna", 449},
		{"vilay", 66},
		{"dolsko", 28},
		{"katamov", 36},
		{"chudy", 70},
		{"tf1", 122},
		{"sunburra", 40},
		{"bumin", 55},
		{"orlov", 157},
		{"plano", 300},
		{"islanoela", 127},
		{"magnola", 72},
		{"ratun", 193},
		{"lazina", 115},
		{"morana", 30}
	};
	disabledTowns[] = {"graltech", "oilterminal", "owl", "coyote", "forge", "rangetiren", "sundial", "aris", "ufocamp", "gypsy", "radar2", "kalina", "bosco", "laguna", "sbp1", "sbp2"}; //no towns that need to be disabled
	antennas[] = {
		{1545.13,1279.5,0}, // ID: 1 - Upper Jabovo Outpost
		{4480.38,629.25,0}, // ID: 2 - Airport Ivanograd
		{571.25,8023.13,0}, // ID: 3 - Kruger Lab Outpost
		{5665.13,3989.38,0}, // ID: 4 - Castle Serm
		{467.452,4498.5,0}, // ID: 5 - MOB Mermaid
		{8315.94,8295.46,0} // ID: 6 - Airport Botana Intl.

	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		
	};
	garrison[] = {
		{},{"airport_3","outpost_3","milbase_2","seaport_4","outpost_1","resource_8"},{},{}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_fs_feed_F","Land_FuelStation_Feed_F","Land_FuelStation_01_pump_malevil_F","Land_Fuelstation","Land_Fuelstation_army","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC"
	};
	milAdministrations[] = {
		{8752.45,5621.98,0},{3031,9631,0},{8494.14,1690.66,0},{903.379,4074.86,0},{2973.32,1564.61,0}
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