#include "..\BuildObjectsList.hpp"
class Gulfcoast {
	population[] = {
		{"haven", 145},{"iona", 133},{"terraceia", 670},{"Lely", 89},{"laurel", 190},{"cayocosta", 129},{"hobesound", 275},{"acline", 62},{"alva", 86},{"northfort", 303},{"solana", 74},{"croom", 48},{"pineridge", 76},{"labelle", 46},{"goodland", 73},{"keela", 125},{"harker", 46},{"orionestates", 164},{"captivabeach", 90},{"captivasound", 54},{"stjamescity", 136},{"tice", 89},{"bokeelia", 105},{"osprey", 64},{"northterra", 230},{"starmand", 126},{"riverside", 28},{"woodford", 56},{"edgewood", 152},{"crosscity", 95},{"eastwood", 93},{"cooperhead", 22},{"bellavida", 216},{"marco", 71},{"lochmoor", 49},{"madeira", 75},{"rotonda", 284},{"felda", 35},{"lakeport", 138},{"harborside", 98},{"gulfshore", 267},{"caperassa", 666},{"sanbelshores", 61},{"palmdale", 122},{"sebring", 539},{"esteropass", 51},{"hurpass", 38},{"boca", 201},{"sanbelcity", 411},{"salvista", 142},{"arcadia", 129},{"delmare", 322},{"sancarlos", 188},{"corelcity", 486}
	};
	disabledTowns[] = {"orionindustrial", "orionport", "eastpointport", "gasparillasound", "heronlanding"}; //no towns that need to be disabled
	antennas[] = {
		{11398,1500,0.455994},{3787,3155,0},{1908,7706,0},{230,14568,0.470652},{7774.88,13099.9,0},{14732.6,12315.6,0.691902},{14967,5242.21,0},{9182.72,7331.71,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{13104.8,1074.83,0},{14856.5,5291.96,0},{6981.71,5476.02,0},{7912.48,11198.3,0},{3095.36,12046.4,0}
	};
	garrison[] = {
		{},{"airport_2","airport_6","milbase_2","seaport_3","seaport_4","outpost_2","outpost_6","outpost_18","outpost_19","factory_3","resource_6","resource_9"},{},{"control_1","control_2","control_3","control_4","control_5","control_6","control_7","control_8","control_9","control_10","control_11","control_12","control_13","control_14","control_15","control_16","control_17","control_18","control_19","control_20","control_21","control_22","control_23","control_24","control_25","control_26","control_27","control_28","control_29","control_29","control_30","control_31","control_32","control_33","control_34","control_35","control_36","control_37","control_38"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_fs_feed_F","Land_FuelStation_Feed_F","Land_FuelStation_01_pump_malevil_F","Land_Fuelstation","Land_Fuelstation_army","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC"
	};
	milAdministrations[] = {
		{600.25,14318.3,0},{2072.5,5376.5,0},{13250.9,5351.25,0},{13909,14567.5,0}
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