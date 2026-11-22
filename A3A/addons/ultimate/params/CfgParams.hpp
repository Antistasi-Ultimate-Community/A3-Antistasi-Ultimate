class PREFIX {
    class Params {
        class DeprecatedParams;
        class ExperimentalParams;
        class ExtenderParams;

        class GVAR(testParam1): ExperimentalParams {
            title = "I am a test param.";
            tooltip = "This is a tooltip for the test param. After A3A_diameterExtendedCaptureArea.";
            values[] = {10,20,30,40,50,60,70,80,90,100};
            texts[] = {"10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
            default = 50;
            after = "A3A_diameterExtendedCaptureArea";
        };

        class GVAR(testParam2): GVAR(testParam1) {
            title = "I am another test param.";
            after = QGVAR(testParam1);
        };

        class GVAR(testParam3): GVAR(testParam1) {
            title = "I am yet another test param.";
            after = QGVAR(testParam2);
        };

        class GVAR(testDepParam1): DeprecatedParams {
            title = "I am a deprecated test param.";
            tooltip = "This is a tooltip for the deprecated test param.";
            values[] = {0,1};
            texts[] = {"Disabled", "Enabled"};
            default = 0;
        };

        class GVAR(testExtParam1): ExtenderParams {
            title = "I am an extender test param.";
            tooltip = "This is a tooltip for the extender test param.";
            values[] = {0,1};
            texts[] = {"Disabled", "Enabled"};
            default = 0;
        };
    };
};
