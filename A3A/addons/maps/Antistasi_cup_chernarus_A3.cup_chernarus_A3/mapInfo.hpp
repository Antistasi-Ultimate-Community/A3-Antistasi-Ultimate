#include "..\BuildObjectsList.hpp"
class cup_chernarus_a3 {
	population[] = {
		{"city_Chernogorsk", 560},{"city_Elektrozavodsk", 300},{"vill_Tulga", 29},{"city_Solnychniy", 92},
		{"city_Berezino", 235},{"city_StarySobor", 123},{"vill_Msta", 52},{"vill_Shakhovka", 45},
		{"vill_Staroye", 61},{"vill_Dolina", 47},{"vill_Orlovets", 69},{"vill_Bor", 48},
		{"city_Gorka", 122},{"vill_NovySobor", 78},{"vill_Kabanino", 58},{"vill_Mogilevka", 63},
		{"vill_Nadezhdino", 67},{"vill_Guglovo",29},{"vill_Kamyshovo", 109},{"vill_Pusta", 62},
		{"city_Zelenogorsk", 483},{"city_Vybor", 173},{"vill_Dubrovka", 92},{"vill_Khelm", 102},
		{"vill_Olsha", 83},{"vill_Gvozdno", 74},{"city_Krasnostav", 190},{"vill_Grishino", 78},
		{"vill_Rogovo", 59},{"vill_Pogorevka", 76},{"vill_Pustoshka", 100},{"vill_Kozlovka", 64},
		{"vill_Polana", 81},{"vill_Balota", 93},{"vill_Komarovo", 54},{"vill_Kamenka", 44},
		{"vill_Myshkino", 65},{"vill_Pavlovo", 72},{"vill_Lopatino", 90},{"vill_Vyshnoye", 33},
		{"vill_Prigorodki", 25},{"vill_Drozhino",29},{"vill_Sosnovka", 54},{"vill_Nizhnoye", 61},
		{"vill_Pulkovo", 32}, {"vill_Zvir", 40},{"vil_Bogtyrka", 36},{"vil_vavilovo",115},
		{"vil_Zabolotye", 36},{"Vil_Sinystok", 70},{"Vil_Topolniki", 136},{"City_NovayaPetrovka", 423},
		{"Vil_Tisy",47},{"Settlement_Zaprudnoe", 23},{"Settlement_Ratnoe",70},{"Settlement_Polesovo",64},
		{"Settlement_Skalka", 12},{"Settlement_StaryYar",64},{"Settlement_Kamensk", 89},
		{"Settlement_Kalinovka", 110}, {"City_Severograd", 524},{"Settlement_Svergino", 90},
		{"Settlement_Nagornoe", 110},{"city_Novodmitrovsk", 900},{"vil_Karmanovka",123},
		{"vil_Dobroye",65}, {"vil_BelayaPolyana", 41}, {"vil_Turovo",69},{"vil_Berezhki", 9},
		{"city_Svetloyarsk",279},{"city_cernayapolana", 201}
	};
	disabledTowns[] = {"Settlement_Krasnoe", "Settlement_Arsenovo"};
	antennas[] = {
		{9822.91,10314.4,0},{3707.2,14751.2,0},{7175.2,3018.23,0},{1275.49,6215.75,0},{3688.6,5958.29,0},{13326.2,3256.85,0},{514.324,11082.6,0},{11445.2,7565.58,0},{13326.4,3257.08,0},{6874.77,11458.9,0},{11560.7,11313.6,0},{12936.5,12763.4,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{6831.07,2433.6,0},{12127.5,9093.7,0},{10396.5,2266.98,0}
	};
	garrison[] = {
		{},{"airport_3","outpost_24","outpost_20", "outpost_23", "outpost_20","seaport_5","control_143", "control_144", "control_145", "control_149", "control_147","control_169", "control_165", "control_138", "control_137", "control_158"},{},{"control_143", "control_144", "control_145", "control_149", "control_147","control_169", "control_165", "control_138", "control_137", "control_158"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{2729.96,5375.75,0},{13851.8,13218.4,0},{11489,14480.1,0},{7735.05,12636.6,0},{3430.91,13015.8,0},{11988.3,9190.38,3.8147e-006},{6617.86,2389.05,0},{6075.08,7777.44,0},{10699,7986.4,0}
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