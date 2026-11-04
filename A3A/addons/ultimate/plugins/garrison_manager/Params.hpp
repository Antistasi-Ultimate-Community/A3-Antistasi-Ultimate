class PREFIX {
    class Params {
        class AllParams {
            class dependencies;
        };
        class ExperimentalParams: AllParams {};

        class EGVAR(ultimate,useAdvancedGarrisonManager): ExperimentalParams {
            after = "ExperimentalParams";
            title = CSTRING(Params_useAdvancedGarrisonManager);
            tooltip = CSTRING(Params_useAdvancedGarrisonManager_Tooltip);
            values[] = {0, 1};
            texts[] = {"$STR_antistasi_dialogs_generic_button_no_text", "$STR_antistasi_dialogs_generic_button_yes_text"};
            default = 1;
        };
    };
};
