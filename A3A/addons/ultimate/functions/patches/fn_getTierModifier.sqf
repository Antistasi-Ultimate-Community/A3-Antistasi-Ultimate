/*
    Author:
        Silence
    
    Description:
        Gets a tier modifier for createAttackForceLandMixed based on aggression levels.
    
    Params:
        _sideX <SIDE>
    
    Dependencies:
        aggressionOccupants, aggressionInvaders
    
    Scope:
        Server, HC(?)
    
    Environment:
        Unscheduled
    
    Usage:
        [_sideX] call A3U_fnc_getTierModifier;
    
    Return:
        _modifier <STRING> | "police", "militia", "normal", "SF"
*/

params [["_sideX", sideUnknown]];

if (_sideX isEqualTo sideUnknown) exitWith { "nil" };

private _invaderBuff = aggressionInvaders / 3; // Invaders want a slight buff here simply for being more... aggressive
private _aggr = [aggressionOccupants, (aggressionInvaders + _invaderBuff)] select (_sideX == Invaders);

private _weightPolice = linearConversion [0, 50, _aggr, 1.0, 0.0, true]; // Cuts out at 50
private _weightMilitia = linearConversion [20, 40, _aggr, 0.2, 1.0, true] * linearConversion [20, 45, _aggr, 1.0, 0.3, true]; // Gets significantly higher at ~50
private _weightNormal = linearConversion [40, 80, _aggr, 0.0, 1.0, true]; // Equals with militia at 50, gets high at 60+
private _weightSF = linearConversion [90, 120, _aggr, 0.0, 1.0, true]; // Only for high tier, ~120 equals out with normal

private _categories = [ 
    "police", _weightPolice, 
    "militia", _weightMilitia,
    "normal", _weightNormal,
    "SF", _weightSF
];

private _modifier = selectRandomWeighted _categories;

_modifier;