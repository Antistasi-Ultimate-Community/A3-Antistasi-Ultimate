    // ***************************** BRAF *****************************

    class BRAF_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "BRAF_Air"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        basepath = QPATHTOFOLDER(Templates\Templates\BRAF);
        logo = QPATHTOFOLDER(Templates\Templates\BRAF\flag_brazil.paa);
        priority = 65;
    };

    class BRAF_Tropical : BRAF_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\BRAF\flag_brazil.paa);
        name = "BRAF Brazil Tropical";
        file = "BRAF_AI_BRAF_Tropical";
    };
	
    class BRAF_MNGC : BRAF_Base
    {
        side = "Reb";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa";
        name = "BRAF MNGC";
        file = "BRAF_Reb_MNGC";
        description = "The Militia of Nationalists for Grand Colombia, a group dedicated to the restoration of Gran Colombia, a union of many Central and South American nations";
    };
