    class TKE_Occ_KMC : TKE_KMC_Base
    {
        side = "Occ";
        name = "KMC";
        file = "TKE_Occ_KMC";
        description = "The Kuiper Mining Corporation is the most powerful megacorporation in human space stemming from a conglomeration of multiple mining companies operating in the outer edge of the Sol system in the late 22nd century.";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_kmc_co.paa);
    };

    class TKE_Civ_KMC : TKE_KMC_Base
    {
        side = "Civ";
        name = "KMC Civilians";
        file = "TKE_Civ_KMC";
        description = "Being far beyond the reaches of UCN or MD control and basing its headquarters on Pluto in the Kuiper Belt, the KMC has become known as a ruthless corporation aggressively seizing unclaimed resources and using its private forces both to fend off pirates and crush worker revolts.";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_kmc_co.paa);
    };
    class TKE_Civ_KMC_Void : TKE_Civ_KMC
    {
        name = "KMC (Voidborne)";
        file = "TKE_Civ_KMC_Void";
    };

    class TKE_Reb_WU : TKE_KMC_Base
    {
        side = "Reb";
        name = "KMC Workers Union";
        file = "TKE_Reb_WU";
        description = "An ongoing crisis within the KMC started with a major worker revolt in 2231 on Hyperion in orbit of Saturn, resulting in the creation of the Workers Union\n\nThey are miners seeking better working conditions and the ability to sell their own goods.";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_wu_co.paa);
    };

    class TKE_Riv_WU : TKE_KMC_Base
    {
        side = "Riv";
        name = "KMC Workers Union";
        file = "TKE_Riv_WU";
        description = "An ongoing crisis within the KMC started with a major worker revolt in 2231 on Hyperion in orbit of Saturn, resulting in the creation of the Workers Union\n\nThey are miners seeking better working conditions and the ability to sell their own goods.";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_wu_co.paa);
    };
