#include "\x\A3A\addons\maps\BuildObjectsList.hpp"
class bozcaada {
	population[] = {
		{"merkez_city",2401}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{12837.81,10356.083,-0.001},{7671.087,12459.68,0},{12777.8,12908.4,0.576782},{14565.1,11960.3,0.760006}
	};
	antennasBlacklistIndex[] = {
	
	};	

	banks[] = {
		{14117,12009.3,17.3781};
		
	};
	garrison[] = {
		{},{"airport_1","resource_5","outpost_19","outpost_18","outpost_2","factory_3","outpost_8","factory_5","outpost_9","outpost_20","milbase"},{},{"control","control_1"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{14050.9,12273.2,0.27},{14330.126,11873.051,0}
		
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_UNIVERSAL,
		BUILDABLES_MODERN_SAND,
		BUILDABLES_ARID
	};
};