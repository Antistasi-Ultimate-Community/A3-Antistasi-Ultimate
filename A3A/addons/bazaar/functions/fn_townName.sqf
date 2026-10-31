// The name of the town nearest a position, as printed on the map.
params [["_pos", [0,0,0], [[]]]];
private _locs = nearestLocations [_pos, ["NameCityCapital", "NameCity", "NameVillage", "NameLocal", "NameMarine"], 1500];
if (_locs isEqualTo []) exitWith { localize "STR_A3U_Bazaar_Misc_Location_BackRoads" };
private _n = text (_locs select 0);
if (_n == "") then { _n = localize "STR_A3U_Bazaar_Misc_Location_BackRoads" };
_n
