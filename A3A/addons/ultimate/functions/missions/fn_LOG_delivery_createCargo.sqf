/*
    Author:
        Silence
    
    Description:
        Creates "cargo" for the delivery mission. Adds acknowledgement var, handles EH's and adds the action to acknowledge
    
    Params:
        _cargoClass <STRING>
        _pos <ARRAY<INT>>
    
    Dependencies:
        N/A
    
    Scope:
        Server
    
    Environment:
        Unscheduled
    
    Usage:
        ["B_Quadbike_01_F", [0,0,0]] call A3U_fnc_LOG_delivery_createCargo;
    
    Return:
        _cargo <OBJECT>
*/

params ["_cargoClass", "_pos"];

private _cargo = _cargoClass createVehicle [0,0,0];
_cargo setPos _pos;
_cargo setDir (random 360);

clearItemCargoGlobal _cargo;
clearMagazineCargoGlobal _cargo;
clearWeaponCargoGlobal _cargo;
clearBackpackCargoGlobal _cargo;

// add action to "acknowledge" them (triggers next phase), action to carry
_cargo setVariable ["A3A_cargo_acknowledged", false, true];

[_cargo, "cargo"] remoteExec ["A3A_fnc_flagaction", [teamPlayer, civilian], _cargo];

private _isExplosive = [_cargo] call A3U_fnc_LOG_delivery_getCargoExplosive;
if (_isExplosive isEqualTo 1) then {
    [_cargo] call A3U_fnc_LOG_delivery_addEHExplosive;
};

_cargo;