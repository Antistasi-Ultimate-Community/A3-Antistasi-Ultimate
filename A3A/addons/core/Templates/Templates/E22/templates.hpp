    class E22_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\E22);
        priority = 60;
        climate[] = {"temperate","tropical","arid","arctic"};
    };
    class E22_Northstar_Base : E22_Base
    {
        logo = QPATHTOFOLDER(Templates\Templates\E22\images\flag_e22_ca.paa);
        flagTexture = QPATHTOFOLDER(Templates\Templates\E22\images\flag_e22_northstar_co.paa);
        requiredAddons[] = {"Vests_F_Levi", "Weapons_F_JCA_IA", "Uniforms_F_JCA_IE", "Data_F_JCA_LS", "Weapons_1_F_lxWS"}; // E22 Northstar, JCA IA, JCA IE, JCA LS, WS
    };
    class E22_RAF_Base : E22_Northstar_Base
    {
        flagTexture = QPATHTOFOLDER(Templates\Templates\E22\images\flag_e22_raf_co.paa);
        requiredAddons[] = {"Vests_F_RAF", "Uniforms_F_JCA_IE"}; // E22 Northstar, JCA IE
    };

    class E22_Northstar_Jointcom_Temperate : E22_Northstar_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_e22_northstar_ca.paa);
        name = "Jointcom (Temperate)";
        file = "E22_Northstar_Jointcom_Temperate";
        description = "";
        climate[] = {"temperate", "tropical", "arctic"};
    };
    class E22_Northstar_Jointcom_Arid : E22_Northstar_Jointcom_Temperate
    {
        name = "Jointcom (Arid)";
        file = "E22_Northstar_Jointcom_Arid";
        climate[] = {"temperate", "arid"};
    };

    class E22_RAF_Arid : E22_RAF_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Pictures\Markers\marker_e22_raf_ca.paa);
        name = "RAF (Arid)";
        file = "E22_RAF_Arid";
        description = "";
        climate[] = {"arid"};
    };
    class E22_RAF_Temperate : E22_RAF_Arid
    {
        name = "RAF (Temperate)";
        file = "E22_RAF_Temperate";
        climate[] = {"temperate", "tropical"};
    };
    class E22_RAF_Arctic : E22_RAF_Arid
    {
        name = "RAF (Arctic)";
        file = "E22_RAF_Arctic";
        climate[] = {"arctic"};
    };