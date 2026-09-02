/*
    Author:
        Silence
    
    Description:
        Code that runs for addEHExplosive
    
    Params:
        _cargo <OBJECT>
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        [_cargo] call A3U_fnc_LOG_delivery_ehExplosive;
    
    Return:
        N/A
*/

params ["_cargo"];

private _cargoPos = getPosATL _cargo;
private _effects = [_cargoPos] call A3U_fnc_createFire;
{_x attachTo [_cargo]} forEach _effects;

uiSleep round(random 10);

private _pos = getPosATL _cargo;
deleteVehicle _cargo;

private _bomb = "Bomb_04_F" createVehicle _pos;
_bomb attachTo [_cargo];
detach _bomb;

uiSleep 30;

{deleteVehicle _x} forEach _effects;