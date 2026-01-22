#define SELL_ACTION_FOR_CLASS(className,parentClass) \
    class className : parentClass {\
        class ACE_Actions {\
            class ACE_MainActions {\
                class GVAR(AdvancedSelling) {\
                    displayName = CSTRING(AdvSell_InteractionSell_DisplayName);\
                    condition = QUOTE(call FUNC(canStartAdvancedSelling));\
                    statement = QUOTE(call FUNC(startAdvancedSelling));\
                };\
            };\
        };\
    }

class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class Air;
    class LandVehicle;
    class Ship;
    class ThingX;

    SELL_ACTION_FOR_CLASS(Car,LandVehicle);
    SELL_ACTION_FOR_CLASS(Helicopter,Air);
    SELL_ACTION_FOR_CLASS(Plane,Air);
    SELL_ACTION_FOR_CLASS(Ship_F,Ship);
    SELL_ACTION_FOR_CLASS(Tank,LandVehicle);

    class ReammoBox_F : ThingX {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(AdvancedSelling) {
                    displayName = CSTRING(AdvSell_InteractionSell_DisplayName);
                    condition = QUOTE(call FUNC(canStartAdvancedSelling));
                    statement = QUOTE(call FUNC(startAdvancedSelling));
                };
            };
        };

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
    };
};
