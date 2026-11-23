#pragma hemtt ignore_variables ["_thisEventHandler"]
params ["_artillery"];

if (!alive _artillery) exitWith {
    _artillery removeEventHandler ["Fired", _thisEventHandler];
};

if (side _artillery != teamPlayer) exitWith {};

private _gunner  = gunner _artillery;
if (!isNull _gunner && {side _gunner != teamPlayer}) exitWith {};

private _dataX = _artillery getVariable ["detection", [position _artillery,0]];
private _positionX = position _artillery;
_chance = _dataX select 1;
if ((_positionX distance (_dataX select 0)) < 300) then {
    _chance = _chance + 2;
} else {
    _chance = 0;
};

if (random 100 < _chance) then {
    {
        if !(side _x in [Occupants, Invaders]) then { continue };
        [leader _x, [_artillery, 4]] remoteExec ["reveal", leader _x];
    } forEach allGroups;

    private _airports = airportsX select {
        (getMarkerPos _x distance _artillery < distanceForAirAttack) and {([_x,true] call A3A_fnc_airportCanAttack) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)}
    };

    private _milbases = airportsX select {
        (getMarkerPos _x distance _artillery < distanceForLandAttack) and {([_positionX, getMarkerPos _x] call A3A_fnc_arePositionsConnected) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)}
    };

    private _bases = _airports + _milbases;

    if (_bases isNotEqualTo []) then {
        private _base = selectRandom _bases;
        _sideX = sidesX getVariable [_base, sideUnknown];
        
        private _reveal = [_positionX, _sideX] call A3A_fnc_calculateSupportCallReveal;
        [_sideX, _artillery, markerPos _base, (random [0.5, 2.5, 4]), _reveal] remoteExec ["A3A_fnc_requestSupport", 2];
    };

    _chance = 0;
};

_artillery setVariable ["detection",[_positionX,_chance]];
