params ["_unit"];

_unit forceAddUniform (selectRandom (A3A_faction_reb get "uniforms"));
_unit addItemToUniform "FirstAidKit";
