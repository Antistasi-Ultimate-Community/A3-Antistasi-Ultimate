#include "\x\A3A\addons\maps\BuildObjectsList.hpp"
class lostisland {
	population[] = {
	{"Svetlograd", 300},
	{"Stoczek", 92},
	{"Kozinka", 44},
	{"Budky", 56},
	{"Kirov", 162},
	{"Ivanovka", 40},
	{"Borkin", 122},
	{"Eremizino", 146},
	{"Krasnodar", 163},
	{"Konkovo", 21},
	{"Olginka", 9},
	{"Krasine", 36},
	{"Dolyna", 63},
	{"Mova", 71},
	{"Goritsky", 87},
	{"Novaya", 167}
		
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
	{6569.91,5720.82,0.207825},
	{2832.95,6665.05,0.000595093},
	{5848.3,8945.41,0.529282},
	{2590.91,8465.88,-0.0549698},
	{7774.88,1748.15,0.50779},
	{2432,1910.125,0},
	{1940,4042.375,0},
	{7626.375,6252.5,0},
	{4828.579,3860.218,-0.007},
	{7379.625,8251,0}

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
		{3453.522,1204.528,18.072},{7731.595,4945.663,18.546},{2730.089,6516.646,66.86},{8534.054,1083.556,0},{2728.625,2164.125,0.25},{1166.375,2022.625,0}
		
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