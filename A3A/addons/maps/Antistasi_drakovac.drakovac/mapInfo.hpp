#include "..\BuildObjectsList.hpp"
class drakovac {
	population[] = {
		{"lucica", 106},{"augustin", 47},{"srem", 62},{"diocese", 54},{"studenac", 77},{"osoru", 12},{"sibenska", 48},{"unije", 9},{"podkujni", 74},{"smokve", 72},{"krivenje", 47},{"mazova", 11},{"televrin", 8},{"ridmutak", 7},{"mikul", 10},{"sonte", 33},{"lipica", 19},{"ozor", 31},{"tomozina", 28},{"bijar", 28},{"castellani", 25},{"stanzia", 26},{"punta_kriza", 383},{"perhavac", 97},{"gospodarsko", 29},{"pogana", 120},{"peski", 27},{"kaldonta", 13},{"uvala", 51},{"vlaska", 17},{"sveti_jakov", 84},{"kovaceva", 67},{"galboka", 24},{"vidovići", 53},{"hrasta", 45},{"martinšćica", 42},{"lubenice", 26},{"pernat", 26},{"sveti_anton", 48}
	};
	disabledTowns[] = {"srem"};
	antennas[] = {
		{6420.7,5826.99,0.249046},{5073.08,5794.67,0.038414},{7380.69,7272.53,0},{6017.87,4253.6,0},{4309.6,7920.39,0.0508881},{8110.17,4408.72,0},{4041.85,4557.41,0.0282707},{8202.07,4398.48,0},{8640.43,2922.7,0},{10499,4652.81,0.19014},{10587.5,8352.94,0},{1275.77,3401.08,0.0121155},{4248.97,11600.6,0},{768.404,9022.04,0.0408001},{2610.7,11279.6,0.0285034}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {
		{}, {"airport_3", "seaport_4", "milbase_6", "outpost_14", "outpost_8", "seaport_3", "resource_11", "outpost_13", "seaport_2", "control_37", "control_12", "control_14", "control_44", "control_27"},{},{"control_37", "control_12", "control_14", "control_44", "control_27"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		//{3648.51,13196.9,0},{9282.15,12145.9,0},{11327,14143.8,0},{16698.1,12790.1,0},{18387.5,15241.4,0},{25671,21343.1,0},{21000.4,16983.9,-0.396477}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL
	};
};