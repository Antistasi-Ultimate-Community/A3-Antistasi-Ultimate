class Params
{
    /* * If adding a new section, you need to add

        class XXXParams
        {
            type = "XXX";
        };

        * params need to inherit from that class,
        * and you need to add the type string to A3A/addons/gui/functions/SetupGUI/fn_setupParamsTab.sqf

        * Example:

        class SuperDuperCoolParams
        {
            type = "SuperDuperCool";
        };
        class Spacer102: SuperDuperCoolParams
        {
            title = $STR_SuperDuperCool_params_name;
            values[] = {""};
            texts[] = {""};
            default = "";
        };
        class aReallyCoolParam: SuperDuperCoolParams
        {
            title = $STR_SuperDuperCool_new_param;
            values[] = {0, 69, 420};
            texts[] = {"0","69","420"};
            default = 69;
        };

        * and in A3A/addons/gui/functions/SetupGUI/fn_setupParamsTab.sqf (case ("update")):

        private _shownTypes = switch (lbCurSel A3A_IDC_SETUP_PARAMSTYPE) do {
            case (-1): { [] }; // lbCurSel is -1 until params tab is loaded
            case (0): { ["Basic"] };
            case (1): { ["Ultimate", "Script", "Plus", "Member", "Builder", "Balance", "Equipment", "Loot", "SuperDuperCool"] }; // Generally, new sections can probably be added here to show up as a section under "Advanced Params"
            case (2): { ["Experimental"] };
            case (3): { ["Development"] };
        };

        * if you want your section to show up as an entirely new option in the Parameter Types Dropdown ComboBox,
        * you'll need to add the type to the dropdown under case ("onLoad") like: 

        // * Populate the Parameter Type Dropdown
        private _basicParamsIndex =  _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_basic_label");
        private _advParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_adv_label");
        private _expParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_exp_label");
        private _devParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_dev_label");
        private _sdcParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_sdc_label"); // give it a text value here

        _paramsType lbSetValue [_basicParamsIndex, 0];
        _paramsType lbSetValue [_advParamsIndex, 1];
        _paramsType lbSetValue [_expParamsIndex, 2];
        _paramsType lbSetValue [_devParamsIndex, 3];
        _paramsType lbSetValue [_sdcParamsIndex, 4]; // and give it an integer value here

        _paramsType lbSetCurSel _basicParamsIndex;

        * and then add a new case with the above integer value in the _shownTypes switch like:

        private _shownTypes = switch (lbCurSel A3A_IDC_SETUP_PARAMSTYPE) do {
            ...
            case (4): { ["SuperDuperCool"] };
        };

    */

    class BasicParams
    {
        type = "Basic";
    };
    class gameMode: BasicParams
    {
        title = $STR_params_game_mode_title;
        values[] = {1,2,3};
        texts[] = {$STR_params_game_mode_1,$STR_params_game_mode_2,$STR_params_game_mode_3};
        default = 1;
    };
    class areRivalsEnabled: BasicParams
    {
        title = $STR_params_areRivalsEnabled;
        values[] = {0,1};
        texts[] = {$STR_params_areRivalsEnabled_0, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class autoSave: BasicParams
    {
        title = $STR_params_autosave_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class autoSaveInterval: BasicParams
    {
        title = $STR_params_time_between_autosave_title;
        values[] = {600,1200,1800,3600,5400};
        texts[] = {"10","20","30","60","90"};
        default = 3600;
    };
    class playerMarkersEnabled: BasicParams
    {
        title = $STR_params_server_friendlymarkers_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class limitedFT: BasicParams
    {
        title = $STR_params_allowFT;
        values[] = {0,1,2,3};
        texts[] = {$STR_params_allowFT_0, $STR_params_allowFT_1, $STR_params_allowFT_2, $STR_params_civ_traffic_none};
        default = 0;
    };
    class civTraffic: BasicParams
    {
        title = $STR_params_civ_traffic;
        values[] = {0,1,2,4};
        texts[] = {$STR_params_civ_traffic_none,$STR_params_civ_traffic_low,$STR_params_civ_traffic_medium,$STR_params_civ_traffic_high};
        default = 2;
    };
    class A3A_removeRestore: BasicParams
    {
        title = $STR_A3A_Params_removeRestore_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class globalCivilianMax: BasicParams
    {
        title = $STR_params_global_civilian_max;
        values[] = {0,2,5,10,15,20,25,30};
        texts[] = {"0","2","5","10","15","20","25","30"};
        default = 5;
    };
    class maxCiviliansPerTown: BasicParams
    {
        title = $STR_params_civ_per_town;
        values[] = {0,2,5,10,15};
        texts[] = {"0","2","5","10","15"};
        default = 2;
    };
    class distanceMission: BasicParams
    {
        title = $STR_params_distanceMission;
        values[] = {2000,3000,4000,6000,8000,10000,12000};
        texts[] = {"2000","3000","4000","6000","8000","10000","12000"};
        default = 3000;
    };
    class distanceSPWN: BasicParams
    {
        title = $STR_params_spawnDistance;
        values[] = {700,800,900,1000,1100,1200,1300,1400,1500};
        texts[] = {"700","800","900","1000","1100","1200", "1300" ,"1400", "1500"};
        default = 1100;
    };
    class enemyNearDistance: BasicParams
    {
        title = $STR_params_enemyCheckDistance;
        values[] = {100,200,300,400,500};
        texts[] = {"100","200","300","400","500"};
        default = 300;
    };
    class initialPlayerMoney: BasicParams
    {
        title = $STR_params_playerStartingMoney;
        values[] = {0, 100, 200, 500, 1000, 2500};
        texts[] = {"0", "100", "200", "500","1000","2500"};
        default = 500;
    };
    class initialFactionMoney: BasicParams
    {
        title = $STR_params_rebelFactionStartingMoney;
        values[] = {0,1000,2500,5000,10000};
        texts[] = {"0","1000","2500","5000","10000"};
        default = 1000;
    };
    class initialHr: BasicParams
    {
        title = $STR_params_initialHr;
        values[] = {0, 8, 16, 24, 32, 50};
        texts[] = {"0","8","16","24","32","50"};
        default = 8;
    };
    class limitHR: BasicParams
    {
        title = $STR_params_enable_HR_cap;
        values[] = {0,25,50,75,100,200};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,"x0.25","x0.5","x0.75","x1.0","x2.0"};
        default = 0;
    };
    class A3A_idleTimeout: BasicParams
    {
        title = $STR_params_afk;
        values[] = {120,300,900,1800,9999999};
        texts[] = {"2","5","15","30", $STR_params_afk_disabled};
        default = 300;
    };
    class A3A_GCThreshold: BasicParams
    {
        title = $STR_params_gc_threshold;
        values[] = {3600, 7200, 10800, 14400, 9999999};
        texts[] = {"1", "2", "3", "4", $STR_params_afk_disabled};
        Default = 9999999;
    };
    class A3A_reviveTime: BasicParams
    {
        title = $STR_params_revive_time;
        values[] = {8,12,16,24,32};
        texts[] = {"8","12","16","24","32"};
        default = 16;
    };
    class A3A_selfReviveMethods: BasicParams
    {
        title = $STR_A3A_Params_selfReviveMethods_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_A3A_Params_selfReviveMethods_withstand};
        default = 0;
    };

    class UltimateParams
    {
        type = "Ultimate";
    };
    class Spacer102: UltimateParams
    {
        title = $STR_A3AU_params_name;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class victoryCondition: UltimateParams
    {
        title = $STR_A3AU_victory_condition;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_A3AU_normal_victory,$STR_A3AU_total_victory,$STR_A3AU_economic_victory,$STR_A3AU_logistical_victory,$STR_A3AU_political_victory};
        default = 0;
    };
    class lossCondition: UltimateParams
    {
        title = $STR_A3AU_loss_condition;
        values[] = {0,1,2,3};
        texts[] = {$STR_A3AU_loss_condition_pop_death,$STR_A3AU_loss_condition_hr,$STR_A3AU_loss_condition_money,$STR_A3AU_loss_condition_all};
        default = 0;
    };
    class loseHROnDeath: UltimateParams
    {
        title = $STR_A3AU_hr_loss;
        values[] = {0,1,2};
        texts[] = {$STR_A3AU_no_hr_loss,$STR_A3AU_yes_hr_loss,$STR_A3AU_yes_hr_loss_w_msg};
        default = 0;
    };
    class cosmeticsEnabled: UltimateParams
    {
        title = $STR_A3AU_cosmetics;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class playerRecruitAI: UltimateParams
    {
        title = $STR_params_playerRecruitAI;
        values[] = {1,0};
        texts[] = {$STR_params_afk_enabled, $STR_params_afk_disabled};
        default = 1;
    };
    class enablePunishments: UltimateParams
    {
        title = $STR_params_enablePunishments;
        values[] = {1,0};
        texts[] = {$STR_params_afk_enabled, $STR_params_afk_disabled};
        default = 1;
    };
    class zombiesUncapped: UltimateParams
    {
        title = $STR_A3AU_uncap_zombie_spawn;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class plusGarrison: UltimateParams
    {
        title = $STR_A3AU_old_garrison_spawn;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class vanillaArmsDealer: UltimateParams
    {
        title = $STR_A3AU_vanilla_weapons_in_arms_dealer;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class radiomanSupport: UltimateParams
    {
        title = $STR_A3AU_radioman_support;
        values[] = {0,1};
        texts[] = {$STR_A3AU_dialogs_radioman_support,$STR_A3AU_dialogs_squadleader_support};
        default = 0;
    };
    class hideEnemyMarkers: UltimateParams
    {
        title = $STR_A3AU_hide_enemy_markers;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class hideEnemyMarkersReconPlaneDistance: UltimateParams
    {
        title = $STR_A3AU_hide_enemy_markers_recon_plane_distance;
        values[] = {100, 300, 500, 1000, 1500, 2000};
        texts[] = {"100", "300", "500", "1000", "1500", "2000"};
        default = 500;
    };
    class blackMarketIgnoreRequirements: UltimateParams
    {
        title = $STR_A3AU_blackmarket_ignore_requirements;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class useDownedNotification: UltimateParams
    {
        title = $STR_A3AU_use_downed_notification;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class disableTrader: UltimateParams
    {
        title = $STR_A3AU_disable_trader;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class staminaEnabled: UltimateParams
    {
        title = $STR_A3AU_stamina_enabled;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class fatigueEnabled: UltimateParams
    {
        title = $STR_A3AU_fatigue_enabled;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class swayEnabled: UltimateParams
    {
        title = $STR_A3AU_sway_enabled;
        values[] = {0,25,50,75,100};
        texts[] = {"0%","25%","50%","75%","100%"};
        default = 100;
    };
    
    class ScriptParams
    {
        type = "Script";
    };
    class Spacer67: ScriptParams
    {
        title = $STR_params_antistasi_scripts;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class magRepack: ScriptParams
    {
        title = $STR_params_magRepack;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class RRTurretMagazines: ScriptParams
    {
        title = $STR_params_ReloadRepackTurretMagazines;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };

    class PlusParams
    {
        type = "Plus";
    };
    class Spacer51: PlusParams
    {
        title = $STR_params_antistasi_plus;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class newCarTowing: PlusParams
    {
        title = $STR_params_newCarTowing;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class lootCratesEnabled: PlusParams
    {
        title = $STR_params_lootCrateHeli;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class lootCrateDistance: PlusParams
    {
        title = $STR_params_lootCrateDistance;
        values[] = {10, 25, 50, 75, 100, 200, 300, 400};
        texts[] = {"10", "25", "50", "75", "100", "200", "300", "400"};
        default = 50;
    };
    class lootCratePrice: PlusParams
    {
        title = $STR_params_lootCratePrice;
        values[] = {100, 200, 300, 400, 500};
        texts[] = {"100", "200", "300", "400", "500"};
        default = 100;
    };
    class lootCrateUnlockedItems: PlusParams
    {
        title = $STR_params_lootCrateUnlockedItems;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class playerIcons: PlusParams
    {
        title = $STR_params_playerIcons;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class settingsTimeMultiplier: PlusParams
    {
        title = $STR_params_timeMultiplier;
        values[] = {1, 2, 3, 4, 6, 8, 12, 24};
        texts[] = {$STR_params_timeMultiplier_0, $STR_params_timeMultiplier_1, $STR_params_timeMultiplier_2,$STR_params_timeMultiplier_3,$STR_params_timeMultiplier_4,$STR_params_timeMultiplier_5,$STR_params_timeMultiplier_6,$STR_params_timeMultiplier_7};
        default = 1;
    };
    class unflipPersonCount: PlusParams
    {
        title = $STR_params_unflipPersonCount;
        values[] = {1, 2, 3, 4};
        texts[] = {"1","2","3","4"};
        default = 3;
    };
    class fastTravelEnemyCheck: PlusParams
    {
        title = $STR_params_fastTravelEnemyCheck;
        values[] = {0,1};
        texts[] = {$STR_params_fastTravelEnemyCheck_player, $STR_params_fastTravelEnemyCheck_team};
        default = 0;
    };
    class rallyPointSpawnCount: PlusParams
    {
        title = $STR_params_rallyPointSpawnCount;
        values[] = {3, 5, 10, 15, 20, 30, 0};
        texts[] = {"3", "5", "10", "15", "20", "30", $STR_params_afk_disabled};
        default = 10;
    };
    class aiControlTime: PlusParams
    {
        title = $STR_params_aiControlTime;
        values[] = {30, 60, 90, 120};
        texts[] = {"30", "60", "90", "120"};
        default = 60;
    };
    class deathPenalty: PlusParams
    {
        title = $STR_params_deathPenalty;
        values[] = {15, 30, 50, 75, 100};
        texts[] = {"15%", "30%", "50%", "75%", "100%"};
        default = 30;
    };
    class saveZeusBuildings: PlusParams
    {
        title = $STR_params_saveZeusBuildings;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class maxConstructions: PlusParams
    {
        title = $STR_params_maxConstructions;
        values[] = {0,50,100,250,300};
        texts[] = {"0","50","100","250","300"};
        default = 100;
    };
    class maxSupportPoints: PlusParams
    {
        title = $STR_params_maxSupportPoints;
        values[] = {1,2,3,4,5,6};
        texts[] = {"1","2","3","4","5","6"};
        default = 3;
    };
    class areRandomEventsEnabled: PlusParams
    {
        attr[] = {"server"};
        title = $STR_params_randomEvents;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class rivalsDifficulty: PlusParams
    {
        title = $STR_params_server_riv_difficulty;
        values[] = {1,2,3};
        texts[] = {$STR_params_server_riv_difficulty_easy, $STR_params_server_riv_difficulty_medium, $STR_params_server_riv_difficulty_hard};
        default = 2;
    };
    
    class MemberParams
    {
        type = "Member";
    };
    class TitleMembership: MemberParams
    {
        title = $STR_params_membership_header;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class membershipEnabled: MemberParams
    {
        title = $STR_params_server_membership_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class A3A_guestCommander: MemberParams
    {
        title = $STR_params_guestCommander;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class tkPunish: MemberParams
    {
        title = $STR_params_server_teamkill_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class disableAutoSmokeCover: MemberParams
    {
        title = $STR_params_disableAutoSmokeCover;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };

    class BuilderParams
    {
        type = "Builder";
    };
    class TitleBuilder: BuilderParams
    {
        title = $STR_params_builder_header;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class A3A_builderPermissions: BuilderParams
    {
        title = $STR_params_builderPermissions;
        values[] = {1, 2, 3};
        texts[] = {"Team leaders", "Engineers", "Both"};
        default = 3;
    };
    class A3A_builderLimit: BuilderParams
    {
        title = $STR_params_builderLimit;
        values[] = {100, 200, 300, 400, 500, 600, 800, 900, 1000, 999999};
        texts[] = {"100", "200", "300", "400", "500", "600", "800", "900", "1000", "Basically Infinite"};
        default = 300;
    };
    class A3A_builderBuildTime: BuilderParams
    {
        title = $STR_params_builderBuildTime;
        values[] = {0, 4, 5, 6, 7, 8, 9, 10};
        texts[] = {"DEBUG (Instant)", "0.4x", "0.5x", "0.6x", "0.7x", "0.8x", "0.9x", "1.0x"};
        default = 5;
    };
    class A3A_builderAllowRoads: BuilderParams
    {
        title = $STR_params_builderAllowRoads;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };

    class ExperimentalParams
    {
        type = "Experimental";
    };
    class enableSpectrumDevice: ExperimentalParams
    {
        title = $STR_params_enableSpectrumDevice;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class unconsciousPossessAi: ExperimentalParams
    {
        title = $STR_params_unconsciousAiPossess;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class allowFuturisticSupports: ExperimentalParams
    {
        attr[] = {"server"};
        title = $STR_params_allowFuturisticSupports;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class allowFuturisticUnfairSupports: ExperimentalParams
    {
        attr[] = {"server"};
        title = $STR_params_allowFuturisticUnfairSupports;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class recruitToPlayerSquad: ExperimentalParams
    {
        title = $STR_params_recruitToPlayerSquad;
        values[] = {0,1};
        texts[] = {$STR_params_afk_disabled, $STR_params_afk_enabled};
        default = 0;
    };

    class BalanceParams
    {
        type = "Balance";
    };
    class TitleBalance: BalanceParams
    {
        title = $STR_params_balance_header;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class A3A_enemyBalanceMul: BalanceParams
    {
        title = $STR_params_overall_enemy_res_balance;
        values[] = {4,6,8,10,11,12,13,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.1x", "1.2x","1.3x", "1.4x","1.7x","2.0x","2.4x","2.8x"};
        default = 11;
    };
    class A3A_enemyAttackMul: BalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_response_balance;
        values[] = {4,6,8,10,12,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.2x","1.4x","1.7x","2.0x","2.4x","2.8x"};
        default = 10;
    };
    class A3A_invaderBalanceMul: BalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_resource_balance_inv;
        values[] = {10,11,12,13,14,15,16,17,18,19,20};
        texts[] =  {"1.0x","1.1x","1.2x","1.3x","1.4x","1.5x","1.6x","1.7x","1.8x","1.9x","2.0x"};
        default = 12;
    };
    class A3A_enemyResponseTime: BalanceParams
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_enemyResponseTime_title;
        values[] = {20,15,10,7,5};
        texts[] =  {$STR_A3A_Params_generic_veryslow, $STR_A3A_Params_generic_slow, $STR_A3A_Params_generic_normal, $STR_A3A_Params_generic_fast, $STR_A3A_Params_generic_veryfast};
        default = 10;
    };
    class A3A_attackHQProximityMul: BalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_enemyPref;
        values[] = {1,2,3,5,8};
        texts[] =  {$STR_params_enemyPref_nc,"2x","3x","5x","8x"};
        default = 3;
    };
    class A3A_enemySkillMul: BalanceParams
    {
        title = $STR_params_A3A_enemySkillMul;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_params_A3A_enemySkillMul_veasy,$STR_params_A3A_enemySkillMul_easy,$STR_params_A3A_enemySkillMul_medium,$STR_params_A3A_enemySkillMul_hard,$STR_params_A3A_enemySkillMul_vhard};
        default = 2;
    };
    class A3A_rebelSkillMul: BalanceParams
    {
        title = $STR_params_A3A_rebelSkillMul;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_params_A3A_enemySkillMul_veasy,$STR_params_A3A_enemySkillMul_easy,$STR_params_A3A_enemySkillMul_medium,$STR_params_A3A_enemySkillMul_hard,$STR_params_A3A_enemySkillMul_vhard};
        default = 2;
    };
    class aiAccuracyCeiling: BalanceParams
    {
        title = $STR_params_aiAccuracyCeiling;
        values[] = {10, 20, 30, 40, 45, 50, 60, 70, 80, 90, 100};
        texts[] = {"0.1", "0.2", "0.3", "0.4", "0.45", "0.5", "0.6", "0.7", "0.8", "0.9", "1"};
        default = 45;
    };
    class napalmEnabled: BalanceParams
    {
        title = $STR_params_napalmEnabled;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class allowUnfairSupports: BalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_allowUnfairSupports;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class A3A_rebelGarrisonLimit: BalanceParams
    {
        title = $STR_params_rebelGarrisonLimit;
        tooltip = $STR_params_rebelGarrisonLimit_desc;
        values[] = {-1, 16, 24, 32};
        texts[] = {"No limit", "16", "24", "32"};
        default = 24;
    };
    
    class EquipmentParams
    {
        type = "Equipment";
    };
    class TitleEquipment: EquipmentParams
    {
        title = $STR_params_equipment_header;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class minWeaps: EquipmentParams
    {
        title = $STR_params_server_unlock_threshold;
        values[] = {10,15,20,25,30,35,40,45,50,100,200,500,-1};
        texts[] = {"10","15","20","25","30","35","40","45","50","100","200","500",$STR_params_server_unlock_no_unlocks};
        default = 25;
    };
    class A3A_guestItemLimit: EquipmentParams
    {
        title = $STR_params_A3A_guestItemLimit;
        values[] = {0,10,15,25,40};
        texts[] = {$STR_params_A3A_no_limit,"10","15","25","40"};
        default = 25;
    };
    class unlockedUnlimitedAmmo: EquipmentParams
    {
        attr[] = {"server"};
        title = $STR_params_unlockedUnlimitedAmmo;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text, $STR_antistasi_dialogs_generic_button_no_text};
        default = 0;
    };
    class allowGuidedLaunchers: EquipmentParams
    {
        attr[] = {"server"};
        title = $STR_params_allowGuidedLaunchers;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text, $STR_antistasi_dialogs_generic_button_no_text};
        default = 1;
    };
    class allowUnlockedExplosives: EquipmentParams
    {
        attr[] = {"server"};
        title = $STR_params_allowUnlockedExplosives;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text,$STR_antistasi_dialogs_generic_button_no_text};
        default = 0;
    };
    class startWithLongRangeRadio: EquipmentParams
    {
        attr[] = {"server"};
        title = $STR_params_startWithLongRangeRadio;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class aceFood: EquipmentParams
    {
        attr[] = {"server"};
        title = $STR_params_aceFood;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class helmetLossChance: EquipmentParams
    {
        title = $STR_params_helmetLossChance;
        values[] = {0,33,66,100};
        texts[] = {$STR_params_helmetLossChance_0,$STR_params_helmetLossChance_1,$STR_params_helmetLossChance_2,$STR_params_helmetLossChance_3};
        default = 33;
    };
    class helmetLossSound: EquipmentParams
    {
        title = $STR_params_helmetLossSound;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class reviveKitsEnabled: EquipmentParams
    {
        title = $STR_params_reviveKitsEnabled;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };

    class LootParams
    {
        type = "Loot";
    };
    class TitleLoot: LootParams
    {
        title = $STR_params_TitleLoot;
        values[] = {""};
        texts[] = {""};
        default = "";
    };
    class crateWepTypeMax: LootParams
    {
        title = $STR_params_crateWepTypeMax;
        values[] = {0,2,4,6,8,12,16};
        texts[] = {"1","3","5","7","9","13","17"};
        default = 8;
    };
    class crateWepNumMax: LootParams
    {
        title = $STR_params_crateWepNumMax;
        values[] = {0,1,3,5,8,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","8","10","15"};
        default = 8;
    };
    class crateItemTypeMax: LootParams
    {
        title = $STR_params_crateItemTypeMax;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateItemNumMax: LootParams
    {
        title = $STR_params_crateItemNumMax;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        default = 5;
    };
    class crateAmmoTypeMax: LootParams
    {
        title = $STR_params_crateAmmoTypeMax;
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAmmoNumMax: LootParams
    {
        title = $STR_params_crateAmmoNumMax;
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15","20","25","30"};
        default = 20;
    };
    class crateExplosiveTypeMax: LootParams
    {
        title = $STR_params_crateExplosiveTypeMax;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateExplosiveNumMax: LootParams
    {
        title = $STR_params_crateExplosiveNumMax;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        default = 5;
    };
    class crateAttachmentTypeMax: LootParams
    {
        title = $STR_params_crateAttachmentTypeMax;
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAttachmentNumMax: LootParams
    {
        title = $STR_params_crateAttachmentNumMax;
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15","20","25","30"};
        default = 15;
    };
    class crateBackpackTypeMax: LootParams
    {
        title = $STR_params_crateBackpackTypeMax;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateBackpackNumMax: LootParams
    {
        title = $STR_params_crateBackpackNumMax;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        default = 3;
    };
    class crateVestTypeMax: LootParams
    {
        title = $STR_params_crateVestTypeMax;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateVestNumMax: LootParams
    {
        title = $STR_params_crateVestNumMax;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        default = 3;
    };
    class crateHelmetTypeMax: LootParams
    {
        title = $STR_params_crateHelmetTypeMax;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateHelmetNumMax: LootParams
    {
        title = $STR_params_crateHelmetNumMax;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        default = 3;
    };
    class crateDeviceTypeMax: LootParams
    {
        title = $STR_params_crateDeviceTypeMax;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 2;
    };
    class crateDeviceNumMax: LootParams
    {
        title = $STR_params_crateDeviceNumMax;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        default = 3;
    };

    class DevelopmentParams
    {
        type = "Development";
    };
    class LogLevel: DevelopmentParams
    {
        title = $STR_params_LogLevel;
        values[] = {1,2,3,4};
        texts[] = {"Error", "Info", "Debug", "Verbose"};
        default = 2;
    };
    class A3A_logDebugConsole: DevelopmentParams
    {
        title = $STR_params_A3A_logDebugConsole;
        values[] = {-1,1,2};
        texts[] = {$STR_params_A3A_logDebugConsole_none, $STR_params_A3A_logDebugConsole_allnondev, $STR_params_A3A_logDebugConsole_all};
        default = 1;
    };
    class A3A_GUIDevPreview: DevelopmentParams
    {
        title = $STR_params_A3A_GUIDevPreview;
        values[] = {0};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text};
        default = 0;
    };
};
