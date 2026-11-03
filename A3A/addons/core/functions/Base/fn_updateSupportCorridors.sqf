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

[] call A3A_fnc_getFactionsPositionCenter params ["_occupantsAvgPosition", "_invadersAvgPosition", ""];

private _distOccToInv = _occupantsAvgPosition vectorDistance _invadersAvgPosition;
private _dirOccFromInv = (_occupantsAvgPosition vectorDiff _invadersAvgPosition) vectorMultiply (1 / _distOccToInv);
private _posOccCorridor = _occupantsAvgPosition vectorAdd (_dirOccFromInv vectorMultiply (_distOccToInv / 2));
"NATO_carrier" setMarkerPos _posOccCorridor;

private _dirInvFromOcc = (_invadersAvgPosition vectorDiff _occupantsAvgPosition) vectorMultiply (1 / _distOccToInv);
private _posInvCorridor = _invadersAvgPosition vectorAdd (_dirInvFromOcc vectorMultiply (_distOccToInv / 2));
"CSAT_carrier" setMarkerPos _posInvCorridor;

nil;
