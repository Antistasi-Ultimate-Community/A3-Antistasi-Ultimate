#include "..\BuildObjectsList.hpp"
class VTF_Korsac_Winter {
	population[] = {
		{"rostok", 626},{"czero", 349},{"nizhnegorsk", 139},{"nozyba", 241},{"myro", 104},{"nikovskaya", 54},{"novayazelen", 52},{"zerno", 44},{"chernyshakal", 53},{"zelenydoliny", 19},{"lynsk", 68},{"kirvansk", 32},{"nizkiy", 33},{"borzoisk", 14}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{7466.583,1029.388,0}, {849.591,7191.565,0}, {4673.983,5637.258,0}, {1712.761,4233.053,0}, {6718.211,3399.646,0}, {2315.687,2048.368,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {
		{},{"airport_2", "outpost_12", "resource_1","control_12","control_13","control_44","control_45","control_46","control_47"},{},{"control_12","control_13","control_44","control_45","control_46","control_47"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{2947.129,2615.230,0},{1767.030,2669.186,0},{4869.768,1890.52,0}
	};
	climate = "arctic";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_ARCTIC,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL
	};
};