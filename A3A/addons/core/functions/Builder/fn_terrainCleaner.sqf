params [
  ["_object", objNull, [objNull]],
  ["_radius", 0, [0]],
  ["_terrainTypes", [], [[]]]
];

{
    [_x, true] remoteExec ["hideObject", 0, true];
    _x enableSimulationGlobal false;
} forEach nearestTerrainObjects [getPos _object, _terrainTypes, _radius, false, true];

nil;
