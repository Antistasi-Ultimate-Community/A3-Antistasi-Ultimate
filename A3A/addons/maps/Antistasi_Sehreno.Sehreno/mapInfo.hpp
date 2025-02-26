#include "..\BuildObjectsList.hpp"
class sehreno {
	population[] = {
		{"Sara_Estrella",60},{"Sara_Ambergris",123},{"Sara_Ortego",256},{"Sara_Cayo", 110},
		{"Sara_Iguana", 86},{"Sara_Dolores", 140},{"Sara_Parato",67},{"Sara_Tiberia",90},
		{"Sara_Geraldo", 78},{"Sara_Somato", 35},{"Sara_Bonanza", 53},{"Sara_Yoro", 8},
		{"Sara_Paraiso", 322},{"Sara_Masbete", 137},{"Sara_Pita", 64},{"Sara_Bagango", 286},
		{"Sara_Eponia", 76},{"Sara_Everon", 129},{"Sara_Hunapu", 48},{"Sara_Pacamac", 39},
		{"Sara_Tlaloc", 71},{"Sara_Obregan", 105},{"Sara_Ixel", 19},{"Sara_Mercalillo", 115},
		{"Sara_Modesta", 60},{"Sara_Valor", 44},{"Sara_Gaula", 68}, {"Sara_Mataredo", 29},
		{"Sara_Benoma", 36}, {"Sara_Pesadas", 100}, {"Sara_Rahmadi", 179}, 
		{"Sara_Corazol_East", 280}, {"Sara_Corazol_West", 182},{"Sara_Santa_Lucia", 190}, 
		{"Sara_Acequero", 94}
	};
	disabledTowns[] = {
		"Sara_Pesto", "Sara_Gulan", "Sara_Balmopan", "Sara_Dror", 
		"Sara_Rashidah", "Sara_Corinto", "Sara_Chantico", "Sara_Cedras", 
		"Sara_Arcadia", "Sara_Carmen", "Sara_Tandag"
	};
	antennas[] = {
		{12611.3,15091.4,0},{3362.25,2924.44,0},{18069.1,12523.2,0},{18069.5,12522.9,0},{13442.4,8889.35,-1.90735e-006},{11512.5,6175.29,0},{12494.2,7072.2,0},{8886.57,6103.62,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {};
	garrison[] = {
		{},
		{"outpost_13", "outpost_1", "airport", "control_12", "seaport_1", "control_23", "control_29", "outpost_11", "outpost_10", "control_30", "control_55", "control_31", "control_32", "control_27", "control_28", "outpost_3", "control_56", "milbase_3", "outpost_7", "factory_2", "airport_3", "resource_5", "control_14", "outpost", "control_53", "milbase_2"},
		{},
		{"control_12", "control_23", "control_29", "control_30", "control_55", "control_31", "control_32", "control_27", "control_28", "control_56", "control_14", "control_53"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F",
		"Jbad_Ind_FuelStation_Feed"
	};
	milAdministrations[] = {
		{11945.4,15413.9,0},{14266,12488.2,0},{13698.6,9067.43,0},{10547.1,9538.78,0}
	};
	climate = "temperate";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_GREEN,
		BUILDABLES_TEMPERATE,
		BUILDABLES_JBAD,
		BUILDABLES_UNIVERSAL
	};
    // Needs to be re-done when possible
};