class PREFIX {
    class Params {
        class AllParams {
            class dependencies;
        };
        class BMParams: AllParams {};

        class disableTrader: BMParams {
            class dependencies: dependencies {
                class vanillaArmsDealer;
                class GVAR(sellPriceMultiplier): vanillaArmsDealer {};
            };
        };

        class GVAR(sellPriceMultiplier): BMParams {
            title = CSTRING(Params_SellPriceMultiplier_Text);
            tooltip = CSTRING(Params_SellPriceMultiplier_Tooltip);
            values[] = {10,20,30,40,50,60,70,80,90,100};
            texts[] = {"10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
            default = 50;
        };
    };
};
