class CfgVehicles
{
    class Box_NATO_Uniforms_F;
    class Box_Syndicate_Ammo_F;
    class House_F;
    class House_Small_F;
    class Strategic;
    class ThingX;

    // <Force building placer to ignore surface normals and use their up vectors>
    class FlagCarrierCore: Strategic {
        GVAR(buildingPlacerVectorUp)[] = {0,0,1};
    };

    class Lamps_base_F: House_Small_F {
        GVAR(buildingPlacerVectorUp)[] = {0,0,1};
    };

    class Land_dp_bigTank_F: House_F {
        GVAR(buildingPlacerVectorUp)[] = {0,0,1};
    };

    class Land_dp_smallTank_F: House_Small_F {
        GVAR(buildingPlacerVectorUp)[] = {0,0,1};
    };

    class Land_ReservoirTower_F: House_F {
        GVAR(buildingPlacerVectorUp)[] = {0,0,1};
    };
    // </Force building placer to ignore surface normals and use their up vectors>

    class A3AP_Box_Syndicate_Ammo_F : Box_Syndicate_Ammo_F {
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

    class Box_NATO_AmmoVeh_F;
    class A3AU_Build_Box_Humongous : Box_NATO_AmmoVeh_F {
        displayName = "Build Box (Humongous)";
        hiddenSelectionsTextures[] = {QPATHTOFOLDER(Pictures\items\A3AU_Build_Box_Humongous.paa),"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa"};

        ace_cargo_blockUnloadCarry = 1;
        ace_cargo_canLoad = 1;
        ace_cargo_size = 6;
        ace_dragging_canDrag = 0;
        ace_dragging_canCarry = 0;

        class TransportMagazines{};
        class TransportWeapons{};
        class TransportItems{};
        class TransportBackpacks{};
    };

    class GVAR(Box_BuildingPlacer_Additions_Base): Box_NATO_Uniforms_F {
        scope = 0;
        scopeCurator = 0;
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Exp\Ammoboxes\Data\uniforms_box_blufor_co.paa"};

        GVAR(buildableObjects)[] = {};

        class TransportMagazines{};
        class TransportWeapons{};
        class TransportItems{};
        class TransportBackpacks{};
    };

    class GVAR(Box_BuildingPlacer_Decorations): GVAR(Box_BuildingPlacer_Additions_Base) {
        displayName = "$STR_A3A_Utility_Items_Box_BuildingPlacer_Decorations";
        scope = 1;

        editorPreview = QPATHTOFOLDER(Pictures\items\GVAR(Box_BuildingPlacer_Decorations).jpg);
        hiddenSelectionsTextures[] += {QPATHTOFOLDER(Pictures\items\GVAR(Box_BuildingPlacer_Decorations).paa)};

        /* Generator property:
        
        GVAR(buildableObjectsCode) = QUOTE((_this select 0) pushBack[ARR_2(QQUOTE(Land_Portable_generator_F),200)]);

         */
        GVAR(buildableObjects)[] = {
            {"$STR_antistasi_dialogs_construction_menu_category_clutter", "\a3\editorpreviews_f\Data\CfgVehicles\Land_CampingChair_V1_F.jpg", {
                {"Land_CampingChair_V2_white_F", 25},
                {"Land_CampingTable_F", 50},
                {"Land_CampingTable_small_F", 30},
                {"Land_CampingTable_small_white_F", 35},
                {"Land_CampingTable_white_F", 55},
                {"Land_CampingChair_V1_F", 20},
                {"Land_Camping_Light_F", 40}
            }},
            {"$STR_antistasi_dialogs_construction_menu_category_tents", "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_MedicalTent_01_NATO_generic_open_F.jpg", {
                {"Land_MedicalTent_01_NATO_generic_open_F", 500},
                {"Land_MedicalTent_01_aaf_generic_inner_F", 500},
                {"Land_MedicalTent_01_aaf_generic_outer_F", 500},
                {"Land_MedicalTent_01_NATO_generic_outer_F", 500},
                {"Land_MedicalTent_01_floor_dark_F", 150}
            }},
            {"$STR_antistasi_dialogs_construction_menu_category_large_objects", "\a3\editorpreviews_f\Data\CfgVehicles\Land_ReservoirTower_F.jpg", {
                {"Land_Shed_Big_F", 1250},
                {"Land_Shed_Small_F", 750},
                {"Land_dp_smallTank_F", 1000},
                {"Land_dp_bigTank_F", 1750},
                {"Land_ReservoirTower_F", 2000}
            }},
            {"$STR_antistasi_dialogs_construction_menu_category_lights", "\a3\editorpreviews_f\Data\CfgVehicles\Land_LampAirport_F.jpg", {
                {"Land_LampAirport_F", 400},
                {"Land_LampDecor_F", 100},
                {"Land_LampHalogen_F", 200},
                {"Land_LampHarbour_F", 100},
                {"Land_LampSolar_F", 100},
                {"Land_LampStreet_small_F", 100},
                {"Land_LampStreet_F", 100},
                {"Land_TentLamp_01_suspended_red_F", 80},
                {"Land_TentLamp_01_suspended_F", 80},
                {"Land_Camping_Light_F", 40}
            }},
            {"$STR_antistasi_dialogs_construction_menu_category_obstacles", "\a3\editorpreviews_f_tank\data\cfgvehicles\Land_DragonsTeeth_01_1x1_old_F.jpg", {
                {"Land_DragonsTeeth_01_1x1_old_F", 15},
                {"Land_DragonsTeeth_01_4x2_old_F", 50},
                {"BlockConcrete_F", 65},
                {"Land_CncBarrier_F", 30},
                {"Land_CncBarrierMedium_F", 40},
                {"Land_CncBarrierMedium4_F", 45},
                {"Land_CncBarrier_stripes_F", 35},
                {"Land_CncWall1_F", 50},
                {"Land_CncWall4_F", 60}
            }},
            {"$STR_antistasi_dialogs_construction_menu_category_camo_nets", "\A3\EditorPreviews_F\Data\CfgVehicles\CamoNet_INDP_F.jpg", {
                {"CamoNet_INDP_F", 800},
                {"CamoNet_BLUFOR_F", 800},
                {"CamoNet_OPFOR_F", 800},
                {"CamoNet_wdl_F", 800},
                {"CamoNet_INDP_open_F", 800},
                {"CamoNet_BLUFOR_open_F", 800},
                {"CamoNet_OPFOR_open_F", 800},
                {"CamoNet_wdl_open_F", 800},
                {"CamoNet_INDP_big_F", 1200},
                {"CamoNet_BLUFOR_big_F", 1200},
                {"CamoNet_OPFOR_big_F", 1200},
                {"Land_CanvasCover_01_F", 750},
                {"Land_CanvasCover_02_F", 150}
            }},
            {"$STR_antistasi_dialogs_construction_menu_category_cargo_crates", "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_Cargo40_IDAP_F.jpg", {
                {"$STR_antistasi_dialogs_construction_menu_category_cargo_crates_large", "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_Cargo40_IDAP_F.jpg", {
                    {"Land_Cargo40_IDAP_F", 150},
                    {"Land_Cargo40_blue_F", 150},
                    {"Land_Cargo40_brick_red_F", 150},
                    {"Land_Cargo40_cyan_F", 150},
                    {"Land_Cargo40_grey_F", 150},
                    {"Land_Cargo40_light_blue_F", 150},
                    {"Land_Cargo40_light_green_F", 150},
                    {"Land_Cargo40_military_green_F", 150},
                    {"Land_Cargo40_orange_F", 150},
                    {"Land_Cargo40_red_F", 150},
                    {"Land_Cargo40_sand_F", 150},
                    {"Land_Cargo40_white_F", 150},
                    {"Land_Cargo40_yellow_F", 150}
                }},
                {"$STR_antistasi_dialogs_construction_menu_category_cargo_crates_medium", "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_Cargo20_IDAP_F.jpg", {
                    {"Land_Cargo20_IDAP_F", 50},
                    {"Land_Cargo20_blue_F", 50},
                    {"Land_Cargo20_brick_red_F", 50},
                    {"Land_Cargo20_cyan_F", 50},
                    {"Land_Cargo20_grey_F", 50},
                    {"Land_Cargo20_light_blue_F", 50},
                    {"Land_Cargo20_light_green_F", 50},
                    {"Land_Cargo20_military_green_F", 50},
                    {"Land_Cargo20_orange_F", 50},
                    {"Land_Cargo20_red_F", 50},
                    {"Land_Cargo20_sand_F", 50},
                    {"Land_Cargo20_white_F", 50},
                    {"Land_Cargo20_yellow_F", 50}
                }},
                {"$STR_antistasi_dialogs_construction_menu_category_cargo_crates_small", "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_Cargo10_IDAP_F.jpg", {
                    {"Land_Cargo10_IDAP_F", 25},
                    {"Land_Cargo10_blue_F", 25},
                    {"Land_Cargo10_brick_red_F", 25},
                    {"Land_Cargo10_cyan_F", 25},
                    {"Land_Cargo10_grey_F", 25},
                    {"Land_Cargo10_light_blue_F", 25},
                    {"Land_Cargo10_light_green_F", 25},
                    {"Land_Cargo10_military_green_F", 25},
                    {"Land_Cargo10_orange_F", 25},
                    {"Land_Cargo10_red_F", 25},
                    {"Land_Cargo10_sand_F", 25},
                    {"Land_Cargo10_white_F", 25},
                    {"Land_Cargo10_yellow_F", 25}
                }}
            }}
        };
    };

    class GVAR(Box_BuildingPlacer_Chemlights): GVAR(Box_BuildingPlacer_Additions_Base) {
        displayName = "$STR_A3A_Utility_Items_Box_BuildingPlacer_Chemlights";
        scope = 1;

        editorPreview = QPATHTOFOLDER(Pictures\items\GVAR(Box_BuildingPlacer_Chemlights).jpg);
        hiddenSelectionsTextures[] += {QPATHTOFOLDER(Pictures\items\GVAR(Box_BuildingPlacer_Chemlights).paa)};

        GVAR(buildableObjects)[] = {
            {QGVAR(Chemlight_Red), 15},
            {QGVAR(Chemlight_Green), 15},
            {QGVAR(Chemlight_Blue), 15},
            {QGVAR(Chemlight_Cyan), 15},
            {QGVAR(Chemlight_Purple), 15},
            {QGVAR(Chemlight_Orange), 15},
            {QGVAR(Chemlight_Yellow), 15},
            {QGVAR(Chemlight_White), 15},
            {QGVAR(Chemlight_WarmWhite), 15},

            {QGVAR(Chemlight_Red_Flare), 15},
            {QGVAR(Chemlight_Green_Flare), 15},
            {QGVAR(Chemlight_Blue_Flare), 15},
            {QGVAR(Chemlight_Cyan_Flare), 15},
            {QGVAR(Chemlight_Purple_Flare), 15},
            {QGVAR(Chemlight_Orange_Flare), 15},
            {QGVAR(Chemlight_Yellow_Flare), 15},
            {QGVAR(Chemlight_White_Flare), 15},
            {QGVAR(Chemlight_WarmWhite_Flare), 15}
        };
    };

    class GVAR(Chemlight_Base): ThingX {
        displayName = "Chemlight (Base)";
        author = AUTHOR;
        model = "\A3\Weapons_f\chemlight\chemlight_blue_lit.p3d";
        destrType = "DestructNo";
        armor = 200;
        scope = 0;

        EGVAR(core,isBuilding) = 1;

        class LightParams {
            color[] = {1, 1, 1};
            ambient[] = {0.006, 0.008, 0.01};
            intensity = 1000;
            dayLight = 0;
            useFlare = 0;
            flareMaxDistance = 150;
            flareSize = 1;
        };

        class EventHandlers {
            init = QUOTE(call FUNCMAIN(attachLightFromConfig));
        };
    };

    class GVAR(Chemlight_Base_Flare): GVAR(Chemlight_Base) {
        displayName = "Chemlight (Base, With lens flare)";

        class LightParams : LightParams {
            useFlare = 1;
        };
    };

    class GVAR(Chemlight_Red): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Red)";

        class LightParams : LightParams {
            color[] = {1, 0.08, 0.16};
        };
    };

    class GVAR(Chemlight_Green): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Green)";

        class LightParams : LightParams {
            color[] = {0.35, 1, 0.5};
        };
    };

    class GVAR(Chemlight_Blue): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Blue)";

        class LightParams : LightParams {
            color[] = {0.15, 0.25, 1};
        };
    };

    class GVAR(Chemlight_Cyan): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Cyan)";

        class LightParams : LightParams {
            color[] = {0.25, 0.8, 1};
        };
    };

    class GVAR(Chemlight_Purple): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Purple)";

        class LightParams : LightParams {
            color[] = {0.6, 0.25, 1};
        };
    };

    class GVAR(Chemlight_Orange): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Orange)";

        class LightParams : LightParams {
            color[] = {1, 0.64, 0};
        };
    };

    class GVAR(Chemlight_Yellow): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Yellow)";

        class LightParams : LightParams {
            color[] = {1, 0.8, 0.25};
        };
    };

    class GVAR(Chemlight_White): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (White)";

        class LightParams : LightParams {
            color[] = {1, 1, 1};
        };
    };

    class GVAR(Chemlight_WarmWhite): GVAR(Chemlight_Base) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Warm White)";

        class LightParams : LightParams {
            color[] = {1, 0.65, 0.5};
        };
    };

    // With-flare variants
    class GVAR(Chemlight_Red_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Red, lens flare)";

        class LightParams : LightParams {
            color[] = {1, 0.08, 0.16};
        };
    };

    class GVAR(Chemlight_Green_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Green, lens flare)";

        class LightParams : LightParams {
            color[] = {0.35, 1, 0.5};
        };
    };

    class GVAR(Chemlight_Blue_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Blue, lens flare)";

        class LightParams : LightParams {
            color[] = {0.15, 0.25, 1};
        };
    };

    class GVAR(Chemlight_Cyan_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Cyan, lens flare)";

        class LightParams : LightParams {
            color[] = {0.25, 0.8, 1};
        };
    };

    class GVAR(Chemlight_Purple_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Purple, lens flare)";

        class LightParams : LightParams {
            color[] = {0.6, 0.25, 1};
        };
    };

    class GVAR(Chemlight_Orange_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Orange, lens flare)";

        class LightParams : LightParams {
            color[] = {1, 0.64, 0};
        };
    };

    class GVAR(Chemlight_Yellow_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Yellow, lens flare)";

        class LightParams : LightParams {
            color[] = {1, 0.8, 0.25};
        };
    };

    class GVAR(Chemlight_White_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (White, lens flare)";

        class LightParams : LightParams {
            color[] = {1, 1, 1};
        };
    };

    class GVAR(Chemlight_WarmWhite_Flare): GVAR(Chemlight_Base_Flare) {
        scope = 1; // Deliberately not Zeus-visible
        displayName = "Chemlight (Warm White, lens flare)";

        class LightParams : LightParams {
            color[] = {1, 0.65, 0.5};
        };
    };

    class Land_PaperBox_01_small_closed_white_med_F;
    class A3AU_moneyCrate_small_01 : Land_PaperBox_01_small_closed_white_med_F {
        displayName = "Money Crate (Small)";
        author = AUTHOR;
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { QPATHTOFOLDER(Pictures\items\PaperBox_01_small_money_CO.paa) };
    };
};
