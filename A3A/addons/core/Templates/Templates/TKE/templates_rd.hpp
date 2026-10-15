    class TKE_Occ_ITA : TKE_RD_Base
    {
        side = "Occ";
        name = "ITA";
        file = "TKE_Occ_ITA";
        description = "The Interplanetary Trade Authority (ITA) was established following the end of the Martian-Earth War and the signing of the Treaty of Olympus.\n\nOne of the key provisions of the Treaty was the creation of a neutral and independent body to regulate interplanetary trade, protect shipping lanes, and ensure that parties could engage in commerce without the interference of military power or piracy.";
        priority = 110;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_ita_co.paa);
    };

    class TKE_Inv_MB : TKE_RD_Base
    {
        side = "Inv";
        name = "Mercantile Bastion";
        file = "TKE_Inv_MB";
        description = "The Mercantile Bastion (MB) is a heavily militaristic Private Military Company renowned for its formidable ground and space combat capabilities.\n\nOperated by a coalition of former high-ranking officers and financial experts, MB provides its services to the highest bidder, influencing the landscape of the Sol System.";
        priority = 110;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_mb_co.paa);
    };
    class TKE_Inv_MB_Arid : TKE_Inv_MB
    {
        name = "Mercantile (Arid)";
        file = "TKE_Inv_MB_Arid";
        priority = 109;
        climate[] = {"arid"};
    };
    class TKE_Inv_MB_Arctic : TKE_Inv_MB
    {
        name = "Mercantile (Arctic)";
        file = "TKE_Inv_MB_Arctic";
        priority = 108;
        climate[] = {"arctic"};
    };
    class TKE_Inv_MB_Temperate : TKE_Inv_MB
    {
        name = "Mercantile (Temperate)";
        file = "TKE_Inv_MB_Temperate";
        priority = 107;
        climate[] = {"temperate"};
    };
    class TKE_Inv_MB_Void : TKE_Inv_MB
    {
        name = "Mercantile (Voidborne)";
        file = "TKE_Inv_MB_Void";
        priority = 106;
    };

    class TKE_Inv_Nakamura : TKE_RD_Base
    {
        side = "Inv";
        name = "Nakamura Industries";
        file = "TKE_Inv_Nakamura";
        description = "Nakamura Heavy Industries (中村重工業, NHI) stands as a titan among megacorporations, deeply entrenched in both the legacy of ancient Japan and the relentless drive of modern militaristic ambition.";
        priority = 111;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_nakamura_co.paa);
    };
    
    class TKE_Reb_RF : TKE_RD_Base
    {
        side = "Reb";
        name = "Restorationist Front";
        file = "TKE_Reb_RF";
        description = "The Restoration Front (TRF) is a radical paramilitary organization operating primarily within the Federal States of North America (FSNA).\n\nThey claim allegiance to the 'ideals of Old America,' espousing anti-UCN rhetoric and advocating for the dissolution of the Coalition in favor of a return to nationalistic governance.";
        priority = 105;
        flagTexture = "\A3\Data_F\Flags\flag_US_CO.paa";
    };
    class TKE_Reb_Echelon : TKE_Reb_RF
    {
        name = "9th Echelon";
        file = "TKE_Reb_Echelon";
        description = "After an attack orchestrated by the 9th Echelon's leader that was not sanctioned by the Mars Dominion, Mars formally disavowed the 9th and branded them rogue.\n\nNow an exiled but deadly force, the 9th Echelon Marines remain a looming threat, their elite troops and uncompromising leadership making them a force to be reckoned with.";
        priority = 110;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_echelon_co.paa);
        climate[] = {"arid"};
    };
    class TKE_Reb_Warbot : TKE_Reb_Echelon
    {
        name = "9th Echelon Warbots";
        file = "TKE_Reb_Warbot";
        priority = 109;
        description = "After an attack orchestrated by the 9th Echelon's leader that was not sanctioned by the Mars Dominion, Mars formally disavowed the 9th and branded them rogue.\n\nThe human troops of the 9th died in an unexpected hull breach, all that is now left are the warbots of the 9th Echelon.";
    };
    class TKE_Reb_MB : TKE_Reb_RF
    {
        name = "Mercantile Bastion";
        file = "TKE_Reb_MB";
        description = "The Mercantile Bastion (MB) is a heavily militaristic Private Military Company renowned for its formidable ground and space combat capabilities.\n\nOperated by a coalition of former high-ranking officers and financial experts, MB provides its services to the highest bidder, influencing the landscape of the Sol System.";
        priority = 108;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_mb_co.paa);
    };
    class TKE_Reb_HC : TKE_Reb_RF
    {
        name = "Hyperion Corsairs";
        file = "TKE_Reb_HC";
        priority = 107;
        description = "Formed out of the worker revolt on Hyperion in 2231, the Corsairs or 'Pirates' are a unified fleet of cut throats and looters.\n\nThe Corsairs are responsible for most of the pirate activity throughout the Sol system. Raiding shipping lanes and corporate outposts, there isn't much they can't get their hands on.";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_hc_co.paa);
    };
    class TKE_Reb_Nakamura : TKE_Reb_RF
    {
        name = "Nakamura Shinobi";
        file = "TKE_Reb_Nakamura";
        description = "Nakamura Heavy Industries (中村重工業, NHI) stands as a titan among megacorporations, deeply entrenched in both the legacy of ancient Japan and the relentless drive of modern militaristic ambition.";
        priority = 106;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_nakamura_co.paa);
    };

    class TKE_Riv_RF : TKE_KMC_Base
    {
        side = "Riv";
        name = "Restorationist Front";
        file = "TKE_Riv_RF";
        description = "The Restoration Front (TRF) is a radical paramilitary organization operating primarily within the Federal States of North America (FSNA).\n\nThey claim allegiance to the 'ideals of Old America,' espousing anti-UCN rhetoric and advocating for the dissolution of the Coalition in favor of a return to nationalistic governance.";
        priority = 105;
        flagTexture = "\A3\Data_F\Flags\flag_US_CO.paa";
    };
    class TKE_Riv_Echelon : TKE_Riv_RF
    {
        name = "9th Echelon";
        file = "TKE_Riv_Echelon";
        description = "After an attack orchestrated by the 9th Echelon's leader that was not sanctioned by the Mars Dominion, Mars formally disavowed the 9th and branded them rogue.\n\nNow an exiled but deadly force, the 9th Echelon Marines remain a looming threat, their elite troops and uncompromising leadership making them a force to be reckoned with.";
        priority = 110;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_echelon_co.paa);
        climate[] = {"arid"};
    };
    class TKE_Riv_MAWS : TKE_Riv_RF
    {
        name = "MAWS";
        file = "TKE_Riv_MAWS";
        description = "M.A.W.S. is the premier anti-terrorism and cyber-warfare response division operating under the MDSR. Formed in response to the increasing threat of internal sabotage, digital espionage, and rogue insurgent groups operating across Martian colonies and orbital stations.\n\nAs they say; fight fire with fire.";
        priority = 109;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_md_co.paa);
    };
    class TKE_Riv_MB : TKE_Riv_RF
    {
        name = "Mercantile Bastion";
        file = "TKE_Riv_MB";
        description = "The Mercantile Bastion (MB) is a heavily militaristic Private Military Company renowned for its formidable ground and space combat capabilities.\n\nOperated by a coalition of former high-ranking officers and financial experts, MB provides its services to the highest bidder, influencing the landscape of the Sol System.";
        priority = 108;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_mb_co.paa);
    };
    class TKE_Riv_HC : TKE_Riv_RF
    {
        name = "Hyperion Corsairs";
        file = "TKE_Riv_HC";
        description = "Formed out of the worker revolt on Hyperion in 2231, the Corsairs or 'Pirates' are a unified fleet of cut throats and looters.\n\nThe Corsairs are responsible for most of the pirate activity throughout the Sol system. Raiding shipping lanes and corporate outposts, there isn't much they can't get their hands on.";
        priority = 107;
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_hc_co.paa);
    };
    class TKE_Riv_Nakamura : TKE_Riv_RF
    {
        name = "Nakamura Industries";
        file = "TKE_Riv_Nakamura";
        priority = 106;
        description = "Nakamura Heavy Industries (中村重工業, NHI) stands as a titan among megacorporations, deeply entrenched in both the legacy of ancient Japan and the relentless drive of modern militaristic ambition.";
        flagTexture = QPATHTOFOLDER(Templates\Templates\TKE\images\flag_nakamura_co.paa);
    };