#include "..\BuildObjectsList.hpp"
class drakovac {
	population[] = {
		{"lucica", 106},
		{"augustin", 47},
		{"srem", 62},
		{"diocese", 54},
		{"studenac", 77},
		{"osoru", 12},
		{"sibenska", 48},
		{"unije", 9},
		{"podkujni", 74},
		{"smokve", 72},
		{"krivenje", 47},
		{"mazova", 11},
		{"televrin", 8},
		{"ridmutak", 7},
		{"mikul", 10},
		{"sonte", 33},
		{"lipica", 19},
		{"ozor", 31},
		{"tomozina", 28},
		{"bijar", 28},
		{"castellani", 25},
		{"stanzia", 26},
		{"punta_kriza", 383},
		{"perhavac", 97},
		{"gospodarsko", 29},
		{"pogana", 120},
		{"peski", 27},
		{"kaldonta", 13},
		{"uvala", 51},
		{"vlaska", 17},
		{"sveti_jakov", 84},
		{"kovaceva", 67},
		{"galboka", 24},
		{"vidovići", 53},
		{"hrasta", 45},
		{"martinšćica", 42},
		{"lubenice", 26},
		{"pernat", 26},
		{"sveti_anton", 48}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{1470.823,1951.191,0}, {7467.438,1600.858,0}, {8202.137,4398.358,0}, {10934.377,6614.244,0}, {10655.943,11595.173,0}, {6050.464,11066.818,0}, {2184.669,8707.136,0}, {9157.257,692.506,0.003}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {
		{},{"airport","outpost","outpost_2","outpost_19","outpost_20","resource","seaport_4","milbase_1","control_6","control_7","control_20","control_21"},{},{"control_6","control_7","control_20","control_21"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{7343.686,5313.195,0},{6641.02,6391.657,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL
	};
};