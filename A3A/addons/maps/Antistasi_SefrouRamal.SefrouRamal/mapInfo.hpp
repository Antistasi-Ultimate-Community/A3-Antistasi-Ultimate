#include "..\BuildObjectsList.hpp"
class sefrouramal {
	population[] = {}; //automated data is fine and needs no adaptation
	disabledTowns[] = {};
	antennas[] = {
		{4330.28,1248.04,0},{3298.5,2808.47,0},{8336.84,3027.88,0},{4316.21,4958.38,0},{4316.54,7086.75,0},{6072.25,7593.97,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {{},{"airport_1", "outpost_8", "outpost_9"},{},{"control_41", "control_2", "control_5"}};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{4499.87,2902.21,0}, {5565.09,5087.64,0}
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_ARID,
		BUILDABLES_WS,
		BUILDABLES_UNIVERSAL
	};
    // Needs to be re-done when possible
};