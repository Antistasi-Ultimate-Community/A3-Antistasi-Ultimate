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

[] call A3A_fnc_getFactionsPositionCenter params ["_occupantsCount", "_occupantsAvgPosition", "_invadersCount", "_invadersAvgPosition", "_rebelsCount", "_rebelsAvgPosition"];

// Projects a ray from _origin along _dir and returns the point where it leaves the square map
// Ngl, this function was vibed because math is hard
private _fnc_edgePosition = {
    params ["_origin", "_dir"];
    private _buffer = 100;
    private _bounds = [_buffer, worldSize - _buffer];
    private _tMin = 1e10;
    {
        private _d = _dir select _x;
        if (_d != 0) then {
            private _o = _origin select _x;
            private _t = ((_bounds select (_d > 0)) - _o) / _d;
            _tMin = _tMin min _t;
        };
    } forEach [0, 1];
    [(_origin select 0) + (_dir select 0) * _tMin, (_origin select 1) + (_dir select 1) * _tMin, 0];
};

if (!areOccupantsDefeated) then {
    private _distOccToInv = _occupantsAvgPosition vectorDistance _invadersAvgPosition;
    private _dirOccFromInv = (_occupantsAvgPosition vectorDiff _invadersAvgPosition) vectorMultiply (1 / _distOccToInv);
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
