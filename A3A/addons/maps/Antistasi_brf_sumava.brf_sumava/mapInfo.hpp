#include "..\BuildObjectsList.hpp"
class brf_sumava {
	population[] = {}; //automated data is fine and needs no adaptation
	disabledTowns[] = {};
	antennas[] = {
		{714.059,11491.5,0},{3023.59,11558.5,0.0440907},{5242.85,8589.15,0.542652},{310.491,2006.59,0},
		{11068.3,1740.35,0.542648}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {{},{"airport", "outpost", "resource_3", "control_1", "control_2", "control"},{},{"control_1", "control_2", "control"}};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F",
		"Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F",
		"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC",
		"Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{2228.06,11491.9,0},{2067.18,2684.47,0},{10448.4,8228.22,0},
		{4761.86,6566.92,0},{10197.2,810.374,0},{4744.35,1488.48,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL
	};
	// Needs a look over to see if vanilla objects are suitable
};
