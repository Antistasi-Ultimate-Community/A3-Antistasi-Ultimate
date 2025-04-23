#include "..\BuildObjectsList.hpp"
class lythium 
{
	population[] = 
	{
		{"kinduf", 516},
		{"orfar", 917},
		{"MilitaryBase08", 20},
		{"nefer", 142},
		{"afsher", 614},
		{"mayankel", 437},
		{"yemara", 132},
		{"razbula", 161},
		{"arobster", 845},
		{"anyakar", 34},
		{"kalaenoowi", 94},
		{"kamir", 101},
		{"morar", 217},
		{"offar", 854},
		{"zregurat", 366},
		{"orcarif", 622},
		{"zagun", 1280},
		{"afarat", 482},
		{"alfaraz", 144},
		{"puestocrow", 91},
		{"limari", 541},
		{"limar", 228},
		{"karift", 435},
		{"zarath", 217},
		{"zhapir", 183},
		{"mafaraz", 822},
		{"MilitaryBase02", 719},
		{"MilitaryBase03", 136},
		{"MilitaryBase06", 443},
		{"kandar", 258},
		{"shoran", 49},
		{"tunkuf", 257},
		{"ramir", 144},
		{"doran", 274},
		{"amir", 117},
		{"benamair", 60},
		{"loboriverbed", 89},
		{"shegara", 361},
		{"mikisfob", 909},
		{"teruk", 563},
		{"kinduffactory", 177},
		{"bagdir", 360},
		{"morut", 524},
		{"bramar", 668},
		{"kunara", 486},
		{"martinfob", 19}
	};
	disabledTowns[] = {"MilitaryBase02", "MilitaryBase03", "MilitaryBase06", "MilitaryBase08", "puestocrow", "puestovulcan", "pelotoncampbase", "martinfob", "mikisfob", "greencaampbase", "ibancampbase", "kinduffactory", "kinduf"};
	antennas[] = {
		{16207.7,19631.8,0.898682},{13740.9,9353.18,-1.15576},{2981.66,9053.11,-0.42218},{8585.65,7038.04,-0.320374},{12328.4,5381.54,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{10583.8,3972.63,0},{11420.5,6726.26,0},{13351.1,17593.5,0}
	};
	garrison[] = {
		// {},{"airport_2", "resource_8", "outpost_2", "outpost_3", "outpost_1", "resource_4", "factory_2"},{},{}
		{},{"airport_2","resource_8","outpost_2","outpost_17","outpost_19","factory_2","control_7","control_8","control_9","control_10","control_12"},{},{"control_7","control_8","control_9","control_10","control_12"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
	};
	milAdministrations[] = {
		{4962.55,10639.8,-3.05176e-005},{9645.47,14027.3,-3.05176e-005},{1315.08,14302.8,0}
	};
	climate = "arid";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_MODERN_SAND,
		BUILDABLES_ARID,
		BUILDABLES_JBAD,
		BUILDABLES_UNIVERSAL
	};
};