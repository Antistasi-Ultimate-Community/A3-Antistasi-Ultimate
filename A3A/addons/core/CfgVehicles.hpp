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

    class Land_PaperBox_01_small_closed_white_med_F;
    class A3AU_moneyCrate_small_01 : Land_PaperBox_01_small_closed_white_med_F {
        displayName = "Money Crate (Small)";
        author = AUTHOR;
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { QPATHTOFOLDER(Pictures\items\PaperBox_01_small_money_CO.paa) };
    };

    ///
    class Land_Pod_Heli_Transport_04_box_F;
    class B_Slingload_01_Cargo_F;
    class Land_Cargo10_light_blue_F;
    class Land_CargoBox_V1_F;
    class A3AU_Land_Pod_Heli_Transport_04_box_F_shoppingCart : Land_Pod_Heli_Transport_04_box_F {
        displayName = $STR_A3A_Utility_Items_Name_shoppingcartXL;
        hiddenSelectionsTextures[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_Black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_Black_CO.paa"};
        maximumLoad = 20000;
        transportMaxMagazines = 300;
        transportMaxWeapons = 100;
        transportMaxBackpacks = 100;
        armor = 2000;
    }; ///size 7

    class A3AU_B_Slingload_01_Cargo_F_shoppingCart : B_Slingload_01_Cargo_F {
        displayName = $STR_A3A_Utility_Items_Name_shoppingcartL;
        maximumLoad = 10000;
        transportMaxMagazines = 300;
        transportMaxWeapons = 75;
        transportMaxBackpacks = 75;
        armor = 2000;
    }; ///size 7

    class A3AU_Land_Cargo10_light_blue_F_shoppingCart : Land_Cargo10_light_blue_F {
        displayName = $STR_A3A_Utility_Items_Name_shoppingcartM;
        maximumLoad = 5000;
        transportMaxMagazines = 200;
        transportMaxWeapons = 50;
        transportMaxBackpacks = 50;
        armor = 2000;
        supplyRadius = 20;
        enableInventory = 1;
    };///size 4

    class A3AU_Land_CargoBox_V1_F_shoppingCart : Land_CargoBox_V1_F {
        displayName = $STR_A3A_Utility_Items_Name_shoppingcartL;
        maximumLoad = 2000;
        transportMaxMagazines = 100;
        transportMaxWeapons = 25;
        transportMaxBackpacks = 25;
        armor = 2000;
        supplyRadius = 4;
        enableInventory = 1;
    }; ///size 3
};
