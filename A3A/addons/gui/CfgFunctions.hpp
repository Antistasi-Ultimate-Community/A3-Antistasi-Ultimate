// note use of preInit & postInit will run for EVERY mission, use sparingly or with non a3a mission aborts in place, example check if the class (missionConfigFile >> "A3A") exists
class CfgFunctions {
    class A3A {
        class GUI {
            file = QPATHTOFOLDER(functions\GUI);
            class arsenalLimitsDialog {};
            class buyVehicleDialog {};
            class buyVehicleTabs {};
            class blackMarketDialog {};
            class blackMarketTabs {};
            class getVehicleCrewCount {};
            class setUpPlacerHints {};
            class teamLeaderRTSPlacerDialog {};
        };
        class SetupGUI {
            file = QPATHTOFOLDER(functions\SetupGUI);
            class onExtendersWarningDialogLoad {};
            class onExtendersWarningDialogUnload {};
            class setupCheckExtenders {};
            class setupDialog {};
            class setupFactionsTab {};
            class setupLoadgameTab {};
            class setupParamsTab {};
            class setupConfirmDialog {};
            class setupEditZonesDialog {};
            class setupHQPosDialog {};
            class setupImportExportDialog {};
        };
    };
    class ADDON {
        class controlsHelpers {
            file = QPATHTOFOLDER(functions\controlsHelpers);
            class directChildCtrls {};
            class emplaceControl {};
            class sortCGList {};
        };

        class ObjectHelpers {
            file = QPATHTOFOLDER(functions\ObjectHelpers);
            class sizeOf {};
        };
    };
};
