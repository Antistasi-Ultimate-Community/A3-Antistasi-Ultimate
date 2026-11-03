/*
    Author:
        Creep'nCrunch / jwoodruff40
    
    Description:
        Updates the support corridors for each faction based after change of marker ownership
    
    Params:
        None
    
    Dependencies:
        A3A_fnc_getFactionsPositionCenter
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [] call A3A_fnc_updateSupportCorridors;
    
    Return:
        None
*/

[] call A3A_fnc_getFactionsPositionCenter params [
    ["_occupantsCount", 0, [0]],
    ["_occupantsAvgPosition", [], [[]], 3],
    ["_invadersCount", 0, [0]],
    ["_invadersAvgPosition", [], [[]], 3],
    ["_rebelsCount", 0, [0]],
    ["_rebelsAvgPosition", [], [[]], 3]
];

// Returns the point at which the ray from _originPos along _dirVector intersects the edge of the map
// used to place the support corridor markers at the edge of the map
// TODO: look into whether it would make more sense to either:
//   - do this but place the support corridor a fixed distance *past* the edge of the map to ensure players can't be there, OR
//   - find the minimal distance from _originPos along _dirVector where we can expect players to *not* be present (e.g. when the new support corridor would be XX meters from any other marker?)
private _fnc_edgePosition = {
    params ["_originPos", "_dirVector"];
    private _buffer = 100; // 100m buffer from edge of map
    private _bounds = [_buffer, worldSize - _buffer];
    private _minDistToBoundary = 1e10;
    {
        // Get distance to boundary along each X,Y axis --> check which distance is shorter
        // (the first edge that would be crossed when traveling along the direction vector)
        private _dirVecAxis = _x;
        if (_dirVecAxis isNotEqualTo 0) then {
            private _originPosAxis = _originPos select _forEachIndex;
            private _distToBoundary = ((_bounds select (_dirVecAxis > 0)) - _originPosAxis) / _dirVecAxis;
            _minDistToBoundary = _minDistToBoundary min _distToBoundary;
        };
    } forEach (_dirVector select [0,2]); // [X axis, Y axis, 0]
    _originPos vectorAdd (_dirVector vectorMultiply [_minDistToBoundary, _minDistToBoundary, 0]);
};

private _distOccToInv = _occupantsAvgPosition vectorDistance _invadersAvgPosition;
private _dirOccFromInv = (_occupantsAvgPosition vectorDiff _invadersAvgPosition) vectorMultiply (1 / _distOccToInv);

if (!areOccupantsDefeated) then {
    private _distOccToReb = _occupantsAvgPosition vectorDistance _rebelsAvgPosition;
    private _dirOccFromReb = (_occupantsAvgPosition vectorDiff _rebelsAvgPosition) vectorMultiply (1 / _distOccToReb);
    private _dirOccAvg = vectorNormalized (((_dirOccFromInv vectorMultiply _invadersCount) vectorAdd (_dirOccFromReb vectorMultiply _rebelsCount)) vectorMultiply (1 / (_invadersCount + _rebelsCount)));
    private _posOccCorridor = [_occupantsAvgPosition, _dirOccAvg] call _fnc_edgePosition;
    "NATO_carrier" setMarkerPos _posOccCorridor;
};

if (gameMode isNotEqualTo 3 && {!areInvadersDefeated}) then {
    private _dirInvFromOcc = _dirOccFromInv vectorMultiply -1;
    private _distInvToReb = _invadersAvgPosition vectorDistance _rebelsAvgPosition;
    private _dirInvFromReb = (_invadersAvgPosition vectorDiff _rebelsAvgPosition) vectorMultiply (1 / _distInvToReb);
    private _dirInvAvg = vectorNormalized (((_dirInvFromOcc vectorMultiply _occupantsCount) vectorAdd (_dirInvFromReb vectorMultiply _rebelsCount)) vectorMultiply (1 / (_occupantsCount + _rebelsCount)));
    private _posInvCorridor = [_invadersAvgPosition, _dirInvAvg] call _fnc_edgePosition;
    "CSAT_carrier" setMarkerPos _posInvCorridor;
};

nil;
