/*
    Author: [Håkon]
    [Description]
        Refreshes lock with added/removed seats/turrets to lock

    Arguments:
    0. <Object> Vehicle to lock seats/turrets of
    1. <Bool>   Are the seats/turrets being locked
    2. <Array>  Seat indices / turret paths that are being locked/unlocked (optional - leave nil to lock/unlock all seats/turrets of the vehicle)

    Return Value:
    <Nil>

    Scope: Clients
    Environment: Scheduled
    Public: [No]
    Dependencies:

    Example: [_vehicle, true, _seatsAndTurrets] remoteExecCall ["A3A_Logistics_fnc_toggleLock", 0, _vehicle];
*/
params ["_vehicle", "_lock", "_seatsAndTurrets"];
//toggle lock of the proper seats/turrets
_vehicle lockCargo false;
{_vehicle lockTurret [_x, false]} forEach (allTurrets _vehicle);
if !(isNil "_seatsAndTurrets") then {//for vehicle loading cargo
    _seatsAndTurrets params ["_seats", "_turrets"];
    
    private _crew = crew _vehicle;
    private _crewCargoIndex = _crew apply {_vehicle getCargoIndex _x};
    private _crewTurretPath = _crew apply {_vehicle unitTurret _x};

    private _seatsAndTurretsToLock = _vehicle getVariable ["Logistics_occupiedSeatsAndTurrets", []];
    if (_lock) then {
        _seatsAndTurretsToLock append _seats;
        _seatsAndTurretsToLock append _turrets;
    } else {
        _seatsAndTurretsToLock = _seatsAndTurretsToLock - _seats;
        _seatsAndTurretsToLock = _seatsAndTurretsToLock - _turrets;
    };
    _vehicle setVariable ["Logistics_occupiedSeatsAndTurrets", _seatsAndTurretsToLock, true];
    {
        if (_x isEqualType 0) then { // this is a seat index
            if (_x in _crewCargoIndex) then {
                moveOut (_crew # (_crewCargoIndex find _x)); //incase someone got into the seat before it is locked in the loading process
            };
            _vehicle lockCargo [_x, true];
        } else { // this is a turret path
            if (_x in _crewTurretPath) then {
                moveOut (_crew # (_crewTurretPath find _x)); //incase someone got into the turret before it is locked in the loading process
            };
            _vehicle lockTurret [_x, true];
        };        
    } forEach _seatsAndTurretsToLock;
} else {//for cargo, lock it fully and kick out any crew
    /* if (_vehicle isKindOf "StaticWeapon") exitWith {}; // dont lock statics, cant get out otherwise
    _vehicle lock _lock;
    if (_lock) then { */
        //move out crew
        {moveOut _x}forEach crew _vehicle;

        if (!isNil "SA_Put_Away_Tow_Ropes") then {
            //detach tow ropes attached to cargo
            {
                _veh = ropeAttachedTo _x;
                if (!isNull _veh) then {[_veh,player] call SA_Put_Away_Tow_Ropes};
            } forEach attachedObjects _vehicle;
            //detach tow ropes from cargo
            [_vehicle,player] call SA_Put_Away_Tow_Ropes;
        };
    /* }; */
};
