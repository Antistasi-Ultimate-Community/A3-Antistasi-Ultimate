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

private _distOccToInv = _occupantsAvgPosition vectorDistance _invadersAvgPosition;
private _dirOccFromInv = (_occupantsAvgPosition vectorDiff _invadersAvgPosition) vectorMultiply (1 / _distOccToInv);
private _distOccToReb = _occupantsAvgPosition vectorDistance _rebelsAvgPosition;
private _dirOccFromReb = (_occupantsAvgPosition vectorDiff _rebelsAvgPosition) vectorMultiply (1 / _distOccToReb);
private _dirOccAvg = vectorNormalized (((_dirOccFromInv vectorMultiply _invadersCount) vectorAdd (_dirOccFromReb vectorMultiply _rebelsCount)) vectorMultiply (1 / (_invadersCount + _rebelsCount)));
private _posOccCorridor = _occupantsAvgPosition vectorAdd (_dirOccAvg vectorMultiply ((_distOccToInv + _distOccToReb) / 2));
"NATO_carrier" setMarkerPos _posOccCorridor;

private _dirInvFromOcc = _dirOccFromInv vectorMultiply -1;
private _distInvToReb = _invadersAvgPosition vectorDistance _rebelsAvgPosition;
private _dirInvFromReb = (_invadersAvgPosition vectorDiff _rebelsAvgPosition) vectorMultiply (1 / _distInvToReb);
private _dirInvAvg = vectorNormalized (((_dirInvFromOcc vectorMultiply _occupantsCount) vectorAdd (_dirInvFromReb vectorMultiply _rebelsCount)) vectorMultiply (1 / (_occupantsCount + _rebelsCount)));
private _posInvCorridor = _invadersAvgPosition vectorAdd (_dirInvAvg vectorMultiply ((_distOccToInv + _distInvToReb) / 2));
"CSAT_carrier" setMarkerPos _posInvCorridor;

nil;
