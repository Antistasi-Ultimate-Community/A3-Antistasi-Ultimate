    // ***************************** Phalanx Downfall *****************************

    class ACM_PD_Base
    {
        requiredAddons[] = {"gm_weapons_items", "ACM_GM_AAF2015"};
        basepath = QPATHTOFOLDER(Templates\Templates\ACM\PD);
        logo = QPATHTOFOLDER(Templates\Templates\ACM\PD\modicon_ca.paa); // Copied from Phalanx Downfall (APL-SA). Thanks Anthrax!
        maps[] = {"altis", "malden"};
        climate[] = {"arid", "temperate"};
        priority = 80;
        equipFlags[] = {"specialGM"};
        forceDLC[] = {"gm"};
    };

    class ACM_PD_AAF : ACM_PD_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "[PD] AAF";
        file = "ACM_PD_AI_AAF";
        description = "The Altian Armed Forces, the legal armed forces of the republic that arose out of the first civil war, is the most advanced and capable armed forces in the republic.";
    };

    class ACM_PD_Reb_FIA : ACM_PD_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "[PD] FIA";
        file = "ACM_PD_Reb_FIA";
        description = "The Freedom and Independence Army, referred to as the FIA, is the united political front for various anti-Akhanteros political factions.";
    };

    class ACM_PD_Riv_Akh : ACM_PD_Base
    {
        side = "Riv";
        flagTexture = "ACM_AAF_2015_core\factions\akhanterite_flag_co.paa";
        name = "[PD] Akhanterites";
        file = "ACM_PD_Riv_Akh";
        description = "A paramilitary structure separate to the AAF only loyal (at least in theory) to their patron, Col. Akhanteros.";
    };

    class ACM_PD_Riv_FIA_GP : ACM_PD_Base
    {
        side = "Riv";
        flagTexture = "ACM_AAF_2015_core\factions\GoldenPath_flag_co.paa";
        name = "[PD] FIA Golden Path";
        file = "ACM_PD_Riv_FIA_GP";
        description = "Agrarian communists who have singlehandedly delegitimized the Altian Left.";
    };
    
    class ACM_PD_Riv_FIA_Ins : ACM_PD_Base
    {
        side = "Riv";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "[PD] FIA Insurgents";
        file = "ACM_PD_Riv_FIA_Ins";
        description = "Insurgent groups who conduct assasinations, bombing campaigns, theft, and psychological operations.";
    };

    class ACM_PD_Riv_FIA_Loy : ACM_PD_Base
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Vanilla\flags\flag_aaf_torn_co.paa);
        name = "[PD] FIA Loyalists";
        file = "ACM_PD_Riv_FIA_Loy";
        description = "Remnants of the previous Altian government & its armed forces.";
    };
    
    class ACM_PD_Riv_FIA_UPF : ACM_PD_Base
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\ACM\flags\flag_fia_upf_co.paa);
        name = "[PD] FIA United Political Front";
        file = "ACM_PD_Riv_FIA_UPF";
        description = "The Freedom and Independence Army, referred to as the FIA, is the united political front for various anti-Akhanteros political factions, the dominent factions include the remnants of the previous Altian government & its armed forces, referred to as the Loyalists who fight a conventional conflict, but have lost a lot of their influence as the losses mount. Competing yet allied are various insurgent groups who conduct assasinations, bombing campaigns, theft, and psychological operations.";
    };

    // ***************************** Griffin's Ascent *****************************
    
    class ACM_GA_Base
    {
        requiredAddons[] = {"gm_weapons_items", "ACM_GM_AAF2015", "ACM_GM_AAF2028"};
        basepath = QPATHTOFOLDER(Templates\Templates\ACM\GA);
        logo = QPATHTOFOLDER(Templates\Templates\ACM\GA\modicon_ca.paa); // Copied from Griffin's Ascent (APL-SA). Thanks Anthrax!
        maps[] = {"altis", "stratis", "malden"};
        climate[] = {"arid", "temperate"};
        priority = 80;
        equipFlags[] = {"specialGM"};
        forceDLC[] = {"gm"};
    };

    class ACM_GA_ASDF : ACM_GA_Base
    {
        side = "Occ";
        flagTexture = "ACM_AAF_2028_core\faction\asdf_flag_co.paa";
        name = "[GA] ASDF";
        file = "ACM_GA_AI_ASDF";
        description = "After the Treaty of Jerusalem, the loyalist faction of the FIA merged and took over the AAF, reforming it into the Altis and Stratis Defence Force (ASDF).";
    };

    class ACM_GA_AFORandASDF : ACM_GA_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\ACM\flags\flag_afor&asdf_co.paa);
        name = "[GA] AFOR & ASDF";
        file = "ACM_GA_AI_AFOR&ASDF";
        description = "Working alongside the Altis and Stratis Defence Force, is AFOR (Altis Force), primarily composed of Danish soldiers, with a small mix of German, American, and British troops. AFOR works to support NATO's support programs to the ASDF and provides capabilities the ASDF lacks like heavy artillery and armour.";
    };

    class ACM_GA_Reb_TrueFIA : ACM_GA_Base
    {
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\ACM\flags\flag_true_fia_co.paa);
        name = "[GA] True FIA";
        file = "ACM_GA_Reb_TrueFIA";
        description = "Gun nuts, conspiracy theorists, extremists, sovereign citizens, larpers. Groups proclaiming themselves the 'True FIA' in the wake of the invasion tend to have this worrying combination, and more...";
    };

    class ACM_GA_Riv_AkhRem : ACM_GA_Base
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\ACM\flags\flag_akh_torn_co.paa);
        name = "[GA] Akhanterite Remnants";
        file = "ACM_GA_Riv_AkhRem";
        description = "Made up of AAF soldiers who didn't surrender and Akhanterites who evaded capture and execution. while not considered a serious threat capable of displacing the new democratic regime, its members still engage in acts of terrorism and banditry, neccesitating direct action at times.";
    };

    class ACM_GA_Riv_NPSF : ACM_GA_Base
    {
        side = "Riv";
        flagTexture = "ACM_AAF_2028_core\faction\npsf_flag_co.paa";
        name = "[GA] NPSF";
        file = "ACM_GA_Riv_NPSF";
        description = "The Nazarene Popular Support Forces (or NPSF) is a Christian nationalist militia founded by the mysterious former head of the now defunct Altian Air Force Intelligence Directorate. The group has the curious organizational descendance from several Akhanterite groups, Junta intelligence officials, and even some right wing FIA groups with anti-western ideologies.";
    };