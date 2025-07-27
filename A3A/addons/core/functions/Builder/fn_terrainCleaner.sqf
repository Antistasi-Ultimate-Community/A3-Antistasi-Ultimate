params [
  ["_object", objNull, [objNull]],
  ["_radius", 0, [0]]
];

{
    [_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [getPos _object, ["ROCKS","ROCK","Tree", "Bush","SMALL TREE","HIDE"], _radius, false, true];

nil;
