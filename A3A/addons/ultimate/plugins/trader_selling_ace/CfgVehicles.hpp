#define ACE_ACTIONS_FOR_CLASS(className,parentClassName) \
    class className: parentClassName { \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(AdvancedSelling) { \
                    displayName = ECSTRING(DOUBLES(ultimate,trader_selling),AdvSell_InteractionSell_DisplayName); \
                    condition = QUOTE(call EFUNC(DOUBLES(ultimate,trader_selling),canStartAdvancedSelling)); \
                    statement = QUOTE(call EFUNC(DOUBLES(ultimate,trader_selling),startAdvancedSelling)); \
                }; \
            }; \
        }; \
    }

class CfgVehicles {
    class Air;
    class LandVehicle;
    class Ship;
    class ThingX;

    ACE_ACTIONS_FOR_CLASS(Car,LandVehicle);
    ACE_ACTIONS_FOR_CLASS(Helicopter,Air);
    ACE_ACTIONS_FOR_CLASS(Plane,Air);
    ACE_ACTIONS_FOR_CLASS(ReammoBox_F,ThingX);
    ACE_ACTIONS_FOR_CLASS(Ship_F,Ship);
    ACE_ACTIONS_FOR_CLASS(Tank,LandVehicle);
};
