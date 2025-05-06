params ["_object"];

private _center = getPos _object;

{
    [_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_center, ["ROCKS","ROCK","Tree", "Bush","SMALL TREE","HIDE"], 35, false, true];