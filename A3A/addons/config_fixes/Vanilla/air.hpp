//Vanilla - air.hpp

class B_Heli_Light_01_F;
class B_Heli_Light_01_dynamicLoadout_F;
class B_Heli_Light_01_stripped_F;
class I_Heli_Transport_02_F;
class I_Plane_Fighter_03_dynamicLoadout_F;
class I_Plane_Fighter_04_F;
class O_Heli_Light_02_dynamicLoadout_F;
class O_Heli_Light_02_unarmed_F;
class Heli_Transport_01_base_F;

//Black
class a3a_Heli_Light_02_black_F : O_Heli_Light_02_dynamicLoadout_F
{
    class TextureSources
    {
        class Black
        {
            author = "Bohemia Interactive";
            displayName = "Black";
            textures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
        };
        class Blackcustom
        {
           author = "Bohemia Interactive";
            displayName = "Black Custom";
            textures[] = {"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};
        };
    };
    textureList[] = {"Black",1,"Blackcustom",1};
    hiddenSelectionsTextures[] = {"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};
};

//ION
class a3a_Heli_Light_01_Stripped_ION_F : B_Heli_Light_01_stripped_F
{
    hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa",""};
};
class a3a_Heli_Light_01_ION_F : B_Heli_Light_01_F
{
    hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa",""};
};
class a3a_Heli_Light_01_dynamicLoadout_ION_F : B_Heli_Light_01_dynamicLoadout_F
{
    hiddenSelectionsTextures[] = {"a3\air_f\heli_light_01\data\heli_light_01_ext_ion_co.paa","a3\air_f\heli_light_01\data\heli_light_01_dot_ca.paa"};
};
class a3a_ION_Heli_Transport_02_F : I_Heli_Transport_02_F
{
    textureList[] = {"ION",1,"AAF",0,"IDAP",0,"Dahoman",0};
    hiddenSelectionsTextures[] = {"a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_ion_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_ion_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_ion_co.paa","a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"};
};

//Grey
class a3a_Plane_Fighter_04_grey_F : I_Plane_Fighter_04_F
{
    textureList[] = {"CamoGrey",1,"DigitalCamoGreen",0,"DigitalCamoGrey",0};
    hiddenSelectionsTextures[] = {"a3\air_f_jets\plane_fighter_04\data\fighter_04_fuselage_01_co.paa","a3\air_f_jets\plane_fighter_04\data\fighter_04_fuselage_02_co.paa","a3\air_f_jets\plane_fighter_04\data\fighter_04_misc_01_co.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_04_ca.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_04_ca.paa","a3\air_f_jets\plane_fighter_04\data\numbers\fighter_04_number_08_ca.paa"};
};
class a3a_Plane_Fighter_03_grey_F : I_Plane_Fighter_03_dynamicLoadout_F
{
    scope = 2;
    faction = "OPF_F";
    side = 0;
    textureList[] = {"Grey",1,"Green",0,"Hex",0};
    hiddenSelectionsTextures[] = {"a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_1_greyhex_co.paa","a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_2_greyhex_co.paa"};
};

//Civilian
class a3a_C_Heli_Transport_02_F : I_Heli_Transport_02_F
{
    crew = "C_man_pilot_F";
    faction = "CIV_F";
    side = 3;
    textureList[] = {"ION",0,"AAF",0,"IDAP",0,"Dahoman",1};
    hiddenSelectionsTextures[] = {"a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_1_dahoman_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_2_dahoman_co.paa","a3\air_f_beta\heli_transport_02\data\skins\heli_transport_02_3_dahoman_co.paa","a3\air_f_beta\heli_transport_02\data\heli_transport_02_int_02_co.paa"};
};
class a3a_C_Heli_Light_02_blue_F : O_Heli_Light_02_unarmed_F
{
    crew = "C_man_pilot_F";
    faction = "CIV_F";
    side = 3;
    textureList[] = {"Opfor",0,"Black",0,"Blackcustom",0,"Blue",1};
    hiddenSelectionsTextures[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa","\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa","\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"};
};

///2.20 update (armed ghosthawk)
class Heli_Transport_01_pylons_base_F: Heli_Transport_01_base_F
{
    class Components;
};
class B_Heli_Transport_01_pylons_F: Heli_Transport_01_pylons_base_F 
{
    class Components : Components 
    {
        class TransportPylonsComponent
		{
            uiPicture = "\A3\Air_F_Beta\Heli_Transport_01\Data\UI\Heli_Transport_01_pylons_EDEN_CA.paa";
            class Presets
			{
                class Default 
				{
                    attachment[] = {"PylonRack_12Rnd_PGM_missiles","PylonWeapon_2000Rnd_65x39_belt","PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_PGM_missiles"};
                    displayName = "Default";
                };
                class Empty 
				{
                    attachment[] = {};
                    displayName = "Empty";
                };
                class LongRange 
				{
                    attachment[] = {"PylonFuelTank_UH80","PylonRack_12Rnd_PGM_missiles","PylonRack_12Rnd_PGM_missiles","PylonFuelTank_UH80"};
                    displayName = "Long-Range";
                };
            };
            class Pylons 
			{
                class Pylon1
				{
                    attachment = "PylonRack_12Rnd_PGM_missiles";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    priority = 2;
                    UIposition[] = {0.625,0.42};
                };
                class Pylon2 
				{
                    attachment = "PylonRack_12Rnd_PGM_missiles";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    priority = 1;
                    UIposition[] = {0.555,0.37};
                };
                class Pylon3
				{
                    attachment = "PylonRack_12Rnd_PGM_missiles";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    mirroredMissilePos = 2;
                    priority = 1;
                    UIposition[] = {0.11,0.37};
                };
                class Pylon4
				{
                    attachment = "PylonRack_12Rnd_PGM_missiles";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    mirroredMissilePos = 1;
                    priority = 2;
                    UIposition[] = {0.04,0.42};
                };
            };
        };
    };
};
class a3a_B_Heli_Transport_01_pylons_F: B_Heli_Transport_01_pylons_F {
   class Components : Components 
   {
        class TransportPylonsComponent : TransportPylonsComponent 
		{
            class Presets
			{
                class Default 
				{
                    attachment[] = {"PylonRack_12Rnd_PGM_missiles","PylonWeapon_2000Rnd_65x39_belt","PylonWeapon_2000Rnd_65x39_belt","PylonRack_12Rnd_PGM_missiles"};
                    displayName = "Default";
                };
                class Empty 
				{
                    attachment[] = {};
                    displayName = "Empty";
                };
                class LongRange 
				{
                    attachment[] = {"PylonFuelTank_UH80","PylonRack_12Rnd_PGM_missiles","PylonRack_12Rnd_PGM_missiles","PylonFuelTank_UH80"};
                    displayName = "Long-Range";
                };
            };
            class Pylons 
			{
                class Pylon1
				{
                    attachment = "PylonRack_12Rnd_missiles";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    priority = 2;
                    UIposition[] = {0.625,0.42};
                };
                class Pylon2 
				{
                    attachment = "PylonWeapon_2000Rnd_65x39_belt";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    priority = 1;
                    UIposition[] = {0.555,0.37};
                };
                class Pylon3
				{
                    attachment = "PylonWeapon_2000Rnd_65x39_belt";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    mirroredMissilePos = 2;
                    priority = 1;
                    UIposition[] = {0.11,0.37};
                };
                class Pylon4
				{
                    attachment = "PylonRack_12Rnd_missiles";
                    bay = -1;
                    hardpoints[] = {"B_BOMB_PYLON","B_FUELTANK_HELI","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","DAR","DAGRM","WEAPON_PODS_RF","20MM_TWIN_CANNON","I_ORCA_RIGHT_PYLON"};
                    maxweight = 1200;
                    mirroredMissilePos = 1;
                    priority = 2;
                    UIposition[] = {0.04,0.42};
                };
            };
        };
    };
};