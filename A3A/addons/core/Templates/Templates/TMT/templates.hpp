    class TMT_Base
    {
        requiredAddons[] = {"TMT_Core", "CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\TMT);
        logo = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo.paa);
        priority = 80;
    };

    class TMT_Army : TMT_Base
    {
        side = "Occ";
        flagTexture = "\TMT\TMT_Core\Data\flag_Turkish_co.paa";
        name = "Turkish Land Forces";
        file = "TMT_AI_Army";
    };
