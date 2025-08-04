if (!isServer) exitWith {};

/*  Checks if the marker should change its owner after a unit died and flips it if need be
    Execution on: Server
    Scope: Internal
    Params:
        _marker : STRING : Name of the marker the unit died on
        _side : SIDE : Side of the unit which died
    Returns:
        Nothing
*/
params ["_marker", "_side"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if ((isNil "_marker") or (isNil "_side")) exitWith {};

//Await lock
waitUntil {!zoneCheckInProgress};
zoneCheckInProgress = true;

//If marker is a different side than the unit which died on it, we don't care
if(_side != sidesX getVariable [_marker, sideUnknown]) exitWith
{
    zoneCheckInProgress = false
};

private _counts = [_marker] call A3A_fnc_zoneCountUnits;
private _defenderUnitCount = _counts deleteAt _side;
_counts deleteAt civilian; // Remove civilian count, we don't care about them

private _keys = keys _counts;

#if __A3_DEBUG__
if !assert(count _keys == 2) exitWith {
    zoneCheckInProgress = false;
    Error_3("ZoneCheck at %1 found %2 sides (%3), expected 2",_marker,count _keys,_keys);
};
#endif

private _enemy1 = _keys deleteAt 0;
private _enemy2 = _keys deleteAt 0;
private _enemy1UnitCount = _counts get _enemy1;
private _enemy2UnitCount = _counts get _enemy2;

Debug_7("ZoneCheck at %1 found %2 friendly %5 units, %3 enemy %6 units and %4 enemy %7 units", _marker, _defenderUnitCount, _enemy1UnitCount, _enemy2UnitCount, _side, _enemy1, _enemy2);

if (_enemy1UnitCount > 3 * _defenderUnitCount || {_enemy2UnitCount > 3 * _defenderUnitCount}) then
{
    private _winner = if (_enemy1UnitCount > _enemy2UnitCount) then {_enemy1} else {_enemy2};
    if (_winner isEqualTo teamPlayer) exitWith {Debug_2("Rebel auto capture of %1 was blocked, %1 remains side %2", _marker, _side)};
    [_winner,_marker] remoteExec ["A3A_fnc_markerChange",2];
};
zoneCheckInProgress = false;
