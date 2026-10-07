    class AMF_Base
    {
        requiredAddons[] = {"AMF_Patches", "hlcweapons_core"};
        basepath = QPATHTOFOLDER(Templates\Templates\AMF);
        logo = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo.paa);
        priority = 80;
    };

    class AMF_Army : AMF_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa);
        name = "French Army (BME)";
        file = "AMF_AI_Army";
        climate[] = {"temperate", "tropical"};
    };
    class AMF_Army_CE : AMF_Army
    {
        name = "French Army (CE)";
        file = "AMF_AI_Army_CE";
    };
    class AMF_Army_Tan : AMF_Army
    {
        name = "French Army (DA)";
        file = "AMF_AI_Army_Tan";
        climate[] = {"arid"};
    };
    class AMF_Army_Tundra : AMF_Army
    {
        name = "French Army (Tundra)";
        file = "AMF_AI_Army_Tundra";
        climate[] = {"arctic"};
    };