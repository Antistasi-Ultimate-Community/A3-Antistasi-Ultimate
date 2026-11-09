#include "script_component.hpp"

SUBADDON = false;
#include "XEH_PREP.hpp"
if (hasInterface) then {
    GVAR(registry) = createHashMap;
    GVAR(modes) = [];
    GVAR(active) = "";
    GVAR(preferred) = profileNamespace getVariable [QGVAR(preferred), ""];
    if !(GVAR(preferred) isEqualType "") then { GVAR(preferred) = ""; };
    GVAR(explicitSelection) = false;
    GVAR(transitioning) = false;
    GVAR(restored) = false;
};
SUBADDON = true;