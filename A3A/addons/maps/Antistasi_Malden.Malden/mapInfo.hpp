#include "..\BuildObjectsList.hpp"
class malden {
	population[] = {}; //automated data is fine and needs no adaptation
	disabledTowns[] = {"Malden_C_Airport","Malden_L_Moray", "Malden_V_Lolisse"};
	antennas[] = {
		{11607.4,4483.77,0},{6272.45,4754.12,0},{5183.3,1189.01,0},{7058.79,9933.09,0},{4744,7156.13,3.05176e-005},{7556.63,10560.4,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{8203.04,3166.26,0.31955}, {7322.58,7947.16,0}
	};
	garrison[] = {{},{"airport", "seaport_7", "milbase_1", "seaport_6"},{},{"control_5","control_22", "control_6"}};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{5841.13,3682.52,0}, {6145.07,8550.52,0}, {7141.02,8054.9,0}
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_SAND,
		BUILDABLES_ARID,
		BUILDABLES_UNIVERSAL
	};
};