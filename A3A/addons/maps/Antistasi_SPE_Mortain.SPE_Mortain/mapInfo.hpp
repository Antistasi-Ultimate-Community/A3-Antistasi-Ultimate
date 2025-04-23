#include "..\BuildObjectsList.hpp"
class SPE_Mortain {
	population[] = {
		{"Vil_Romagny", 477},{"Vil_Neufbourg", 562},{"Vil_Mortain", 878},{"Vil_Barthelemy", 305},{"Vil_Bellefontaine", 453},{"Vil_Tournerie", 253},{"Vil_La_Bougonniere", 76},{"Vil_Les_Liards", 219},{"Vil_La_Vieille_Vente", 78},{"Vil_La_Deliniere", 209},{"Vil_La_Bagotiere", 299},{"Vil_La_Baffardiere", 188},{"Vil_La_Menardiere", 241},{"Vil_lagranderoche", 91},{"Vil_belleeau", 103},{"Vil_longueveille", 236},{"Vil_Les_Aulnays", 255},{"Vil_LaGalpichere", 191},{"Vil_LeClosMonnier", 223},{"Vil_Abbeye_Blanche", 560},{"Vil_Le_Tertre", 321},{"Loc_La_Morinais", 385},{"Vil_Calvaire", 469},{"Vil_LePillon", 179},{"Vil_LaRiffaudiere", 110},{"Vil_Saint_Hilaire", 544},{"Vil_LaGesberdiere", 464},{"Vil_La_Fieffe_de_Brousse_Pave", 172},{"Vil_Ruandelle", 86},{"Vil_Le_Chene_des_Maires", 260},{"Vil_Brousse_Pave", 224},{"Vil_La_Giffardiere", 398}
	}; 
	disabledTowns[] = {
		"Vil_La_Baffardiere","Vil_Les_Aulnays","Vil_Ruandelle","Vil_LaGalpichere","Vil_LeClosMonnier","Vil_La_Giffardiere","Vil_La_Fieffe_de_Brousse_Pave","Vil_LaGesberdiere","Vil_longueveille","Loc_La_Morinais"
	};
	antennas[] = {
		{503.309,4029.087,0},{5094.455,3037.716,0.010},{4994.081,6685.594,0},{5447.429,553.270,0},{8030.398,7720.771,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable/defined buildings
	garrison[] = {
		{},{"outpost", "outpost_8", "milbase", "factory_3", "control_5", "control_10", "control_18"},
		{},{"control_5", "control_10", "control_18"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","SPE_Fuel_Barrel_German_01","SPE_Fuel_Barrel_US_01"
	};
	milAdministrations[] = {
		{4436.497,3073.387,0},{3592.247,6623.858,0},{2688.955,1922.826,0},{5194.111,6011.908,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_TEMPERATE,
		BUILDABLES_SPE,
		BUILDABLES_UNIVERSAL
	};
};
