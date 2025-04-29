//Vanilla - armor.hpp

class I_APC_Wheeled_03_cannon_F;
class I_MRAP_03_F;
class I_MRAP_03_gmg_F;
class I_MRAP_03_hmg_F;
class O_MBT_04_cannon_F;
class O_MBT_04_command_F;
class O_MBT_02_base_F; //external Root Class
class O_MBT_02_cannon_F : O_MBT_02_base_F
{ 
    class TextureSources; //external Child Class
};
class O_MBT_02_railgun_F;
//Grey
class a3a_MRAP_03_grey_F : I_MRAP_03_F
{ 
    scope = 2;
    faction = "BLU_F";
    side = 1;
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
    editorPreview = QPATHTOFOLDER(Pictures\vehicles\a3a_MRAP_03_grey_F.jpg);
};
class a3a_MRAP_03_gmg_grey_F : I_MRAP_03_gmg_F
{ 
    scope = 2;
    faction = "BLU_F";
    side = 1;
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
    editorPreview = QPATHTOFOLDER(Pictures\vehicles\a3a_MRAP_03_gmg_grey_F.jpg);
};
class a3a_MRAP_03_hmg_grey_F : I_MRAP_03_hmg_F
{ 
    scope = 2;
    faction = "BLU_F";
    side = 1;
    hiddenSelectionsTextures[] = {"a3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa","a3\data_f\vehicles\turret_co.paa"};
    editorPreview = QPATHTOFOLDER(Pictures\vehicles\a3a_MRAP_03_hmg_grey_F.jpg);
};

//Olive
class a3a_APC_Wheeled_03_cannon_blufor_F : I_APC_Wheeled_03_cannon_F
{
    scope = 2;
    faction = "BLU_F";
    side = 1;
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\RCWS30_CO.paa","a3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_CO.paa","a3\armor_f\data\camonet_aaf_fia_desert_co.paa","a3\armor_f\data\cage_sand_co.paa"};
    editorPreview = QPATHTOFOLDER(Pictures\vehicles\a3a_APC_Wheeled_03_cannon_blufor_F.jpg);
};

//Black
class a3a_MBT_04_cannon_black_F : O_MBT_04_cannon_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};
class a3a_MBT_04_command_black_F : O_MBT_04_command_F
{
    textureList[] = {};
    hiddenSelectionsTextures[] = {"a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa","a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa","a3\armor_f\data\camonet_csat_stripe_desert_co.paa"};
};

class a3a_MBT_02_cannon_grey_F : O_MBT_02_cannon_F
{
    class TextureSources : TextureSources
    {
        class Grey
        {
            author = "Bohemia Interactive";
            displayName = "Grey";
            textures[] = {"a3\Armor_F_Decade\MBT_02\Data\MBT_02_body_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_turret_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_expo_CO.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa"};
        };
    };
    textureList[] = {"Grey", 1};
    hiddenSelectionsTextures[] = {"a3\Armor_F_Decade\MBT_02\Data\MBT_02_body_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_turret_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_expo_CO.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa"};
};

class a3a_MBT_02_railgun_grey_F : O_MBT_02_railgun_F
{
    textureList[] = {"Grey", 1};
    hiddenSelectionsTextures[] = {"a3\Armor_F_Decade\MBT_02\Data\MBT_02_body_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_turret_expo_CO.paa","a3\Armor_F_Decade\MBT_02\Data\MBT_02_expo_CO.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa"};
};