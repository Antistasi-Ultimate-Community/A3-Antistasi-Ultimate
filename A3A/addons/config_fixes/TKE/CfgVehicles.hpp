//TKE - CfgVehicles.hpp

class CfgVehicles 
{
    class UCNFA_G_APC_U; // Paladin
    class MDMC_APC_U; // Galea
    class TKE_Ext_Bearcat_Autocannon_UCNFA; // IFV
    class TKE_Ext_Bearcat_Unarmed_UCNFA; // APC
    class TKE_Ext_Bearcat_Cannon_UCNFA; // FSV
    class TKE_Ext_Bearcat_AA_UCNFA; // SHORAD
    class TKE_Ext_Dragonfly_A_UCNFA; // AH-44/A
    class TKE_Ext_Dragonfly_S_UCNFA; // AH-44/S
    class TKE_Ext_Dragonfly_T_UCNFA; // MH-44/T
    class CIV_Nomad; // Nomad Ranger

    #define DRAGONFLY_TEXTURES_BROWN hiddenSelectionsTextures[] = {"TKE_Ext_Heli\data\heli_UCFA_brown_co.paa","TKE_Ext_Heli\data\heli1_UCFA_brown_co.paa"}
    #define DRAGONFLY_TEXTURES_SAR hiddenSelectionsTextures[] = {"TKE_Ext_Heli\data\heli_co.paa","TKE_Ext_Heli\data\heli1_co.paa","TKE_Ext_APC\data\apc_black_co.paa"}

    // UCN Brown
    class A3U_TKE_Ext_Bearcat_Autocannon_UCNFA_B : TKE_Ext_Bearcat_Autocannon_UCNFA
    {
        displayName = "TC-15/A 'Bearcat' IFV Brown"
        textureList[] = {"UCFABrown",1};
    };
    class A3U_TKE_Ext_Bearcat_Unarmed_UCNFA_B : TKE_Ext_Bearcat_Unarmed_UCNFA
    {
        displayName = "TC-15/C 'Bearcat' APC Brown"
        textureList[] = {"UCFABrown",1};
    };
    class A3U_TKE_Ext_Bearcat_Cannon_UCNFA_B : TKE_Ext_Bearcat_Cannon_UCNFA
    {
        displayName = "TC-15/D 'Bearcat' FSV Brown"
        textureList[] = {"UCFABrown",1};
    };
    class A3U_TKE_Ext_Bearcat_AA_UCNFA_B : TKE_Ext_Bearcat_AA_UCNFA
    {
        displayName = "TC-15/B 'Bearcat' SHORAD Brown"
        textureList[] = {"UCFABrown",1};
    };

    class A3U_TKE_Ext_Dragonfly_A_UCNFA_B : TKE_Ext_Dragonfly_A_UCNFA
    {
        displayName = "AH-44/A 'Dragonfly' Brown"
        textureList[] = {"UCFABrown",1,"UCFA",0};
        DRAGONFLY_TEXTURES_BROWN;
    };
    class A3U_TKE_Ext_Dragonfly_S_UCNFA_B : TKE_Ext_Dragonfly_S_UCNFA
    {
        displayName = "AH-44/S 'Dragonfly' Brown"
        textureList[] = {"UCFABrown",1,"UCFA",0};
        DRAGONFLY_TEXTURES_BROWN;
    };
    class A3U_TKE_Ext_Dragonfly_T_UCNFA_B : TKE_Ext_Dragonfly_T_UCNFA
    {
        displayName = "MH-44/T 'Locust' Brown"
        textureList[] = {"UCFABrown",1,"UCFA",0};
        DRAGONFLY_TEXTURES_BROWN;
    };

    // Civ SAR
    class A3U_TKE_Ext_Dragonfly_T_CIV : TKE_Ext_Dragonfly_T_UCNFA
    {
        displayName = "MH-44/T 'Locust' SAR"
        textureList[] = {"SAR",1,"UCFA",0};
        DRAGONFLY_TEXTURES_SAR;
    };

    // UCMC White Bearcats
    class A3U_TKE_Ext_Bearcat_Autocannon_UCMC_A : TKE_Ext_Bearcat_Autocannon_UCNFA
    {
        displayName = "TC-15/A 'Bearcat' IFV Arctic"
        textureList[] = {"White",1};
    };
    class A3U_TKE_Ext_Bearcat_Unarmed_UCMC_A : TKE_Ext_Bearcat_Unarmed_UCNFA
    {
        displayName = "TC-15/C 'Bearcat' APC Arctic"
        textureList[] = {"White",1};
    };
    class A3U_TKE_Ext_Bearcat_Cannon_UCMC_A : TKE_Ext_Bearcat_Cannon_UCNFA
    {
        displayName = "TC-15/D 'Bearcat' FSV Arctic"
        textureList[] = {"White",1};
    };
    class A3U_TKE_Ext_Bearcat_AA_UCMC_A : TKE_Ext_Bearcat_AA_UCNFA
    {
        displayName = "TC-15/B 'Bearcat' SHORAD Arctic"
        textureList[] = {"White",1};
    };

    // UCN
    class A3U_UCNFA_BL_APC_U_Repair : UCNFA_G_APC_U
    {
        displayName = "Paladin APC (Repair)"
        transportRepair = 1e+12;
        textureList[] = {"Black",1};
    };
    class A3U_UCNFA_BL_APC_U_Fuel : UCNFA_G_APC_U
    {
        displayName = "Paladin APC (Fuel)"
        transportFuel = 1e+12;
        textureList[] = {"Black",1};
    };
    class A3U_UCNFA_BL_APC_U_Ammo : UCNFA_G_APC_U
    {
        displayName = "Paladin APC (Ammo)"
        transportAmmo = 1e+12;
        textureList[] = {"Black",1};
    };

    // MD
    class A3U_MDMC_APC_U_Repair : MDMC_APC_U
    {
        displayName = "Galea APC (Repair)"
        transportRepair = 1e+12;
        textureList[] = {"Grey",1};
    };
    class A3U_MDMC_APC_U_Fuel : MDMC_APC_U
    {
        displayName = "Galea APC (Fuel)"
        transportFuel = 1e+12;
        textureList[] = {"Grey",1};
    };
    class A3U_MDMC_APC_U_Ammo : MDMC_APC_U
    {
        displayName = "Galea APC (Ammo)"
        transportAmmo = 1e+12;
        textureList[] = {"Grey",1};
    };

    // UCN Black Nomads
    class A3U_UCN_BL_Nomad : CIV_Nomad
    {
        displayName = "Nomad Ranger (UCN/Black)"
        textureList[] = {"Black",1};
        animationList[] = {
            "hide_cover",0,"hide_cover_hard",0,"hide_cover_cabin",0,"hide_tailgate",0,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",0,"hide_bags2",0,
            "hide_bags3",0,"hide_bags4",0,"hide_bags5",0
        };
    };
    class A3U_UCN_BL_Nomad_Rollcage : CIV_Nomad
    {
        displayName = "Nomad Ranger Rollcage (UCN/Black)"
        textureList[] = {"Black",1};
        animationList[] = {
            "hide_cover",1,"hide_cover_hard",1,"hide_cover_cabin",1,"hide_tailgate",1,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",0,"hide_bags2",1,
            "hide_bags3",1,"hide_bags4",0,"hide_bags5",1
        };
    };
    class A3U_UCN_BL_Nomad_Light : CIV_Nomad
    {
        displayName = "Nomad Ranger Light (UCN/Black)"
        textureList[] = {"Black",1};
        animationList[] = {
            "hide_cover",1,"hide_cover_hard",1,"hide_cover_cabin",1,"hide_tailgate",1,
            "hide_fender",0,"hide_rollcage",1,"hide_bags1",0,"hide_bags2",0,
            "hide_bags3",0,"hide_bags4",0,"hide_bags5",0
        };
    };

    // Civ Nomads
    class A3U_CIV_Nomad_Industrial : CIV_Nomad
    {
        displayName = "Nomad Ranger Light (Civ/Orange)"
        textureList[] = {"Orange",1};
        animationList[] = {
            "hide_cover",0,"hide_cover_hard",1,"hide_cover_cabin",1,"hide_tailgate",1,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",1,"hide_bags2",1,
            "hide_bags3",1,"hide_bags4",1,"hide_bags5",0
        };
    };
    class A3U_CIV_Nomad_Repair : CIV_Nomad
    {
        displayName = "Nomad Ranger Repair (Civ/Blue)"
        textureList[] = {"Blue",1};
        transportRepair = 1e+12;
        animationList[] = {
            "hide_cover",0,"hide_cover_hard",1,"hide_cover_cabin",1,"hide_tailgate",0,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",0,"hide_bags2",0,
            "hide_bags3",0,"hide_bags4",0,"hide_bags5",0
        };
    };
    class A3U_CIV_Nomad_Fuel : CIV_Nomad
    {
        displayName = "Nomad Ranger Repair (Civ/Blue)"
        textureList[] = {"Green",1};
        transportFuel = 1e+12;
        animationList[] = {
            "hide_cover",0,"hide_cover_hard",0,"hide_cover_cabin",0,"hide_tailgate",0,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",1,"hide_bags2",1,
            "hide_bags3",1,"hide_bags4",1,"hide_bags5",1
        };
    };
};