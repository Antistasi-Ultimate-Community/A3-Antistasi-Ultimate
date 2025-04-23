#include "..\BuildObjectsList.hpp"
class iron_excelsior_Tobruk {
	population[] = {
		{"baccara", 110},{"marcuca", 59},{"solaro", 13},{"hariga", 122},{"perrone", 0},{"hotel", 143},{"tobruk", 1039},{"birauda", 151},{"hospital", 51},{"airenti", 3},{"oupost2", 499},{"kingscross", 25},{"outpost1", 0},{"maclub", 131},{"gubbi", 119},{"mahmud", 125},{"marsatobruk", 112},{"daud", 147},{"distillery", 14}
	};
	disabledTowns[] = {"marcuca","solaro","perrone","hospital","airenti","kingscross","outpost1","distillery"};
	antennas[] = {
	{4948.738,1732.944,0},{475.454,7961.95,0},{8831.038,1038.956,0},{5276.479,6441.453,0}
};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"outpost","outpost_1","seaport","seaport_1","control"},{},{"control"}
	};
	fuelStationTypes[] = {"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"};
	milAdministrations[] = {
		{5997.239,6149.627,0.197}
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_SAND,
		BUILDABLES_ARID,
		BUILDABLES_CUP,
		BUILDABLES_UNIVERSAL
	};
	// Needs to be re-done when possible (?)
};
