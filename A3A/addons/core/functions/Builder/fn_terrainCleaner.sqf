params ["_object"];
private _center = getPos _object;

private _radius = objNull;

switch (_object) do {
    case ("A3AU_TerrainCleaner_VerySmall_F"):
    {
		_radius = 4;
    };
    case ("A3AU_TerrainCleaner_Small_F"):
    {
		_radius = 8;
    };
    case ("A3AU_TerrainCleaner_Medium_F"):
    {
		_radius = 15;
    };
    case ("A3AU_RebHelipad_Square_F","A3AU_RebHelipad_Circle_F","A3AU_TerrainCleaner_Large_F"):
    {
		_radius = 30;
    };
};

{
    [_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_center, ["ROCKS","ROCK","Tree", "Bush","SMALL TREE","HIDE"], _radius, false, true];
