#include "..\BuildObjectsList.hpp"
class optre_madrigal {
	population[] = {
		{"Barcelonova", 683},{"Fort_Romeo", 124},{"Castilla_Facility", 229},{"Castra_Arcology", 360},{"Airbase", 336},{"Enix_Relay", 172},{"Merida", 473},{"Caralis", 197},{"Gibaja", 163},{"Ostia", 103},{"Malaca", 79},{"Laredo_Base", 197},{"Sierra_Outpost", 111},{"Victor_Outpost", 35},{"Gladius_Academy", 277},{"Adrada", 89},{"Nisa", 63},{"Luciana", 120},{"Gargantiel", 92},{"Onil", 55},{"Illana", 128},{"Arenys", 188},{"Neila", 171},{"Monroy", 118},{"Nasca", 43},{"Cartagena", 102},{"San_Jose", 82},{"Encinitas", 203},{"LaVilla_Resort", 115},{"Getaria", 230}
	};
	disabledTowns[] = {"Fort_Romeo","Castilla_Facility","Airbase","Enix_Relay","Laredo_Base","Sierra_Outpost","Victor_Outpost","Gladius_Academy"};
	antennas[] = {
		{5729.58,4304.33,0},{6552.97,763.547,0},{5845.01,2283.75,0},{5619.04,2978.83,0},{7185.34,3671.44,0},{5614.58,5918.11,0},{6531.14,6203.85,0},{6032.99,4425.59,0},{1687.52,7400.32,0},{1266.89,6072.98,0},{1745.85,4148.14,0},{2637.16,4328.64,0},{2318.92,2526.15,0},{4453.64,3058.05,0},{4413.891,3054.943,0},{2374.032,2542.946,0},{701.009,6393.149,0},{2701.494,4134.769,-0.001}
	};
	antennasBlacklistIndex[] = {0,2,3,4,6,7,9,10,11,12};
	banks[] = {}; 
	garrison[] = {
		{},{"outpost_6","outpost_7","resource_2"},{},{}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	milAdministrations[] = {
		{2194.121,3435.699,0.289},{4470.977,3698.007,0},{4278.438,6311.146,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_SCIFI,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL
	};
	// Needs to be re-done when possible
};
