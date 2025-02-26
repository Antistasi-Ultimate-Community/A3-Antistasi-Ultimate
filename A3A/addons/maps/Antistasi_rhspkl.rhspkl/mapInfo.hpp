#include "..\BuildObjectsList.hpp"
class rhspkl {
	population[] = {
		{"DefaultKeyPoint1",40},{"DefaultKeyPoint4",200},{"DefaultKeyPoint32",50},{"DefaultKeyPoint34",100},
        {"DefaultKeyPoint35",110},{"DefaultKeyPoint36",105},{"DefaultKeyPoint37",10},{"DefaultKeyPoint38",50},
        {"DefaultKeyPoint39",250},{"DefaultKeyPoint40",300},{"DefaultKeyPoint43",350},{"DefaultKeyPoint49",180},
        {"DefaultKeyPoint53",160},{"DefaultKeyPoint5",250},{"DefaultKeyPoint6",550},{"DefaultKeyPoint7",80},{"DefaultKeyPoint8",200},
        {"DefaultKeyPoint9",180}
		};
	disabledTowns[] = {};
	antennas[] = {
		{5418.42,2559.52,0},{3674.47,2705.45,0},{2287.05,6480.78,0},{4552.77,5420.52,0}
	};
	antennasBlacklistIndex[] = {11, 15, 17, 21, 24, 27};
	banks[] = {};
	garrison[] = {
		{},{"airport_2","resource_2","control_3","control_12","control_35","control_34","control_38","control_42","control_44"},{},{"control_3","control_12","control_35","control_34","control_38","control_42","control_44"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{1036.800,711.183,0.557},{4089.152,6984.706,0}
	};
	climate = "tropical";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TROPIC,
		BUILDABLES_UNIVERSAL
	};
    // Needs to be re-done when possible
};
