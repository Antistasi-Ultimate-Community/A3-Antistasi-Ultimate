#include "..\BuildObjectsList.hpp"
class takistan {
	population[] = {
		{"city_FeeruzAbad",218},{"city_Nagara",99},{"city_Rasman",237},{"city_Garmsar",148},{"city_Bastam",66},{"city_Nur",127},{"city_Zavarak",160},{"city_Falar",86},{"city_Anar",92},{"city_ChakChak",129},{"city_Sakhee",97},{"city_Chaman",110},{"city_LoyManara",114},{"vill_Gospandi",50},{"vill_Mulladoost",110},{"vill_Khushab",84},{"vill_Jilavur",52},{"vill_Shukurkalay",127},{"vill_Imarat",40},{"vill_Ravanay",56},{"vill_Timurkalay",67},{"vill_Kakaru",29},{"vill_Landay",25},{"vill_Huzrutimam",83},{"vill_Sultansafee",52},{"vill_Jaza",61},{"vill_Chardarakht",99},{"vill_Shamali",36},{"vill_Karachinar",90},{"city_Garmarud",73}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{10106.4,10343.8,0},{616.562,4520.12,0},{4014.64,3089.66,0.150604}, {5249.37,3709.48,-0.353882}, {3126.7,8223.88,-0.649429}, {8547.92,3897.03,-0.56073}, {5578.24,9072.21,-0.842239}, {2239.98,12630.7,-0.575844}
	};
	antennasBlacklistIndex[] = {}; //no antennas that need to be blacklisted
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"airport_1", "outpost_5", "outpost_6", "outpost_7", "outpost_8", "resource", "resource_5", "resource_6"},{},{"control", "control_1", "control_2", "control_5", "control_13", "control_20", "control_21", "control_22", "control_24", "control_25", "control_31"}
	};
	fuelStationTypes[] = {
		"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{3144.85,9968.64,0}, {1394.24,3512.91,0.592224}, {10101.3,2309.57,0.331482}
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_SAND,
		BUILDABLES_ARID,
		BUILDABLES_CUP,
		BUILDABLES_UNIVERSAL
	};
};