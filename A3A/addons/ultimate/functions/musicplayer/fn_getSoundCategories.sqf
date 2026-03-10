//fn_getSoundCategories.sqf
#include "..\..\script_component.hpp"
if (isNil "A3U_cache_allSoundCategories") then { call A3U_fnc_musicCache; };
A3U_cache_allSoundCategories