class forbiddenItems
{
    class forbidden_unlimited_base
    {
        addons[] = {};
        unlimited = 1;
        appearInCrates = 0;
    };
    class forbidden_limited_base : forbidden_unlimited_base
    {
        unlimited = 0;
    };

    #include "cfgForbiddenItemsAndroid.hpp"
    #include "cfgForbiddenItemsCW.hpp"
    #include "cfgForbiddenItemsFWA.hpp"
	#include "cfgForbiddenItemsGM.hpp"
	#include "cfgForbiddenItemsNIA.hpp"
    #include "cfgForbiddenItemsOPTRE.hpp"
    #include "cfgForbiddenItemsPracs.hpp"
    #include "cfgForbiddenItemsSMA.hpp"
    #include "cfgForbiddenItemsTOW.hpp"
    #include "cfgForbiddenItemsUns.hpp"
    #include "cfgForbiddenItemsHAFM.hpp"
};
