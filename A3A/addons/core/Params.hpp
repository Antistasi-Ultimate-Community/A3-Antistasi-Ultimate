class Params
{
    /* 
        * Parameter class structure and guidelines:
        
        class ParamClass : ParentClass // all fields are required unless specified otherwise
        {
            type = "TypeString"; // Used to group parameters in the GUI. Required for section titles, can be inherited for actual parameters.
            title = $STR_params_name; // stringtable entry for the parameter or section name
            tooltip = $STR_params_name_desc; // stringtable entry for the parameter tooltip (optional)
            values[] = {0,1,2,3}; // integer values for the actual parameter value. If values is {0,1} they will be converted to boolean when loading the save.
            texts[] = {}; // string values for the parameter options, shown in the setup GUI dropdown
            default = 0; // default integer value for the parameter
            lockOnSave = 0; // Set to 1 if parameter should not be changeable after saving a game (optional, default 0)
            lockInGame = 0; // Set to 1 if parameter value should not be changeable while in-game (optional, default 0)
            lockCondition = "false;"; // SQF code run while setup GUI is open that returns true/false to determine if the parameter should be changeable (optional, default "false;" (meaning, not locked))
            lockConditionTooltip = $STR_antistasi_dialogs_setup_param_locked_bycondition; // stringtable entry for the tooltip to show when the parameter is locked by the lockCondition (optional)
            class dependencies // this block is used to define which other parameters depend on this one, and what values they should take when this parameter is set to a certain value (optional)
            {
                class AnotherParameterName // the name of the parameter this one affects (must match the class name in this file){
                {
                    value = -1; // the value of this parameter that triggers the dependency (required if using this block)
                    dependentValue = 0; // the value to set the dependent parameter to when this parameter is set to 'value' (optional, default nil)
                    lockedByDependency = 1; // set to 1 if the dependent parameter should be locked when this dependency is active (optional, default 0)
                    dependencyTooltip = $STR_antistasi_dialogs_setup_param_locked_bydependency; // stringtable entry for the tooltip to show when the dependent parameter is locked by this dependency (optional)
                };
            };
            class difficulty // this block is used to define different default values based on desired difficulty and amount of players (optional)
            {
                class solo // settings for solo players
                {
                    easy = 0; // default value for easy difficulty
                    medium = 1; // default value for medium difficulty
                    hard = 1; // default value for hard difficulty
                };
                class small : solo {}; // settings for small player counts. In this case it inherits the same values from the 'solo' class, but it can have its own defined
                class medium : solo {}; // settings for medium player counts
                class large // settings for large player counts. In this case it has its own defined values
                {
                    easy = 1;
                    medium = 1;
                    hard = 2;
                };
            };
        };
    
        * If adding a new section, you need to add

        class XXXParams : AllParams
        {
            type = "XXX";
        };

        * params need to inherit from that class,
        * and you need to add the type string to A3A/addons/gui/functions/SetupGUI/fn_setupParamsTab.sqf

        * Example:

        class SuperDuperCoolParams : AllParams
        {
            type = "SuperDuperCool";
        };
        class Spacer102: SuperDuperCoolParams
        {
            title = $STR_SuperDuperCool_params_name;
            values[] = {};
            texts[] = {};
            default = 0;
        };
        class aReallyCoolParam: SuperDuperCoolParams
        {
            title = $STR_SuperDuperCool_new_param;
            tooltip = $STR_SuperDuperCool_new_param_desc;
            values[] = {0, 69, 420};
            texts[] = {"0","69","420"};
            default = 69;
            lockOnSave = 0; // Set to 1 if parameter should not be changeable after saving a game
            lockInGame = 0; // Set to 1 if parameter value should not be changeable while in-game
        };

        * and in A3A/addons/gui/functions/SetupGUI/fn_setupParamsTab.sqf (case ("update")):

        private _shownTypes = switch (lbCurSel A3A_IDC_SETUP_PARAMSTYPE) do {
            case (-1): { [] }; // lbCurSel is -1 until params tab is loaded
            case (0): { ["Basic", "Scenario", "Member", "Script", "Timer"] };
            case (1): { ["AI", "Balance", "RebelBalance", "AIBalance", "MiscBalance"] };
            case (2): { ["BlackMarket", "Loot", "Unlocks", "Crates", "VehicleLoot", "MiscLoot"] };
            case (3): { ["Builder"] };
            case (4): { ["Extender", "Experimental", "Development"] };
        };

        * if you want your section to show up as an entirely new option in the Parameter Types Dropdown ComboBox,
        * you'll need to add the type to the dropdown under case ("onLoad") like: 

        // * Populate the Parameter Type Dropdown
        private _basicParamsIndex =  _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_basic_label");
        private _balParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_bal_label");
        private _eqpParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_eqp_label");
        private _bldParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_bld_label");
        private _devParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_dev_label");
        private _sdcParamsIndex = _paramsType lbAdd (localize "STR_antistasi_dialogs_setup_params_sdc_label"); // give it a text value here

        _paramsType lbSetValue [_basicParamsIndex, 0];
        _paramsType lbSetValue [_balParamsIndex, 1];
        _paramsType lbSetValue [_eqpParamsIndex, 2];
        _paramsType lbSetValue [_bldParamsIndex, 3];
        _paramsType lbSetValue [_devParamsIndex, 4];
        _paramsType lbSetValue [_sdcParamsIndex, 5]; // and give it an integer value here
        
        _paramsType lbSetCurSel _basicParamsIndex;

        * and then add a new case with the above integer value in the _shownTypes switch like:

        private _shownTypes = switch (lbCurSel A3A_IDC_SETUP_PARAMSTYPE) do {
            ...
            case (5): { ["SuperDuperCool"] };
        };

    */

    class AllParams
    {
        lockOnSave = 0;
        lockInGame = 0;
        lockCondition = "false;";
        lockedByDependency = 0;
        class dependencies {};
    };

    class BasicParams : AllParams
    {
        type = "Basic";
    };
    class ScenarioParams : BasicParams
    {
        type = "Scenario";
        title = $STR_params_scenarioParams;
        //tooltip = $STR_params_scenarioParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class gameMode: ScenarioParams
    {
        title = $STR_params_game_mode_title;
        tooltip = $STR_params_game_mode_desc;
        values[] = {1,2,3};
        texts[] = {$STR_params_game_mode_1,$STR_params_game_mode_2,$STR_params_game_mode_3};
        default = 1;
        lockOnSave = 1;
        lockInGame = 1;
        class dependencies
        {
            class areRivalsEnabled
            {
                value = 3;
                dependentValue = 0;
                lockedByDependency = 0;
            };
        };
    };
    class areRivalsEnabled: ScenarioParams
    {
        title = $STR_params_areRivalsEnabled;
        tooltip = $STR_params_areRivalsEnabled_desc;
        values[] = {0,1};
        texts[] = {$STR_params_areRivalsEnabled_0, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
        lockOnSave = 1;
        class dependencies
        {
            class rivalsDifficulty
            {
                value = 0;
                lockedByDependency = 1;
            };
        };
    };
    class rivalsDifficulty: ScenarioParams
    {
        title = $STR_params_server_riv_difficulty;
        tooltip = $STR_params_server_riv_difficulty_desc;
        values[] = {1,2,3};
        texts[] = {$STR_params_server_riv_difficulty_easy, $STR_params_server_riv_difficulty_medium, $STR_params_server_riv_difficulty_hard};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 2;
                hard = 3;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 2;
    };
    class victoryCondition: ScenarioParams
    {
        title = $STR_A3AU_victory_condition;
        tooltip = $STR_A3AU_victory_condition_desc;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_A3AU_normal_victory,$STR_A3AU_total_victory,$STR_A3AU_economic_victory,$STR_A3AU_logistical_victory,$STR_A3AU_political_victory};
        class difficulty
        {
            class solo
            {
                easy = 4;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class lossCondition: ScenarioParams
    {
        title = $STR_A3AU_loss_condition;
        tooltip = $STR_A3AU_loss_condition_desc;
        values[] = {0,1,2,3};
        texts[] = {$STR_A3AU_loss_condition_pop_death,$STR_A3AU_loss_condition_hr,$STR_A3AU_loss_condition_money,$STR_A3AU_loss_condition_all};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 3;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
        lockOnSave = 1;
    };
    class areRandomEventsEnabled: ScenarioParams
    {
        attr[] = {"server"};
        title = $STR_params_randomEvents;
        tooltip = $STR_params_randomEvents_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class createAmbientSounds: ScenarioParams
    {
        title = $STR_A3AU_ambient_sounds;
        tooltip = $STR_A3AU_ambient_sounds;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class MemberParamsSpacer : BasicParams
    {
        type = "Member";
    };
    class MemberParams : BasicParams
    {
        type = "Member";
        title = $STR_params_member;
        //tooltip = $STR_params_member_desc;
        values[] = {};
        texts[] = {};
        default = 0;
        lockInGame = 1;
    };
    class membershipEnabled: MemberParams
    {
        title = $STR_params_server_membership_title;
        tooltip = $STR_params_server_membership_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 1;
    };
    class A3A_guestCommander: MemberParams
    {
        title = $STR_params_guestCommander;
        tooltip = $STR_params_guestCommander_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class tkPunish: MemberParams
    {
        title = $STR_params_server_teamkill_title;
        tooltip = $STR_params_server_teamkill_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
    };
    class ScriptParamsSpacer : BasicParams
    {
        type = "Script";
    };
    class ScriptParams : BasicParams
    {
        type = "Script";
        title = $STR_params_scriptParams;
        //tooltip = $STR_params_scriptParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class magRepack: ScriptParams
    {
        title = $STR_params_magRepack;
        tooltip = $STR_params_magRepack_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
        lockInGame = 1;
    };
    class RRTurretMagazines: ScriptParams
    {
        title = $STR_params_ReloadRepackTurretMagazines;
        tooltip = $STR_params_ReloadRepackTurretMagazines_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        lockInGame = 1;
    };
    class newCarTowing: ScriptParams
    {
        title = $STR_params_newCarTowing;
        tooltip = $STR_params_newCarTowing_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class disableAutoSmokeCover: ScriptParams
    {
        title = $STR_params_disableAutoSmokeCover;
        tooltip = $STR_params_disableAutoSmokeCover_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        lockInGame = 1;
    };
    class TimerParamsSpacer : BasicParams
    {
        type = "Timer";
    };
    class TimerParams : BasicParams
    {
        type = "Timer";
        title = $STR_params_timerParams;
        //tooltip = $STR_params_timerParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class autoSave: TimerParams
    {
        title = $STR_params_autosave_title;
        tooltip = $STR_params_autosave_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
        class dependencies
        {
            class autoSaveInterval
            {
                value = 0;
                lockedByDependency = 1;
            };
        };
    };
    class autoSaveInterval: TimerParams
    {
        title = $STR_params_time_between_autosave_title;
        tooltip = $STR_params_time_between_autosave_desc;
        values[] = {600,1200,1800,3600,5400};
        texts[] = {"10","20","30","60","90"};
        default = 3600;
    };
    class A3A_idleTimeout: TimerParams
    {
        title = $STR_params_afk;
        tooltip = $STR_params_afk_desc;
        values[] = {120,300,900,1800,-1};
        texts[] = {"2","5","15","30", $STR_params_afk_disabled};
        class difficulty
        {
            class solo
            {
                easy = -1;
                medium = -1;
                hard = -1;
            };
            class small : solo {};
            class medium
            {
                easy = 900;
                medium = 300;
                hard = 120;
            };
            class large
            {
                easy = 300;
                medium = 120;
                hard = 120;
            };
        };
        default = 300;
        class dependencies
        {
            class A3A_isUAVAFK
            {
                value = -1;
                lockedByDependency = 1;
            };
            class A3A_isZeusAFK : A3A_isUAVAFK {};
        };
    };
    class A3A_isUAVAFK: TimerParams
    {
        title = $STR_params_afk_uav;
        tooltip = $STR_params_afk_uav_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 1;
    };
    class A3A_isZeusAFK: TimerParams
    {
        title = $STR_params_afk_zeus;
        tooltip = $STR_params_afk_zeus_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 1;
    };
    class A3A_GCThreshold: TimerParams
    {
        title = $STR_params_gc_threshold;
        tooltip = $STR_params_gc_threshold_desc;
        values[] = {3600, 7200, 10800, 14400, -1};
        texts[] = {"1", "2", "3", "4", $STR_params_afk_disabled};
        class difficulty
        {
            class solo
            {
                easy = -1;
                medium = -1;
                hard = -1;
            };
            class small
            {
                easy = 10800;
                medium = 10800;
                hard = 10800;
            };
            class medium
            {
                easy = 7200;
                medium = 7200;
                hard = 7200;
            };
            class large
            {
                easy = 3600;
                medium = 3600;
                hard = 3600;
            };
        };
        default = -1;
    };
    class settingsTimeMultiplier: TimerParams
    {
        title = $STR_params_timeMultiplier;
        tooltip = $STR_params_timeMultiplier_desc;
        values[] = {1, 2, 3, 4, 6, 8, 12, 24};
        texts[] = {$STR_params_timeMultiplier_0, $STR_params_timeMultiplier_1, $STR_params_timeMultiplier_2,$STR_params_timeMultiplier_3,$STR_params_timeMultiplier_4,$STR_params_timeMultiplier_5,$STR_params_timeMultiplier_6,$STR_params_timeMultiplier_7};
        default = 1;
        lockInGame = 1;
    };
    class BasicParamsSpacer : AllParams
    {
        type = "Basic";
    };

    class AIParamsSpacer : AllParams
    {
        type = "AI";
    };
    class AIParams : AllParams
    {
        type = "AI";
        title = $STR_params_ai;
        //tooltip = $STR_params_ai_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class distanceSPWN: AIParams
    {
        title = $STR_params_spawnDistance;
        tooltip = $STR_params_spawnDistance_desc;
        values[] = {700,800,900,1000,1100,1200,1300,1400,1500};
        texts[] = {"700","800","900","1000","1100","1200", "1300" ,"1400", "1500"};
        class difficulty
        {
            class solo
            {
                easy = 1500;
                medium = 1500;
                hard = 1500;
            };
            class small : solo {};
            class medium
            {
                easy = 1100;
                medium = 1100;
                hard = 1100;
            };
            class large : medium {};
        };
        default = 1100;
    };
    class enemyNearDistance: AIParams
    {
        title = $STR_params_enemyCheckDistance;
        tooltip = $STR_params_enemyCheckDistance_desc;
        values[] = {100,200,300,400,500};
        texts[] = {"100","200","300","400","500"};
        class difficulty
        {
            class solo
            {
                easy = 100;
                medium = 300;
                hard = 500;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 300;
    };
    class globalCivilianMax: AIParams
    {
        title = $STR_params_global_civilian_max;
        tooltip = $STR_params_global_civilian_max_desc;
        values[] = {0,2,5,10,15,20,25,30};
        texts[] = {"0","2","5","10","15","20","25","30"};
        default = 5;
        class dependencies
        {
            class maxCiviliansPerTown
            {
                value = 0;
                dependentValue = 0;
                lockedByDependency = 1;
            };
            class civTraffic : maxCiviliansPerTown {};
            class allowCivDialog : maxCiviliansPerTown {};
        };
    };
    class maxCiviliansPerTown: AIParams
    {
        title = $STR_params_civ_per_town;
        tooltip = $STR_params_civ_per_town_desc;
        values[] = {0,2,5,10,15};
        texts[] = {"0","2","5","10","15"};
        default = 2;
    };
    class civTraffic: AIParams
    {
        title = $STR_params_civ_traffic;
        tooltip = $STR_params_civ_traffic_desc;
        values[] = {0,1,2,4};
        texts[] = {$STR_params_civ_traffic_none,$STR_params_civ_traffic_low,$STR_params_civ_traffic_medium,$STR_params_civ_traffic_high};
        default = 2;
    };
    class allowCivDialog: AIParams
    {
        title = $STR_params_allowCivDialog;
        tooltip = $STR_params_allowCivDialog_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
    };
    class zombiesUncapped: AIParams
    {
        title = $STR_A3AU_uncap_zombie_spawn;
        tooltip = $STR_A3AU_uncap_zombie_spawn_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : solo {};
        };
        default = 0;
    };
    class plusGarrison: AIParams
    {
        title = $STR_A3AU_old_garrison_spawn;
        tooltip = $STR_A3AU_old_garrison_spawn_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class radiomanSupport: AIParams
    {
        title = $STR_A3AU_radioman_support;
        tooltip = $STR_A3AU_radioman_support_desc;
        values[] = {0,1};
        texts[] = {$STR_A3AU_dialogs_radioman_support,$STR_A3AU_dialogs_squadleader_support};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class playerRecruitAI: AIParams
    {
        title = $STR_params_playerRecruitAI;
        tooltip = $STR_params_playerRecruitAI_desc;
        values[] = {1,0};
        texts[] = {$STR_params_afk_enabled, $STR_params_afk_disabled};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
        class dependencies
        {
            class recruitToPlayerSquad
            {
                value = 0;
                dependentValue = 0;
                lockedByDependency = 1;
            };
        };
    };
    class recruitToPlayerSquad: AIParams
    {
        title = $STR_params_recruitToPlayerSquad;
        tooltip = $STR_params_recruitToPlayerSquad_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class aiControlTime: AIParams
    {
        title = $STR_params_aiControlTime;
        tooltip = $STR_params_aiControlTime_desc;
        values[] = {30, 60, 90, 120};
        texts[] = {"30", "60", "90", "120"};
        default = 60;
    };
    class unconsciousPossessAi: AIParams
    {
        title = $STR_params_unconsciousAiPossess;
        tooltip = $STR_params_unconsciousAiPossess_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
        lockInGame = 0;
    };
    class loadoutsToGenerate: AIParams
    {
        title = $STR_params_loadoutsToGenerate;
        tooltip = $STR_params_loadoutsToGenerate_desc;
        values[] = {5, 10, 15, 20};
        texts[] = {"5", "10", "15", "20"};
        class difficulty
        {
            class solo
            {
                easy = 5;
                medium = 10;
                hard = 20;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 5;
        lockInGame = 1;
    };

    class BalanceParamsSpacer : AIParamsSpacer
    {
        type = "Balance";
    };
    class RebelBalanceParams : AIParams
    {
        type = "RebelBalance";
        title = $STR_params_rebelBalanceParams;
        //tooltip = $STR_params_rebelBalanceParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class initialPlayerMoney: RebelBalanceParams
    {
        title = $STR_params_playerStartingMoney;
        tooltip = $STR_params_playerStartingMoney_desc;
        values[] = {0, 100, 200, 500, 1000, 2500};
        texts[] = {"0", "100", "200", "500","1000","2500"};
        class difficulty
        {
            class solo
            {
                easy = 2500;
                medium = 1000;
                hard = 500;
            };
            class small
            {
                easy = 1000;
                medium = 500;
                hard = 200;
            };
            class medium
            {
                easy = 500;
                medium = 200;
                hard = 100;
            };
            class large
            {
                easy = 200;
                medium = 100;
                hard = 0;
            };
        };
        default = 500;
        lockOnSave = 1;
    };
    class initialFactionMoney: RebelBalanceParams
    {
        title = $STR_params_rebelFactionStartingMoney;
        tooltip = $STR_params_rebelFactionStartingMoney_desc;
        values[] = {0,1000,2500,5000,10000};
        texts[] = {"0","1000","2500","5000","10000"};
        class difficulty
        {
            class solo
            {
                easy = 2500;
                medium = 1000;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 5000;
                medium = 2500;
                hard = 1000;
            };
            class large
            {
                easy = 10000;
                medium = 5000;
                hard = 1000;
            };
        };
        default = 1000;
        lockOnSave = 1;
    };
    class deathPenalty: RebelBalanceParams
    {
        title = $STR_params_deathPenalty;
        tooltip = $STR_params_deathPenalty_desc;
        values[] = {0, 15, 30, 50, 75, 100};
        texts[] = {"0%", "15%", "30%", "50%", "75%", "100%"};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 50;
                hard = 100;
            };
            class small
            {
                easy = 15;
                medium = 50;
                hard = 100;
            };
            class medium
            {
                easy = 30;
                medium = 50;
                hard = 100;
            };
            class large : solo {};
        };
        default = 30;
    };
    class initialHr: RebelBalanceParams
    {
        title = $STR_params_initialHr;
        tooltip = $STR_params_initialHr_desc;
        values[] = {0, 8, 16, 24, 32, 50};
        texts[] = {"0","8","16","24","32","50"};
        class difficulty
        {
            class solo
            {
                easy = 32;
                medium = 16;
                hard = 8;
            };
            class small : solo {};
            class medium
            {
                easy = 24;
                medium = 16;
                hard = 8;
            };
            class large
            {
                easy = 16;
                medium = 8;
                hard = 0;
            };
        };
        default = 8;
        lockOnSave = 1;
    };
    class limitHR: RebelBalanceParams
    {
        title = $STR_params_enable_HR_cap;
        tooltip = $STR_params_enable_HR_cap_desc;
        values[] = {0,25,50,75,100,200};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,"x0.25","x0.5","x0.75","x1.0","x2.0"};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 100;
                hard = 50;
            };
            class small : solo {};
            class medium
            {
                easy = 100;
                medium = 50;
                hard = 25;
            };
            class large : medium {};
        };
        default = 0;
    };
    class loseHROnDeath: RebelBalanceParams
    {
        title = $STR_A3AU_hr_loss;
        tooltip = $STR_A3AU_hr_loss_desc;
        values[] = {0,1,2};
        texts[] = {$STR_A3AU_no_hr_loss,$STR_A3AU_yes_hr_loss,$STR_A3AU_yes_hr_loss_w_msg};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 2;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class maxSupportPoints: RebelBalanceParams
    {
        title = $STR_params_maxSupportPoints;
        tooltip = $STR_params_maxSupportPoints_desc;
        values[] = {1,2,3,4,5,6};
        texts[] = {"1","2","3","4","5","6"};
        class difficulty
        {
            class solo
            {
                easy = 6;
                medium = 4;
                hard = 2;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 3;
    };
    class pistolStart : RebelBalanceParams
    {
        title = $STR_params_pistolStart;
        tooltip = $STR_params_pistolStart_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : solo {};
        };
        default = 0;
        lockOnSave = 1;
        lockInGame = 1;
    };
    class startWithLongRangeRadio: RebelBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_startWithLongRangeRadio;
        tooltip = $STR_params_startWithLongRangeRadio_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class large : solo {};
        };
        default = 1;
    };
    class aceFood: RebelBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_aceFood;
        tooltip = $STR_params_aceFood_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        lockCondition = "!A3A_hasACE;";
    };
    class enableSpectrumDevice: RebelBalanceParams
    {
        title = $STR_params_enableSpectrumDevice;
        tooltip = $STR_params_enableSpectrumDevice_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        // lockCondition = "!('enoch' in A3A_enabledDLC);"; // ! Doesn't work because that var isn't instantiated yet. Need to see if we actually have a var for this...
    };
    class reviveKitsEnabled: RebelBalanceParams
    {
        title = $STR_params_reviveKitsEnabled;
        tooltip = $STR_params_reviveKitsEnabled_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class large : solo {};
        };
        default = 1;
    };
    class A3A_reviveTime: RebelBalanceParams
    {
        title = $STR_params_revive_time;
        tooltip = $STR_params_revive_time_desc;
        values[] = {8,12,16,24,32};
        texts[] = {"8","12","16","24","32"};
        class difficulty
        {
            class solo
            {
                easy = 8;
                medium = 16;
                hard = 32;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 16;
    };
    class A3A_selfReviveMethods: RebelBalanceParams
    {
        title = $STR_A3A_Params_selfReviveMethods_title;
        tooltip = $STR_A3A_Params_selfReviveMethods_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_A3A_Params_selfReviveMethods_withstand};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class large : solo {};
        };
        default = 0;
    };
    class useDownedNotification: RebelBalanceParams
    {
        title = $STR_A3AU_use_downed_notification;
        tooltip = $STR_A3AU_use_downed_notification_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class rallyPointSpawnCount: RebelBalanceParams
    {
        title = $STR_params_rallyPointSpawnCount;
        tooltip = $STR_params_rallyPointSpawnCount_desc;
        values[] = {3, 5, 10, 15, 20, 30, 0};
        texts[] = {"3", "5", "10", "15", "20", "30", $STR_params_afk_disabled};
        class difficulty
        {
            class solo
            {
                easy = 10;
                medium = 5;
                hard = 3;
            };
            class small
            {
                easy = 15;
                medium = 10;
                hard = 5;
            };
            class medium
            {
                easy = 20;
                medium = 15;
                hard = 10;
            };
            class large
            {
                easy = 30;
                medium = 20;
                hard = 15;
            };
        };
        default = 10;
    };
    class staminaEnabled: RebelBalanceParams
    {
        title = $STR_A3AU_stamina_enabled;
        tooltip = $STR_A3AU_stamina_enabled_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
    };
    class fatigueEnabled: RebelBalanceParams
    {
        title = $STR_A3AU_fatigue_enabled;
        tooltip = $STR_A3AU_fatigue_enabled_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
    };
    class swayEnabled: RebelBalanceParams
    {
        title = $STR_A3AU_sway_enabled;
        tooltip = $STR_A3AU_sway_enabled_desc;
        values[] = {0,25,50,75,100};
        texts[] = {"0%","25%","50%","75%","100%"};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 50;
                hard = 100;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 100;
    };
    class A3A_removeRestore: RebelBalanceParams
    {
        title = $STR_A3A_Params_removeRestore_title;
        tooltip = $STR_A3A_Params_removeRestore_title;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : solo {};
        };
        default = 0;
    };
    class limitedFT: RebelBalanceParams
    {
        title = $STR_params_allowFT;
        tooltip = $STR_params_allowFT_desc;
        values[] = {0,1,2,3};
        texts[] = {$STR_params_allowFT_0, $STR_params_allowFT_1, $STR_params_allowFT_2, $STR_params_civ_traffic_none};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 3;
            };
            class small
            {
                easy = 0;
                medium = 2;
                hard = 3;
            };
            class medium : small {};
            class large
            {
                easy = 1;
                medium = 2;
                hard = 3;
            };
        };
        default = 0;
        lockInGame = 1;
        class dependencies
        {
            class fastTravelEnemyCheck
            {
                value = 3;
                lockedByDependency = 1;
            };
        };
    };
    class fastTravelEnemyCheck: RebelBalanceParams
    {
        title = $STR_params_fastTravelEnemyCheck;
        tooltip = $STR_params_fastTravelEnemyCheck_desc;
        values[] = {0,1};
        texts[] = {$STR_params_fastTravelEnemyCheck_player, $STR_params_fastTravelEnemyCheck_team};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 0;
    };
    class unflipPersonCount: RebelBalanceParams
    {
        title = $STR_params_unflipPersonCount;
        tooltip = $STR_params_unflipPersonCount_desc;
        values[] = {1, 2, 3, 4};
        texts[] = {"1","2","3","4"};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 2;
                hard = 3;
            };
            class small : solo {};
            class medium
            {
                easy = 2;
                medium = 3;
                hard = 4;
            };
            class large : medium {};
        };
        default = 3;
    };
    class A3A_rebelGarrisonLimit: RebelBalanceParams
    {
        title = $STR_params_rebelGarrisonLimit;
        tooltip = $STR_params_rebelGarrisonLimit_desc;
        values[] = {-1, 16, 24, 32};
        texts[] = {"∞", "16", "24", "32"};
        class difficulty
        {
            class solo
            {
                easy = -1;
                medium = 24;
                hard = 16;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 24;
    };
    class A3A_rebelGarrisonGroupSize: RebelBalanceParams
    {
        title = $STR_params_rebelGarrisonGroupSize;
        tooltip = $STR_params_rebelGarrisonGroupSize_desc;
        values[] = {2, 4, 6, 8, 10, 12, 14, 16};
        texts[] = {"2", "4", "6", "8", "10", "12", "14", "16"};
        default = 8;
    };
    class AIBalanceParamsSpacer : AIParamsSpacer
    {
        type = "AIBalance";
    };
    class AIBalanceParams : AIParams
    {
        type = "AIBalance";
        title = $STR_params_aiBalanceParams;
        //tooltip = $STR_params_aiBalanceParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class A3A_enemyBalanceMul: AIBalanceParams
    {
        title = $STR_params_overall_enemy_res_balance;
        tooltip = $STR_params_overall_enemy_res_balance_desc;
        values[] = {4,6,8,10,11,12,13,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.1x", "1.2x","1.3x", "1.4x","1.7x","2.0x","2.4x","2.8x"};
        class difficulty
        {
            class solo
            {
                easy = 8;
                medium = 12;
                hard = 20;
            };
            class small
            {
                easy = 10;
                medium = 14;
                hard = 20;
            };
            class medium
            {
                easy = 12;
                medium = 17;
                hard = 24;
            };
            class large
            {
                easy = 14;
                medium = 20;
                hard = 28;
            };
        };
        default = 11;
        lockInGame = 1;
    };
    class A3A_enemyAttackMul: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_response_balance;
        tooltip = $STR_params_response_balance_desc;
        values[] = {4,6,8,10,12,14,17,20,24,28};
        texts[] =  {"0.4x","0.6x","0.8x","1.0x","1.2x","1.4x","1.7x","2.0x","2.4x","2.8x"};
        class difficulty
        {
            class solo
            {
                easy = 8;
                medium = 12;
                hard = 20;
            };
            class small
            {
                easy = 10;
                medium = 14;
                hard = 20;
            };
            class medium
            {
                easy = 12;
                medium = 17;
                hard = 24;
            };
            class large
            {
                easy = 14;
                medium = 20;
                hard = 28;
            };
        };
        default = 10;
        lockInGame = 1;
    };
    class A3A_invaderBalanceMul: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_resource_balance_inv;
        tooltip = $STR_params_resource_balance_inv_desc;
        values[] = {10,11,12,13,14,15,16,17,18,19,20};
        texts[] =  {"1.0x","1.1x","1.2x","1.3x","1.4x","1.5x","1.6x","1.7x","1.8x","1.9x","2.0x"};
        class difficulty
        {
            class solo
            {
                easy = 10;
                medium = 12;
                hard = 14;
            };
            class small
            {
                easy = 12;
                medium = 14;
                hard = 16;
            };
            class medium
            {
                easy = 14;
                medium = 16;
                hard = 18;
            };
            class large
            {
                easy = 16;
                medium = 18;
                hard = 20;
            };
        };
        default = 12;
        lockInGame = 1;
    };
    class enablePunishments: AIBalanceParams
    {
        title = $STR_params_enablePunishments;
        tooltip = $STR_params_enablePunishments_desc;
        values[] = {1,0};
        texts[] = {$STR_params_afk_enabled, $STR_params_afk_disabled};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : solo {};
        };
        default = 1;
    };
    class A3A_enemyResponseTime: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_A3A_Params_enemyResponseTime_title;
        tooltip = $STR_A3A_Params_enemyResponseTime_desc;
        values[] = {20,15,10,7,5};
        texts[] =  {$STR_A3A_Params_generic_veryslow, $STR_A3A_Params_generic_slow, $STR_A3A_Params_generic_normal, $STR_A3A_Params_generic_fast, $STR_A3A_Params_generic_veryfast};
        class difficulty
        {
            class solo
            {
                easy = 20;
                medium = 15;
                hard = 10;
            };
            class small
            {
                easy = 15;
                medium = 10;
                hard = 7;
            };
            class medium
            {
                easy = 10;
                medium = 7;
                hard = 5;
            };
            class large : medium {};
        };
        default = 10;
    };
    class A3A_attackHQProximityMul: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_enemyPref;
        tooltip = $STR_params_enemyPref_desc;
        values[] = {1,2,3,5,8};
        texts[] =  {$STR_params_enemyPref_nc,"2x","3x","5x","8x"};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 3;
                hard = 5;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 3;
    };
    class A3A_enemySkillMul: AIBalanceParams
    {
        title = $STR_params_A3A_enemySkillMul;
        tooltip = $STR_params_A3A_enemySkillMul_desc;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_params_A3A_enemySkillMul_veasy,$STR_params_A3A_enemySkillMul_easy,$STR_params_A3A_enemySkillMul_medium,$STR_params_A3A_enemySkillMul_hard,$STR_params_A3A_enemySkillMul_vhard};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 2;
                hard = 3;
            };
            class small : solo {};
            class medium
            {
                easy = 2;
                medium = 3;
                hard = 4;
            };
            class large : medium {};
        };
        default = 2;
    };
    class A3A_rebelSkillMul: AIBalanceParams
    {
        title = $STR_params_A3A_rebelSkillMul;
        tooltip = $STR_params_A3A_rebelSkillMul_desc;
        values[] = {0,1,2,3,4};
        texts[] = {$STR_params_A3A_enemySkillMul_veasy,$STR_params_A3A_enemySkillMul_easy,$STR_params_A3A_enemySkillMul_medium,$STR_params_A3A_enemySkillMul_hard,$STR_params_A3A_enemySkillMul_vhard};
        class difficulty
        {
            class solo
            {
                easy = 4;
                medium = 3;
                hard = 2;
            };
            class small
            {
                easy = 3;
                medium = 2;
                hard = 1;
            };
            class medium
            {
                easy = 2;
                medium = 1;
                hard = 0;
            };
            class large : solo {};
        };
        default = 2;
    };
    class aiAccuracyCeiling: AIBalanceParams
    {
        title = $STR_params_aiAccuracyCeiling;
        tooltip = $STR_params_aiAccuracyCeiling_desc;
        values[] = {10, 20, 30, 40, 45, 50, 60, 70, 80, 90, 100};
        texts[] = {"0.1", "0.2", "0.3", "0.4", "0.45", "0.5", "0.6", "0.7", "0.8", "0.9", "1"};
        class difficulty
        {
            class solo
            {
                easy = 20;
                medium = 50;
                hard = 80;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 45;
    };
    class unconChanceEny : AIBalanceParams
    {
        title = $STR_params_unconChanceEny;
        tooltip = $STR_params_unconChanceEny_desc;
        values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        texts[] = {"0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"};
        class difficulty
        {
            class solo
            {
                easy = 10;
                medium = 8;
                hard = 6;
            };
            class small
            {
                easy = 8;
                medium = 6;
                hard = 4;
            };
            class medium
            {
                easy = 6;
                medium = 4;
                hard = 2;
            };
            class large
            {
                easy = 4;
                medium = 2;
                hard = 0;
            };
        };
        default = 10;
        lockCondition = "A3A_hasACEMedical;";
        lockConditionTooltip = $STR_params_unconChance_lockCondition;
    };
    class unconChanceReb : unconChanceEny
    {
        title = $STR_params_unconChanceReb;
        tooltip = $STR_params_unconChanceReb_desc;
    };
    class napalmEnabled: AIBalanceParams
    {
        title = $STR_params_napalmEnabled;
        tooltip = $STR_params_napalmEnabled_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class large : solo {};
        };
        default = 1;
    };
    class allowUnfairSupports: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_allowUnfairSupports;
        tooltip = $STR_params_allowUnfairSupports_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 0;
    };
    class allowFuturisticSupports: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_allowFuturisticSupports;
        tooltip = $STR_params_allowFuturisticSupports_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class allowFuturisticUnfairSupports: AIBalanceParams
    {
        attr[] = {"server"};
        title = $STR_params_allowFuturisticUnfairSupports;
        tooltip = $STR_params_allowFuturisticUnfairSupports_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 0;
    };
    class A3A_UAVSpawnChance: AIBalanceParams
    {
        title = $STR_params_UAVSpawnChance;
        tooltip = $STR_params_UAVSpawnChance_desc;
        values[] = {0, 10, 20, 30, 50, 100, 200};
        texts[] = {"0", "10%", "20%", "30%", "50%", "100%", "200%"};
        class difficulty
        {
            class solo
            {
                easy = 100;
                medium = 50;
                hard = 10;
            };
            class small : solo {};
            class medium
            {
                easy = 50;
                medium = 30;
                hard = 10;
            };
            class large
            {
                easy = 20;
                medium = 10;
                hard = 0;
            };
        };
        default = 20;
    };
    class distanceMission: AIBalanceParams
    {
        title = $STR_params_distanceMission;
        tooltip = $STR_params_distanceMission_desc;
        values[] = {2000,3000,4000,6000,8000,10000,12000};
        texts[] = {"2000","3000","4000","6000","8000","10000","12000"};
        class difficulty
        {
            class solo
            {
                easy = 2000;
                medium = 3000;
                hard = 4000;
            };
            class small
            {
                easy = 3000;
                medium = 4000;
                hard = 6000;
            };
            class medium
            {
                easy = 4000;
                medium = 6000;
                hard = 8000;
            };
            class large
            {
                easy = 6000;
                medium = 8000;
                hard = 10000;
            };
        };
        default = 3000;
    };
    class A3U_enableVehiclesForAI : AIBalanceParams
    {
        title = $STR_params_enableVehiclesForAI;
        tooltip = $STR_params_enableVehiclesForAI_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
        lockInGame = 1;
    };
    class MiscBalanceParamsSpacer : AIParamsSpacer
    {
        type = "MiscBalance";
    };
    class MiscBalanceParams : AIParams
    {
        type = "MiscBalance";
        title = $STR_params_miscBalanceParams;
        //tooltip = $STR_params_miscBalanceParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class playerMarkersEnabled: MiscBalanceParams
    {
        title = $STR_params_server_friendlymarkers_title;
        tooltip = $STR_params_server_friendlymarkers_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class large : medium {};
        };
        default = 1;
    };
    class hideEnemyMarkers: MiscBalanceParams
    {
        title = $STR_A3AU_hide_enemy_markers;
        tooltip = $STR_A3AU_hide_enemy_markers_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class large : medium {};
        };
        default = 0;
        lockInGame = 1;
    };
    class hideEnemyMarkersReconPlaneDistance: MiscBalanceParams
    {
        title = $STR_A3AU_hide_enemy_markers_recon_plane_distance;
        tooltip = $STR_A3AU_hide_enemy_markers_recon_plane_distance_desc;
        values[] = {100, 300, 500, 1000, 1500, 2000};
        texts[] = {"100", "300", "500", "1000", "1500", "2000"};
        class difficulty
        {
            class solo
            {
                easy = 500;
                medium = 1000;
                hard = 1500;
            };
            class small : solo {};
            class medium
            {
                easy = 300;
                medium = 500;
                hard = 1000;
            };
            class large
            {
                easy = 100;
                medium = 300;
                hard = 500;
            };
        };
        default = 500;
    };
    class playerIcons: MiscBalanceParams
    {
        title = $STR_params_playerIcons;
        tooltip = $STR_params_playerIcons_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class large : medium {};
        };
        default = 1;
    };
    class loadoutArsenalDefaultOverride : MiscBalanceParams
    {
        title = $STR_params_loadoutArsenalDefaultOverride;
        tooltip = $STR_params_loadoutArsenalDefaultOverride_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class limitWeaponsByUnitType : MiscBalanceParams
    {
        title = $STR_params_limitWeaponsByUnitType;
        tooltip = $STR_params_limitWeaponsByUnitType_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class AIParamsSpacer2 : AllParams
    {
        type = "AI";
    };

    class BMParamsSpacer : AllParams
    {
        type = "BlackMarket";
    };
    class BMParams : AllParams
    {
        type = "BlackMarket";
        title = $STR_params_blackmarket;
        //tooltip = $STR_params_blackmarket_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class disableTrader: BMParams
    {
        title = $STR_A3AU_disable_trader;
        tooltip = $STR_A3AU_disable_trader;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 0;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
        lockOnSave = 1; // Causes errors if disabling trader after already having found him in a save
        class dependencies
        {
            class vanillaArmsDealer
            {
                value = 1;
                lockedByDependency = 1;
            };
            class blackMarketIgnoreRequirements : vanillaArmsDealer {};
            class A3U_blackMarketDiscountVehicle : vanillaArmsDealer {};
            class A3U_blackMarketDiscountWeapon : vanillaArmsDealer {};
        };
    };
    class vanillaArmsDealer: BMParams
    {
        title = $STR_A3AU_vanilla_weapons_in_arms_dealer;
        tooltip = $STR_A3AU_vanilla_weapons_in_arms_dealer_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
        lockInGame = 1;
    };
    class blackMarketIgnoreRequirements : BMParams
    {
        title = $STR_params_blackMarketIgnoreRequirements;
        tooltip = $STR_params_blackMarketIgnoreRequirements_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class A3U_blackMarketDiscountVehicle : BMParams
    {
        title = $STR_params_blackMarketDiscountVehicle;
        tooltip = $STR_params_blackMarketDiscountVehicle_desc;
        values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%"};
        default = 0;
    };
    class A3U_blackMarketDiscountWeapon : BMParams
    {
        title = $STR_params_blackMarketDiscountWeapon;
        tooltip = $STR_params_blackMarketDiscountWeapon_desc;
        values[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%"};
        default = 0;
    };

    class BuilderParamsSpacer : AllParams
    {
        type = "Builder";
    };
    class BuilderParams : AllParams
    {
        type = "Builder";
        title = $STR_params_builder;
    };
    class A3A_builderPermissions: BuilderParams
    {
        title = $STR_params_builderPermissions;
        tooltip = $STR_params_builderPermissions_desc;
        values[] = {1, 2, 3};
        texts[] = {"Team leaders", "Engineers", "Both"};
        class difficulty
        {
            class solo
            {
                easy = 3;
                medium = 3;
                hard = 3;
            };
            class small : solo {};
            class medium
            {
                easy = 3;
                medium = 2;
                hard = 2;
            };
            class large : medium {};
        };
        default = 3;
    };
    class A3A_builderLimit: BuilderParams
    {
        title = $STR_params_builderLimit;
        tooltip = $STR_params_builderLimit_desc;
        values[] = {100, 200, 300, 400, 500, 600, 800, 900, 1000, -1};
        texts[] = {"100", "200", "300", "400", "500", "600", "800", "900", "1000", "Basically Infinite"};
        default = 300;
    };
    class A3A_builderBuildTime: BuilderParams
    {
        title = $STR_params_builderBuildTime;
        tooltip = $STR_params_builderBuildTime_desc;
        values[] = {0, 4, 5, 6, 7, 8, 9, 10};
        texts[] = {"DEBUG (Instant)", "0.4x", "0.5x", "0.6x", "0.7x", "0.8x", "0.9x", "1.0x"};
        class difficulty
        {
            class solo
            {
                easy = 4;
                medium = 6;
                hard = 8;
            };
            class small
            {
                easy = 5;
                medium = 7;
                hard = 9;
            };
            class medium
            {
                easy = 6;
                medium = 8;
                hard = 10;
            };
            class large
            {
                easy = 8;
                medium = 9;
                hard = 10;
            };
        };
        default = 5;
    };
    class A3A_builderAllowRoads: BuilderParams
    {
        title = $STR_params_builderAllowRoads;
        tooltip = $STR_params_builderAllowRoads_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class A3U_HelipadTerrainSmoothing: BuilderParams
    {
        title = $STR_params_helipadTerrainSmoothing;
        tooltip = $STR_params_helipadTerrainSmoothing_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class saveZeusBuildings: BuilderParams
    {
        title = $STR_params_saveZeusBuildings;
        tooltip = $STR_params_saveZeusBuildings_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class maxConstructions: BuilderParams
    {
        title = $STR_params_maxConstructions;
        tooltip = $STR_params_maxConstructions_desc;
        values[] = {0,50,100,250,300};
        texts[] = {"0","50","100","250","300"};
        default = 100;
    };
    

    class LootParams : AllParams
    {
        type = "Loot";
    };
    class UnlockParams : LootParams
    {
        type = "Unlocks";
        title = $STR_params_unlockParams;
        //tooltip = $STR_params_unlockParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class minWeaps: UnlockParams
    {
        title = $STR_params_server_unlock_threshold;
        tooltip = $STR_params_server_unlock_threshold_desc;
        values[] = {10,15,20,25,30,35,40,45,50,100,200,500,-1};
        texts[] = {"10","15","20","25","30","35","40","45","50","100","200","500",$STR_params_server_unlock_no_unlocks};
        class difficulty
        {
            class solo
            {
                easy = 10;
                medium = 15;
                hard = 20;
            };
            class small
            {
                easy = 15;
                medium = 20;
                hard = 25;
            };
            class medium
            {
                easy = 25;
                medium = 50;
                hard = -1;
            };
            class large : medium {};
        };
        default = 25;
        class dependencies
        {
            class unlockedUnlimitedAmmo
            {
                value = -1;
                dependentValue = 0;
                lockedByDependency = 1;
                dependencyTooltip = $STR_antistasi_dialogs_setup_unlocks_disabled;
            };
            class allowGuidedLaunchers : unlockedUnlimitedAmmo {};
            class allowUnlockedExplosives : unlockedUnlimitedAmmo {};
            class allowUnlockedTNVG : unlockedUnlimitedAmmo {};
        };
    };
    class A3A_guestItemLimit: UnlockParams
    {
        title = $STR_params_A3A_guestItemLimit;
        tooltip = $STR_params_A3A_guestItemLimit_desc;
        values[] = {0,10,15,25,40};
        texts[] = {$STR_params_A3A_no_limit,"10","15","25","40"};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 10;
                hard = 15;
            };
            class small : solo {};
            class medium
            {
                easy = 10;
                medium = 15;
                hard = 25;
            };
            class large
            {
                easy = 15;
                medium = 25;
                hard = 40;
            };
        };
        default = 25;
    };
    class unlockedUnlimitedAmmo: UnlockParams
    {
        attr[] = {"server"};
        title = $STR_params_unlockedUnlimitedAmmo;
        tooltip = $STR_params_unlockedUnlimitedAmmo_desc;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text, $STR_antistasi_dialogs_generic_button_no_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class allowGuidedLaunchers: UnlockParams
    {
        attr[] = {"server"};
        title = $STR_params_allowGuidedLaunchers;
        tooltip = $STR_params_allowGuidedLaunchers_desc;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text, $STR_antistasi_dialogs_generic_button_no_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
    };
    class allowUnlockedExplosives: UnlockParams
    {
        attr[] = {"server"};
        title = $STR_params_allowUnlockedExplosives;
        tooltip = $STR_params_allowUnlockedExplosives_desc;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text,$STR_antistasi_dialogs_generic_button_no_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class allowUnlockedTNVG: UnlockParams
    {
        attr[] = {"server"};
        title = $STR_params_allowUnlockedTNVG;
        tooltip = $STR_params_allowUnlockedTNVG_desc;
        values[] = {1,0};
        texts[] = {$STR_antistasi_dialogs_generic_button_yes_text,$STR_antistasi_dialogs_generic_button_no_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class cosmeticsEnabled: UnlockParams
    {
        title = $STR_A3AU_cosmetics;
        tooltip = $STR_A3AU_cosmetics_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class CrateParamsSpacer : LootParams
    {
        type = "Crates";
    };
    class CrateParams : LootParams
    {
        type = "Crates";
        title = $STR_params_crateParams;
        //tooltip = $STR_params_crateParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class lootCratesEnabled: CrateParams
    {
        title = $STR_params_lootCrateHeli;
        tooltip = $STR_params_lootCrateHeli_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
        class dependencies
        {
            class lootCrateDistance
            {
                value = 0;
                lockedByDependency = 1;
            };
            class lootCratePrice : lootCrateDistance {};
            class lootCrateUnlockedItems : lootCrateDistance {};
        };
    };
    class lootCrateDistance: CrateParams
    {
        title = $STR_params_lootCrateDistance;
        tooltip = $STR_params_lootCrateDistance_desc;
        values[] = {10, 25, 50, 75, 100, 200, 300, 400};
        texts[] = {"10", "25", "50", "75", "100", "200", "300", "400"};
        class difficulty
        {
            class solo
            {
                easy = 100;
                medium = 50;
                hard = 10;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 50;
    };
    class lootCratePrice: CrateParams
    {
        title = $STR_params_lootCratePrice;
        tooltip = $STR_params_lootCratePrice_desc;
        values[] = {100, 200, 300, 400, 500};
        texts[] = {"100", "200", "300", "400", "500"};
        class difficulty
        {
            class solo
            {
                easy = 100;
                medium = 200;
                hard = 300;
            };
            class small : solo {};
            class medium
            {
                easy = 200;
                medium = 300;
                hard = 400;
            };
            class large
            {
                easy = 300;
                medium = 400;
                hard = 500;
            };
        };
        default = 100;
    };
    class lootCrateUnlockedItems: CrateParams
    {
        title = $STR_params_lootCrateUnlockedItems;
        tooltip = $STR_params_lootCrateUnlockedItems_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 0;
    };
    class crateWepTypeMax: CrateParams
    {
        title = $STR_params_crateWepTypeMax;
        tooltip = $STR_params_crateWepTypeMax_desc;
        values[] = {0,2,4,6,8,12,16};
        texts[] = {"1","3","5","7","9","13","17"};
        default = 8;
    };
    class crateWepNumMax: CrateParams
    {
        title = $STR_params_crateWepNumMax;
        tooltip = $STR_params_crateWepNumMax_desc;
        values[] = {0,1,3,5,8,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","8","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 15;
                medium = 10;
                hard = 5;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 8;
    };
    class crateItemTypeMax: CrateParams
    {
        title = $STR_params_crateItemTypeMax;
        tooltip = $STR_params_crateItemTypeMax_desc;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateItemNumMax: CrateParams
    {
        title = $STR_params_crateItemNumMax;
        tooltip = $STR_params_crateItemNumMax_desc;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 10;
                medium = 5;
                hard = 3;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 5;
    };
    class crateAmmoTypeMax: CrateParams
    {
        title = $STR_params_crateAmmoTypeMax;
        tooltip = $STR_params_crateAmmoTypeMax_desc;
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAmmoNumMax: CrateParams
    {
        title = $STR_params_crateAmmoNumMax;
        tooltip = $STR_params_crateAmmoNumMax_desc;
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15","20","25","30"};
        class difficulty
        {
            class solo
            {
                easy = 30;
                medium = 20;
                hard = 10;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 20;
    };
    class crateExplosiveTypeMax: CrateParams
    {
        title = $STR_params_crateExplosiveTypeMax;
        tooltip = $STR_params_crateExplosiveTypeMax_desc;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 4;
    };
    class crateExplosiveNumMax: CrateParams
    {
        title = $STR_params_crateExplosiveNumMax;
        tooltip = $STR_params_crateExplosiveNumMax_desc;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 10;
                medium = 5;
                hard = 3;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 5;
    };
    class crateAttachmentTypeMax: CrateParams
    {
        title = $STR_params_crateAttachmentTypeMax;
        tooltip = $STR_params_crateAttachmentTypeMax_desc;
        values[] = {0,2,4,6,9,14,19};
        texts[] = {"1","3","5","7","10","15","20"};
        default = 6;
    };
    class crateAttachmentNumMax: CrateParams
    {
        title = $STR_params_crateAttachmentNumMax;
        tooltip = $STR_params_crateAttachmentNumMax_desc;
        values[] = {0,1,3,5,10,15,20,25,30};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15","20","25","30"};
        class difficulty
        {
            class solo
            {
                easy = 25;
                medium = 15;
                hard = 5;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 15;
    };
    class crateBackpackTypeMax: CrateParams
    {
        title = $STR_params_crateBackpackTypeMax;
        tooltip = $STR_params_crateBackpackTypeMax_desc;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateBackpackNumMax: CrateParams
    {
        title = $STR_params_crateBackpackNumMax;
        tooltip = $STR_params_crateBackpackNumMax_desc;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 5;
                medium = 3;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 3;
    };
    class crateVestTypeMax: CrateParams
    {
        title = $STR_params_crateVestTypeMax;
        tooltip = $STR_params_crateVestTypeMax_desc;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateVestNumMax: CrateParams
    {
        title = $STR_params_crateVestNumMax;
        tooltip = $STR_params_crateVestNumMax_desc;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 5;
                medium = 3;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 3;
    };
    class crateHelmetTypeMax: CrateParams
    {
        title = $STR_params_crateHelmetTypeMax;
        tooltip = $STR_params_crateHelmetTypeMax_desc;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 0;
    };
    class crateHelmetNumMax: CrateParams
    {
        title = $STR_params_crateHelmetNumMax;
        tooltip = $STR_params_crateHelmetNumMax_desc;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 5;
                medium = 3;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 3;
    };
    class crateDeviceTypeMax: CrateParams
    {
        title = $STR_params_crateDeviceTypeMax;
        tooltip = $STR_params_crateDeviceTypeMax_desc;
        values[] = {0,2,4,9};
        texts[] = {"1","3","5","10"};
        default = 2;
    };
    class crateDeviceNumMax: CrateParams
    {
        title = $STR_params_crateDeviceNumMax;
        tooltip = $STR_params_crateDeviceNumMax_desc;
        values[] = {0,1,3,5,10,15};
        texts[] = {$STR_params_civ_traffic_none,"1","3","5","10","15"};
        class difficulty
        {
            class solo
            {
                easy = 5;
                medium = 3;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 3;
    };
    class VehicleLootParamsSpacer : LootParams
    {
        type = "VehicleLoot";
    };
    class VehicleLootParams : LootParams
    {
        type = "VehicleLoot";
        title = $STR_params_vehicleLootParams;
        //tooltip = $STR_params_vehicleLootParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class enableVehicleAutoLock: VehicleLootParams
    {
        title = $STR_params_enableVehicleAutoLock;
        tooltip = $STR_params_enableVehicleAutoLock_desc;
        values[] = {0,1};
        texts[] = {$STR_params_afk_disabled, $STR_params_afk_enabled};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
        lockInGame = 1;
    };
    class enableVehicleAutoLockCiv: VehicleLootParams
    {
        title = $STR_params_enableVehicleAutoLockCiv;
        tooltip = $STR_params_enableVehicleAutoLockCiv_desc;
        values[] = {0,1};
        texts[] = {$STR_params_afk_disabled, $STR_params_afk_enabled};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 1;
                hard = 1;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 1;
        lockInGame = 1;
        class dependencies
        {
            class vehicleLockpickTime
            {
                value = 0;
                lockedByDependency = 1;
            };
        };
    };
    class vehicleLockpickTime: VehicleLootParams
    {
        title = $STR_params_vehicleLockpickTime;
        tooltip = $STR_params_vehicleLockpickTime_desc;
        values[] = {30,60,120};
        texts[] = {"30s", "60s", "120s"};
        class difficulty
        {
            class solo
            {
                easy = 30;
                medium = 60;
                hard = 120;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 60;
    };
    class MiscLootParamsSpacer : LootParams
    {
        type = "MiscLoot";
    };
    class MiscLootParams : LootParams
    {
        type = "MiscLoot";
        title = $STR_params_miscLootParams;
        //tooltip = $STR_params_miscLootParams_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class helmetLossChance: MiscLootParams
    {
        title = $STR_params_helmetLossChance;
        tooltip = $STR_params_helmetLossChance_desc;
        values[] = {0,33,66,100};
        texts[] = {$STR_params_helmetLossChance_0,$STR_params_helmetLossChance_1,$STR_params_helmetLossChance_2,$STR_params_helmetLossChance_3};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 33;
                hard = 66;
            };
            class small : solo {};
            class medium
            {
                easy = 33;
                medium = 66;
                hard = 100;
            };
            class large : solo {};
        };
        default = 33;
        class dependencies
        {
            class helmetLossSound
            {
                value = 0;
                lockedByDependency = 1;
            };
        };
    };
    class helmetLossSound: MiscLootParams
    {
        title = $STR_params_helmetLossSound;
        tooltip = $STR_params_helmetLossSound_desc;
        values[] = {0,1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text,$STR_antistasi_dialogs_generic_button_yes_text};
        default = 1;
    };
    class BMParamsSpacer2 : AllParams
    {
        type = "BlackMarket";
    };

    class ExtenderParamsSpacer : AllParams
    {
        type = "Extender";
    };
    class ExtenderParams : AllParams
    {
        type = "Extender";
        title = $STR_params_extender;
        tooltip = $STR_params_extender_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };

    class ExperimentalParamsSpacer : AllParams
    {
        type = "Experimental";
    };
    class ExperimentalParams
    {
        type = "Experimental";
        title = $STR_params_experimental;
        tooltip = $STR_params_experimental_desc;
        values[] = {};
        texts[] = {};
        default = 0;
        lockOnSave = 0; // ! Nothing in this section should ever have to be locked. We wouldn't want an *experimental* param to bork a save.
    };
    class A3A_diameterExtendedCaptureArea: ExperimentalParams
    {
        title = $STR_A3A_Params_diameterExtendedCaptureArea_title;
        tooltip = $STR_A3A_Params_diameterExtendedCaptureArea_tooltip;
        values[] = {0,150,250,300,350,400,450,500};
        texts[] = {$STR_A3A_Params_diameterExtendedCaptureArea_traditional, "150m", "250m", "300m", "350m", "400m", "450m", "500m"};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 300;
                hard = 500;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class A3U_disablePATCOMMortars : ExperimentalParams
    {
        title = $STR_params_disablePATCOMMortars;
        tooltip = $STR_params_disablePATCOMMortars_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
        lockInGame = 1;
    };
    class A3U_disableMortars : ExperimentalParams
    {
        title = $STR_params_disableMortars;
        tooltip = $STR_params_disableMortars_desc;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 0;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
        lockInGame = 0;
    };
    class EGVAR(ultimate,allowLockpickKits) : ExperimentalParams
    {
        title = $STR_params_ultimate_allowLockpickKits;
        tooltip = $STR_params_ultimate_allowLockpickKits_Tooltip;
        values[] = {0, 1};
        texts[] = {$STR_antistasi_dialogs_generic_button_no_text, $STR_antistasi_dialogs_generic_button_yes_text};
        class difficulty
        {
            class solo
            {
                easy = 1;
                medium = 1;
                hard = 0;
            };
            class small : solo {};
            class medium : solo {};
            class large : solo {};
        };
        default = 0;
    };
    class EGVAR(ultimate,lockpickKitBreakChance) : ExperimentalParams
    {
        title = $STR_params_ultimate_lockpickKitBreakChance;
        tooltip = $STR_params_ultimate_lockpickKitBreakChance_Tooltip;
        values[] = {0, 10, 20, 25, 30, 40, 50};
        texts[] = {"0%", "10%", "20%", "25%", "30%", "40%", "50%"};
        class difficulty
        {
            class solo
            {
                easy = 0;
                medium = 10;
                hard = 20;
            };
            class small
            {
                easy = 10;
                medium = 20;
                hard = 30;
            };
            class medium
            {
                easy = 20;
                medium = 30;
                hard = 40;
            };
            class large
            {
                easy = 30;
                medium = 40;
                hard = 50;
            };
        };
        default = 25;
    };
    class AIrevivesOutsideSquad : ExperimentalParams
    {
        title = $STR_params_AIrevivesOutsideSquad;
        tooltip = $STR_params_AIrevivesOutsideSquad_desc;
        values[] = {25, 50, 75, 100, -1};
        texts[] = {"25", "50", "75", "100", $STR_params_afk_disabled};
        default = -1;
    };

    class DevelopmentParamsSpacer : AllParams
    {
        type = "Development";
    };
    class DevelopmentParams : AllParams
    {
        type = "Development";
        title = $STR_params_development;
        //tooltip = $STR_params_development_desc;
        values[] = {};
        texts[] = {};
        default = 0;
    };
    class LogLevel: DevelopmentParams
    {
        title = $STR_params_LogLevel;
        tooltip = $STR_params_LogLevel_desc;
        values[] = {1,2,3,4};
        texts[] = {"Error", "Info", "Debug", "Verbose"};
        default = 2;
    };
    class A3A_logDebugConsole: DevelopmentParams
    {
        title = $STR_params_A3A_logDebugConsole;
        tooltip = $STR_params_A3A_logDebugConsole_desc;
        values[] = {-1,1,2};
        texts[] = {$STR_params_A3A_logDebugConsole_none, $STR_params_A3A_logDebugConsole_allnondev, $STR_params_A3A_logDebugConsole_all};
        default = 1;
    };

    // * Ported from community, deliberately not categorized in Ultimate so it's not shown, and default changed to 0 to disable for now to preserve our existing behavior
    // * only included here to not break A3A_fnc_manageFlagAccess
    class A3A_flagGarageBlock
    {
        title = $STR_A3A_Params_garageAccessTimer_title;
        tooltip = $STR_A3A_Params_garageAccessTimer_desc;
        values[] = {0,3,5,10,20};
        texts[] = {$STR_A3A_Params_generic_disabled, $STR_A3A_Params_generic_3min, $STR_A3A_Params_generic_5min, $STR_A3A_Params_generic_10min, $STR_A3A_Params_generic_20min};
        default = 0;
    };
};
