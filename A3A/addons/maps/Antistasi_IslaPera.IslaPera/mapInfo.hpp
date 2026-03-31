#include "\x\A3A\addons\maps\BuildObjectsList.hpp"
class IslaPera {
	population[] = {
		{"PresaAlta", 112},{"AbandonedResort", 102},{"LoggingCamp", 74},{"RioSeco", 114},{"CartelCamp02", 102},{"CartelCamp01", 56},{"Esmeralda", 144},{"Cambulos", 114},{"ElPato", 134},{"SantaIsabel", 340},{"Tina", 164},{"Cacao", 90},{"abandonedvillage", 33},{"AirStationMike69", 26},{"Bocachico", 700},{"Avila", 210},{"Pava", 142},{"SanJavier", 50},{"ElGuamo", 100},{"Coraros", 210}
		
	};
	disabledTowns[] = {"CartelCamp02","CartelCamp01","AbandonedResort","abandonedvillage","AirStationMike69","LoggingCamp","PresaAlta"}; //no towns that need to be disabled	
	
	antennas[] = {
		{7357.93,5599.99,0.161621},{3172.45,2656.02,0.0867615},{5774.54,8340.09,0.505314},{4499.42,8481.67,-7.55243},{532.841,1609.948,0},{1913.198,3898.319,0},{7170.472,6712.629,0}
		
	};
	antennasBlacklistIndex[] = {
		{4};
	};

	banks[] = {
		{3873.175,2115.419,1.141}
	
	};
	garrison[] = {
		{},{"airport_02","outpost_09","outpost_08","resource_04"},{},{"control_05","control_06","control_41,","control_42"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{4007.517,2408.959,0},{1755.741,2914.329,0},{8083.223,2753,0}
	};
	climate = "tropical";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_UNIVERSAL,
		BUILDABLES_MODERN_GREEN,	
		BUILDABLES_TROPIC
	};
};