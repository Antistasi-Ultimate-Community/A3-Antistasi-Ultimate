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
        _modifier <STRING> | "police", "militia", "tierboost", "specops"
*/

params [["_sideX", sideUnknown]];

if (_sideX isEqualTo sideUnknown) exitWith { "nil" };

private _invaderBuff = aggressionInvaders / 3; // Invaders want a slight buff here simply for being more... aggressive
private _aggr = [aggressionOccupants, (aggressionInvaders + _invaderBuff)] select (_sideX == Invaders);

private _weightPolice = linearConversion [0, 60, _aggr, 1.0, 0.0, true]; 
private _weightMilitia = linearConversion [40, 60, _aggr, 0.2, 1.0, true] * linearConversion [60, 85, _aggr, 1.0, 0.3, true];
private _weightTierBoost = linearConversion [40, 80, _aggr, 0.0, 1.0, true]; 
private _weightSF = linearConversion [70, 120, _aggr, 0.0, 1.0, true];

private _categories = [ 
    "police", _weightPolice, 
    "militia", _weightMilitia,
    "tierboost", _weightTierBoost,
    "specops", _weightSF
];

private _modifier = selectRandomWeighted _categories;

_modifier;