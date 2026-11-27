// Shared: is this a WEAPON (rifle, launcher, pistol, binocular/designator) -
// something with mounted parts and a magazine that a trader only buys from
// the player's hands, after fn_sellCheck has looked it over? NVGs are
// filed as type 4096 too but are plain items.
params [["_c", "", [""]]];
private _cfg = configFile >> "CfgWeapons" >> _c;
if (!isClass _cfg) exitWith { false };
private _t = getNumber (_cfg >> "type");
(_t in [1, 2, 4]) || {_t == 4096 && {(toLower getText (_cfg >> "simulation")) != "nvgoggles"}}
