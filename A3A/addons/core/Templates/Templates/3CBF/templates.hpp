    class 3CBF_Base : Base
    {
        requiredAddons[] = {"UK3CB_Factions_Vehicles_SUV"};
        logo = "UK3CB_Factions\addons\UK3CB_Factions_Common\editor\logo_3cb_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\3CBF);
        priority = 40;
        equipFlags[] = {"specialRHS"};
    };

    class 3CBF_FIA : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CBF FIA";
        file = "3CBF_Reb_FIA";
        description = $STR_A3AP_setupFactionsTab_fia_3cbf;
    };

    class 3CBF_NAPA : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_NAP\Flag\nap_flag_co.paa";
        name = "3CBF NAPA";
        file = "3CBF_Reb_NAPA";
        description = $STR_A3AP_setupFactionsTab_napa_3cbf;
    };

    class 3CBF_CCM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_o_flag_co.paa";
        name = "3CBF CCM";
        file = "3CBF_Reb_CCM";
        description = $STR_A3AP_setupFactionsTab_ccm_3cbf;
    };

    class 3CBF_TKM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa";
        name = "3CBF TKM";
        file = "3CBF_Reb_TKM";
        maps[] = {"takistan", "SefrouRamal"};
        description = $STR_A3AP_setupFactionsTab_tkm_3cbf;
    };

    class 3CBF_Reb_ION : 3CBF_CCM
    {
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa";
        name = "3CBF ION";
        file = "3CBF_Reb_ION";
        description = "";
    };

    class 3CBF_CHDKZ : 3CBF_Base
    {
        side = "Riv";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\flag_chdkz_co.paa";
        name = "3CBF CHDKZ";
        file = "3CBF_Riv_CHDKZ";
        description = $STR_A3AP_setupFactionsTab_chdkz;
    };

    class 3CBF_CHDKZ_CW : 3CBF_CHDKZ
    {
        name = "3CBF CHDKZ (Cold War)";
        file = "3CBF_Riv_CHDKZ_CW";
        priority = 39;
    };

    class 3CBF_TI : 3CBF_Base
    {
        side = "Riv";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_TKC\Flag\tkc_flag_co.paa";
        name = "3CBF TI";
        file = "3CBF_Riv_TI";
        maps[] = {"takistan", "SefrouRamal"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_ti;
    };

    class 3CBF_CHC : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CHC\Flag\CHC_flag_co.paa";
        name = "3CBF Eastern European";
        file = "3CBF_Civ_CHC";
        description = $STR_A3AP_setupFactionsTab_easterneuropean;
        climate[] = {"temperate"};
    };

    class 3CBF_A : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_ADC\Flag\ADC_flag_co.paa";
        name = "3CBF Arid";
        file = "3CBF_Civ_A";
        description = $STR_A3AP_setupFactionsTab_a;
        climate[] = {"arid"};
    };

    class 3CBF_Civ : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
        name = "3CBF";
        file = "3CBF_Civ";
        description = $STR_A3AP_setupFactionsTab_vanilla_civ;
    };

    class 3CBF_TKC: 3CBF_Base
    {
        side = "Civ";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
        name = "3CBF Takistan";
        file = "3CBF_Civ_TKC";
        climate[] = {"arid"};
        maps[] = {"takistan", "SefrouRamal"};
        description = $STR_A3AP_setupFactionsTab_takistan;
    };

    class 3CBF_LDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "3CBF LDF";
        file = "3CBF_AI_LDF";
        description = $STR_A3AP_setupFactionsTab_ldf;
        climate[] = {"temperate"};
        maps[] = {"Enoch"};
    };

    class 3CBF_CDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CHC\Flag\CHC_flag_co.paa";
        name = "3CBF CDF";
        file = "3CBF_AI_CDF";
        description = $STR_A3AP_setupFactionsTab_cdf;
        climate[] = {"temperate"};
        maps[] = {"cup_chernarus_A3", "brf_sumava", "chernarus", "chernarus_summer", "Chernarus_Winter"};
    };

    class 3CBF_HIDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "3CBF HIDF";
        file = "3CBF_AI_HIDF";
        description = $STR_A3AP_setupFactionsTab_hil;
        maps[] = {"tanoa"};
        climate[] = {"tropical"};
    };

    class 3CBF_AAF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "3CBF AAF";
        file = "3CBF_AI_AAF";
        maps[] = {"altis", "malden"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aaf_3cbf;
    };

    class 3CBF_TKA : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
        name = "3CBF TKA";
        file = "3CBF_AI_TKA";
        maps[] = {"takistan", "SefrouRamal"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_tka;
    };

    class 3CBF_MDF : 3CBF_AAF
    {
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_mdf\flag\mal_flag_co.paa";
        name = "3CB Malden Defence Force";
        file = "3CBF_AI_MDF";
        maps[] = {"malden"};
        climate[] = {"arid"};
        description = "";
    };

    class 3CBF_KRG : 3CBF_MDF
    {
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_krg\flag\krg_flag_co.paa";
        name = "3CB Karzeghistan Guard";
        file = "3CBF_AI_KRG";
        climate[] = {"arid"};
    };

    class 3CBF_ARD : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_ARD\Flag\ARD_flag_co.paa";
        name = "3CBF ARD";
        file = "3CBF_AI_ARD";
        maps[] = {"takistan", "SefrouRamal"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_ard;
    };

    class 3CBF_AFRF : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
        name = "3CBF AFRF";
        file = "3CBF_AI_AFRF";
        climate[] = {"arid","temperate","tropical","arctic"};
        description = $STR_A3AP_setupFactionsTab_aegis_afrf;
    };

    class 3CBF_CSAT : 3CBF_AFRF
    {
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "3CBF CSAT";
        file = "3CBF_AI_CSAT";
        climate[] = {"arid", "temperate"}; // This is the "classic" CSAT. While temperate has its own template I still think this should be an option by default
        description = $STR_A3AP_setupFactionsTab_csat;
    };
    class 3CBF_CSAT_Winter : 3CBF_CSAT
    {
        name = "3CBF CSAT Winter";
        file = "3CBF_AI_CSAT_Winter";
        climate[] = {"arctic"};
    };
    class 3CBF_CSAT_Temperate : 3CBF_CSAT
    {
        name = "3CBF CSAT Temperate";
        file = "3CBF_AI_CSAT_Temperate";
        climate[] = {"temperate"};
    };
    class 3CBF_CSAT_Tropical : 3CBF_CSAT
    {
        name = "3CBF CSAT Tropical";
        file = "3CBF_AI_CSAT_Tropical";
        climate[] = {"tropical"};
    };

    class 3CBF_ION : 3CBF_AFRF
    {
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa";
        name = "3CB ION Temperate";
        file = "3CBF_AI_ION";
        climate[] = {"temperate", "tropical"};
        description = "";
    };
    class 3CBF_ION_Arid : 3CBF_ION
    {
        name = "3CB ION Arid";
        file = "3CBF_AI_ION_Arid";
        climate[] = {"arid"};
    };
    class 3CBF_ION_Arctic : 3CBF_ION
    {
        name = "3CB ION Arctic";
        file = "3CBF_AI_ION_Arctic";
        climate[] = {"arctic"};
    };

    class 3CBF_US_Army_Arid : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "3CBF US Army Arid";
        file = "3CBF_AI_US_Army_Arid";
        description = $STR_A3AP_setupFactionsTab_usaf;
        climate[] = {"arid"};
    };
    class 3CBF_US_Army_Temperate : 3CBF_US_Army_Arid
    {
        name = "3CBF US Army Temperate";
        file = "3CBF_AI_US_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_USMC_Arid : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CW_US\Flag\cw_US_Marines_flag_co.paa";
        name = "3CBF USMC Arid";
        file = "3CBF_AI_USMC_Arid";
        description = $STR_A3AP_setupFactionsTab_usmc;
        climate[] = {"arid"};
    };
    class 3CBF_USMC_Temperate : 3CBF_USMC_Arid
    {
        name = "3CBF USMC Temperate";
        file = "3CBF_AI_USMC_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_SOV_CW : 3CBF_Base
    {
        priority = 39;
        side = "Inv";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CW_SOV\Flag\cw_sov_flag_co.paa";
        name = "3CBF Red Army (Cold War)";
        file = "3CBF_AI_SOV_CW";
        description = $STR_A3AP_setupFactionsTab_ra;
        equipFlags[] = {"specialRHS", "coldWar"};
    };

    class 3CBF_US_Army_CW : 3CBF_Base
    {
        priority = 39;
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "3CBF US Army (Cold War)";
        file = "3CBF_AI_US_Army_CW";
        description = $STR_A3AP_setupFactionsTab_us_cw;
        equipFlags[] = {"specialRHS", "coldWar"};
    };