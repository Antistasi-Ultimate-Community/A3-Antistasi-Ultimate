class PREFIX {
    class Params {
        class disableTrader;

        class EGVAR(ultimate,disableBazaar) : disableTrader
        {
            after = "disableTrader"; // because faster loot selling plugin stuffs sellPriceMultiplier in here as well
            title = $STR_A3U_Bazaar_Params_disable_bazaar;
            tooltip = $STR_A3U_Bazaar_Params_disable_bazaar_desc;
            lockInGame = 1;
            lockOnSave = 0;
            class dependencies {};
        };
    };
};
