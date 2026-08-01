    class NFTSCW_Base
    {
        requiredAddons[] = {"NORTH_Main", "weapons_f_vietnam", "NFCW_fn"};
        basepath = QPATHTOFOLDER(Templates\Templates\NFtSCW);
        logo = QPATHTOFOLDER(Templates\Templates\NFtS\NFtS_logo.paa);
        priority = 18;
        equipFlags[] = {"lowTech"};
    };	

    class NFTS_SOV_Arctic : NFTSCW_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\NFtSCW\flag_FSSR.paa);
        name = "NFtSCW FSSR Army";
        file = "NFtSCW_AI_FIN_Temperate";
    };

    class NFTSCW_US : NFTSCW_Base
    {
        side = "Inv";
        flagTexture = "\vn\objects_f_vietnam\flags\vn_flag_01_usa_co.paa";
        name = "NFtSCW US Army";
        file = "NFtSCW_AI_USA_Tropical";
    };

    class NFTSCW_FIN_Temperate : NFTSCW_Base
    {
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\NFtS\flag_finland.paa);
        name = "NFtSCW FIN";
        file = "NFtSCW_Reb_FIN_Temperate";
    };
