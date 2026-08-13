/*
    Author:
        Silence
    
    Description:
        Creates a number of dead soldiers
    
    Params:
        _unitTypes | [<FACTION>, <ARRAY<STRING>>]
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Scheduled
    
    Usage:
        [VALUE] call A3U_fnc_NAME;
    
    Return:
        _return <TYPE>
*/

params ["_unitTypes", "_position", "_amount"];

private _radius = 5;
private _units = [];

for "_i" from 0 to (random [(_amount-1),_amount,(_amount+1)]) do {

    private _unitPosition = [
        _position, 
        2,
        _radius,
        2
    ] call BIS_fnc_findSafePos;

    private _randomSoldiers = selectRandom _unitTypes;
    private _randomSoldierFaction = _randomSoldiers#0;
    private _randomSoldier = selectRandom (_randomSoldiers#1);

    private _unit = [_randomSoldier, _unitPosition, _randomSoldierFaction] call A3U_fnc_createDeadSoldier;

    _units pushBack _unit;
};

_units;