    // ***************************** SPE with IFA *****************************

    class SPE_IFA_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","IFA3_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE_IFA);
        logo = QPATHTOFOLDER(Templates\Templates\SPE_IFA\spe_ifa_logo.paa);
        priority = 20;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };

    class SPE_IFA_US : SPE_IFA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_us.paa);
        name = "SPE_IFA US";
        file = "SPE_IFA_AI_US";
    };

    class SPE_IFA_WEH : SPE_IFA_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_ger.paa);
        name = "SPE_IFA WEH";
        file = "SPE_IFA_AI_WEH";
    };

    class SPE_IFA_Reb : SPE_IFA_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE_IFA FFF";
        file = "SPE_IFA_Reb_FFF";
    };

    class SPE_IFA_CIV : SPE_IFA_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_fr.paa);
        name = "SPE_IFA Civs";
        file = "SPE_IFA_CIV";
    };
	
    class SPE_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","JK_US_Air_F_DC3"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE_IFA);
        logo = QPATHTOFOLDER(Templates\Templates\SPE_IFA\spe_logo.paa);
        priority = 19;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };
	
    class SPE_USA : SPE_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_us.paa);
        name = "SPE USA";
        file = "SPE_AI_USA";
    };

    class SPE_WEH : SPE_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_ger.paa);
        name = "SPE WEH";
        file = "SPE_AI_WEH";
    };
	
    class SPE_Reb : SPE_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE FFF";
        file = "SPE_REB_FFF";
    };
	
    class SPE_Riv : SPE_Base
    {
        side = "Riv";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE FFD";
        file = "SPE_RIV_FFD";
    };	
	
    class SPE_CIV : SPE_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_fr.paa);
        name = "SPE Civs";
        file = "SPE_CIV";
    };