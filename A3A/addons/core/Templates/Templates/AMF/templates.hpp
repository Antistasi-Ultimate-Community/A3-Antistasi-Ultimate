    class AMF_Base
    {
        requiredAddons[] = {"AMF_Patches", "hlcweapons_core", "hlcweapons_XM8"}; // iirc the old NIArms mod also has _core, but not _xm8
        basepath = QPATHTOFOLDER(Templates\Templates\AMF);
        logo = QPATHTOFOLDER(Pictures\antistasi_ultimate_logo.paa);
        priority = 80;
    };

    class AMF_Army : AMF_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\AMF\images\flag_france_co.paa);
        name = "French Army (Woodland)";
        file = "AMF_AI_Army";
    };
    class AMF_Army_Tan : AMF_Army
    {
        name = "French Army (Desert)";
        file = "AMF_AI_Army_Tan";
        climate[] = {"arid"};
    };