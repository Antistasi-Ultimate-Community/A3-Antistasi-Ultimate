#define ACE_ACTIONS_FOR_CLASS \
    class ACE_Actions {\
        class ACE_MainActions {\
            class GVAR(AdvancedSelling) {\
                displayName = ECSTRING(DOUBLES(ultimate,trader_selling),AdvSell_InteractionSell_DisplayName);\
                condition = QUOTE(call EFUNC(DOUBLES(ultimate,trader_selling),canStartAdvancedSelling));\
                statement = QUOTE(call EFUNC(DOUBLES(ultimate,trader_selling),startAdvancedSelling));\
            };\
        };\
    }

class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class Air;
    class LandVehicle;
    class Ship;
    class ThingX;

    class Car: LandVehicle {
        ACE_ACTIONS_FOR_CLASS;
    };

    class Helicopter: Air {
        ACE_ACTIONS_FOR_CLASS;
    };

    class Plane: Air {
        ACE_ACTIONS_FOR_CLASS;
    };

    class ReammoBox_F : ThingX {
        ACE_ACTIONS_FOR_CLASS;

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
    };

    class Ship_F: Ship {
        ACE_ACTIONS_FOR_CLASS;
    };

    class Tank: LandVehicle {
        ACE_ACTIONS_FOR_CLASS;
    };
};
