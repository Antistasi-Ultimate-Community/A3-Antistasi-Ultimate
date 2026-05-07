class lostisland {
	population[] = {
	{"Svetlograd", 275},
	{"Stoczek", 82},
	{"Kozinka", 24},
	{"Budky", 46},
	{"Kirov", 156},
	{"Ivanovka", 33},
	{"Borkin", 112},
	{"Eremizino", 126},
	{"Krasnodar", 133},
	{"Konkovo", 16},
	{"Olginka", 6},
	{"Krasine", 28},
	{"Dolyna", 43},
	{"Mova", 71},
	{"Goritsky", 87},
	{"Novaya", 117}
		
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
	{6569.91,5720.82,0.207825},
	//{7557.3,6182.65,0.00652313},
	//{7760.76,5546.98,0.16861}, 
	//{2583.88,6248.69,0.0361176},
	{2832.95,6665.05,-129.941},
	//{7777.67,6326.99,0},
	{5848.3,8945.41,0.529282},
	//{5076.88,9061.88,0.000728607},
	{2590.91,8465.88,-0.0549698},
	//{5457.36,9321.57,0.0757065},
	//{5368.67,9351.14,1.98193}, 	
	{7774.88,1748.15,0.50779},
	//{1036.78,928.949,0.017952},
	//{981.875,808.125,0.0483627}
	{2432,1910.125,0},
	{1940,4042.375,0},
	{7626.375,6252.5,0}

	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{2895,6267.25,0},{2685.951,1739.512,38.25}
		
	};
	garrison[] = {
		{},{airport_1,outpost_16,outpost_14,factory_1,outpost_3,outpost_20},{},{control_2,control_3,control_4,control_5}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{3453.522,1204.528,18.072},{7731.595,4945.663,18.546},{2730.089,6516.646,66.86}
		
	};
	climate = "Temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_UNIVERSAL,
		BUILDABLES_CUP
	};
};