["emergence"] call A3U_fnc_setInvaderState;

private _attackCount = 0;
private _attackAmount = 2;

for "_i" from 0 to _attackAmount do {
    [Invaders] spawn A3A_fnc_chooseAttack;
    _attackCount = _attackCount + 1;

    // Wait 5 minutes before choosing another attack
    uiSleep 300;
};

// waitUntil {sleep 30; _attackCount >= _attackAmount};

// private _possibleTargets = airportsX + outposts + seaports + factories + resourcesX + milbases;
// _possibleTargets = _possibleTargets select {sidesX getVariable [_x,sideUnknown] == teamPlayer};