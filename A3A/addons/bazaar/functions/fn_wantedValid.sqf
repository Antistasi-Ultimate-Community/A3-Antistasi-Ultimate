// Shared: can this class be on the Wanted List here? It has to exist in
// this game's loaded mods (pins from another modset are kept in the profile
// but sit idle until those mods are loaded again).
params [["_c", "", [""]]];
if (_c == "") exitWith { false };
isClass (configFile >> "CfgWeapons" >> _c) || {isClass (configFile >> "CfgMagazines" >> _c)} || {isClass (configFile >> "CfgVehicles" >> _c)} || {isClass (configFile >> "CfgGlasses" >> _c)}
