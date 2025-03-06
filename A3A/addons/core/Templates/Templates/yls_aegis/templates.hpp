class yls_Base : Base
    {
        requiredAddons[] = {"Weapons_1_F_lxWS","A3_Aegis_Armor_F_Aegis_APC_Tracked_02", "A3_Atlas_Armor_F_Atlas_APC_Tracked_02", "A3_Opf_Armor_F_Opf_APC_Tracked_02"};
        logo = "A3_Aegis\data_f_aegis\logos\arma3_aegis_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\yls_Aegis); //the path to the template folder
        priority = 20;
        equipFlags[] = {"vanilla"};
    };
	class yls_Aegis_FIA : yls_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "YLS Aegis FIA";
        file = "yls_Aegis_Reb_FIA";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_fia;
    };
	class yls_Aegis_NATO : yls_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "YLS Aegis NATO";
        file = "yls_Aegis_AI_NATO";
        climate[] = {"temperate"};
        description = $STR_A3AP_setupFactionsTab_nato;
    };
	
	class Aegis_Goverment_Of_Altis : yls_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "YLS Goverment Of Altis";
        file = "yls_Aegis_AI_Goverment_Of_Altis";
        maps[] = {"altis", "malden"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aaf;
    };
	
	class Aegis_Goverment_Of_Vir : yls_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "YLS Goverment Of Virolahti";
        file = "yls_Aegis_AI_Goverment_Of_Vir";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aaf;
    };
	
	class yls_Aegis_Ion : yls_Base
    {
        side = "Riv";
        flagTexture = "A3_Aegis\Data_F_Aegis\Flags\flag_ION_CO.paa";
        name = "YLS Aegis Ion PMC";
        file = "yls_Aegis_Riv_Ion";
        description = $STR_A3AP_setupFactionsTab_ion;
    };