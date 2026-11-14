#include "script_component.hpp"
#pragma hemtt suppress pw3_padded_arg config

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#define HALs_DEF_INIT
	#include "Addons\main\config.hpp"
#undef HALs_DEF_INIT

#if __A3_DEBUG__
    class A3A {
        #include "CfgFunctions.hpp"
    };
#else
    #include "CfgFunctions.hpp"
#endif
