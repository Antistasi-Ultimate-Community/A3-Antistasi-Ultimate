    #define DRAGONFLY_TEXTURES_KMC hiddenSelectionsTextures[] = {"TKE_Ext_Heli\data\heli_grey_white_face_co.paa","TKE_Ext_Heli\data\heli1_grey_co.paa"}
    
    // KMC
    class A3U_TKE_Ext_Bearcat_Autocannon_KMC : TKE_Ext_Bearcat_Autocannon_UCNFA
    {
        displayName = "TC-15/A 'Bearcat' IFV KMC";
        textureList[] = {"KMC",1};
    };
    class A3U_TKE_Ext_Bearcat_Unarmed_KMC : TKE_Ext_Bearcat_Unarmed_UCNFA
    {
        displayName = "TC-15/C 'Bearcat' APC KMC";
        textureList[] = {"KMC",1};
    };
    class A3U_TKE_Ext_Bearcat_Cannon_KMC : TKE_Ext_Bearcat_Cannon_UCNFA
    {
        displayName = "TC-15/D 'Bearcat' FSV KMC";
        textureList[] = {"KMC",1};
    };
    class A3U_TKE_Ext_Bearcat_AA_KMC : TKE_Ext_Bearcat_AA_UCNFA
    {
        displayName = "TC-15/B 'Bearcat' SHORAD KMC";
        textureList[] = {"KMC",1};
    };

    class A3U_TKE_Ext_Dragonfly_A_KMC : TKE_Ext_Dragonfly_A_UCNFA
    {
        displayName = "AH-44/A 'Dragonfly' KMC";
        textureList[] = {"UCFABrown",1,"UCFA",0};
        DRAGONFLY_TEXTURES_KMC;
    };
    class A3U_TKE_Ext_Dragonfly_S_KMC : TKE_Ext_Dragonfly_S_UCNFA
    {
        displayName = "AH-44/S 'Dragonfly' KMC";
        textureList[] = {"UCFABrown",1,"UCFA",0};
        DRAGONFLY_TEXTURES_KMC;
    };
    class A3U_TKE_Ext_Dragonfly_T_KMC : TKE_Ext_Dragonfly_T_UCNFA
    {
        displayName = "MH-44/T 'Locust' KMC";
        textureList[] = {"UCFABrown",1,"UCFA",0};
        DRAGONFLY_TEXTURES_KMC;
    };

    class A3U_KMC_APC_U : UCNFA_G_APC_U
    {
        displayName = "Paladin APC (KMC/APC)";
        textureList[] = {"Black",1};
    };
    class A3U_KMC_APC_A : UCNFA_G_APC_A
    {
        displayName = "Paladin APC (KMC/IFV)";
        textureList[] = {"Black",1};
    };
    class A3U_KMC_APC_AX : UCNFA_G_APC_AX
    {
        displayName = "Paladin APC (KMC/IFV/XLR)";
        textureList[] = {"Black",1};
    };
    class A3U_KMC_APC_AA : UCNFA_G_APC_AA
    {
        displayName = "Paladin APC (KMC/SPAAG)";
        textureList[] = {"Black",1};
    };
    class A3U_KMC_APC_Art : UCNFA_G_APC_Art
    {
        displayName = "Paladin APC (KMC/SPG)";
        textureList[] = {"Black",1};
    };

    class A3U_TKE_Ext_GUSA_KMC : TKE_Ext_GUSA_UCMC
    {
        displayName = "General Utility Shuttle/A (KMC)";
        textureList[] = {"White",1};
    };
    class A3U_TKE_Ext_GUSM_KMC : TKE_Ext_GUSM_UCMC
    {
        displayName = "General Utility Shuttle/M (KMC)";
        textureList[] = {"White",1};
    };