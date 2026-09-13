class CfgFactionClasses
{
	// factions
	class GVAR(Rebels) {
		displayName = $STR_A3U_Zeus_Faction_Rebels;
		side = 2;
		//flag = "";
		//icon = "\A3A\addons\ultimate\data\rebellion_icon.paa";
		priority = 1;
	};
	class GVAR(Occupants) {
		displayName = $STR_A3U_Zeus_Faction_Occupants;
		side = 1;
		//flag = "";
		//icon = "\A3A\addons\ultimate\data\civ_icon.paa";
		priority = 1;
	};
	class GVAR(Invaders) {
		displayName = $STR_A3U_Zeus_Faction_Invaders;
		side = 0;
		//flag = "";
		//icon = "\A3A\addons\ultimate\data\invaders_icon.paa";
		priority = 1;
	};
	class GVAR(Rivals) {
		displayName = $STR_A3U_Zeus_Faction_Rivals;
		side = 0;
		//flag = "";
		//icon = "\A3A\addons\ultimate\data\rivals_icon.paa";
		priority = 1;
	};
	class GVAR(Civilians) {
		displayName = $STR_A3U_Zeus_Faction_Civilians;
		side = 3;
		//flag = "";
		//icon = "\A3A\addons\ultimate\data\civ_icon.paa";
		priority = 1;
	};

	// modules
	class GVAR(Supports_Occupants) {
        displayName = "$STR_A3U_Zeus_ModuleType_Supports_Occupants";
        side = 7;
    };
	class GVAR(Supports_Invaders) {
		displayName = "$STR_A3U_Zeus_ModuleType_Supports_Invaders";
		side = 7;
	};
	class GVAR(Misc) {
		displayName = "$STR_A3U_Zeus_ModuleType_Misc";
		side = 7;
	};
};