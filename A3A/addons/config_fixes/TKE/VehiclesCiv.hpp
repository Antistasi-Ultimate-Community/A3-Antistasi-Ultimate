    #define DRAGONFLY_TEXTURES_SAR hiddenSelectionsTextures[] = {"TKE_Ext_Heli\data\heli_co.paa","TKE_Ext_Heli\data\heli1_co.paa","TKE_Ext_APC\data\apc_black_co.paa"}
    
    // Civ Nomads
    class A3U_CIV_Nomad_Industrial : CIV_Nomad
    {
        displayName = "Nomad Ranger Light (Civ/Orange)";
        textureList[] = {"Orange",1};
        animationList[] = {
            "hide_cover",0,"hide_cover_hard",1,"hide_cover_cabin",1,"hide_tailgate",1,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",1,"hide_bags2",1,
            "hide_bags3",1,"hide_bags4",1,"hide_bags5",0
        };
    };
    class A3U_CIV_Nomad_Repair : CIV_Nomad
    {
        displayName = "Nomad Ranger Repair (Civ/Blue)";
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
        displayName = "Nomad Ranger Fuel (Civ/Green)";
        textureList[] = {"Green",1};
        transportFuel = 1e+12;
        animationList[] = {
            "hide_cover",0,"hide_cover_hard",0,"hide_cover_cabin",0,"hide_tailgate",0,
            "hide_fender",0,"hide_rollcage",0,"hide_bags1",1,"hide_bags2",1,
            "hide_bags3",1,"hide_bags4",1,"hide_bags5",1
        };
    };

    // Civ SAR Heli
    class A3U_TKE_Ext_Dragonfly_T_CIV : TKE_Ext_Dragonfly_T_UCNFA
    {
        displayName = "MH-44/T 'Locust' SAR";
        textureList[] = {"SAR",1,"UCFA",0};
        DRAGONFLY_TEXTURES_SAR;
    };