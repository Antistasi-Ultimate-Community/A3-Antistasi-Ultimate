#include "script_component.hpp"

SUBADDON = false;
#include "XEH_PREP.hpp"
SUBADDON = true;

if !(hasInterface) exitWith {};

[
    QGVAR(playKaching), "CHECKBOX",
    [LLSTRING(Settings_playKaching_DisplayName), LLSTRING(Settings_playKaching_Tooltip)],
    ["[Antistasi Ultimate]", LLSTRING(Component)],
    true, // default
    false, // global
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(sellForbidden), "CHECKBOX",
    [LLSTRING(Settings_sellForbidden_DisplayName), LLSTRING(Settings_sellForbidden_Tooltip)],
    ["[Antistasi Ultimate]", LLSTRING(Component)],
    false, // default
    true, // Make this a global setting so players don't decide individually
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(sellDelay), "SLIDER",
    [LLSTRING(Settings_sellDelay_DisplayName), LLSTRING(Settings_sellDelay_Tooltip)],
    ["[Antistasi Ultimate]", LLSTRING(Component)],
    [0, 2, 0.125, 3], // min,max,default,decimals
    false, // global
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;
