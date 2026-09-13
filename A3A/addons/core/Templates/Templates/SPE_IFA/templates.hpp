    class SPEX_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","WW2_SPEX_Core_t"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE_IFA);
        logo = QPATHTOFOLDER(Templates\Templates\SPE_IFA\spe_logo.paa);
        priority = 19;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };
	
    class SPEX_USA : SPEX_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_us.paa);
        name = "SPEX USA";
        file = "SPE_AI_USA";
    };

    class SPEX_WEH : SPEX_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_ger.paa);
        name = "SPEX WEH";
        file = "SPE_AI_WEH";
    };
	
	class SPEX_COM : SPEX_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "SPEX COM";
        file = "SPE_AI_COM";
    };
	
    class SPEX_Reb : SPEX_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPEX FFF";
        file = "SPE_REB_FFF";
    };
	
    class SPEX_Riv : SPEX_Base
    {
        side = "Riv";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPEX FFD";
        file = "SPE_RIV_FFD";
    };	
	
    class SPEX_CIV : SPEX_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_fr.paa);
        name = "SPEX Civs";
        file = "SPE_CIV";
    };