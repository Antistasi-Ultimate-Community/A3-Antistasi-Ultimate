#include "..\BuildObjectsList.hpp"
class napf {
	population[] = {}; //automated data is fine and needs no adaptation
	disabledTowns[] = {"Island_Feldmoos", "Island_Bernerplatte", "Insel_Pfeffikon", "mil_SouthAirstrip", "LandMark_Hubel", "Insel_Hasenmatt", "pass_Rorenpass", "Castle_Froburg", "castle_Homburg", "Insel_Suhrenfeld"};
	antennas[] = {
		{15116.9,12587,0}, {18100.3,2555.68,0},{8966.71,3432.88,0}, {15684.9,19837.4,0},{4974.47,9258.15,0},{10978.2,16960.1,0},{8171.18,14687,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{8558.25,16204.7,0}, {14515,13873.3,0},{6378.62,10606,0},{2418.86,7766.25,0}
	};
	garrison[] = {{},{"airport_2", "outpost_5", "outpost_6", "outpost_7", "seaport_1","control_44", "control_49", "control_43", "control_53", "control_23", "control_52", "control_46", "control_47", "control_54", "control_50", "control_16", "control_17"},{},{"control_44", "control_49", "control_43", "control_53", "control_23", "control_52", "control_46", "control_47", "control_54", "control_50", "control_16", "control_17"}};
	fuelStationTypes[] = {
		"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{8966.32,16349.9,-0.269293},{14608.1,14184.6,0},{2408.55,7980.53,0},{2033.37,9888.12,0},{6131.41,10402.5,0},{12851.8,9466.35,0},{6949.05,9651.84,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_CUP,
		BUILDABLES_UNIVERSAL
	};
};