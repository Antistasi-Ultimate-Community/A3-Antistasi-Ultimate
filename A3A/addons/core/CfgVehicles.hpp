class CfgVehicles
{
    class Box_Syndicate_Ammo_F;

    class A3AP_Box_Syndicate_Ammo_F : Box_Syndicate_Ammo_F 
    {
        armor = 2000;
    };
    // Rebel AI unit types

    //don't need to change this one?
    class I_G_Survivor_F;
    class a3a_unit_reb_unarmed : I_G_Survivor_F {};

    class I_G_Soldier_F;
    class a3a_unit_reb : I_G_Soldier_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_medic_F;
    class a3a_unit_reb_medic : I_G_medic_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Sharpshooter_F;
    class a3a_unit_reb_sniper : I_G_Sharpshooter_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_M_F;
    class a3a_unit_reb_marksman : I_G_Soldier_M_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_LAT_F;
    class a3a_unit_reb_lat : I_G_Soldier_LAT_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_AR_F;
    class a3a_unit_reb_mg : I_G_Soldier_AR_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_exp_F;
    class a3a_unit_reb_exp : I_G_Soldier_exp_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_GL_F;
    class a3a_unit_reb_gl : I_G_Soldier_GL_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_Soldier_SL_F;
    class a3a_unit_reb_sl : I_G_Soldier_SL_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_engineer_F;
    class a3a_unit_reb_eng : I_G_engineer_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_Soldier_AT_F;
    class a3a_unit_reb_at : I_Soldier_AT_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_Soldier_AA_F;
    class a3a_unit_reb_aa : I_Soldier_AA_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class I_G_officer_F;
    class a3a_unit_reb_petros : I_G_officer_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    // Base side types

    class B_G_Soldier_F;
    class a3a_unit_west : B_G_Soldier_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class O_G_Soldier_F;
    class a3a_unit_east : O_G_Soldier_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class O_G_Soldier_lite_F;
    class a3a_unit_riv : O_G_Soldier_lite_F {
        backpack = "";
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"};
        magazines[] = {};
        weapons[] = {"Throw","Put"};
    };

    class C_Man_1;
    class a3a_unit_civ : C_Man_1 {};
  
    class NATO_Box_Base;

	
    class A3AU_Build_Box_base: NATO_Box_Base {
        author = AUTHOR;
        hiddenSelections[] = 
        {
            "Camo_Signs",
            "Camo"
        };
        hiddenSelectionsTextures[] = 
        {
            QPATHTOFOLDER(Pictures\items\AmmoBox_signs_CA.paa),
            QPATHTOFOLDER(Pictures\items\AmmoBox_black_CO.paa)
        };
	};

	class A3AU_Build_Box_Large_1: A3AU_Build_Box_base {
        mapSize = 2.3399999;
        class SimpleObject
        {
            eden = 1;
            animate[] = {};
            hide[] = {};
            verticalOffset = 0.15000001;
            verticalOffsetWorld = 0;
            init = "''";
        };
        editorPreview = QPATHTOFOLDER(Pictures\items\A3AU_Build_Box_Large_1.jpg);
        _generalMacro = "Box_NATO_WpsLaunch_F";
        scope = 2;
        displayName = "Build Box (Large)";
        model = "\A3\weapons_F\AmmoBoxes\WpnsBox_long_F";
        icon = "iconCrateLong";
        class TransportMagazines{};
        class TransportWeapons{};
        class TransportItems{};
        class TransportBackpacks{};
    };

    class B_supplyCrate_F;
    class A3AU_supplyCrate_Base : B_supplyCrate_F {
        author = AUTHOR;
        class TransportBackpacks {};
        class TransportItems {};
        class TransportMagazines {};
        class TransportWeapons {};
    };
    class A3AU_supplyCrate_Medical_01 : A3AU_supplyCrate_Base {
        author = AUTHOR;
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { QPATHTOFOLDER(Pictures\items\supplydrop_medical_01_co.paa) };
    };
    class A3AU_supplyCrate_Medical_02 : A3AU_supplyCrate_Base {
        author = AUTHOR;
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { QPATHTOFOLDER(Pictures\items\supplydrop_medical_02_co.paa) };
    };
    
    class Land_PaperBox_01_small_closed_white_med_F;
    class A3AU_moneyCrate_small_01 : Land_PaperBox_01_small_closed_white_med_F {
        displayName = "Money Crate (Small)";
        author = AUTHOR;
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { QPATHTOFOLDER(Pictures\items\PaperBox_01_small_money_CO.paa) };
    };
};
