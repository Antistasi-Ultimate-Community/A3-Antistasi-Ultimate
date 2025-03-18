#include "..\BuildObjectsList.hpp"
class kunduz_valley {
	population[] = {
		{"Naqel", 532},{"Nazarbay", 251},{"Omarkhel", 439},{"Maghdootkhel", 1030},{"Chumchuqjar", 519},{"Chahardara", 602},{"Qaryalaghi", 503},{"Esakhan", 189},{"Anbartappeh", 195},{"Morsheykh", 69},{"Babarahim", 202},{"Masjidmuallem", 307},{"Taherkamar", 388},{"Gerdan", 124},{"KarShek", 346},{"Masjidahmad", 70},{"Dharghaffari", 168},{"Qazakojumat", 195},{"Mugdudkhila", 491},{"Jamamasjid", 292},{"Laghiauliya", 291},{"ShekKa", 120},{"TalGozar", 468},{"TappehKa", 105},{"Darreh", 231}
	};
	disabledTowns[] = {}; //no towns that need to be disabled
	antennas[] = {
		{9221.517,10171.755,0},{9548.353,370.956,0},{4845.838,3194.091,0}, {6066.799,6464.698,0}, {3547.619,7527.658,0}, {7479.943,8674.383,0}, {9233.831,6133.654,0}
	};
	antennasBlacklistIndex[] = {}; //no antennas that need to be blacklisted
	banks[] = {}; //no suitable building available
	garrison[] = {
		{},{"milbase", "milbase_1", "outpost_5", "outpost_6", "factory_1", "resource_5", "control_8", "control_23", "control_24", "control_27", "control_28", "control_45", "control_46"},{},{"control_8", "control_23", "control_24", "control_27", "control_28", "control_45", "control_46"}
	};
	fuelStationTypes[] = {
		"Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","Land_Fuelstation","Land_Fuelstation_army","Land_Benzina_schnell"
	};
	milAdministrations[] = {
		{4902.229,3949.389,0}, {5521.88,7721.498,0.35}, {8426.972,2623.649,0}, {6351.916,3326.519,0}
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