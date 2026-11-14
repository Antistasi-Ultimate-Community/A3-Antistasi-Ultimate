#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

if (isNil "factories") then { factories = []; };
if (isNil "citiesX") then { citiesX = []; };
if (isNil "destroyedSites") then { destroyedSites = []; };

private _ownedTowns = {sidesX getVariable [_x, sideUnknown] == teamPlayer && !(_x in destroyedSites)} count citiesX;
private _suppBoost = 0.5 + (_ownedTowns * 0.1); // 0.5 base support gain + 0.1 per town owned

private _resAdd = 25;
private _hrAdd = 0;

{
    private _city = _x;
    private _resAddCity = 0;
    private _hrAddCity = 0;
    private _cityData = A3A_townData get _city;
    _cityData params [["_numCiv",0], ["_numVeh",0], ["_supportGov",0], ["_supportReb",0]];

    private _citySide = sidesX getVariable [_city,sideUnknown];
    private _radioTowerSide = [_city] call A3A_fnc_getSideRadioTowerInfluence;
    switch (_radioTowerSide) do
    {
        case teamPlayer: {[0,_suppBoost,_city,false,true] spawn A3A_fnc_citySupportChange};
        case Occupants: {[0,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
        case Invaders: {[-1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
    };

    _resAddCity = (_numCiv * (_supportReb / 100)) / 3;
    if (!finite _resAddCity) then { _resAddCity = 0; };

    private _hrMultiplier = overallHRGain / 100; // 80 / 100 = 0.8

    if (_numCiv > 0) then {
        private _baseDivider = 10000;
        private _refPopulation = 2000;
        private _minDivider = 5000 / _hrMultiplier;
        private _maxDivider = 10000 / _hrMultiplier;
        private _supportRebCapped = if (_citySide isNotEqualTo teamPlayer) then {_supportReb min 15} else {_supportReb}; // Support heavily capped without owning
        
        private _divider = _baseDivider * sqrt(_numCiv / _refPopulation);
        _divider = (_divider max _minDivider) min _maxDivider;
        _hrAddCity = _numCiv * (_supportRebCapped / _divider);
    } else {
        _hrAddCity = 0;
    };

    if (_citySide != teamPlayer) then
    {
        _resAddCity = _resAddCity / 2;
    };
    if (_radioTowerSide != teamPlayer) then { _resAddCity = _resAddCity / 2 };

    _resAdd = _resAdd + _resAddCity;
    _hrAdd = _hrAdd + _hrAddCity;

    private _popReb = round (_numCiv * (_supportReb / 100));
    private _popGov = round (_numCiv * (_supportGov / 100));
    private _popAboveMin = round (_numCiv) >= 20;
    private _isNowEnemy = (_popReb <= (_popGov * 0.667)); // ~40% enemy 
    private _isNowFriendly = (_popReb >= (_popGov * 1.5)); // ~60% rebel needed
    private _isNeutral = (!_isNowEnemy && !_isNowFriendly);
    private _isSkirmish = _city in townSkirmishes;
    private _isDestroyed = _city in destroyedSites;

    private _canFlipBase = (!(_isNeutral) && !(_isDestroyed) && !(_isSkirmish));
    private _canFlip = (_canFlipBase && (_isNowFriendly && _citySide isNotEqualTo teamPlayer)); 
    private _canFlipEnemy = (_canFlipBase && (_isNowEnemy && _citySide isEqualTo teamPlayer));
    private _canStartSkirmish = (_popAboveMin && (random 100 <= townSkirmishChance) && !(_isSkirmish)); // !(bigAttackInProgress) - Will keep, interesting experiment for now

    Debug_8("City: %1 | Side: %2 | Pop: %3 | Gov: %4 | Reb: %5 | CanFlip: %6 | CanFlipEnemy: %7 | CanStartSkirmish: %8", _city, _citySide, _numCiv, _popGov, _popReb, _canFlip, _canFlipEnemy, _canStartSkirmish);

    if (_canFlip) then {
        if (_canStartSkirmish) then {
            if (areOccupantsDefeated) then {_citySide = Invaders}; // They won't capture it but they will attack it
            private _possibleOrigins = outposts select {sidesX getVariable [_x, sideUnknown] == _citySide};
            private _finalOrigin = selectRandom (_possibleOrigins select { (getMarkerPos _x) distance2D (getMarkerPos _city) < 3000 });
            if (isNil "_finalOrigin") then { _finalOrigin = selectRandom _possibleOrigins };
            if (isNil "_finalOrigin") exitWith { [_city, true] call A3A_fnc_cityChangeSide }; // Worst case scenario, no outposts available
            [_citySide, _city, _finalOrigin] spawn A3A_fnc_townBattle;
            uiSleep 1;
        } else {
            [_city, true] call A3A_fnc_cityChangeSide;
        };
    };

    if (_canFlipEnemy) then {
        [_city, false] call A3A_fnc_cityChangeSide;
    };
} forEach citiesX;

call A3A_fnc_checkWinCondition;
if (lossCondition isNotEqualTo 1) then {
    call A3A_fnc_checkLossCondition;
};

[_resAdd, _hrAdd];