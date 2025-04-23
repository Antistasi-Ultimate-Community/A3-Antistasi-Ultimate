#define ITEM(CLASSNAME, PRICE, TYPE, CONDITION)\
class CLASSNAME {\
    price = PRICE;\
    type = TYPE;\
    condition = CONDITION;\
};

class traderAddons
{
    class addons_base
    {
        addons[] = {};
        weapons = ""; // in traderWeapons
        vehicles = ""; // in traderVehicles
    };
    
    #include "cfgTraderAddons.hpp"

    class traderWeapons
    {
        #include "cfgTraderWeapons.hpp"
    };
    class traderVehicles
    {
        #include "cfgTraderVehicles.hpp"
    };
};
