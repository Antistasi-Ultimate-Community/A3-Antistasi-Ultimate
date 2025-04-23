#include "..\BuildObjectsList.hpp"
class spex_utah_beach {
	population[] = {
{"Vil_Sainte_Mere_Eglise", 1074},

{"Vil_Chef_du_Pont", 322},

{"Vil_Sainte_Marie_du_Mont", 835},

{"Vil_Pouppeville", 951},

{"Vil_Saint_Germain_de_Varreville", 1002},

{"Vil_Ravenoville", 566},

{"Vil_Foucarville", 1050},

{"Vil_Neuville_au_Plain", 354},

{"Vil_Turqueville", 851},

{"Vil_Azeville", 643},

{"Vil_Saint_Martin_de_Varreville", 596},

{"Vil_Saint_Marcouf", 607},

{"Vil_Fontenay_sur_Mer", 924},

{"Vil_Les_Gougins", 267},

{"Vil_Hameau_du_Sud", 358},

{"Vil_Les_Cruttes", 352},

{"Vil_La_Madeleine", 525}
	}; 
	disabledTowns[] = {"Vil_Les_Gougins","Vil_Les_Cruttes"};
	antennas[] = {
		{1510.098,3501.696,0},{7269.458,5701.470,0},{2380.396,7427.759,0},{1748.874,5941.625,0.029},{5719.224,3172.476,0},{4338.537,4779.429,-0.018},{7191.120,7095.473,0},{3943.526,286.679,0},{719.989,2484.194,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {}; //no suitable/defined buildings
	garrison[] = {
		{},{"airport","seaport","outpost"},
		{},{}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","SPE_Fuel_Barrel_German_01","SPE_Fuel_Barrel_US_01"
	};
	milAdministrations[] = {
		{5671.482,728.057,0},{3218.594,3629.620,0},{1152.579,6418.865,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_TEMPERATE,
		BUILDABLES_SPE,
		BUILDABLES_UNIVERSAL
	};
};
